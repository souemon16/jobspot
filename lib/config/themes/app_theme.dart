import 'package:flutter/material.dart';
import 'package:jobspot/config/themes/app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: AppColor.primaryColor,
        primaryColorLight: AppColor.primaryColor,
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: AppColor.primaryColor,
            onPrimary: AppColor.pureWhite,
            secondary: AppColor.secondaryColor,
            onSecondary: AppColor.primaryColor,
            error: AppColor.error,
            onError: AppColor.pureWhite,
            background:AppColor.pureWhite,
            onBackground: AppColor.primaryColor,
            surface: AppColor.pureWhite,
            onSurface: AppColor.bodyFontColor),
        scaffoldBackgroundColor: AppColor.pureWhite,
        splashColor: AppColor.transparent,
        fontFamily: "DMSans",
        textTheme: ThemeData.light().textTheme,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: AppColor.primaryColor,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColor.pureWhite,
          elevation: 6,
          selectedItemColor: AppColor.headingFontColor,
          unselectedItemColor: AppColor.unselectedItemColor,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontSize: 24),
          unselectedLabelStyle: const TextStyle(fontSize: 22),
        )       
            );
  }

  // Dark Theme 
}
