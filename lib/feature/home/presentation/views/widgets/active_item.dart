import 'package:flutter/material.dart';
import 'package:fruit_test_myself/core/utils/app_colors.dart';
import 'package:fruit_test_myself/core/utils/app_text_styles.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: .12),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyles.semiBold13.copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(width: 8),
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                image,
                width: 16,
                height: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
