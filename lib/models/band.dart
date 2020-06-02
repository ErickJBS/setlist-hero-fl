import 'package:setlistherofl/utils/string_utils.dart';

class Band {
  final String id;
  final String name;
  final String description;
  final String logo;
  final List<String> genres;
  final String manager;

  Band({this.id, this.name, this.description, this.logo, this.genres, this.manager});

  Band.fromMap(Map<String, dynamic> data):
    id = data['id'],
    name = data['name'],
    description = data['description'],
    logo = data['logo'],
    genres = toStringArray(data['genres']),
    manager = data['manager'];
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'logo': logo,
      'genres': genres,
      'manager': manager
    };
  }

  static String get modelName {
    return 'band';
  }
}

class BandFilter {
  String genre;
  String manager;
  String active;
  String musician;

  BandFilter({this.genre, this.manager, this.active, this.musician});

  Map<String, dynamic> toMap() {
    return {
      'genre': genre,
      'manager': manager,
      'active': active,
      'musician': musician
    };
  }
}