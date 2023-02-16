import 'package:closest_hospital/logic/cubits/__cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:closest_hospital/constants/__constants.dart';
import 'package:closest_hospital/data/data.dart';
import 'package:closest_hospital/presentation/widgets/__widgets.dart';

class StateHospitalsScreen extends StatelessWidget {
  const StateHospitalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hospitalsData = context.watch<StateHospitalsCubit>().state;
    final search = context.watch<StateSearchCubit>().state;

    return Scaffold(
      backgroundColor: light,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w),
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
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
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: red,
                    ),
                    iconSize: 36.sp,
                    value: search.searchTerm != ""
                        ? search.searchTerm
                        : "Select State",
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
                    onChanged: (String? newSearchTerm) async {
                      context
                          .read<StateSearchCubit>()
                          .setSearchTerm(newSearchTerm!);
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.h, left: 10.w, bottom: 10.h),
                child: CustomText(
                  text: search.searchTerm != ""
                      ? "${search.searchTerm} State"
                      : "Select State",
                  size: 20.sp,
                  weight: FontWeight.w600,
                  color: dark,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: hospitalsData.isLoading
                      ? 5
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
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
