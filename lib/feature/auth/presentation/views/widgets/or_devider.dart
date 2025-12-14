import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_text_styles.dart';

class OrDevider extends StatelessWidget {
  const OrDevider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color:Color(0xffDDDFDF) ,
          ),
        ),
        SizedBox(width:10 ,),
        Text("or",
        style: TextStyles.semiBold16,
        ),
                SizedBox(width: 10),

         Expanded(child: Divider(
                      thickness: 1,

          color: Color(0xffDDDFDF))),
      ],
    );
  }
}
