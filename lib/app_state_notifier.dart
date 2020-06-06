import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStateNotifier extends ChangeNotifier {
  final String key = "theme";
  bool isDarkModeOn;
  SharedPreferences _prefs;
  bool get darkTheme => isDarkModeOn;

  AppStateNotifier(){
    isDarkModeOn = true;
    _loadFromPrefs();
  }

  updateTheme(){
     isDarkModeOn = !isDarkModeOn;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async{
    if(_prefs == null){
      _prefs = await SharedPreferences.getInstance();
    }
  }

  _loadFromPrefs()async{
    await _initPrefs();
    isDarkModeOn = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async{
    await _initPrefs();
    _prefs.setBool(key, isDarkModeOn);
  }
}