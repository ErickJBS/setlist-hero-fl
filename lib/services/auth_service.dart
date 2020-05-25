import 'dart:convert';

import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:setlistherofl/app_config.dart';
import 'package:setlistherofl/models/user.dart';

enum Provider {
  FACEBOOK, GOOGLE
}

class AuthService {

  String apiUrl = config.apiUrl;

  Future<User> loginWithPassword(String identifier, String password) async {
    var url = '$apiUrl/auth/email';
    var body = { 'identifier': identifier, 'password': password };
    var response = await http.post(url, headers: {'content-type': 'application/json'}, body: jsonEncode(body));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      
      await saveAuthToken(data['token']);

      return User.fromMap(data['user']);
    } else {
      return null;
    }
  }

  Future<User> register({String email, String username, String password, String displayName }) async {
    var url = '$apiUrl/auth/register';
    var body = {
      'email': email,
      'displayName': displayName,
      'username': username,
      'password': password
    };
    var response = await http.post(url, headers: {'content-type': 'application/json'}, body: jsonEncode(body));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return User.fromMap(data);
    } else {
      return null;
    }
  }

  Future<User> getUser(String userId) async {
    var url = '$apiUrl/user/$userId';
    var response = await http.get(url);
    var result = jsonDecode(response.body);
    return User.fromMap(result);
  }

  Future<User> loginWithSocial(Provider provider) async {
    // Present the dialog to the user
    String urlProvider = (provider == Provider.FACEBOOK) ? 'facebook' : 'google';
    final response = await FlutterWebAuth.authenticate(
      url: '$apiUrl/auth/$urlProvider?redirectUri=setlistheromobile:/',
      callbackUrlScheme: "setlistheromobile",
    );

    // Extract token from resulting url
    final result = Uri.parse(response);
    final token = result.queryParameters['token'];
    final userId = result.queryParameters['userId'];
    
    await saveAuthToken(token);
    return getUser(userId);
  }


  Future<void> saveAuthToken(String token) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setString('token', token);
  }

  Future<String> getAuthToken() async {
    var preferences = await SharedPreferences.getInstance();
    return preferences.get('token');
  }
}