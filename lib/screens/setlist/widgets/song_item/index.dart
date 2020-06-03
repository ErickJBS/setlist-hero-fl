import 'package:flutter/material.dart';
import 'package:setlistherofl/models/song.dart';
import 'package:setlistherofl/screens/song_viewer/index.dart';

class SongItem extends StatelessWidget {
  final List<Song> songs;
  final int index;

  SongItem({this.songs, this.index});

  @override
  Widget build(BuildContext context) {
    Song item = songs[index];

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SongViewerScreen(songs: songs, index: index)));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[Text(item.name), Text(item.tempo.toString())],
          ),
        ),
      ),
    );
  }
}
