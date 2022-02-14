import 'package:closest_hospital/constants/colors.dart';
import 'package:closest_hospital/controllers/navigation_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationController navigationController = Get.find();

    final items = <Widget>[
      const Icon(Icons.home, size: 30, color: Colors.white),
      const Icon(Icons.location_pin, size: 30, color: Colors.white),
      const Icon(Icons.search, size: 30, color: Colors.white),
      const Icon(Icons.info_outline, size: 30, color: Colors.white),
    ];

    return Obx(
      () => CurvedNavigationBar(
        items: items,
        index: navigationController.indexScreen.value,
        height: 60,
        color: red,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (screen) => navigationController.changeScreen(screen),
      ),
    );
  }
}
