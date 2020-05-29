import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ContentView extends StatefulWidget {
  VoidCallback onTapIncrease;
  VoidCallback onTapDecrease;
  Widget body;
  
  ContentView({this.body, this.onTapDecrease, this.onTapIncrease});

  @override
  State<StatefulWidget> createState() {
    return _ContentViewState();
  }
}

class _ContentViewState extends State<ContentView> {
  final controller = PageController(initialPage: 1, viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
        var fabIncreaseFont = FloatingActionButton(
      heroTag: 'increase',
      backgroundColor: Colors.orangeAccent[700],
      onPressed: widget.onTapIncrease,
      child: Icon(MdiIcons.formatFontSizeIncrease),
    );

    var fabDecreaseFont = FloatingActionButton(
      heroTag: 'decrease',
      mini: true,
      backgroundColor: Colors.grey[100],
      onPressed: widget.onTapDecrease,
      child: Icon(
        MdiIcons.formatFontSizeDecrease,
        color: Colors.grey[800],
      ),
    );

    var fontSizeButtons = Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: fabIncreaseFont,
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: fabDecreaseFont,
        )
      ],
    );

    var body = Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: widget.body,
          ),
          Positioned(bottom: 8.0, right: 8.0, child: fontSizeButtons),
        ],
      ),
    );    

    return body;
  }
}
