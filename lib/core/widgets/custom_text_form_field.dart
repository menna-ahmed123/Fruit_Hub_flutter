import 'package:flutter/material.dart';
import 'package:fruit_test_myself/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.icon,
    this.onSaved,
    this.obscureText = false,
  });

  final String hintText;
  final TextInputType textInputType;

  final Widget? icon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: textInputType,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'this field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: icon,
        hintStyle: TextStyles.bold16.copyWith(
          color: Color(0xff949D9E)
        ),
        filled: true,
        fillColor: Color(0xffE6E9EA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder()
        ),
        
        );
  }

  OutlineInputBorder buildBorder() {
    
    return OutlineInputBorder(
       borderSide: BorderSide(
        width: .3
       ),
      borderRadius: BorderRadius.circular(4));
  }
}
