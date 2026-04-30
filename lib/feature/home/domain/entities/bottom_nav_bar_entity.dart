import 'package:fruit_test_myself/core/utils/app_images.dart';

class BottomNavBarEntity {
  final String activeImage;
  final String inactiveImage;
  final String label;

  BottomNavBarEntity({
    required this.activeImage,
    required this.inactiveImage,
    required this.label,
  });

  static List<BottomNavBarEntity> getBottomNavBarItems() {
    return [
      BottomNavBarEntity(
        activeImage: Assets.imagesActiveIconActiveHome,
        inactiveImage: Assets.imagesInactiveIconInHome,
        label: 'Home',
      ),
      BottomNavBarEntity(
        activeImage: Assets.imagesActiveIconActiveProduct,
        inactiveImage: Assets.imagesInactiveIconInActiveProduct,
        label: 'Product',
      ),
      BottomNavBarEntity(
        activeImage: Assets.imagesActiveIconActiveShoppingCart,
        inactiveImage: Assets.imagesInactiveIconInShoppingCart,
        label: 'Cart',
      ),
      BottomNavBarEntity(
        activeImage: Assets.imagesActiveIconActiveUser,
        inactiveImage: Assets.imagesInactiveIconInUser,
        label: 'Profile',
      ),
    ];
  }
}
