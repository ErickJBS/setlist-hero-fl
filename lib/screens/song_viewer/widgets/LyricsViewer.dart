import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:setlistherofl/screens/song_viewer/TextSpanBuilder.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/ContentView.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/NavigationButtons.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/TextSpanUtils.dart';

class LyricsViewer extends StatefulWidget {
  LyricsViewer();

  @override
  State<StatefulWidget> createState() {
    return _LyricsViewerState();
  }
}

class _LyricsViewerState extends State<LyricsViewer> {
  List<Widget> pages = [];
  double _viewerFontIncrement = 0.0;

  PageController controller =
      PageController(initialPage: 1, viewportFraction: 0.9);

  void _increaseFontSize() {
    setState(() {
      _viewerFontIncrement += 4.0;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _viewerFontIncrement -= 4.0;
    });
  }

  Widget _generateCardContent(List<TextSpan> list) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
      child: Card(
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(children: list),
                ))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: GET LYRICS INFO (RICH TEXT)
    // 

    //var lyricsJson = json.decode(LYRICS TEXT);
    //var doc = Delta.fromJson(lyricsJson['ops']);
    //var builder = TextSpanBuilder(increment: _viewerFontIncrement);
    //TextSpanUtils.DeltaToList(doc, builder);
    

    return ContentView(
        onTapDecrease: _decreaseFontSize,
        onTapIncrease: _increaseFontSize,
        body: PageView(
          controller: controller,
          children: <Widget>[
            PrevSetButton(onTap: () {
            },),
            NextSetButton()
          ],
        ));
  }
}
