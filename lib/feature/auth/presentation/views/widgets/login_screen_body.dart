import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/core/utils/app_text_styles.dart';
import 'package:fruit_hub_app/core/widgets/custom_app_par.dart';
import 'package:fruit_hub_app/core/widgets/custom_button.dart';
import 'package:fruit_hub_app/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_app/feature/auth/presentation/views/widgets/dont_have_acc.dart';
import 'package:fruit_hub_app/feature/auth/presentation/views/widgets/or_devider.dart';
import 'package:fruit_hub_app/feature/auth/presentation/views/widgets/social_login.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            CustomAppPar(title: "Login"),
            SizedBox(height:24),
            CustomTextFormField(hintText: "email", textInputType: TextInputType.emailAddress,
            ),
            
            SizedBox(height:16),

            CustomTextFormField(hintText: "pawwsord", textInputType: TextInputType.visiblePassword,
            icon: IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye,color: Color(0xffC9CECF),)),
            ),
                        SizedBox(height: 16),

            Text("forgot your password",
             style:TextStyles.semiBold13.copyWith(
              color: AppColors.greenColor
             ),
            ),
           SizedBox(height: 37),

            CustomButton(onPressed: (){}, text: "Login"),
            SizedBox(height: 33),
            CustomText(text1: 'Don’t have account ?'
           , text2:"sign up" ),
             SizedBox(height: 37),

          OrDevider(),
          SizedBox(height: 16),
          SocialLogin(onPressed: (){}, text: "Login with Google", image: Assets.imagesSocialIconsg ),
          SizedBox(height: 16),
          SocialLogin(onPressed: (){}, text: "Login with Apple", image: Assets.imagesSocialIconsa ),
          SizedBox(height: 16),
            SocialLogin(
              onPressed: () {},
              text: "Login with facebook ",
              image: Assets.imagesSocialIconsf,
            )

          ],
        ),
      ),
    );
  }
}
