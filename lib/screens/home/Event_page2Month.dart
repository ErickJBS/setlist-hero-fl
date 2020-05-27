import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setlistherofl/screens/home/widgets/BuildCards.dart';

class EventPageMonth extends StatefulWidget {
  @override
  _EventPageMonthState createState() => _EventPageMonthState();
}

class _EventPageMonthState extends State<EventPageMonth> {
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
                      band: 'Dua Lipa',
                      date: 'May 29th',
                      tourName: 'Nostalgia Tour',
                    ),
                    BuildCard(
                      band: 'Paramore',
                      date: 'May 30th',
                      tourName: 'Laughter Tour',
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

