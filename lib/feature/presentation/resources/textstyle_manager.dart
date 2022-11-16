import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    String fontFamily, double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color);
}

TextStyle getHeading1Style(
    {fontFamily = FontConstants.fontFamily,
    double fontSize = FontSize.s40,
    FontWeight fontWeight = FontWeight.w700,
    required Color color}) {
  return _getTextStyle(fontFamily, fontSize, fontWeight, color);
}

TextStyle getHeading2Style(
    {fontFamily = FontConstants.fontFamily,
    double fontSize = FontSize.s30,
    FontWeight fontWeight = FontWeight.w700,
    required Color color}) {
  return _getTextStyle(fontFamily, fontSize, fontWeight, color);
}

TextStyle getHeading3Style(
    {fontFamily = FontConstants.fontFamily,
    double fontSize = FontSize.s14,
    FontWeight fontWeight = FontWeight.w500,
    required Color color}) {
  return _getTextStyle(fontFamily, fontSize, fontWeight, color);
}

TextStyle getMediumStyle(
    {fontFamily = FontConstants.fontFamily,
    double fontSize = FontSize.s26,
    FontWeight fontWeight = FontWeight.w500,
    required Color color}) {
  return _getTextStyle(fontFamily, fontSize, fontWeight, color);
}

TextStyle getRegularStyle(
    {fontFamily = FontConstants.fontFamily,
    double fontSize = FontSize.s12,
    FontWeight fontWeight = FontWeight.w400,
    required Color color}) {
  return _getTextStyle(fontFamily, fontSize, fontWeight, color);
}

TextStyle getSmallStyle(
    {fontFamily = FontConstants.fontFamily,
    double fontSize = FontSize.s10,
    FontWeight fontWeight = FontWeight.w400,
    required Color color}) {
  return _getTextStyle(fontFamily, fontSize, fontWeight, color);
}
