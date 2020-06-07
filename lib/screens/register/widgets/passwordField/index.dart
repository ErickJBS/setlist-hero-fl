import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

const String _montserratFontFamily = 'Montserrat';

class PasswordField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final ValueChanged<String> onChangeFoo;
  final String errorMessage;
  final bool flag;

  const PasswordField({@required this.label, this.controller, this.onChangeFoo, this.errorMessage, this.flag}):assert(label != null),
        assert(controller != null),
        assert(onChangeFoo != null),
        assert(flag != null),
        assert(errorMessage != null);


  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(bottom: 16.0), child: TextField(
      style: Theme.of(context).textTheme.bodyText2,
            controller: controller,
            obscureText: true,
            onChanged: onChangeFoo,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              errorText: flag ? errorMessage : null,
              labelText: label,
              labelStyle: Theme.of(context).textTheme.bodyText2

            ),
          ));
  }

}