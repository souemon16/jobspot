import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("130160");
  static Color primaryLight = HexColor.fromHex("D6CDFE");
  static Color orangish = HexColor.fromHex("FCA34D");
  static Color sky = HexColor.fromHex("AFECFE");
  static Color inputColor = HexColor.fromHex("E6E1FF");

  static Color white = HexColor.fromHex("FFFFFF");
  static Color black = HexColor.fromHex("000000");

  static Color primaryFont = HexColor.fromHex("0D0140");
  static Color title = HexColor.fromHex("150B3D");
  static Color secondaryFont = HexColor.fromHex("524B6B");

  static Color error = HexColor.fromHex("FC4646");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
