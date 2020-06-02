import 'package:setlistherofl/utils/string_utils.dart';
import 'song.dart';

class Set {
  final String name;
  final List<Song> songs;

  Set({this.name, this.songs});

  Set.fromMap(Map<String, dynamic> data):
    name = data['name'],
    songs = _getSongs(data['songs']);
  
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'songs': songs
    };
  }

  static String get modelName {
    return 'set';
  }

  static List<Song> _getSongs(dynamic data) {
    List<dynamic> songs = data;
    if (songs != null) {
      return songs.map((e) => Song.fromMap(e)).toList();
    }
    return null;
  }
}

class Event {
  final String id;
  final String name;
  final DateTime date;
  final String location;
  final String tour;
  final String band;
  final String designer;
  final String bandName;
  final List<String> tags;
  final List<Set> setlist;

  Event({this.id, this.tour, this.name, this.date, this.location,
    this.band, this.designer, this.setlist, this.tags, this.bandName});

  Event.fromMap(Map<String, dynamic> data):
    id = data['id'],
    name = data['name'],
    date = DateTime.parse(data['date']),
    tour = data['tour'],
    bandName = data['bandName'],
    location = data['location'],
    band = data['band'],
    designer = data['designer'],
    setlist = _getSetlist(data['setlist']),
    tags = toStringArray(data['tags']);
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'location': location,
      'bandName': bandName,
      'tour': tour,
      'band': band,
      'designer': designer,
      'setlist': setlist,
      'tags': tags
    };
  }

  static String get modelName {
    return 'event';
  }

  static List<Set> _getSetlist(dynamic data) {
    List<dynamic> sets = data;
    if (sets != null) {
      return sets.map((e) => Set.fromMap(e)).toList();
    }
    return null;
  }
}

class EventFilter {
  String designer;
  String manager;
  String musician;
  String band;
  String tag;
  String startDate;
  String endDate;

  EventFilter({ this.designer, this.manager, this.musician,
    this.band, this.tag, this.startDate, this.endDate });
  
   Map<String, dynamic> toMap() {
    return {
      'designer': designer,
      'manager': manager,
      'musician': musician,
      'band': band,
      'tag': tag,
      'startDate': startDate,
      'endDate': endDate
    };
  }
}