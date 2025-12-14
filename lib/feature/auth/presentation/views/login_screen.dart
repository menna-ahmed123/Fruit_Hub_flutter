import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/widgets/custom_app_par.dart';
import 'package:fruit_hub_app/feature/auth/presentation/views/widgets/login_screen_body.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

    static const routeName = "auth";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: LoginScreenBody(),
    );
  }
}
