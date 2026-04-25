import 'package:flutter/material.dart';
import 'package:fruit_test_myself/feature/auth/presentation/views/sign_in_screen.dart';
import 'package:fruit_test_myself/feature/auth/presentation/views/sign_up_screen.dart';
import 'package:fruit_test_myself/feature/on_bording/presentation/views/on_bording_Screen.dart';
import 'package:fruit_test_myself/feature/splash/presentation/views/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
      case OnBordingScreen.routeName:
      return MaterialPageRoute(builder: (context) => const OnBordingScreen());

      case SignInScreen.routeName:
      return MaterialPageRoute(builder: (_) => const SignInScreen());
    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());  

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text('Route not found')),
        ),
      );
  }
}