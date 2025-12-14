import 'package:flutter/material.dart';
import 'package:fruit_hub_app/feature/on_bording/presentation/views/widgets/on_bording_body.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  static const routeName = "on_bording";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: OnBordingBody()),
    );
  }
}
