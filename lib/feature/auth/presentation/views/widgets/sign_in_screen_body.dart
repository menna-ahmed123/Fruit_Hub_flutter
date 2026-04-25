import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_test_myself/constants.dart';
import 'package:fruit_test_myself/core/utils/app_colors.dart';
import 'package:fruit_test_myself/core/utils/app_images.dart';
import 'package:fruit_test_myself/core/utils/app_text_styles.dart';
import 'package:fruit_test_myself/core/widgets/custom_app_par.dart';
import 'package:fruit_test_myself/core/widgets/custom_button.dart';
import 'package:fruit_test_myself/core/widgets/custom_text_form_field.dart';
import 'package:fruit_test_myself/core/widgets/password_form_field.dart';
import 'package:fruit_test_myself/feature/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruit_test_myself/feature/auth/presentation/views/widgets/dont_have_acc.dart';
import 'package:fruit_test_myself/feature/auth/presentation/views/widgets/or_devider.dart';
import 'package:fruit_test_myself/feature/auth/presentation/views/widgets/social_login.dart';

class SignInScreenBody extends StatefulWidget {
  const SignInScreenBody({super.key});

  @override
  State<SignInScreenBody> createState() => _SignInScreenBodyState();
}

class _SignInScreenBodyState extends State<SignInScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const CustomAppPar(title: "Login"),
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: "email",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordFormField(
                formKey: formKey,
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 16),
              Text(
                "forgot your password",
                style: TextStyles.semiBold13.copyWith(
                  color: AppColors.greenColor,
                ),
              ),
              const SizedBox(height: 37),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SignInCubit>().signInWithEmailAndPassword(
                      email,
                      password,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: "Login",
              ),
              const SizedBox(height: 33),
              const Center(
                child: CustomText(
                  text1: 'Don’t have account ?',
                  text2: "sign up",
                ),
              ),
              const SizedBox(height: 37),
              const OrDevider(),
              const SizedBox(height: 16),
              SocialLogin(
                onPressed: () {
                  context.read<SignInCubit>().signInWithGoogle();
                },
                text: "Login with Google",
                image: Assets.imagesSocialIconsg,
              ),
              const SizedBox(height: 16),
              
              
            ],
          ),
        ),
      ),
    );
  }
}
