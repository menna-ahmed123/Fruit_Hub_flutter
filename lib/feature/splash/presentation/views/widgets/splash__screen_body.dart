import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_test_myself/constants.dart';
import 'package:fruit_test_myself/core/services/firebase_auth_service.dart';
import 'package:fruit_test_myself/core/services/shared_prefrence_singletone.dart';
import 'package:fruit_test_myself/core/utils/app_images.dart';
import 'package:fruit_test_myself/feature/auth/presentation/views/sign_in_screen.dart';
import 'package:fruit_test_myself/feature/home/presentation/views/home_screen.dart';
import 'package:fruit_test_myself/feature/on_bording/presentation/views/on_bording_Screen.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();

  
}

class _SplashScreenBodyState extends State<SplashScreenBody> {

  @override
  void initState() {
        excuteNavigation();

    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.imagesPlant),
          ],
        ),

        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashBottom)

      ],
    );
  }
  
   void excuteNavigation() {
    Future.delayed(Duration(seconds: 5), () {
      bool isOnBordingCompleted =
          Prefs.getBool(kIsOnBordingCompletedKey) ?? false;
      if (isOnBordingCompleted) {
        var isloggedIn = FirebaseAuthService().isLoggedIn();
        if (isloggedIn) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(context, SignInScreen.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBordingScreen.routeName);
      }
    });
  }
}
