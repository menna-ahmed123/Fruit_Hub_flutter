import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_test_myself/constants.dart';
import 'package:fruit_test_myself/core/helper/build_error_message.dart';
import 'package:fruit_test_myself/core/widgets/custom_app_par.dart';
import 'package:fruit_test_myself/core/widgets/custom_button.dart';
import 'package:fruit_test_myself/core/widgets/custom_text_form_field.dart';
import 'package:fruit_test_myself/core/widgets/password_form_field.dart';
import 'package:fruit_test_myself/feature/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruit_test_myself/feature/auth/presentation/views/widgets/already_have_account.dart';
import 'package:fruit_test_myself/feature/auth/presentation/views/widgets/conditions_and_terms.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
    late bool isTermsAccepted = false;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();// to validate form fields
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled; // to control when to show validation errors
    late String username, email, password; // to store form field values
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:horizintalPadding ),
        child:Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height:30),
              CustomAppPar(title: "Sign Up"),
               SizedBox(height: 24),
          
              CustomTextFormField(
                onSaved: (value) {
                  username = value!;
                },
                hintText: "full name", textInputType: TextInputType.name),
              SizedBox(height:16 ,),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: "email",
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
            PasswordFormField(
                formKey: formKey,
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 16),
                TermsAndConditionsWidget(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              SizedBox(height: 40),
              CustomButton(onPressed: (){
                 if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
  context.read<SignUpCubit>().createUserWithEmailAndPassword(
    email,
    password,
    username,
  );
}
else{
  buildErrorMessage(context, "you must accept terms and conditions to continue");
}
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
              }, text: "Create a new account"),
               SizedBox(height:26),
              HaveAcc(text1: "already have account? ", text2: "login")
               
          
            ],
          ),
        ),
      ),
    );
  }
}
