import 'package:flutter/material.dart';
import 'package:fruit_test_myself/core/widgets/custom_text_form_field.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    required this.formKey,
    required this.onSaved,
  });

  final GlobalKey<FormState> formKey;
  final void Function(String?) onSaved;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onSaved: widget.onSaved,
      hintText: "password",
      textInputType: TextInputType.visiblePassword,
      obscureText: _isObscure,
      icon: IconButton(
        onPressed: () {
          setState(() {
            _isObscure = !_isObscure;
          });
        },
        icon: Icon(
          _isObscure ? Icons.visibility_off : Icons.remove_red_eye,
          color: const Color(0xffC9CECF),
        ),
      ),
    );
  }
}
