import 'package:flutter/material.dart';
import 'package:setlistherofl/models/event.dart';
import './widgets/expandable_item/index.dart';

class SetlistScreen extends StatelessWidget {
  final Event event;

  SetlistScreen(this.event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        title: Text(event.name,
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: event.setlist.length,
              itemBuilder: (BuildContext context, int index) {
                return ExpandableItem(
                  title: event.setlist[index].name ?? '',
                  songs: event.setlist[index].songs
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
