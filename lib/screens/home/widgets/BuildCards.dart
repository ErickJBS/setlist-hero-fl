import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setlistherofl/screens/home/event_screen.dart';

class BuildCard extends StatelessWidget {
  final String band;
  final String date;
  final String  tourName;

  const BuildCard({this.band, this.date, this.tourName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EventoSets(
                date: date,
                tourName: tourName,
                nameBand: band,
              ),
            ),
          );
        },
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10)
              ),

              SizedBox(height: 5),
              Text(band,
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                ),

              ),
              Text(tourName,
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                ),
              ),
              Text(date,
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
    );
  }
}
