import 'package:flutter/material.dart';

import 'value_manager.dart';
import 'color_manager.dart';
import 'textstyle_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // Main Colors
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryLight,
      splashColor: ColorManager.primary,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: ColorManager.primary,
          onPrimary: ColorManager.white,
          secondary: ColorManager.primaryLight,
          onSecondary: ColorManager.white,
          error: ColorManager.error,
          onError: ColorManager.white,
          background: ColorManager.white,
          onBackground: ColorManager.primaryFont,
          surface: ColorManager.sky,
          onSurface: ColorManager.orangish),

      // Card Theme

      // Appbar Theme
      appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),

      // Button Theme
      buttonTheme: ButtonThemeData(
          height: 50,
          minWidth: 260,
          shape: const RoundedRectangleBorder(),
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.primaryLight),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s10)),
      )),

      // Text Theme
      textTheme: TextTheme(
          headline1: getHeading1Style(color: ColorManager.black),
          headline2: getHeading2Style(color: ColorManager.primaryFont),
          headline3: getHeading3Style(color: ColorManager.title),
          bodyText1: getRegularStyle(color: ColorManager.secondaryFont),
          bodyText2: getSmallStyle(color: ColorManager.secondaryFont)),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(AppPadding.p10),
          hintStyle:
              getRegularStyle(color: ColorManager.primaryFont.withOpacity(0.6)),
          labelStyle: getRegularStyle(color: ColorManager.primaryFont),
          errorStyle: getRegularStyle(color: ColorManager.error),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)))));
}
