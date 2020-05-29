import 'dart:async';

import 'package:html/parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsonml/html2jsonml.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:setlistherofl/screens/home/event_screen.dart';
import 'package:setlistherofl/screens/song_viewer/TextSpanBuilder.dart';
import 'package:setlistherofl/screens/song_viewer/RichTextTokenizer.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/ChordsViewer.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/LyricsViewer.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/SheetsViewer.dart';
import 'package:sheet_music/sheet_music.dart';
import 'package:tokenizer/token.dart';
import 'package:tokenizer/tokenizer.dart';

class SongViewerScreen extends StatefulWidget {
  Songs _songs;

  SongViewerScreen(Songs songs) {
    _songs = songs;
  }

  @override
  State<StatefulWidget> createState() {
    return _SongViewerState(_songs);
  }

//  @override
//  _SongViewerState createState() => _SongViewerState(_songs);
}

const String _montserratFontFamily = 'Montserrat';
double _viewerFontSize = 8.0;

class _SongViewerState extends State<SongViewerScreen> {
  int _selectedIndex = 0;
  String _selectedSet;
  String _selectedSong;

  final tabs = [LyricsViewer(), ChrodsViewer(), SheetsViewer()];

  Songs _songs;
  _SongViewerState(Songs songs) {    
    _songs = songs;
  }

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
      title: Column(
        children: <Widget>[
          Text(
            'Song B',
            style: TextStyle(
                fontFamily: _montserratFontFamily, color: Colors.black87),
          ),
          Text(
            'Set A',
            style: TextStyle(
                fontFamily: _montserratFontFamily,
                color: Colors.black87,
                fontSize: 15.0,
                fontWeight: FontWeight.w300),
          ),
        ],
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
