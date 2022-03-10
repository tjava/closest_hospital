import 'package:closest_hospital/constants/colors.dart';
import 'package:closest_hospital/controllers/single_hospital_controller.dart';
import 'package:closest_hospital/controllers/state_hospitals_controller.dart';
import 'package:closest_hospital/data/data.dart';
import 'package:closest_hospital/widget/custom_text.dart';
import 'package:closest_hospital/widget/hospital_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateHospitalsScreen extends StatelessWidget {
  const StateHospitalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StateHospitalsController stateHospitalsController = Get.find();
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
                margin: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
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
                    onChanged: (String? state) async {
                      await stateHospitalsController.changeState(
                        state: state,
                        index: states.indexOf(state!),
                      );
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0, left: 10, bottom: 10),
                child: CustomText(
                  text: stateHospitalsController.stateValue == "Select State"
                      ? "No state selected"
                      : "${stateHospitalsController.stateValue.value} State Hospitals",
                  size: 20.0,
                  weight: FontWeight.w600,
                  color: dark,
                ),
              ),
              if (stateHospitalsController.isLoading.isTrue ||
                  stateHospitalsController.stateValue == "Select State")
                Center(
                  child: Container(
                    margin: EdgeInsets.all(100),
                    child: CircularProgressIndicator(),
                  ),
                ),
              if (stateHospitalsController.stateValue != "Select State")
                Expanded(
                  child: ListView.builder(
                    itemCount: stateHospitalsController.stateHospitals!.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () async =>
                            await singleHospitalController.goToSingleHospital(
                                id: stateHospitalsController
                                    .stateHospitals![index].id),
                        child: HospitalCard(
                            stateHospital: stateHospitalsController
                                .stateHospitals![index].properties!),
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
