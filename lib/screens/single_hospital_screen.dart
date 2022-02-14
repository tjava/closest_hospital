import 'package:closest_hospital/constants/colors.dart';
import 'package:closest_hospital/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleHospitalScreen extends StatelessWidget {
  const SingleHospitalScreen({Key? key}) : super(key: key);

  _buildSingleHospital({String? name, String? value}) => RichText(
        text: TextSpan(
          text: name! + " : ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: dark,
          ),
          children: [
            TextSpan(
              text: value!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: dark,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              // flex: 2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      offset: const Offset(8, 10),
                      color: red.withOpacity(0.1),
                    ),
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(-1, -5),
                      color: red.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSingleHospital(
                      name: "Facility Name",
                      value: "taiwo",
                    ),
                    _buildSingleHospital(
                      name: "Facility Type",
                      value: "taiwo",
                    ),
                    _buildSingleHospital(
                      name: "Ownership",
                      value: "taiwo",
                    ),
                    _buildSingleHospital(
                      name: "Ward",
                      value: "taiwo",
                    ),
                    _buildSingleHospital(
                      name: "L.G.A",
                      value: "taiwo",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              // flex: 4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      offset: const Offset(8, 10),
                      color: red.withOpacity(0.1),
                    ),
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(-1, -5),
                      color: red.withOpacity(0.1),
                    ),
                  ],
                ),
                child: CustomText(
                  text: "map",
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
