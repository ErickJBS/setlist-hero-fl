import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:setlistherofl/app_config.dart';
import 'package:setlistherofl/service_locator.dart';
import 'package:setlistherofl/models/event.dart';
import 'auth_service.dart';

class EventService {
  AuthService authService = locator<AuthService>();
  final String apiUrl = config.apiUrl;

  Future<Event> findById(String id) async {
    final requestUrl = '$apiUrl/event/$id';
    final headers = await _headers();
    final response = await http.get(requestUrl, headers: headers );
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      return Event.fromMap(data);
    }
    return null;
  }

  Future<List<Event>> findByFilter<T>(EventFilter filter) async {
    final queryBuffer = new StringBuffer();
    filter.toMap().forEach((key, value) {
      if (value != null) {
        queryBuffer.write('&$key=$value');
      }
    });
    final requestUrl = '$apiUrl/event?${queryBuffer.toString()}';
    final headers = await _headers();
    final response = await http.get(requestUrl, headers: headers );
    if (response.statusCode == 200) {
      List<Map> data = jsonDecode(response.body);
      return data.map((e) => Event.fromMap(e));
    }
    return null;
  }

  Future<Map> _headers() async {
    final token = await authService.getAuthToken();
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
  }
}