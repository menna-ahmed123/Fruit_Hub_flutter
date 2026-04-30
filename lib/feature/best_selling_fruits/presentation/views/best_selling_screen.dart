import 'package:flutter/material.dart';

class BestSellingScreen extends StatelessWidget {
  const BestSellingScreen({super.key});
  static const String routeName = 'best-selling';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Best Selling Fruits'),
      ),
      body: Center(
        child: Text('Best Selling Fruits Content'),
      ),
    );
  }

}
