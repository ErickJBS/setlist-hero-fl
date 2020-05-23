import 'package:flutter/material.dart';
import 'package:setlistherofl/services/auth_service.dart';
import 'package:setlistherofl/service_locator.dart';
import 'package:setlistherofl/routes.dart';

class SplashScreen extends StatelessWidget {

  final AuthService _authService = locator<AuthService>();

  void _goToInitialPage(BuildContext context) async {
    String token = await _authService.getAuthToken();
    if (token != null) {
      Navigator.popAndPushNamed(context, homeRoute);
    } else {
      Navigator.popAndPushNamed(context, loginRoute);
    }
  }

    @override
  Widget build(BuildContext context) {
    _goToInitialPage(context);
    
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 180.0,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }

}
