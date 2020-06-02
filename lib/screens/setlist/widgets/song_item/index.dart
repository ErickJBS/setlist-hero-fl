import 'package:flutter/material.dart';
import 'package:setlistherofl/models/song.dart';

class SongItem extends StatelessWidget {
  final Song item;

  SongItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(item.name),
            Text(item.tempo.toString())
          ],
        ),
      ),
    );
  }

}
