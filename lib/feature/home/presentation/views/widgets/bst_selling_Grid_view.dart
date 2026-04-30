import 'package:flutter/material.dart';
import 'package:fruit_test_myself/core/widgets/fruit_item.dart';

class BstSellingGridView extends StatelessWidget {
  const BstSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        //mainAxisSpacing: 8,
        mainAxisExtent: 230,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => const FruitItem(),
        childCount: 10,
      ),
    );
  }
}
