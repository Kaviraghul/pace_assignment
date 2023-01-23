import 'package:flutter/material.dart';

class ColorManager {
  static Color black = HexColor.fromHex('#000000');
  static Color white = HexColor.fromHex('#ffffff');
  static Color gray = HexColor.fromHex('#464646');
  static Color halfWhite = HexColor.fromHex('#f2f2f2');
  static Color lightGray = HexColor.fromHex('#bababa');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "0xFF$hexColorString";
    } else if (hexColorString.length == 8) {
      hexColorString = "0x$hexColorString";
    }
    return Color(int.parse(hexColorString));
  }
}
