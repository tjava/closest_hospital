import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:closest_hospital/constants/__constants.dart';
import 'package:closest_hospital/logic/cubits/specialist_hospitals/specialist_hospitals_cubit.dart';
import 'package:closest_hospital/presentation/widgets/__widgets.dart';

class FacilityCategoryScreen extends StatelessWidget {
  const FacilityCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("testing build");

    final hospitalsData = context.watch<SpecialistHospitalsCubit>().state;

    return Scaffold(
      backgroundColor: light,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            size: 30.sp,
            color: red,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15.h, left: 10.w, bottom: 10.h),
                child: CustomText(
                  text: 'Specialist',
                  size: 20.sp,
                  weight: FontWeight.w600,
                  color: dark,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: hospitalsData.isLoading
                      ? 6
                      : hospitalsData.hospitals.length,
                  itemBuilder: (BuildContext context, index) {
                    if (hospitalsData.isLoading) {
                      return const HospitalCardShimmer();
                    } else {
                      return InkWell(
                        // onTap: () => context.goNamed("singleHospital"),
                        child: HospitalCard(
                          hospital: hospitalsData.hospitals[index],
                        ),
                      );
                    }
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
