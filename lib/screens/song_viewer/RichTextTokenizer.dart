import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:tokenizer/token.dart';
import 'package:tokenizer/tokenizer.dart';

import 'TextSpanBuilder.dart';

class RichTextUtils {
  Future<List<Token>> tokenizeRichText(String text) async {
    final tokenizer = Tokenizer({
      '<p>',
      '</p>',
      '<strong>',
      '</strong>',
      '<em>',
      '</em>',
      '<u>',
      '</u>',
      '<span>',
      '</span>'
    });
    final c = StreamController<String>();

    c.add(text);
    c.close();

    List<Token> tokens = await c.stream.transform(tokenizer.streamTransformer).toList();
    return tokens;
  }

  Future<List<TextSpan>> buildTextSpan(String text, double fontSize) async {
    List<TextSpan> list = List<TextSpan>();
    TextSpanBuilder builder = TextSpanBuilder();
    StringBuffer buffer = StringBuffer();
    bool concat = true;

    List<Token> tokens = await tokenizeRichText(text);

    builder.addSize(fontSize);
    builder.addText(text);
    list.add(builder.build());

    print(tokens);
    print(text);

    for (Token token in tokens) {
      switch (token.value) {
        case '<strong>':
          concat = true;
          builder.addBold();
          break;

        case '</strong>':
          builder.addText(buffer.toString());
          list.add(builder.build());
          builder.removeBold();
          buffer.clear();
          break;

        default:
          concat = false;
          buffer.write(token.value);
      }
    }

    return list;
  }
}