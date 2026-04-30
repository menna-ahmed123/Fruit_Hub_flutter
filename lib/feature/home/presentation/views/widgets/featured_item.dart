import 'package:flutter/material.dart';
import 'package:fruit_test_myself/core/utils/app_images.dart';
import 'package:fruit_test_myself/core/utils/app_text_styles.dart';
import 'package:fruit_test_myself/feature/home/presentation/views/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQuery.sizeOf(context).width;
    return AspectRatio(
      aspectRatio: 342 / 158,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff5DAA53), Color(0xff2C8E49)],
                  ),
                  image: const DecorationImage(
                    image: AssetImage(Assets.imagesFeaturedItemBackground),
                    fit: BoxFit.cover,
                    opacity: .14,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 26,
              bottom: 26,
              child: Container(
                width: 6,
                decoration: const BoxDecoration(
                  color: Color(0xffF4A91F),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
              ),
            ),
            Positioned(
              right: -8,
              bottom: -8,
              child: Image.asset(
                Assets.imagesTestImage,
                width: itemWidth * .40,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 16, 138, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Eid Offer",
                    style: TextStyles.regular13.copyWith(
                      color: Colors.white.withValues(alpha: .94),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "25% Discount",
                    style: TextStyles.bold19.copyWith(color: Colors.white),
                  ),
                  const Spacer(),
                  FeaturedItemButton(onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
