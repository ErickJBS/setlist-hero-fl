import 'package:flutter/material.dart';

import './screens/home/index.dart';
import './screens/register/index.dart';
import './screens/login/index.dart';


const String homeRoute = 'home';
const String registerRoute = 'register';
const String loginRoute = 'login';

class Router {
  static Route <dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
        
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());

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
