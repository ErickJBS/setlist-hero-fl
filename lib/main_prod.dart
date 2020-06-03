import 'package:setlistherofl/app_config.dart';
import 'package:setlistherofl/app.dart';
import 'package:setlistherofl/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:setlistherofl/AppStateNotifier.dart';
import 'package:provider/provider.dart';

void main() {
  AppConfig.init(
    debugLabel: false,
    flavor: 'production',
    apiUrl: 'https://setlist-hero.wl.r.appspot.com/api/'
  );
  
  setupServiceLocator();
  runApp(
      ChangeNotifierProvider<AppStateNotifier>(
        create: (context) => AppStateNotifier(),
        child: App(),
      )
  );
}
