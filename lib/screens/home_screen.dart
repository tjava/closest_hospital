import 'package:closest_hospital/constants/colors.dart';
import 'package:closest_hospital/controllers/navigation_controller.dart';
import 'package:closest_hospital/widget/navigation_bar.dart';
import 'package:closest_hospital/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationController navigationController = Get.find();
    return Scaffold(
      extendBody: true,
      body: Container(
        child: const Center(
          child: CustomText(text: "Home Screen."),
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
