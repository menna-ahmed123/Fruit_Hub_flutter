import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/helper/on_generate_routes.dart';
import 'package:fruit_hub_app/feature/splash/presentation/views/splash_screen.dart';

void main() {
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}
