// --- الـ Widgets المساعدة ---
import 'package:flutter/material.dart';
import 'package:fruit_test_myself/feature/home/domain/entities/bottom_nav_bar_entity.dart';
import 'package:fruit_test_myself/feature/home/presentation/views/widgets/active_item.dart';
import 'package:fruit_test_myself/feature/home/presentation/views/widgets/in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });

  final BottomNavBarEntity bottomNavigationBarEntity;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
            text: bottomNavigationBarEntity.label,
          )
        : InActiveItem(image: bottomNavigationBarEntity.inactiveImage);
  }
}
