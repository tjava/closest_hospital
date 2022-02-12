import 'package:closest_hospital/constants/colors.dart';
import 'package:closest_hospital/controllers/navigation_controller.dart';
import 'package:closest_hospital/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  _buildHomeOption({String? imagePath, String? name}) => Container(
        height: 170,
        width: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              offset: Offset(8, 10),
              color: red.withOpacity(0.1),
            ),
            BoxShadow(
              blurRadius: 10,
              offset: Offset(-1, -5),
              color: red.withOpacity(0.1),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              height: 100,
              width: 150,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath!),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Container(
                height: 50,
                width: 150,
                margin: EdgeInsets.only(top: 100),
                child: Center(
                  child: CustomText(
                    text: name!,
                    size: 15,
                    weight: FontWeight.bold,
                    color: dark,
                  ),
                ),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    NavigationController navigationController = Get.find();
    return Scaffold(
      backgroundColor: light,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.local_hospital_rounded,
                      size: 30,
                      color: red,
                    ),
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
                            color: red,
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
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.location_pin,
                      size: 30,
                      color: red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Stack(
                children: [
                  Container(
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/images/home_1.png"),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 30,
                          offset: Offset(8, 10),
                          color: red.withOpacity(0.1),
                        ),
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(-1, -5),
                          color: red.withOpacity(0.1),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(right: 180, left: 30, bottom: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/images/home_2.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 150, top: 50),
                    child: Column(
                      children: [
                        CustomText(
                          text: "Closest Hospital",
                          size: 20,
                          weight: FontWeight.bold,
                          color: dark,
                        ),
                        SizedBox(height: 10),
                        CustomText(
                          text: "By providing your location,",
                          size: 16,
                          weight: FontWeight.w300,
                          color: dark,
                        ),
                        SizedBox(height: 5),
                        CustomText(
                          text: "You get the",
                          size: 16,
                          weight: FontWeight.w300,
                          color: dark,
                        ),
                        SizedBox(height: 5),
                        CustomText(
                          text: "Closest medical facilities.",
                          size: 16,
                          weight: FontWeight.w300,
                          color: dark,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: CustomText(
                text: "What did you need ?",
                size: 20,
                weight: FontWeight.bold,
                color: dark,
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildHomeOption(
                        imagePath: "assets/images/home_3.png",
                        name: "General Hospital",
                      ),
                      _buildHomeOption(
                        imagePath: "assets/images/home_4.png",
                        name: "Clinic",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildHomeOption(
                        imagePath: "assets/images/home_5.png",
                        name: "Health Post",
                      ),
                      _buildHomeOption(
                        imagePath: "assets/images/home_6.png",
                        name: "Specialist",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildHomeOption(
                        imagePath: "assets/images/home_7.png",
                        name: "Dispensary",
                      ),
                      _buildHomeOption(
                        imagePath: "assets/images/home_8.png",
                        name: "Primary Health Centre",
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
