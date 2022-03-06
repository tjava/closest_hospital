import 'package:closest_hospital/constants/colors.dart';
import 'package:closest_hospital/models/single_hospital_properties_model.dart';
import 'package:closest_hospital/models/state_hospitals.dart';
import 'package:closest_hospital/widget/custom_text.dart';
import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  final SingleHospitalPropertiesModel stateHospital;

  const HospitalCard({Key? key, required this.stateHospital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 140,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 20, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Container(
          //   height: 150.0,
          //   width: 150.0,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage(stateHospital.imageUrl!),
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 170,
                child: CustomText(
                  text: stateHospital.facility_name!,
                  size: 20.0,
                  weight: FontWeight.bold,
                  color: dark,
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: 170,
                child: CustomText(
                  text: stateHospital.ownership!,
                  size: 16.0,
                  weight: FontWeight.w600,
                  color: dark,
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: 170,
                child: CustomText(
                  text: stateHospital.facility_type!,
                  size: 16.0,
                  weight: FontWeight.w600,
                  color: dark,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
