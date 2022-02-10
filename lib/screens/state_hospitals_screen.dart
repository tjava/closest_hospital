import 'package:closest_hospital/constants/colors.dart';
import 'package:closest_hospital/data/data.dart';
import 'package:closest_hospital/models/state_hospitals.dart';
import 'package:closest_hospital/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StateHospitalsScreen extends StatefulWidget {
  const StateHospitalsScreen({Key? key}) : super(key: key);

  @override
  _StateHospitalsScreenState createState() => _StateHospitalsScreenState();
}

class _StateHospitalsScreenState extends State<StateHospitalsScreen> {
  _buildStateHospitals() {
    List<Widget> stateHospitalList = [];
    stateHospitals.forEach((StateHospital stateHospital) {
      stateHospitalList.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              width: 1.0,
              color: Colors.grey,
            ),
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 150.0,
                width: 150.0,
                child: SvgPicture.asset(stateHospital.imageUrl!),
              ),
              Container(
                margin: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: stateHospital.name!,
                      size: 20.0,
                      weight: FontWeight.bold,
                      color: dark,
                    ),
                    SizedBox(height: 4.0),
                    CustomText(
                      text: stateHospital.owner! + ' Hostpital',
                      size: 16.0,
                      weight: FontWeight.w600,
                      color: dark,
                    ),
                    SizedBox(height: 4.0),
                    CustomText(
                      text: stateHospital.specialist! + ' Specialist',
                      size: 16.0,
                      weight: FontWeight.w600,
                      color: dark,
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
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: blue,
                  ),
                ),
                hintText: 'Search Hospital',
                prefixIcon: Icon(
                  Icons.search,
                  size: 30.0,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomText(
                  text: 'Closest Hospitals',
                  size: 24.0,
                  weight: FontWeight.w600,
                  color: dark,
                ),
              ),
              _buildStateHospitals(),
            ],
          )
        ],
      ),
    );
  }
}
