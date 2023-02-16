import 'package:closest_hospital/logic/cubits/__cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:closest_hospital/constants/__constants.dart';
import 'package:closest_hospital/data/data.dart';
import 'package:closest_hospital/presentation/widgets/__widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: light,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: Icon(
                        Icons.local_hospital_rounded,
                        size: 30.sp,
                        color: red,
                      ),
                    ),
                    Column(
                      children: [
                        CustomText(
                          text: 'Current Location',
                          size: 16.sp,
                          color: lightGrey,
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              size: 20.sp,
                              color: red,
                            ),
                            CustomText(
                              text: 'Minna, Niger',
                              size: 16.sp,
                              color: dark,
                              weight: FontWeight.bold,
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10.w),
                      child: Icon(
                        Icons.location_pin,
                        size: 30.sp,
                        color: red,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Container(
                height: 180.h,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(right: 10.h, left: 10.h),
                child: Stack(
                  children: [
                    Container(
                      height: 120.h,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 30.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/home_1.png"),
                          fit: BoxFit.fill,
                        ),
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
                    ),
                    Container(
                      height: 150.h,
                      width: 100.w,
                      margin: EdgeInsets.only(left: 50.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/home_2.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: 45,
                      child: Column(
                        children: [
                          CustomText(
                            text: "Closest Hospital",
                            size: 18.sp,
                            weight: FontWeight.bold,
                            color: dark,
                          ),
                          SizedBox(height: 10.h),
                          CustomText(
                            text: "By providing your location,",
                            size: 14.sp,
                            weight: FontWeight.w300,
                            color: dark,
                          ),
                          SizedBox(height: 5.h),
                          Center(
                            child: CustomText(
                              text: "You get the",
                              size: 14.sp,
                              weight: FontWeight.w300,
                              color: dark,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          CustomText(
                            text: "Closest medical facilities.",
                            size: 14.sp,
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
                margin: EdgeInsets.only(left: 10.h),
                child: CustomText(
                  text: "What did you need ?",
                  size: 18.sp,
                  weight: FontWeight.bold,
                  color: dark,
                ),
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 3,
                    mainAxisSpacing: 20.0.w,
                    crossAxisSpacing: 20.0.h,
                    childAspectRatio: (100.w / 100.h),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        context
                            .read<SpecialistHospitalsCubit>()
                            .getHospitals(index: index);
                        context.goNamed("facilityCategory");
                      },
                      child: HomeCard(
                        homeCardData: homeCardData[index],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
