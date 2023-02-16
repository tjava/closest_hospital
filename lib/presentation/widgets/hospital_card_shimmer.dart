import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:closest_hospital/constants/__constants.dart';
import 'package:closest_hospital/presentation/widgets/__widgets.dart';

class HospitalCardShimmer extends StatelessWidget {
  const HospitalCardShimmer({
    Key? key,
  }) : super(key: key);

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
          Container(
            margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
            child: ShimmerWidget.circular(
              hight: 100.h,
              width: 100.h,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 170.w,
                child: ShimmerWidget.rectangular(hight: 15.h, width: 170.h),
              ),
              // SizedBox(height: 15.h),
              SizedBox(
                width: 170.w,
                child: ShimmerWidget.rectangular(hight: 13.h, width: 170.h),
              ),
              // SizedBox(height: 15.h),
              SizedBox(
                width: 170.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget.rectangular(hight: 10.h, width: 60.h),
                    Row(
                      children: [
                        ShimmerWidget.rectangular(hight: 10.h, width: 15.h),
                        SizedBox(width: 5.w),
                        ShimmerWidget.rectangular(hight: 10.h, width: 25.h),
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
