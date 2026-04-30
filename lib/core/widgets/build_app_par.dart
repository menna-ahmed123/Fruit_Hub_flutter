import 'package:flutter/material.dart';
import 'package:fruit_test_myself/core/utils/app_text_styles.dart';

AppBar buildAppPar ({required String title}) {
    return AppBar(
      centerTitle: true,
      title: Text(title, style: TextStyles.bold19),
    );
}