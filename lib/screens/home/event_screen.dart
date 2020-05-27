import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:setlistherofl/widgets/bottom_bar_home_screen/bottom_bar.dart';
import 'package:setlistherofl/screens/home/Event_page.dart';

class EventoSets extends StatefulWidget {
  final nameBand, tourName, date;

  EventoSets ({this.date, this.tourName, this.nameBand});
  @override
  _EventoSetsState createState() => _EventoSetsState();
}

class _EventoSetsState extends State<EventoSets> {

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
        title: Text('Setlist Hero',
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'Montserrat',
          ),
        ),
      ),

      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
                widget.tourName,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 25.0,
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
                    fontSize: 20.0,
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
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF17532))
            ),
          ),
          SizedBox(height: 5.0),
        ],
      ),

    //  bottomNavigationBar: BottomBar(),
    );
  }
}
