import 'package:closest_hospital/constants/colors.dart';
import 'package:closest_hospital/controllers/state_hospitals_controller.dart';
import 'package:closest_hospital/data/data.dart';
import 'package:closest_hospital/models/state_hospitals.dart';
import 'package:closest_hospital/widget/custom_text.dart';
import 'package:closest_hospital/widget/hospital_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateHospitalsScreen extends StatelessWidget {
  const StateHospitalsScreen({Key? key}) : super(key: key);

  _buildStateHospitals(context) {
    List<Widget> stateHospitalList = [];
    stateHospitals.forEach((StateHospital stateHospital) {
      stateHospitalList.add(
        GestureDetector(
          onTap: () => Get.toNamed("/singleHospital"),
          child: HospitalCard(stateHospital: stateHospital),
        ),
      );
    });
    return Column(children: stateHospitalList);
  }

  @override
  Widget build(BuildContext context) {
    StateHospitalsController stateHospitalsController = Get.find();

    return Scaffold(
      backgroundColor: light,
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(top: 30.0, left: 10, right: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
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
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: red,
                        ),
                        iconSize: 36.0,
                        value: stateHospitalsController.stateValue.value,
                        items: states.map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: CustomText(
                                text: value,
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (String? state) {
                          stateHospitalsController.changeState(state);
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => stateHospitalsController.getSingleHospital(),
                    child: Container(
                      margin: const EdgeInsets.only(top: 30.0, left: 10),
                      child: CustomText(
                        text:
                            "${stateHospitalsController.stateValue.value} State Hospitals",
                        size: 20.0,
                        weight: FontWeight.w600,
                        color: dark,
                      ),
                    ),
                  ),
                  _buildStateHospitals(context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
