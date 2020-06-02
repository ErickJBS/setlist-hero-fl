import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:setlistherofl/app_config.dart';
import 'package:setlistherofl/service_locator.dart';
import 'package:setlistherofl/models/band.dart';
import 'auth_service.dart';

class BandService {
  AuthService authService = locator<AuthService>();
  final String apiUrl = config.apiUrl;

  Future<Band> findById(String id) async {
    final requestUrl = '$apiUrl/band/$id';
    final headers = await _headers();
    final response = await http.get(requestUrl, headers: headers );
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      return Band.fromMap(data);
    }
    return null;
  }

  Future<List<Band>> findByFilter<T>(BandFilter filter) async {
    final queryBuffer = new StringBuffer();
    filter.toMap().forEach((key, value) {
      if (value != null) {
        queryBuffer.write('&$key=$value');
      }
    });
    final requestUrl = '$apiUrl/band?${queryBuffer.toString()}';
    final headers = await _headers();
    final response = await http.get(requestUrl, headers: headers );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Band.fromMap(e)).toList();
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