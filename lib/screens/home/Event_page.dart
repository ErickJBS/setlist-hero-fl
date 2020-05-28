import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setlistherofl/screens/home/widgets/BuildCards.dart';
class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              child: Material(
                color: Colors.white,
                elevation: 14,
                borderRadius: BorderRadius.circular(5),
                shadowColor: Colors.grey.withOpacity(.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    BuildCard(
                      band: 'Linkin Park',
                      date: 'May 26th',
                      tourName: 'One More Light Tour',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
    ),
    );
  }
}
