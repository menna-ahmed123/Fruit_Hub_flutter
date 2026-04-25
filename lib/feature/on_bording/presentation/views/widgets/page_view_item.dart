import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_test_myself/core/utils/app_text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.image, required this.backGroundImage, required this.title, required this.subTitle});

  final String image;
    final String backGroundImage;

  final  Widget title;
  final String subTitle;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                 backGroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child:  Center(
                  child: SizedBox(
                    width: 300, 
                    child: SvgPicture.asset(image),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64),
        title,
        SizedBox(height: 24),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            subTitle,

            textAlign: TextAlign.center,
            style: TextStyles.semiBold13,
          ),
        ),
      ],
    );
  }
}