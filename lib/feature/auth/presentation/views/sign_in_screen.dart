import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_test_myself/core/services/get_it_service.dart';
import 'package:fruit_test_myself/feature/auth/domain/repos/auth_repo.dart';
import 'package:fruit_test_myself/feature/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruit_test_myself/feature/auth/presentation/views/widgets/sign_in_body_bloc_consumer.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const routeName = "sign_in";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(authRepo: getIt<AuthRepo>()),
      child: const Scaffold(
        body: SignInBodyBlocConsumer(),
      ),
    );
  }
}
