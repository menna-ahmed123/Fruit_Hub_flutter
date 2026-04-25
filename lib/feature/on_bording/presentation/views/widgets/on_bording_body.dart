import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_test_myself/constants.dart';
import 'package:fruit_test_myself/core/services/shared_prefrence_singletone.dart';
import 'package:fruit_test_myself/core/utils/app_colors.dart';
import 'package:fruit_test_myself/core/widgets/custom_button.dart';
import 'package:fruit_test_myself/feature/auth/presentation/views/sign_in_screen.dart';
import 'package:fruit_test_myself/feature/on_bording/presentation/views/widgets/on_bording_page_view.dart';

class OnBordingBody extends StatefulWidget {
  const OnBordingBody({super.key});

  @override
  State<OnBordingBody> createState() => _OnBordingBodyState();
}

class _OnBordingBodyState extends State<OnBordingBody> {
  late PageController pageController;

  var currentPage = 0;
  @override
  void initState() {
    super.initState();

    pageController = PageController(); //initialize for page controller

    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBordingPageView(pageController: pageController)),

        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(.5),
          ),
        ),
        SizedBox(height: 29),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: currentPage == 1 ? true : false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizintalPadding),
            child: CustomButton(
              onPressed: () {
                Prefs.setBool(kIsOnBordingCompletedKey, true);
                Navigator.pushReplacementNamed(context, SignInScreen.routeName);
                //.pushReplacementNamed(LoginScreen.routeName);
              },
              text: "Start Now",
            ),
          ),
        ),
        SizedBox(height: 43),
      ],
    );
  }
}
