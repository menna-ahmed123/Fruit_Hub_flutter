import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/core/utils/app_text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.backgroundImage,
    required this.image,
    required this.subTitle, required this.title,
   // required this.title, required this.isVisible,
  });
  final String backgroundImage;
  final String image;
  final String subTitle;
  final Widget title;

 // final bool isVisible;

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
                  Assets.imagesBackGround1,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(Assets.imagesFruitBasket),
              ),
            ],
          ),
        ),
        SizedBox(height: 64),
        title,
        SizedBox(height: 24),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(subTitle,
         
           textAlign: TextAlign.center,
            style: TextStyles.semiBold13
           ),
        ),
      ],
    );
  }
}
