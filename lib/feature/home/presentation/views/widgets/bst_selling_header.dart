import 'package:flutter/material.dart';
import 'package:fruit_test_myself/core/utils/app_colors.dart';
import 'package:fruit_test_myself/core/utils/app_text_styles.dart';
import 'package:fruit_test_myself/feature/best_selling_fruits/presentation/views/best_selling_screen.dart';

class BstSellingHeader extends StatelessWidget {
  const BstSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BestSellingScreen.routeName);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Best Selling',
            style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
          ),
          Text(
            'See All',
            style: TextStyles.regular13.copyWith(color: AppColors.secondaryColor),
          ),
        ],
      ),
    );
  }
}
