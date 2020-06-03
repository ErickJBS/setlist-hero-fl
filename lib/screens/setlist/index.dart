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
        backgroundColor: Theme.of(context).appBarTheme.color,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Theme.of(context).iconTheme.color,
        ),
        title: Text(event.name,
          style: Theme.of(context).textTheme.headline6,
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
