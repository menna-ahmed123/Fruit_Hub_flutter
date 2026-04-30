import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_test_myself/core/utils/app_images.dart';
import 'package:fruit_test_myself/core/utils/app_text_styles.dart';

class CustomHomeAppPar extends StatelessWidget {
  const CustomHomeAppPar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.grey[300],
        child: SvgPicture.asset(Assets.imagesNotification),
      ),
      leading: Image.asset(
        Assets.imagesProfileImage,
        width:60,
        height: 60,
      ),
      title: Text(
        'Welcome',
        style: TextStyles.regular16.copyWith(color: Colors.grey),
        
      ),
      subtitle: Text(
        'John Doe',
        style: TextStyles.bold16,
      ),
    );
  }
}
