import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setlistherofl/screens/home/event_screen.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class Events {
  String bandName, date, tourName;

  Events({this.bandName, this.date, this.tourName});
}

class _EventPageState extends State<EventPage> {
  List<Events> events = new List();

  _EventPageState(){
    events.add(new Events(bandName: 'Linkin Park', date: 'May 26th', tourName: 'One More Light Tour'));
  }

  Widget MyEventsIndex(BuildContext context, int index) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => EventoSets(
          date: events[index].date,
          tourName: events[index].tourName,
          nameBand: events[index].bandName)
        )
        );
      },
      child: Container(

        child: Card(
          margin: EdgeInsets.fromLTRB(16, 5, 16, 5),
          child: Material(
            color: Colors.white,
            elevation: 14,
            borderRadius: BorderRadius.circular(5),
            shadowColor: Colors.grey.withOpacity(.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10)
                ),
                SizedBox(height: 5),
                Text(events[index].bandName,
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                  ),

                ),
                Text(events[index].tourName,
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                  ),
                ),
                Text(events[index].date,
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }

    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) => MyEventsIndex(context, index),
                ),
              ),
            ],
          ),

        ),
      );
    }
  }


