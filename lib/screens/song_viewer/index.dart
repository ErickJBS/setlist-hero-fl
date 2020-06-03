import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:setlistherofl/models/song.dart';
// import 'package:setlistherofl/screens/home/event_screen.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/ChordsViewer.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/LyricsViewer.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/SheetsViewer.dart';

class SongViewerScreen extends StatefulWidget {
  final List<Song> songs;
  final int index;

  SongViewerScreen({this.songs, this.index});

  @override
  _SongViewerState createState() => _SongViewerState();
}

const String _montserratFontFamily = 'Montserrat';

class _SongViewerState extends State<SongViewerScreen> {
  int _selectedIndex = 0;

  final tabs = [LyricsViewer(), ChrodsViewer(), SheetsViewer()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Text(
            'Song B',
            style: TextStyle(
                fontFamily: _montserratFontFamily, color: Colors.black87),
                ),
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

    return Scaffold(
        appBar: appBar,
        bottomNavigationBar: bottomNavigatorBar,
        body: tabs[_selectedIndex]);
  }
}
