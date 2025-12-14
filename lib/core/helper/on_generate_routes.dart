import 'package:flutter/material.dart';
import 'package:fruit_hub_app/feature/auth/presentation/views/login_screen.dart';
import 'package:fruit_hub_app/feature/auth/presentation/views/sign_up_screen.dart';
import 'package:fruit_hub_app/feature/on_bording/presentation/views/on_bording_screen.dart';
import 'package:fruit_hub_app/feature/splash/presentation/views/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {

    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => const  SplashScreen());

    case OnBording.routeName:
      return MaterialPageRoute(builder: (_) => const OnBording());  
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
      case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());   
  
    default:
      // صفحة للطرق غير المعروفة
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('No Route Found', style: TextStyle(fontSize: 20)),
          ),
        ),
      );
  }
}
