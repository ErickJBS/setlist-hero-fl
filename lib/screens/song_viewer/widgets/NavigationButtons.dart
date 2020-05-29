import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PrevSetButton extends StatefulWidget {
  VoidCallback onTap;

  PrevSetButton({this.onTap});

  @override
  State<StatefulWidget> createState() {
    return _PrevSetButtonState();
  }
}

class _PrevSetButtonState extends State<PrevSetButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
              onPressed: widget.onTap,
              iconSize: 80,
              icon: Icon(MdiIcons.arrowLeftCircle)),
          Text("Go to previous set")
        ],
      ),
    );
  }
}

class NextSetButton extends StatefulWidget {
  VoidCallback onTap;

  NextSetButton({this.onTap});

  @override
  State<StatefulWidget> createState() {
    return _NextSetButtonState();    
  }
}

class _NextSetButtonState extends State<NextSetButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
              onPressed: widget.onTap,
              iconSize: 80,
              icon: Icon(MdiIcons.arrowRightCircle)),
          Text("Go to next set")
        ],
      ),
    );
  }
}