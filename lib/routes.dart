import 'package:flutter/material.dart';

import './screens/home/index.dart';
import './screens/register/index.dart';

const String homeRoute = 'home';
const String registerRoute = 'register';

class Router {
  static Route <dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen(title: 'Setlist Hero',));

      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
        
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
