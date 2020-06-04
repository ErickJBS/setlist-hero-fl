import 'package:setlistherofl/utils/string_utils.dart';

class Sheet {
  final String instrument;
  final String content;

  Sheet({this.instrument, this.content});

  Sheet.fromMap(Map<String, dynamic> data): 
    instrument = data['instrument'],
    content = data['content'];

  Map<String, dynamic> toMap() {
    return {
      'instrument': instrument,
      'content': content
    };
  }

  static String get modelName {
    return 'sheet';
  }
}

class Song {
  final String id;
  final String name;
  final String band;
  final Map lyrics;
  final Map chords;
  final int tempo;
  final List<Sheet> sheets;
  final List<String> tags;

  Song({this.id, this.name, this.band, this.lyrics, this.chords, this.tempo, this.sheets, this.tags});

  Song.fromMap(Map<String, dynamic> data):
    id = data['id'],
    name = data['name'],
    band = data['band'],
    lyrics = data['lyrics'],
    chords = data['chords'],
    tempo = data['tempo'],
    sheets = _getSheets(data['sheets']),
    tags = toStringArray(data['tags']);
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'band': band,
      'lyrics': lyrics,
      'tempo': tempo,
      'sheets': sheets,
      'tags': tags
    };
  }

  static String get modelName {
    return 'song';
  }

  static List<Sheet> _getSheets(dynamic data) {
    List<dynamic> sheets = data;
    if (sheets != null) {
      return sheets.map((e) => Sheet.fromMap(e)).toList();
    }
    return List<Sheet>();
  }
}

class SongFilter {
  String band;
  String tag;
  SongFilter({ this.band, this.tag });

  Map<String, dynamic> toMap() {
    return {
      'band': band,
      'tag': tag
    };
  }
}