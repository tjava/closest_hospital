import 'package:closest_hospital/constants/colors.dart';
import 'package:closest_hospital/widget/custom_text.dart';
import 'package:closest_hospital/widget/navigation_bar.dart';
import 'package:flutter/material.dart';

class ClosestHospitalSceen extends StatelessWidget {
  const ClosestHospitalSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: CustomText(text: "Closest Hospital Screen."),
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
