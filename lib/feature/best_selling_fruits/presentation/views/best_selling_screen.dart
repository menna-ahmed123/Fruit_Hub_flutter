import 'package:flutter/material.dart';
import 'package:fruit_test_myself/core/widgets/build_app_par.dart';

class BestSellingScreen extends StatelessWidget {
  const BestSellingScreen({super.key});
  static const String routeName = 'best-selling';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppPar(title: 'Best Selling Fruits'),
      body: Center(child: Text('Best Selling Fruits Content')),
    );
  }
}
