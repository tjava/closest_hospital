import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:closest_hospital/constants/__constants.dart';
import 'package:closest_hospital/data/models/hospital_model.dart';
import 'package:closest_hospital/presentation/widgets/__widgets.dart';

class HospitalCard extends StatelessWidget {
  final HospitalModel hospital;

  const HospitalCard({Key? key, required this.hospital}) : super(key: key);

  Widget showImage(String type) {
    if (type == "Primary Health Centre (PHC)") {
      return Container(
        height: 100.h,
        width: 100.w,
        margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home_8.png"),
            fit: BoxFit.fill,
          ),
        ),
      );
    }

    if (type == "Specialist Hospital") {
      return Container(
        height: 100.h,
        width: 100.w,
        margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home_6.png"),
            fit: BoxFit.fill,
          ),
        ),
      );
    }

    if (type == "Dispensary") {
      return Container(
        height: 100.h,
        width: 100.w,
        margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home_7.png"),
            fit: BoxFit.fill,
          ),
        ),
      );
    }

    if (type.contains("Basic Health Centre")) {
      return Container(
        height: 100.h,
        width: 100.w,
        margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home_4.png"),
            fit: BoxFit.fill,
          ),
        ),
      );
    }

    return Container(
      height: 100.h,
      width: 100.w,
      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home_3.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      margin: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 30.r,
            offset: const Offset(8, 10),
            color: red.withOpacity(0.1),
          ),
          BoxShadow(
            blurRadius: 10.r,
            offset: const Offset(-1, -5),
            color: red.withOpacity(0.1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          showImage(hospital.facilityType),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 170.w,
                child: CustomText(
                  text: hospital.facilityName,
                  size: 18.sp,
                  weight: FontWeight.bold,
                  color: dark,
                ),
              ),
              SizedBox(
                width: 170.w,
                child: CustomText(
                  text: hospital.facilityType,
                  size: 16.sp,
                  weight: FontWeight.w400,
                  color: dark,
                ),
              ),
              SizedBox(
                width: 170.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Ownership:",
                      size: 16.sp,
                      weight: FontWeight.w400,
                      color: dark,
                    ),
                    Row(
                      children: [
                        if (hospital.ownership == "private")
                          Icon(
                            Icons.person,
                            size: 16.sp,
                            color: red,
                          )
                        else
                          Icon(
                            Icons.people_alt,
                            size: 16.sp,
                            color: red,
                          ),
                        SizedBox(width: 5.w),
                        SizedBox(
                          width: 50.w,
                          child: CustomText(
                            text: hospital.ownership,
                            size: 16.sp,
                            weight: FontWeight.w400,
                            color: dark,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
