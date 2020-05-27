import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setlistherofl/screens/home/widgets/BuildCards.dart';

class EventPageYear extends StatefulWidget {
  @override
  _EventPageYearState createState() => _EventPageYearState();
}

class _EventPageYearState extends State<EventPageYear> {
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
                      date: 'June 31th',
                      tourName: 'One More Light Tour',
                    ),
                    BuildCard(
                      band: 'Linkin Park',
                      date: 'July 26th',
                      tourName: 'One More Light Tour',
                    ),
                    BuildCard(
                      band: 'Linkin Park',
                      date: 'August 26th',
                      tourName: 'One More Light Tour',
                    ),
                    BuildCard(
                      band: 'Linkin Park',
                      date: 'September 26th',
                      tourName: 'One More Light Tour',
                    ),
                    BuildCard(
                      band: 'Linkin Park',
                      date: 'September 27th',
                      tourName: 'One More Light Tour',
                    ),
                    BuildCard(
                      band: 'Linkin Park',
                      date: 'September 29th',
                      tourName: 'One More Light Tour',
                    ),
                    BuildCard(
                      band: 'Linkin Park',
                      date: 'September 30th',
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