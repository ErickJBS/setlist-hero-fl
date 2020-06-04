import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:setlistherofl/models/song.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/textspan_builder.dart';
import 'package:setlistherofl/service_locator.dart';
import 'package:setlistherofl/services/song_service.dart';
import 'package:setlistherofl/utils/textspan_utils.dart';

class LyricsViewer extends StatefulWidget {
  PageController pageController;
  List<Song> songs;
  int index;

  LyricsViewer({this.pageController, this.songs, this.index});

  @override
  State<StatefulWidget> createState() {
    return _LyricsViewerState();
  }
}

class _LyricsViewerState extends State<LyricsViewer> {
  double _viewerFontScale = 1.0;

  Widget _generateCardContent(List<TextSpan> list) {
    return GestureDetector(
        onScaleUpdate: (ScaleUpdateDetails details) {
          if (details.scale <= 1.5 && details.scale >= 0.5) {
            setState(() {
              _viewerFontScale = details.scale;
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
          child: Card(
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(children: list),
                    ))),
          ),
        ));
  }

  static SongService _songService = locator<SongService>();

  Future<List<Song>> _getSongsLyrics(List<Song> songs) async {
    List<Song> songsAndLyrics = [];

    for (Song element in songs) {
      songsAndLyrics.add(await _songService.findById(element.id));
    }

    return songsAndLyrics;
  }

  List<Widget> _generateLyricsCards(List<Song> songsAndLyrics) {
    List<Widget> cards = [];
    TextSpanBuilder builder = new TextSpanBuilder(scale: _viewerFontScale);

    for (Song element in songsAndLyrics) {
      var doc = Delta.fromJson(element.lyrics['ops']);
      cards.add(_generateCardContent(TextSpanUtils.DeltaToList(doc, builder)));
    }

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    var somethingWrong = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            MdiIcons.emoticonSad,
            size: 60.0,
          ),
          Text('Something went wrong, try later')
        ],
      ),
    );

    return FutureBuilder(
        future: _getSongsLyrics(widget.songs),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var songsAnLyrics = snapshot.data;
            if (songsAnLyrics == null) {
              return somethingWrong;
            }
            return PageView(
                controller: widget.pageController,
                children: _generateLyricsCards(songsAnLyrics));
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return somethingWrong;
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
