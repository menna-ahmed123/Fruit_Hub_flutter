import 'package:flutter/material.dart';
import 'package:fruit_hub_app/feature/auth/presentation/views/widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

    static const routeName = "login";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: LoginScreenBody(),
    );
  }
}
