import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
          //title: Text('login screen'),
      //),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/background_images/login_screen_back.png'),
            fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}