import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ContentView.dart';
import 'NavigationButtons.dart';

class ChrodsViewer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChrodsViewerState();
  }
}

class _ChrodsViewerState extends State<ChrodsViewer> {
  List<Widget> pages = [];
  final String _montserratFontFamily = 'Montserrat';
  PageController controller = PageController(initialPage: 1, viewportFraction: 0.9);
  
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
    List<TextSpan> list = [TextSpan(text: '''
[Verse]
 A                        Bm
En un dia de estos en que suelo pensar
 F#m                       C#m
Hoy va hacer el dia menos pensado
 D                     A
nos hemos cruzado has decidido mirar
        E         D              A
a los ojitos azules que ahora van a tu lado
 
 A                        Bm
En este momento en que te conocí
 F#m                    C#m
resumiendo con prisa tiempo de silencio
 D                    A
te juro que a nadie le e vuelto a decir
       E           D                A
que tenemos el record del mundo en querernos
''', style: TextStyle(color: Colors.black))];


    return PageView(controller: controller, children: <Widget>[PrevSetButton(), _generateCardContent(list), NextSetButton()],);
  }

}