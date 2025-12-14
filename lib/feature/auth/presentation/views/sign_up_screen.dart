import 'package:flutter/material.dart';
import 'package:fruit_hub_app/feature/auth/presentation/views/widgets/sign_up__body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
   
      static const routeName = "signUp";
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpBody(),
    );
  }
}
