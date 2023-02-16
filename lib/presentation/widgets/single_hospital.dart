// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:closest_hospital/constants/__constants.dart';
import 'package:closest_hospital/presentation/widgets/__widgets.dart';

class SingleHospital extends StatelessWidget {
  final String name;
  final String value;
  const SingleHospital({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: "$name : ",
          color: dark,
          size: 18.sp,
          weight: FontWeight.bold,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: RichText(
              text: TextSpan(
                text: value,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: dark,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
