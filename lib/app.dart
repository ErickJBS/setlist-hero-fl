import 'package:flutter/material.dart';
import 'package:setlistherofl/app_config.dart';
import './routes.dart';
import 'package:setlistherofl/styles.dart';
import 'package:setlistherofl/app_state_notifier.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
      builder: (context, appState, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: config.debugLabel,
          title: 'Setlist Hero',
          initialRoute: splashRoute,
          theme: ThemeBuilder.lightTheme,
          darkTheme: ThemeBuilder.darkTheme,
          themeMode: appState.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: Router.generateRoute,
        );
      },
    );
  }
}
