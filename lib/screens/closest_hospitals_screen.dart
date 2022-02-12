import 'package:closest_hospital/constants/colors.dart';
import 'package:closest_hospital/data/data.dart';
import 'package:closest_hospital/models/state_hospitals.dart';
import 'package:closest_hospital/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClosestHospitalSceen extends StatelessWidget {
  const ClosestHospitalSceen({Key? key}) : super(key: key);
  _buildStateHospitals(context) {
    List<Widget> stateHospitalList = [];
    stateHospitals.forEach((StateHospital stateHospital) {
      stateHospitalList.add(
        Container(
          // height: 140,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 20, left: 10.0, right: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(stateHospital.imageUrl!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 170,
                      child: CustomText(
                        text: stateHospital.name!,
                        size: 20.0,
                        weight: FontWeight.bold,
                        color: dark,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      width: 170,
                      child: CustomText(
                        text: stateHospital.owner!,
                        size: 16.0,
                        weight: FontWeight.w600,
                        color: dark,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      width: 170,
                      child: CustomText(
                        text: stateHospital.specialist!,
                        size: 16.0,
                        weight: FontWeight.w600,
                        color: dark,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
    return Column(children: stateHospitalList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30.0, left: 10),
                  child: CustomText(
                    text: 'Closest Hospitals',
                    size: 24.0,
                    weight: FontWeight.w600,
                    color: dark,
                  ),
                ),
                _buildStateHospitals(context),
              ],
            )
          ],
        ),
      ),
    );
  }
}
