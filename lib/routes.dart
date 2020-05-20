import 'package:flutter/material.dart';

import './screens/home/index.dart';
import './screens/login/index.dart';

const String homeRoute = 'home';
const String loginRoute = 'login';

class Router {
  static Route <dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen(title: 'Setlist Hero',));

      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen(title: 'Setlist Hero',));

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
