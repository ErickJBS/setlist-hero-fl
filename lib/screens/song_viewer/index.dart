import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:setlistherofl/screens/home/event_screen.dart';

class SongViewerScreen extends StatefulWidget {
  Songs _songs;
  SongViewerScreen(Songs songs){
    _songs = songs;
  }

  @override
  State<StatefulWidget> createState(){
    return _SongViewerState(_songs);
  }

//  @override
//  _SongViewerState createState() => _SongViewerState(_songs);
}

const String _montserratFontFamily = 'Montserrat';
var _viewerFontSize = 8.0;

class _SongViewerState extends State<SongViewerScreen> {
  int _selectedIndex = 0;
  String _selectedSet;
  String _selectedSong;

  Songs _songs;
  _SongViewerState(Songs songs){
    _songs = songs;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _increaseFontSize() {
    print(_viewerFontSize);
    setState(() {
      _viewerFontSize += 2.0;
    });
  }

  void _decreaseFontSize() {
    print(_viewerFontSize);
    setState(() {
      _viewerFontSize -= 2.0;
    });
  }

  List<DropdownMenuItem<String>> _buildDropdownItems(List<String> list) {
    List<DropdownMenuItem<String>> items = List<DropdownMenuItem<String>>();

    for (String s in list) {
      items.add(DropdownMenuItem(value: s, child: Text(s)));
    }

    //return items;
    return list.map<DropdownMenuItem<String>>((value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
          style: TextStyle(),
        ),
      );
    }).toList();
  }

  Widget _buildDropdown(
    List<String> items,
    String initValue,
  ) {
    return DropdownButton<String>(
        value: initValue,
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        dropdownColor: Theme.of(context).primaryColor,
        elevation: 0,
        style: TextStyle(color: Colors.white),
        underline: Container(
          height: 0,
        ),
        onChanged: (String newValue) {
          setState(() {
            initValue = newValue;
          });
        },
        items: _buildDropdownItems(items));
  }

  List<String> l1 = ['Act 1', 'Act 2', 'Act 3'];
  List<String> l2 = ['I want to break free', 'Highway to hell'];

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[_buildDropdown(l1, l1[0]), _buildDropdown(l2, l2[0])],
      ),
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            print('BACK');
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

    var fabIncreaseFont = FloatingActionButton(
      heroTag: 'increase',
      onPressed: _increaseFontSize,
      child: Icon(MdiIcons.formatFontSizeIncrease),
    );

    var fabDecreaseFont = FloatingActionButton(
      heroTag: 'decrease',
      mini: true,
      backgroundColor: Colors.grey[100],
      onPressed: _decreaseFontSize,
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

    var acdcHighwayToHell = '''
    <p>Living easy, living free<br /> Season ticket on a one-way ride<br /> Asking nothing, leave me be<br /> Taking everything in my stride<br /> <strong>Don't need reason</strong>, don't need rhyme<br /> Ain't nothing I would rather do<br /> Going down, party time<br /> My friends are gonna be there too<br /><br /> I'm on the highway to hell<br /> On the highway to hell<br /> Highway to hell<br /> I'm on the highway to hell<br /><br /> <strong>No stop signs</strong>, speed limit<br /> Nobody's gonna slow me down<br /> Like a wheel, gonna spin it<br /> Nobody's gonna mess me around<br /> Hey Satan, paid my dues<br /> Playing in a rocking band<br /> Hey mama, look at me<br /> <strong>I'm on my way to the promised land, <em><span style="text-decoration: underline;">whoo!</span></em></strong><br /><br /> I'm on the highway to hell<br /> Highway to hell<br /> I'm on the highway to hell<br /> Highway to hell<br /><br /> <span style="text-decoration: underline; color: #ffffff; background-color: #ff0000;"><em><strong>Don't stop me</strong></em></span><br /><br /> I'm on the highway to hell<br /> On the highway to hell<br /> I'm on the highway to hell<br /> On the highway<br /> Yeah, highway to hell<br /> I'm on the highway to hell<br /> Highway to hell<br /> Highway to hell<br /><br /> And I'm going down<br /> All the way<br /> Whoa!<br /> I'm on the highway to hell</p>
    ''';

    var queenFree = '''
    <p>I want to break free<br>
I want to break free<br>
I want to break free from your lies<br>
You're so self satisfied I don't need you<br>
I've got to break free<br>
God knows, God knows I want to break free<br><br>
I've fallen in love<br>
I've fallen in love for the first time<br>
And this time I know it's for real<br>
I've fallen in love, yeah<br>
God knows, God knows I've fallen in love<br><br>
It's strange but it's true, yeah<br>
I can't get over the way you love me like you do<br>
But I have to be sure<br>
When I walk out that door<br>
Oh, how I want to be free, baby<br>
Oh, how I want to be free<br>
Oh, how I want to break free<br><br>
But life still goes on<br>
I can't get used to living without, living without<br>
Living without you by my side<br>
I don't want to live alone, hey<br>
God knows, got to make it on my own<br><br>
So baby can't you see<br>
I've got to break free<br>
I've got to break free<br>
I want to break free, yeah<br>
I want, I want, I want, I want to break free<br></p>
    ''';

    Map<String, Style> d = Map();

    d['p'] = Style(fontSize: FontSize(_viewerFontSize),);

    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigatorBar,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Html(
                data: acdcHighwayToHell,
                style: d,
              ),
            )),
            Positioned(bottom: 8.0, right: 8.0, child: fontSizeButtons),
          ],
        ),
      ),
    );
  }
}
