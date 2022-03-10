import 'package:closest_hospital/constants/colors.dart';
import 'package:closest_hospital/controllers/closest_hospitals_controller.dart';
import 'package:closest_hospital/controllers/single_hospital_controller.dart';
import 'package:closest_hospital/data/data.dart';
import 'package:closest_hospital/models/state_hospitals.dart';
import 'package:closest_hospital/widget/custom_text.dart';
import 'package:closest_hospital/widget/hospital_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClosestHospitalSceen extends StatelessWidget {
  const ClosestHospitalSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClosestHospitalsController closestHospitalsController = Get.find();
    SingleHospitalController singleHospitalController = Get.find();
    return Scaffold(
      backgroundColor: light,
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30.0, left: 10, bottom: 10),
                child: CustomText(
                  text: 'Closest Hospitals (3km)',
                  size: 20.0,
                  weight: FontWeight.w600,
                  color: dark,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount:
                      closestHospitalsController.closestHospitals!.length,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () async =>
                          await singleHospitalController.goToSingleHospital(
                              id: closestHospitalsController
                                  .closestHospitals![index].id),
                      child: HospitalCard(
                          stateHospital: closestHospitalsController
                              .closestHospitals![index].properties!),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
