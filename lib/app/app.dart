import 'package:flutter/material.dart';
import 'package:jobspot/presentation/theme_manager.dart';

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
      theme: getApplicationTheme(),
      home: Scaffold(
        body: const Center(child: Text("Hello World")),
      ),
    );
  }
}
