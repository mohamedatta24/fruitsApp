import 'package:flutter/material.dart';
import 'package:fruits_app/core/router/app_router_name.dart';
import 'package:fruits_app/features/Splash/presentation/views/splash_view.dart';
import 'package:fruits_app/features/auth/presentation/views/login_view.dart';
import 'package:fruits_app/features/auth/presentation/views/signup_view.dart';
import 'package:fruits_app/features/onBoarding/presentation/views/on_boarding_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRouterName.splashView:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case AppRouterName.onBoardingView:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case AppRouterName.loginView:
      return MaterialPageRoute(builder: (context) => const LoginView());
      
    case AppRouterName.signupView:
      return MaterialPageRoute(builder: (context) => const SignupView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
