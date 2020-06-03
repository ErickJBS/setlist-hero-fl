import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setlistherofl/models/song.dart';

class ChrodsViewer extends StatefulWidget {
  PageController pageController;
  List<Song> songs;
  int index;

  ChrodsViewer({this.pageController, this.songs, this.index});

  @override
  State<StatefulWidget> createState() {
    return _ChrodsViewerState();
  }
}

class _ChrodsViewerState extends State<ChrodsViewer> {
  List<Widget> pages = [];
  var _size = 10.0;
  var _supersize = 10.0;

  Widget _generateCardContent(List<TextSpan> list) {
    return GestureDetector(
        onScaleUpdate: (ScaleUpdateDetails details) {
          print(details.scale);
          if (details.scale <= 1.5 && details.scale >= 0.5)
            setState(() {
              _size = _supersize * details.scale;
            });
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

  var _prevSize;

  @override
  Widget build(BuildContext context) {
    List<TextSpan> list = [
      TextSpan(text: '''
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
''', style: TextStyle(color: Colors.black, fontSize: _size)),
      TextSpan(text: '''
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
''', style: TextStyle(color: Colors.black, fontSize: _size))
    ];
    var superSize = 12.0;

    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: widget.pageController,
      children: <Widget>[
        _generateCardContent(list),
        _generateCardContent(list),
      ],
    );
  }
}
