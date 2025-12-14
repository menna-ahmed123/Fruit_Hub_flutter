import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/core/utils/app_text_styles.dart';
import 'package:fruit_hub_app/feature/on_bording/presentation/views/widgets/page_view_item.dart';

class OnBordingPageView extends StatelessWidget {
  const OnBordingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          backgroundImage: Assets.imagesBackGround1,
          image: Assets.imagesFruit,

          subTitle:
              "Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and get the best deals and highest quality.",
              
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("welcome to",
            style: TextStyles.bold23 ,
            ), Text("Fruit",
             style: TextStyles.bold23 
            ), Text("HUB",
             style: TextStyles.bold23.copyWith(
              color: AppColors.secondaryColor
             )
             
            ),
            
            ],
          ),
        ),
        PageViewItem(
          backgroundImage: Assets.imagesBackground2,
          image: Assets.imagesPineapple,

          subTitle:
              "We offer you the finest, carefully selected fruits. Check out the details, photos, and reviews to ensure you choose the perfect fruit.",
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Search and shop",
            style: TextStyles.bold23,
            )],
          ),
        ),
      ],
    );
  }
}
