import 'package:flutter/material.dart';
import 'package:fruit_test_myself/feature/on_bording/presentation/views/widgets/on_bording_body.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});
    static const routeName = "onBording";
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const OnBordingBody(),
    );
  }
}
