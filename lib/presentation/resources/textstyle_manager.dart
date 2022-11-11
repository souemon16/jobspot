import 'package:flutter/material.dart';
import 'color_manager.dart';

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
    required Color color}) {
  return _getTextStyle(
      fontFamily, fontSize, FontWeightManager.bold, ColorManager.black);
}

TextStyle getHeading2Style(
    {fontFamily = FontConstants.fontFamily,
    double fontSize = FontSize.s30,
    required Color color}) {
  return _getTextStyle(fontFamily, fontSize, FontWeightManager.bold, color);
}

TextStyle getHeading3Style(
    {fontFamily = FontConstants.fontFamily,
    double fontSize = FontSize.s14,
    required Color color}) {
  return _getTextStyle(fontFamily, fontSize, FontWeightManager.medium, color);
}

TextStyle getMediumStyle(
    {fontFamily = FontConstants.fontFamily,
    double fontSize = FontSize.s26,
    required Color color}) {
  return _getTextStyle(fontFamily, fontSize, FontWeightManager.medium, color);
}

TextStyle getRegularStyle(
    {fontFamily = FontConstants.fontFamily,
    double fontSize = FontSize.s12,
    required Color color}) {
  return _getTextStyle(fontFamily, fontSize, FontWeightManager.regular, color);
}
