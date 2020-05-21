import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

const String _montserratFontFamily = 'Montserrat';

class PasswordField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final ValueChanged<String> onChangeFoo;
  final String errorText;

  const PasswordField({@required this.label, this.controller, this.onChangeFoo, this.errorText}):assert (label != null);// assert(controller != null);


  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(bottom: 16.0), child: TextField(
            controller: controller,
            obscureText: true,
            onChanged: onChangeFoo,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              errorText: null,
              labelText: label,
              labelStyle: TextStyle(fontFamily: _montserratFontFamily)

            ),
          ));
  }

}