import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final Function(int)? onTabChange;
  const MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
        onTabChange: (value) => onTabChange!((value)),
        tabBorderRadius: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder:
            Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
        tabBackgroundColor: Colors.grey.shade200,
        tabs: [
          GButton(
            icon: Icons.shop,
            text: "Shop",
            textSize: 16,
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: "Cart",
            textSize: 16,
          ),
        ]);
  }
}
