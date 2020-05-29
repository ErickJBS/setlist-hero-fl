import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setlistherofl/screens/song_viewer/index.dart';


class EventoSets extends StatefulWidget {
  final nameBand, tourName, date;

  EventoSets ({this.date, this.tourName, this.nameBand});
  @override
  _EventoSetsState createState() => _EventoSetsState();
}

class Songs {
  String songName, set;

  Songs({this.set, this.songName});
}

class _EventoSetsState extends State<EventoSets> {
  List<Songs> songs = new List();
  
  _EventoSetsState(){
    songs.add(new Songs(set: 'Set A', songName: 'The catalyst'));
    songs.add(new Songs(set: 'Set A',songName: 'Welcome'));
    songs.add(new Songs(set: 'Set A',songName: 'Numb'));
    songs.add(new Songs(set: 'Set A',songName: 'In the end'));
    songs.add(new Songs(set: 'Set B',songName: 'Castle of Glass'));
    songs.add(new Songs(set: 'Set B',songName: 'Final Masquerade'));
    songs.add(new Songs(set: 'Set B',songName: 'From the inside'));
    songs.add(new Songs(set: 'Set B',songName: 'Faint'));
    songs.add(new Songs(set: 'Set B',songName: 'Given Up'));
    songs.add(new Songs(set: 'Set B',songName: 'Waiting for the end'));
    songs.add(new Songs(set: 'Set C',songName: 'Heavy'));
    songs.add(new Songs(set: 'Set C',songName: 'Guilty all the same'));
    songs.add(new Songs(set: 'Set C',songName: 'Bleed it out'));

  }

  Widget MySongsIndex(BuildContext context, int index){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SongViewerScreen(songs[index])));
      },
      child: Container(

        child: Card(
          margin: EdgeInsets.fromLTRB(16, 5, 16, 5),
          child: Row(
            children: <Widget>[
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(songs[index].set),  //Imprimir Set o acto de canciópn
          ),
            SizedBox(height: 5.0),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(songs[index].songName),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Setlist',
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'Montserrat',
          ),
        ),
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                  widget.tourName,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))
              ),
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                  widget.nameBand,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))
              ),
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                  widget.date,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))
              ),
            ),
            SizedBox(height: 5.0),
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) => MySongsIndex(context, index),
              ),
            ),
          ],

        ),

      ),


    //  bottomNavigationBar: BottomBar(),
    );
  }
}
