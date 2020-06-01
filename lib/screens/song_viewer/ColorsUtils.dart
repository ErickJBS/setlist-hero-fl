import 'dart:ui';

abstract class ColorsUtils {

  ColorsUtils();

  static Color hexToARGB(String hex) {
    hex = hex.replaceAll('#', '');
    var ref = {
      '0': 0,
      '1': 1,
      '2': 2,
      '3': 3,
      '4': 4,
      '5': 5,
      '6': 6,
      '7': 7,
      '8': 8,
      '9': 9,
      'a': 10,
      'b': 11,
      'c': 12,
      'd': 13,
      'e': 14,
      'f': 15
    };

    var rgb = [];

    for (int i = 0; i < 3; i++) {
      rgb.add(ref[hex[i * 2]] + (ref[hex[i * 2 + 1]] * 16));
    }

    return Color.fromARGB(255, rgb[0], rgb[1], rgb[2]);
  }
}
