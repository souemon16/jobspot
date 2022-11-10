import 'package:flutter/material.dart';

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
    return Container();
  }
}
