import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_text_styles.dart';

class CustomAppPar extends StatelessWidget {
  const CustomAppPar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        Expanded(
          child: Center(child: Text(title, style: TextStyles.bold19)),
        ),
        const SizedBox(width: 48), // علشان توازن مكان السهم
      ],
    );

  }
}
