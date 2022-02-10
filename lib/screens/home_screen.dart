import 'package:closest_hospital/constants/colors.dart';
import 'package:closest_hospital/controllers/navigation_controller.dart';
import 'package:closest_hospital/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationController navigationController = Get.find();
    return Scaffold(
      backgroundColor: light,
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.local_hospital,
                  size: 30,
                  color: blue,
                ),
                Column(
                  children: [
                    CustomText(
                      text: 'Current Location',
                      size: 16,
                      color: lightGrey,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          size: 20,
                          color: blue,
                        ),
                        CustomText(
                          text: 'Minna, Niger',
                          size: 16,
                          color: dark,
                          weight: FontWeight.bold,
                        ),
                      ],
                    )
                  ],
                ),
                Icon(
                  Icons.location_pin,
                  size: 30,
                  color: blue,
                ),
              ],
            ),
          ),
          Stack(
            children: [Container()],
          )
        ],
      ),
    );
  }
}
