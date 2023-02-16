import 'package:closest_hospital/constants/__constants.dart';
import 'package:closest_hospital/presentation/widgets/__widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      text: 'About App',
                      size: 50.sp,
                      color: dark,
                    ),
                    Icon(
                      Icons.info_outline,
                      size: 50.sp,
                      color: red,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Container(
                height: 300.w,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(right: 10.w, left: 10.w),
                child: SizedBox(
                  height: 200.h,
                  width: 200.w,
                  child: SvgPicture.asset('assets/images/about.svg'),
                ),
              ),
              SizedBox(height: 50.h),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: RichText(
                  text: TextSpan(
                    text:
                        "Our mobile app is designed to help you find the nearest medical facility based on your current location. Whether you need urgent care, emergency medical services, or just a routine check-up, our app can help you find the medical care you need. ",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: dark,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "Our team is dedicated to making healthcare more accessible and convenient for everyone. We understand that finding medical care can be stressful and time-consuming, especially when you're not feeling well. That's why we created our app to make it easy for you to find the closest medical facility, no matter where you are.",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: dark,
                        ),
                      ),
                      TextSpan(
                        text:
                            "We believe that everyone should have access to quality healthcare, regardless of their location or financial situation. Our app is free to download and use, and we don't collect any personal information that could be used to identify you. Your privacy and security are our top priorities, and we take every measure to protect your personal information.",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: dark,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Thank you for using our app to find the medical care you need. We hope that our app makes it easier for you to get the care you deserve.",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: dark,
                        ),
                      ),
                      TextSpan(
                        text: "contact : devtaiwo@gmail.com\n",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: dark,
                        ),
                      ),
                      TextSpan(
                        text: "contact : devtaiwo@gmail.com\n",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: dark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
