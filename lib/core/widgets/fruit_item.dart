import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_test_myself/core/utils/app_colors.dart';
import 'package:fruit_test_myself/core/utils/app_images.dart';
import 'package:fruit_test_myself/core/utils/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({
    super.key,
    this.title = 'Strawberry',
    this.price = '30 / kg',
    this.imagePath = Assets.imagesTestImage,
  });

  final String title;
  final String price;
  final String imagePath;

  Widget _buildImage() {
    if (imagePath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(imagePath, height: 92, fit: BoxFit.contain);
    }

    return Image.asset(imagePath, height: 92, fit: BoxFit.contain);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .06),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              SizedBox(
                height: 106,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffF7F7F7),
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                    Center(child: _buildImage()),
                    Positioned(
                      right: 10,
                      top: 6,
                      child: Icon(
                        Icons.favorite_border,
                        color: AppColors.primaryColor.withValues(alpha: .9),
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                dense: true,
                visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                title: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyles.semiBold16.copyWith(color: Colors.black87),
                ),
                subtitle: Text(
                  price,
                  textAlign: TextAlign.start,
                  style: TextStyles.bold13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        Positioned(
          right: 12,
          top: 124,
          child: Container(
            width: 34,
            height: 34,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 22),
          ),
        ),
      ],
    );
  }
}
