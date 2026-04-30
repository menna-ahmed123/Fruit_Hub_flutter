import 'package:flutter/material.dart';
import 'package:fruit_test_myself/core/utils/app_images.dart';
import 'package:fruit_test_myself/core/utils/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: " Search...",
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xff949D9E),
            size: 20,
          ),
          suffixIcon: Image.asset(
            Assets.imagesFilter,
            width: 20,
            height: 20,
          ),
          hintStyle: TextStyles.regular13.copyWith(color: Color(0xff949D9E)),
          filled: true,
          fillColor: Colors.white,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }
  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(width: .1,
      color: Colors.white
      ),
      borderRadius: BorderRadius.circular(4),
     

    );
  }
}