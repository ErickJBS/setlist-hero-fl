import 'package:flutter/material.dart';
import 'package:setlistherofl/app_config.dart';

import './routes.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: config.debugLabel,
      title: 'Setlist Hero',
      initialRoute: splashRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Router.generateRoute,
    );
  }
}