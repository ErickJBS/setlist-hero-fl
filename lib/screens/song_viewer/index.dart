import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:setlistherofl/models/song.dart';
import 'package:setlistherofl/screens/song_viewer/styles.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/chords_viewer/index.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/lyrics_viewer/index.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/sheets_viewer/index.dart';
import 'package:setlistherofl/service_locator.dart';
import 'package:setlistherofl/services/song_service.dart';

class SongViewerScreen extends StatefulWidget {
  final List<Song> songs;
  final int index;

  SongViewerScreen({this.songs, this.index});

  @override
  _SongViewerState createState() => _SongViewerState();
}

class _SongViewerState extends State<SongViewerScreen> {
  List<Song> _fullSongsData = [];
  int _selectedTabIndex = 0;
  int _selectedSongIndex;
  String _title;
  bool _isLoading = true;
  PageController _controller;
  static SongService _songService = locator<SongService>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedSongIndex = widget.index;
    _title = widget.songs[_selectedSongIndex].name;
    _loadSongs().then((value) => {
          setState(() {
            _fullSongsData = value;
            _isLoading = false;
          })
        });
  }

  Future<List<Song>> _loadSongs() async {
    List<Song> songs = [];

    for (Song element in widget.songs) {
      songs.add(await _songService.findById(element.id));
    }

    return songs;
  }

  Widget _getFabButton(var fabIcon, var callback) {
    return FloatingActionButton(
        heroTag: null,
        child: Icon(
          fabIcon,
          color: fabIconColor,
        ),
        backgroundColor: fabBackgroundColor,
        mini: true,
        onPressed: callback);
  }

  void _initPageController() {
    _controller =
        PageController(initialPage: _selectedSongIndex, viewportFraction: 0.9);
  }

  void _nextPage() {
    if (_selectedSongIndex < widget.songs.length - 1) {
      setState(() {
        _selectedSongIndex++;
        _title = widget.songs[_selectedSongIndex].name;
      });
    }

    _controller.nextPage(duration: controllerDuration, curve: controllerCurve);
  }

  void _prevPage() {
    if (_selectedSongIndex > 0) {
      setState(() {
        _selectedSongIndex--;
        _title = widget.songs[_selectedSongIndex].name;
      });
    }

    _controller.previousPage(
        duration: controllerDuration, curve: controllerCurve);
  }

  @override
  Widget build(BuildContext context) {
    _initPageController();

    var tabs = [
      LyricsViewer(
        pageController: _controller,
        songs: _fullSongsData,
        index: _selectedSongIndex,
      ),
      ChrodsViewer(
        pageController: _controller,
        songs: _fullSongsData,
        index: _selectedSongIndex,
      ),
      SheetsViewer(
        pageController: _controller,
      )
    ];

    AppBar appBar = AppBar(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Text(_title, style: appBarTitleStyle),
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
    );

    var bottomNavigatorBar = BottomNavigationBar(
      currentIndex: _selectedTabIndex,
      selectedItemColor: Colors.orangeAccent[700],
      onTap: _onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.music_note), title: Text('Lyrics')),
        BottomNavigationBarItem(
            icon: Icon(Icons.queue_music), title: Text('Chords')),
        BottomNavigationBarItem(
            icon: Icon(MdiIcons.musicClefBass), title: Text('Tabs'))
      ],
    );

    var loading = Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(child: CircularProgressIndicator()));

    var body = Stack(
      children: <Widget>[
        tabs[_selectedTabIndex],
        Positioned(
            bottom: 8.0,
            right: 8.0,
            child: _getFabButton(MdiIcons.chevronRight, _nextPage)),
        Positioned(
            bottom: 8.0,
            left: 8.0,
            child: _getFabButton(MdiIcons.chevronLeft, _prevPage))
      ],
    );

    return Scaffold(
        appBar: appBar,
        bottomNavigationBar: bottomNavigatorBar,
        body: _isLoading ? loading : body);
  }
}
