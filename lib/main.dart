import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobspot/config/themes/app_theme.dart';
import 'package:jobspot/features/user/presentation/pages/on_boarding_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: OnboardingPage()
    );
  }
}
