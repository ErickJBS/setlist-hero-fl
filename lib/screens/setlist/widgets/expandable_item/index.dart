import 'package:flutter/material.dart';
import 'package:setlistherofl/models/song.dart';
import '../song_item/index.dart';

class ExpandableItem extends StatelessWidget {
  final String title;
  final List<Song> songs;
  final bool initiallyExpanded;

  ExpandableItem({this.title, this.songs, this.initiallyExpanded = false});

  @override
  Widget build(BuildContext context) {
    if (songs.isEmpty) return ListTile(title: Text(title));
    return ExpansionTile(
      initiallyExpanded: initiallyExpanded,
      title: Text(title),
      children: _populateChildren(),
    );
  }

  List<Widget> _populateChildren() {
    List<Widget> songItems = [];

    songs.asMap().forEach((index, item) {
      songItems.add(SongItem(
        songs: songs,
        index: index,
      ));
    });

    return songItems;
  }
}
