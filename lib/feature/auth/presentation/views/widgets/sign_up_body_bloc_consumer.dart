import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_test_myself/core/helper/build_error_message.dart';
import 'package:fruit_test_myself/feature/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruit_test_myself/feature/auth/presentation/cubits/sign_up_cubit/sign_up_state.dart';
import 'package:fruit_test_myself/feature/auth/presentation/views/widgets/sign_up__body.dart';

class SignUpBodyBlocConsumer extends StatelessWidget {
  const SignUpBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailureState) {
          // Show error message
          buildErrorMessage(context, state.message.toString());
        } else if (state is SignUpSuccessState) {
          // Navigate to the next screen or show success message
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            SignUpBody(), // الشاشة الأساسية

            if (state is SignUpLoadingState)
              Container(
                color: Colors.black.withValues(alpha: 0.3), // تعتيم خفيف
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        );
      },
    );
  }


}
