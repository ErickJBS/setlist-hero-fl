import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:setlistherofl/app_config.dart';
import 'package:setlistherofl/service_locator.dart';
import 'package:setlistherofl/models/song.dart';
import 'auth_service.dart';

class SongService {
  AuthService authService = locator<AuthService>();
  final String apiUrl = config.apiUrl;

  Future<Song> findById(String id) async {
    final requestUrl = '$apiUrl/song/$id';
    final headers = await _headers();
    final response = await http.get(requestUrl, headers: headers );
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      return Song.fromMap(data);
    }
    return null;
  }

  Future<List<Song>> findByFilter<T>(SongFilter filter) async {
    final queryBuffer = new StringBuffer();
    filter.toMap().forEach((key, value) {
      if (value != null) {
        queryBuffer.write('&$key=$value');
      }
    });
    final requestUrl = '$apiUrl/song?${queryBuffer.toString()}';
    final headers = await _headers();
    final response = await http.get(requestUrl, headers: headers );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Song.fromMap(e)).toList();
    }
    return null;
  }

  Future<Map<String, String>> _headers() async {
    final token = await authService.getAuthToken();
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
  }
}