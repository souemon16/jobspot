import 'package:flutter/material.dart';

import '../pages/forgetPassword/forget_password_screen.dart';
import '../pages/home/home_screen.dart';
import '../pages/signin/signin_screen.dart';
import '../pages/onboarding/onboarding_screen.dart';
import '../pages/signup/signup_screen.dart';
import '../pages/splash/splash_screen.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String forgetPasswordRoute = '/forgetpassword';
  static const String homeRoute = '/home';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.signupRoute:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(
                child: Text(AppString.noRouteFound),
              ),
            ));
  }
}
