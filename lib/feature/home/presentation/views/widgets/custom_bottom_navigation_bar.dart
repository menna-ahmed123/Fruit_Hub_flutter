import 'package:flutter/material.dart';
import 'package:fruit_test_myself/feature/home/domain/entities/bottom_nav_bar_entity.dart';
import 'package:fruit_test_myself/feature/home/presentation/views/widgets/navigation_bar_item.dart';
class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final items = BottomNavBarEntity.getBottomNavBarItems();

    return Container(
      width: double.infinity, 
      height: 70,
    decoration: const ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      shadows: [
        BoxShadow(
          color: Color(0x19000000),
          blurRadius: 15,
          offset: Offset(0, -2),
          spreadRadius: 0,
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = entry.key;
            });
          },
          child: NavigationBarItem(
            bottomNavigationBarEntity: entry.value,
            isSelected: _selectedIndex == entry.key,
          ),
        );
      }).toList(),
    ),
    );
  }
}

