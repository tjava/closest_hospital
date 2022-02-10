import 'package:closest_hospital/controllers/navigation_controller.dart';
import 'package:closest_hospital/screens/about_us_screen.dart';
import 'package:closest_hospital/screens/closest_hospitals_screen.dart';
import 'package:closest_hospital/screens/home_screen.dart';
import 'package:closest_hospital/screens/state_hospitals_screen.dart';
import 'package:closest_hospital/widget/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Layout extends StatelessWidget {
  // const Layout({ Key? key }) : super(key: key);

  final Screens = <Widget>[
    const HomeScreen(),
    const ClosestHospitalSceen(),
    const StateHospitalsScreen(),
    const AboutUsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    NavigationController navigationController = Get.find();
    return Obx(
      () => Scaffold(
        extendBody: true,
        body: Screens[navigationController.indexScreen.value],
        bottomNavigationBar: const NavigationBar(),
      ),
    );
  }
}
