import 'package:closest_hospital/constants/colors.dart';
import 'package:closest_hospital/data/data.dart';
import 'package:closest_hospital/models/state_hospitals.dart';
import 'package:closest_hospital/widget/custom_text.dart';
import 'package:closest_hospital/widget/hospital_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClosestHospitalSceen extends StatelessWidget {
  const ClosestHospitalSceen({Key? key}) : super(key: key);
  // _buildStateHospitals(context) {
  //   List<Widget> stateHospitalList = [];
  //   stateHospitals.forEach((StateHospital stateHospital) {
  //     stateHospitalList.add(
  //       GestureDetector(
  //         onTap: () => Get.toNamed("/singleHospital"),
  //         // child: HospitalCard(stateHospital: stateHospital),
  //       ),
  //     );
  //   });
  //   return Column(children: stateHospitalList);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30.0, left: 10),
                  child: CustomText(
                    text: 'Closest Hospitals (3km)',
                    size: 20.0,
                    weight: FontWeight.w600,
                    color: dark,
                  ),
                ),
                // _buildStateHospitals(context),
              ],
            )
          ],
        ),
      ),
    );
  }
}
