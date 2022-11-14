import 'package:flutter/material.dart';
import 'package:jobspot/feature/presentation/resources/routes_manager.dart';

import '../feature/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static MyApp instance = const MyApp._internal();
  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
    );
  }
}
