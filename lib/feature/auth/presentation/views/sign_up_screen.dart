import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_test_myself/core/services/get_it_service.dart';
import 'package:fruit_test_myself/feature/auth/domain/repos/auth_repo.dart';
import 'package:fruit_test_myself/feature/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruit_test_myself/feature/auth/presentation/views/widgets/sign_up_body_bloc_consumer.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const routeName = "signUp";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(body:
      
       SignUpBodyBlocConsumer()
       
       ),
    );
  }
}
