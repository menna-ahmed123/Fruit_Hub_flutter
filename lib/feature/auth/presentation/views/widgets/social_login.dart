import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    super.key,
    required this.onPressed,
    required this.text,
    required this.image,
  });

  final VoidCallback onPressed;
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero, // مهم مع ListTile
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              color: Color(0xffDDDFDF),
              width: 1, // stroke
            ),
          ),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          leading: SvgPicture.asset(image, height: 24, width: 24),
          title: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          horizontalTitleGap: 8,
          dense: true,
        ),
      ),
    );
  }
}
