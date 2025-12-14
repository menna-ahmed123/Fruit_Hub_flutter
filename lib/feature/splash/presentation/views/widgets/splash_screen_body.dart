import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub_app/constants.dart';
import 'package:fruit_hub_app/core/services/shared_prefrence_singletone.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/feature/auth/presentation/views/auth_screen.dart';
import 'package:fruit_hub_app/feature/on_bording/presentation/views/on_bording_screen.dart';

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
          children: [SvgPicture.asset(Assets.imagesPlant)],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashBottom),
      ],
    );
  }

  void excuteNavigation() {
    Future.delayed(Duration(seconds: 5), () {
      bool isOnBordingCompleted = Prefs.getBool(kIsOnBordingCompletedKey) ?? false;
      if (isOnBordingCompleted) {
        Navigator.pushReplacementNamed(context, AuthScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBording.routeName);
      }
    });
  }
}
