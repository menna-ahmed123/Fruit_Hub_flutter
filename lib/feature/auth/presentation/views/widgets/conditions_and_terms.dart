import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_text_styles.dart';
import 'package:fruit_hub_app/feature/auth/presentation/views/widgets/custom_check_box.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // ⭐ مهم
      children: [
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onChecked: (value) {
            setState(() {
              isTermsAccepted = value;
            });
            widget.onChanged(value);
          },
        ),
        const SizedBox(width: 8), // مسافة مظبوطة
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "By creating an account, you agree to\n",
                  style: TextStyles.semiBold16.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: "our terms ",
                  style: TextStyles.semiBold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                TextSpan(
                  text: "and conditions.",
                  style: TextStyles.semiBold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.start, // ⭐
          ),
        ),
      ],
    );
  }
}
