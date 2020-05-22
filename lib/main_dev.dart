import 'package:setlistherofl/app_config.dart';
import 'package:setlistherofl/main.dart';
import 'package:flutter/material.dart';

void main() {
  AppConfig.init(
    flavor: 'development',
    apiUrl: 'http://192.168.100.56:5000/api/'
  );
  
  runApp(App());
}
