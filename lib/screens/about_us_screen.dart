import 'package:closest_hospital/constants/colors.dart';
import 'package:closest_hospital/widget/custom_text.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: CustomText(text: "About Us Screen."),
        ),
      ),
    );
  }
}
