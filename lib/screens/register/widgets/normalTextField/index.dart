import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

const String _montserratFontFamily = 'Montserrat';

class NormalTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final ValueChanged<String> onChangeFoo;
  final bool flag;
  final String errorMessage;

  const NormalTextField(
      {@required this.label,
      @required this.controller,
      @required this.onChangeFoo,
      @required this.flag,
      @required this.errorMessage})
      : assert(label != null),
        assert(controller != null),
        assert(onChangeFoo != null),
        assert(flag != null),
        assert(errorMessage != null);

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
                errorText: flag ? errorMessage : null,
                labelStyle: TextStyle(fontFamily: _montserratFontFamily))));
  }
}
