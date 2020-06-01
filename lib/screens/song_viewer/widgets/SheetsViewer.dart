import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SheetsViewer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SheetsViewerState();
  }
}

class _SheetsViewerState extends State<SheetsViewer> {
  final String _montserratFontFamily = 'Montserrat';

  @override
  Widget build(BuildContext context) {
    /*var right = SheetMusic(
      height: (MediaQuery.of(context).size.width * 0.9 / 1.97),
      width: MediaQuery.of(context).size.width,
      trebleClef: true,
      scale: "Gb Major",
      pitch: 'A4',
      pitchTap: () {
        print('ppop');
      },
      clefTap: () {
        print('asd');
      },
    );

    var left = SheetMusic(
      height: (MediaQuery.of(context).size.width * 0.9 / 1.97),
      width: MediaQuery.of(context).size.width,
      trebleClef: false,
      scale: "C Major",
      pitch: 'A5',
      pitchTap: () {
        print('ppop');
      },
      clefTap: () {
        print('asd');
      },
    );*/

    return Center(
     /* child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[right, left],),
      ),*/
      child: Text('Hello')
    );
  }

}