import 'package:flutter/material.dart';

import './screens/home/index.dart';

const String homeRoute = 'home';

class Router {
  static Route <dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen(title: 'Setlist Hero',));
        
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
