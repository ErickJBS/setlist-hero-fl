import 'package:flutter/material.dart';
import 'package:setlistherofl/widgets/bottom_bar_home_screen/bottom_bar.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomBar(),
    );
  }
}
