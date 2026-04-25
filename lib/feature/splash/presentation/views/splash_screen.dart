import 'package:flutter/material.dart';
import 'package:fruit_test_myself/feature/splash/presentation/views/widgets/splash__screen_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const routeName = "splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenBody(),
    );
  }
}
