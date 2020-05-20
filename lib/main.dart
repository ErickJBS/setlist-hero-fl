import 'package:flutter/material.dart';

import './routes.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Setlist Hero',
      initialRoute: homeRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Router.generateRoute,
    );
  }
}
