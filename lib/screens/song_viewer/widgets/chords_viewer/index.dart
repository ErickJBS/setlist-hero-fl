import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:setlistherofl/models/song.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/feedback_message/index.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/textspan_builder.dart';
import 'package:setlistherofl/utils/textspan_utils.dart';

class ChrodsViewer extends StatefulWidget {
  final PageController pageController;
  final List<Song> songs;
  final int index;

  ChrodsViewer({this.pageController, this.songs, this.index});

  @override
  State<StatefulWidget> createState() {
    return _ChrodsViewerState();
  }
}

class _ChrodsViewerState extends State<ChrodsViewer> {
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

  List<Widget> _generateChordsCards(List<Song> songsAndChords) {
    List<Widget> cards = [];
    TextSpanBuilder builder = new TextSpanBuilder(scale: _viewerFontScale);

    for (Song element in widget.songs) {
      if (element.lyrics == null) {
        cards.add(FeedbackMessage(icon: MdiIcons.textBoxRemove, message: 'No content for this song'));
      } else {
        var doc = Delta.fromJson(element.lyrics['ops']);
        cards
            .add(_generateCardContent(TextSpanUtils.DeltaToList(doc, builder)));
      }
    }

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: widget.pageController,
        children: _generateChordsCards(widget.songs));
  }
}
