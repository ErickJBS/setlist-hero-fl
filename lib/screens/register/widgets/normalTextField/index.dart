import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

const String _montserratFontFamily = 'Montserrat';

class NormalTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final ValueChanged<String> onChangeFoo;
  final bool flag;
  final String errorText;

  const NormalTextField({@required this.label, this.controller, this.onChangeFoo, this.flag, this.errorText}) : assert(label != null); // assert(controller != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: TextField(
          controller: controller,
          onChanged: onChangeFoo,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: label,
                errorText: null,
                labelStyle: TextStyle(fontFamily: _montserratFontFamily))));
  }
}
