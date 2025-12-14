import 'package:flutter/material.dart';
import 'package:fruit_hub_app/constants.dart';
import 'package:fruit_hub_app/core/widgets/custom_app_par.dart';
import 'package:fruit_hub_app/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_app/feature/auth/presentation/views/widgets/conditions_and_terms.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
    late bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:horizintalPadding ),
        child: Column(
          children: [
            SizedBox(height: 16),
            CustomAppPar(title: "Sign Up"),
             SizedBox(height: 24),
        
            CustomTextFormField(hintText: "full name", textInputType: TextInputType.name),
            SizedBox(height:16 ,),
            CustomTextFormField(
              hintText: "email",
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: "password",
              textInputType: TextInputType.visiblePassword,
              icon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
              ),
            ),
            SizedBox(height: 16),
              TermsAndConditionsWidget(
              onChanged: (value) {
                isTermsAccepted = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
