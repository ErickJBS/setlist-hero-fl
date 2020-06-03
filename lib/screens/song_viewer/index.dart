import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:setlistherofl/models/song.dart';
import 'package:setlistherofl/screens/song_viewer/styles.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/chords_viewer/index.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/lyrics_viewer/index.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/sheets_viewer/index.dart';

class SongViewerScreen extends StatefulWidget {
  final List<Song> songs;
  final int index;

  SongViewerScreen({this.songs, this.index});

  @override
  _SongViewerState createState() => _SongViewerState();
}

class _SongViewerState extends State<SongViewerScreen> {
  int _selectedIndex = 0;
  PageController _controller;
  Duration _pageSwapDuration = Duration(milliseconds: 500);
  Curve _pageSwapCurve = Curves.ease;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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

  void _initPageController(int index) {
    _controller = PageController(initialPage: index, viewportFraction: 0.9);
  }

  void _nextPage() {
    _controller.nextPage(duration: _pageSwapDuration, curve: _pageSwapCurve);
  }

  void _prevPage() {
    _controller.previousPage(
        duration: _pageSwapDuration, curve: _pageSwapCurve);
  }

  @override
  Widget build(BuildContext context) {
    List<Song> songs = widget.songs;
    int songIndex = widget.index;

    _initPageController(songIndex);

    var tabs = [
      LyricsViewer(
        pageController: _controller,
      ),
      ChrodsViewer(
        pageController: _controller,
      ),
      SheetsViewer(pageController: _controller,)
    ];

    AppBar appBar = AppBar(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Text(
          //songs[songIndex].name,
          'DEMO',
          style: appBarTitleStyle),
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
      currentIndex: _selectedIndex,
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

    var body = Stack(
      children: <Widget>[
        tabs[_selectedIndex],
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
        appBar: appBar, bottomNavigationBar: bottomNavigatorBar, body: body);
  }
}
