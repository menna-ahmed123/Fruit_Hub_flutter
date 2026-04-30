import 'package:flutter/material.dart';
import 'package:fruit_test_myself/feature/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit_test_myself/feature/home/presentation/views/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: 
      SafeArea(child: const HomeScreenBody()),
    );
  }
}
