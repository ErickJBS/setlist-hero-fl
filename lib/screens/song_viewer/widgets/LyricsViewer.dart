import 'package:flutter/material.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/ContentView.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/NavigationButtons.dart';

class LyricsViewer extends StatefulWidget {
  

  LyricsViewer();

  @override
  State<StatefulWidget> createState() {
    return _LyricsViewerState();
  }
}

class _LyricsViewerState extends State<LyricsViewer> {
  List<Widget> pages = [];
  final String _montserratFontFamily = 'Montserrat';
  double _viewerFontSize = 20.0;
  
  PageController controller = PageController(initialPage: 1, viewportFraction: 0.9);

    void _increaseFontSize() {
    setState(() {
      _viewerFontSize += 2.0;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _viewerFontSize -= 2.0;
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
    List<TextSpan> list = [
      TextSpan(
          text: 'Hello',
          style: TextStyle(
            color: Colors.black,
              fontFamily: _montserratFontFamily, fontSize: _viewerFontSize)),
      TextSpan(
          text: 'Bold',
          style: TextStyle(
              fontFamily: _montserratFontFamily,
              color: Colors.black,
              decoration: null,
              fontSize: _viewerFontSize,
              fontWeight: FontWeight.bold)),
      TextSpan(
          text: 'Italic',
          style: TextStyle(
            color: Colors.black,
              fontFamily: _montserratFontFamily,
              fontSize: _viewerFontSize,
              fontStyle: FontStyle.italic)),
      TextSpan(
          text: '\n',
          style: TextStyle(
              fontFamily: _montserratFontFamily,
              fontSize: _viewerFontSize,
              decoration: TextDecoration.underline)),
      TextSpan(
          text: 'Color',
          style: TextStyle(
              fontFamily: _montserratFontFamily,
              fontSize: _viewerFontSize,
              color: Color.fromARGB(255, 0, 71, 178))),
      TextSpan(
          text: 'Background',
          style: TextStyle(
              fontFamily: _montserratFontFamily,
              fontSize: _viewerFontSize,
              backgroundColor: Color.fromARGB(255, 255, 255, 0)))
    ];

    

  return ContentView(onTapDecrease: _decreaseFontSize, onTapIncrease: _increaseFontSize, body: PageView(controller: controller, children: <Widget> [PrevSetButton(), _generateCardContent(list), _generateCardContent(list), NextSetButton()],));
  }
}
