import 'dart:convert';

import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:setlistherofl/app_config.dart';
import 'package:setlistherofl/models/user.dart';

enum Provider { FACEBOOK, GOOGLE }

class AuthService {
  String _apiUrl = config.apiUrl;
  String _token;
  User _currentUser;

  Future<User> loginWithPassword(String identifier, String password) async {
    var url = '$_apiUrl/auth/email';
    var body = {'identifier': identifier, 'password': password};
    var response = await http.post(url,
        headers: {'content-type': 'application/json'}, body: jsonEncode(body));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      final user = User.fromMap(data['user']);
      
      await saveAuthToken(data['token']);
      await saveCurrentUser(user);

      return user;
    } else {
      return null;
    }
  }

  Future<User> register(
      {String email,
      String username,
      String password,
      String displayName}) async {
    var url = '$_apiUrl/auth/register';
    var body = {
      'email': email,
      'displayName': displayName,
      'username': username,
      'password': password
    };

    try {
      var response = await http.post(url,
          headers: {'content-type': 'application/json'},
          body: jsonEncode(body));

      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        return User.fromMap(data);
      } else {
        return null;
      }
    } catch (e) {
      throw new Exception("Registration error: Invalid username and/or email");
    }
  }

  Future<User> getUser(String userId) async {
    var url = '$_apiUrl/user/$userId';
    var response = await http.get(url);
    var result = jsonDecode(response.body);
    return User.fromMap(result);
  }

  Future<User> loginWithSocial(Provider provider) async {
    // Present the dialog to the user
    String urlProvider =
        (provider == Provider.FACEBOOK) ? 'facebook' : 'google';
    final response = await FlutterWebAuth.authenticate(
      url: '$_apiUrl/auth/$urlProvider?redirectUri=setlistheromobile:/',
      callbackUrlScheme: "setlistheromobile",
    );

    // Extract token from resulting url
    final result = Uri.parse(response);
    final token = result.queryParameters['token'];
    final userId = result.queryParameters['userId'];

    await saveAuthToken(token);
    final user = await getUser(userId);
    await saveCurrentUser(user);

    return user;
  }

  Future<void> logout() async {
    _token = null;
    _currentUser = null;
    var preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  Future<void> saveAuthToken(String token) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setString('token', token);
  }

  Future<String> getAuthToken() async {
    if (_token == null) {
      var preferences = await SharedPreferences.getInstance();
      _token = preferences.get('token');
    }
    return _token;
  }

   Future<void> saveCurrentUser(User user) async {
    var preferences = await SharedPreferences.getInstance();
    final json = jsonEncode(user.toMap());
    await preferences.setString('user', json);
  }

  Future<User> getCurrentUser() async {
    if (_currentUser == null) {
      var preferences = await SharedPreferences.getInstance();
      final json = preferences.get('user');
      _currentUser = User.fromMap(jsonDecode(json));
    }
    return _currentUser;
  }
}
