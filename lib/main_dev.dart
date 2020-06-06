import 'package:setlistherofl/app_config.dart' show AppConfig;
import 'package:setlistherofl/app.dart';
import 'package:setlistherofl/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:setlistherofl/app_state_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  AppConfig.init(
    debugLabel: true,
    flavor: 'development',
    apiUrl: 'http://192.168.100.56:5000/api/'
  );
  
  setupServiceLocator();
  runApp(ChangeNotifierProvider<AppStateNotifier>(
    create: (context) => AppStateNotifier(),
    child: App(),
  ));
}
