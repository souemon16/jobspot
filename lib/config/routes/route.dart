import 'package:flutter/material.dart';
import 'package:jobspot/core/constants/route_const.dart';
import 'package:jobspot/features/user/presentation/pages/check_your_email_page.dart';
import 'package:jobspot/features/user/presentation/pages/forgot_password_page.dart';
import 'package:jobspot/features/user/presentation/pages/login_page.dart';
import 'package:jobspot/features/user/presentation/pages/on_boarding_page.dart';
import 'package:jobspot/features/user/presentation/pages/sign_up_page.dart';

class AppRoutes{
  static Route onGenerateRoutes(RouteSettings settings){
    switch(settings.name){

      case RouteConst.onboardingPage:
      return _materialRoute(const OnboardingPage(), settings);
      
      case RouteConst.loginPage:
      return _materialRoute(const LoginPage(), settings);

      case RouteConst.signUp:
      return _materialRoute(const SignUpPage(), settings);

      case RouteConst.forgotPasswordPage:
      return _materialRoute(const ForgotPasswordPage(), settings);

      case RouteConst.checkYourEmailPage:
      return _materialRoute(  const CheckYourEmailPage(), settings);

      default:
      return _materialRoute(const OnboardingPage(), settings);
    }
  }

  static Route<dynamic> _materialRoute(Widget view, RouteSettings? settings){
    return MaterialPageRoute(builder: (_) => view, settings: settings);
  }
}