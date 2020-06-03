import 'dart:ui';

abstract class ColorsUtils {

  ColorsUtils();

  static Color hexToARGB(String hex) {
    hex = hex.replaceAll('#', '');
    hex = hex.toLowerCase();

    var red = int.parse(hex.substring(0, 2));
    var green = int.parse(hex.substring(2, 4));
    var blue = int.parse(hex.substring(4));


    return Color.fromARGB(255, red, green, blue);
  }
}
