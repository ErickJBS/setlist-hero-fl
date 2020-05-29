import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextSpanBuilder {
  String _text;
  bool _bold = false;
  bool _italic = false;
  bool _underline = false;
  bool _colorFlag = false;
  bool _backgroundFlag = false;
  Color _color;
  Color _background;
  var _fontSize = 10.0;
  final String _montserratFontFamily = 'Montserrat';

  TextSpanBuilder() {
  }

  void addText(String text) {
    _text = text;
  }

  void addSize(var size) {
    _fontSize = size;
  }

  void addBold() {
    _bold = true;
  }

  void addItalic() {
    _italic = true;
  }

  void addUnderline() {
    _underline = true;
  }

  void addColor(Color color) {
    _colorFlag = true;
    _color = color;
  }

  void addBackground(Color color) {
    _backgroundFlag = true;
    _background = color;
  }

  void removeBold() {
    _bold = false;
  }

  void removeItalic() {
    _italic = false;
  }

  void removeUnderline() {
    _underline = false;
  }

  void removeColor() {
    _colorFlag = false;
  }

  void removeBackground() {
    _backgroundFlag = false;
  }

  TextSpan build() {
    TextStyle textStyle = TextStyle(
      fontFamily: _montserratFontFamily,
      fontSize: _fontSize,
      color: _colorFlag ? _color : Colors.black,
      fontWeight: _bold ? FontWeight.bold : null,
      fontStyle: _italic ? FontStyle.italic : null,
      decoration: _underline ? TextDecoration.underline : null,
      backgroundColor: _backgroundFlag ? _background : null
    );
    return TextSpan(text: _text, style: textStyle);
  }
}