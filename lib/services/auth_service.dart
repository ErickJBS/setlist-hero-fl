import 'package:setlistherofl/app_config.dart';

class AuthService {

  String apiUrl = config.apiUrl;

  Future<String> loginWithPassword(String identifier, String password) async {
    return "this is a token dummy";
  }
}