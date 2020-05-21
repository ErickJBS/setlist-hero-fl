import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final String label;

  const PasswordField({@required this.label}):assert (label != null);


  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 16.0), child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              labelText: label,
            ),
          ));
  }

}