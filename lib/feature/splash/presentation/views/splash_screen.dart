import 'package:flutter/material.dart';
import 'package:fruit_hub_app/feature/splash/presentation/views/widgets/splash_screen_body.dart';

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
