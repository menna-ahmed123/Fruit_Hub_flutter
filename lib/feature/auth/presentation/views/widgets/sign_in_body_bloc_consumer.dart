import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_test_myself/core/helper/build_error_message.dart';
import 'package:fruit_test_myself/feature/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruit_test_myself/feature/auth/presentation/cubits/sign_in_cubit/sign_in_state.dart';
import 'package:fruit_test_myself/feature/auth/presentation/views/widgets/sign_in_screen_body.dart';
import 'package:fruit_test_myself/feature/home/presentation/views/home_screen.dart';

class SignInBodyBlocConsumer extends StatelessWidget {
  const SignInBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailureState) {
          buildErrorMessage(context, state.message);
        } else if (state is SignInSuccessState) {
          Navigator.pushNamed(context, HomeScreen.routeName);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            const SignInScreenBody(),
            if (state is SignInLoadingState)
              Container(
                color: Colors.black.withValues(alpha: 0.3),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        );
      },
    );
  }
}
