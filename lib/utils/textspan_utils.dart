import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/textspan_builder.dart';

import 'colors_util.dart';
abstract class TextSpanUtils {
  TextSpanUtils();

  static List<TextSpan> DeltaToList(Delta doc, TextSpanBuilder builder) {
    List<TextSpan> list = [];

    for (int i = 0; i < doc.length; i++) {
      var element = doc.elementAt(i);
      var attributes = element.attributes;

      builder.addText(element.data);

      if (attributes != null) {
        print(attributes['size']);
        if (attributes['bold'] != null && attributes['bold']) builder.addBold();
        if (attributes['underline'] != null && attributes['underline'])
          builder.addUnderline();
        if (attributes['italic'] != null && attributes['italic'])
          builder.addItalic();
        if (attributes['size'] != null) builder.addSize(attributes['size']);

        if (attributes['background'] != null) {
          String strColor = attributes['background'];
          builder.addBackground(ColorsUtils.hexToARGB(strColor));
        }

        if (attributes['color'] != null) {
          String strColor = attributes['color'];
          builder.addColor(ColorsUtils.hexToARGB(strColor));
        }
      }

      list.add(builder.build());
      builder.clear();
    }

    return list;
  }
}
