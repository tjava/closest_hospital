import 'package:closest_hospital/constants/__constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:closest_hospital/presentation/widgets/__widgets.dart';

class HomeCard extends StatelessWidget {
  final Map<String, dynamic> homeCardData;
  const HomeCard({
    Key? key,
    required this.homeCardData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
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
      child: Column(
        children: [
          Container(
            height: 100.h,
            margin: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(homeCardData["image"]),
                fit: BoxFit.fill,
              ),
            ),
          ),
          CustomText(
            text: homeCardData["name"],
            size: 15.sp,
            weight: FontWeight.bold,
            color: dark,
          ),
        ],
      ),
    );
  }
}
