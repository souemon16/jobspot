import 'dart:async';
import 'package:flutter/material.dart';

import 'package:jobspot/feature/presentation/resources/assets_manager.dart';
import 'package:jobspot/feature/presentation/resources/color_manager.dart';
import 'package:jobspot/feature/presentation/resources/routes_manager.dart';
import 'package:jobspot/feature/presentation/resources/textstyle_manager.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
// Splash Screen Timer
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() {
    // BlocBuilder<AuthCubit, AuthState>(
    //   builder: (context, state) {
    //     if (AuthState is Authenticated) {
    //       Navigator.pushReplacementNamed(context, Routes.homeRoute);
    //     }
    //     if (AuthState is UnAuthenticated) {
    //       Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
    //     }
    //     return const CircularProgressIndicator();
    //   },
    // );
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }
  // Splash Screen Timer

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(image: AssetImage(ImageAssets.splashLogo)),
            Text(
              "Jobspot",
              style: getMediumStyle(color: ColorManager.white),
            )
          ],
        ),
      ),
    );
  }
}
