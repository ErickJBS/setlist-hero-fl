import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setlistherofl/screens/home/event_screen.dart';

class EventPageYear extends StatefulWidget {
  @override
  _EventPageYearState createState() => _EventPageYearState();
}
class Events {
  String bandName, date, tourName;

  Events({this.bandName, this.date, this.tourName});
}

class _EventPageYearState extends State<EventPageYear> {
  List<Events> events = new List();

  _EventPageYearState(){
    events.add(new Events(bandName: 'Twenty One Pilots', date: 'June 2nd', tourName: 'Bandito Tour'));
    events.add(new Events(bandName: 'Dua Lipa', date: 'June 3rd', tourName: 'Nostalgia Tour'));
    events.add(new Events(bandName: 'Paramore', date: 'June 10th', tourName: 'Laughter Tour'));
    events.add(new Events(bandName: 'Twenty One Pilots', date: 'June 11', tourName: 'Bandito Tour'));
    events.add(new Events(bandName: 'Twenty One Pilots', date: 'June 18', tourName: 'Bandito Tour'));
    events.add(new Events(bandName: 'Linkin Park', date: 'June 20', tourName: 'One More Light Tour'));
    events.add(new Events(bandName: 'Linkin Park', date: 'June 21', tourName: 'One More Light Tour'));
    events.add(new Events(bandName: 'Paramore', date: 'June 30th', tourName: 'Laughter Tour'));
    events.add(new Events(bandName: 'Linkin Park', date: 'July 2nd', tourName: 'One More Light Tour'));
    events.add(new Events(bandName: 'Dua Lipa', date: 'July 9th', tourName: 'Nostalgia Tour'));
    events.add(new Events(bandName: 'Linkin Park', date: 'July 15', tourName: 'One More Light Tour'));
    events.add(new Events(bandName: 'Twenty One Pilots', date: 'July 20th', tourName: 'Bandito Tour'));
    events.add(new Events(bandName: 'Linkin Park', date: 'July 26th', tourName: 'One More Light Tour'));
    events.add(new Events(bandName: 'Paramore', date: 'July 30th', tourName: 'Laughter Tour'));
    events.add(new Events(bandName: 'Linkin Park', date: 'August 26th', tourName: 'One More Light Tour'));

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