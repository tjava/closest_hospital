import 'package:closest_hospital/constants/colors.dart';
import 'package:closest_hospital/controllers/navigation_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);
  // int index = 0;

  @override
  Widget build(BuildContext context) {
    NavigationController navigationController = Get.find();

    final items = <Widget>[
      Icon(Icons.home, size: 30, color: Colors.white),
      Icon(Icons.location_pin, size: 30, color: Colors.white),
      Icon(Icons.search, size: 30, color: Colors.white),
      Icon(Icons.person, size: 30, color: Colors.white),
    ];

    return Obx(
      () => CurvedNavigationBar(
        items: items,
        index: navigationController.indexScreen.value,
        height: 60,
        color: blue,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: (screen) => navigationController.changeScreen(screen),
      ),
    );
  }
}
