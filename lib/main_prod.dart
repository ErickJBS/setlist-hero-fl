import 'package:setlistherofl/app_config.dart';
import 'package:setlistherofl/main.dart';
import 'package:flutter/material.dart';

void main() {
  AppConfig.init(
    flavor: 'production',
    apiUrl: 'https://setlist-hero.wl.r.appspot.com/api/'
  );
  
  runApp(App());
}
