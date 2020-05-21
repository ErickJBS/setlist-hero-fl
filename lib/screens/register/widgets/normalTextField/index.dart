import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class NormalTextField extends StatelessWidget {
  final String label;

  const NormalTextField({@required this.label}):assert (label != null);


  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 16.0), child:TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: label)));
  }

}

