import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextSpanBuilder {
  static final String _montserratFontFamily = 'Montserrat';
  static final double _base = 28.0;
  static final double _baseIncrement = 4.0;
  
  double increment;
  
  bool _bold = false;
  bool _italic = false;
  bool _underline = false;
  bool _colorFlag = false;
  bool _backgroundFlag = false;
  double _size = _base;
  String _text;
  Color _color;
  Color _background;

  TextSpanBuilder({this.increment});

  void clear() {
    _text = '';
    _bold = false;
    _italic = false;
    _underline = false;
    _colorFlag = false;
    _backgroundFlag = false;
    _color = null;
    _background = null;
    _size = _base;
  }

  void addText(String text) {
    _text = text;
  }

  void addSize(String size) {
    switch (size) {
      case 'huge':
        _size = _base + _baseIncrement * 2;
        break;
      case 'large':
        _size = _base + _baseIncrement;
        break;
      case 'small':
        _size = _base - _baseIncrement;
        break;
      default:
        _size = _base;
    }
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
      color: _colorFlag ? _color : Colors.black,
      fontWeight: _bold ? FontWeight.bold : null,
      fontStyle: _italic ? FontStyle.italic : null,
      decoration: _underline ? TextDecoration.underline : null,
      backgroundColor: _backgroundFlag ? _background : null,
      fontSize: _size + increment
    );
    return TextSpan(text: _text, style: textStyle);
  }
}