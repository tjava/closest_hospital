import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:closest_hospital/constants/__constants.dart';
import 'package:closest_hospital/presentation/widgets/__widgets.dart';

class SingleHospitalScreen extends StatelessWidget {
  const SingleHospitalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: light,
      body: SafeArea(
        child: Column(
          children: [
            // Container(
            //   margin: EdgeInsets.only(top: 30.h),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         margin: EdgeInsets.only(left: 10.w),
            //         child: GestureDetector(
            //           onTap: () => Get.back(),
            //           child: Icon(
            //             Icons.arrow_back,
            //             size: 30.sp,
            //             color: red,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 30),
            Expanded(
              // flex: 4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      offset: const Offset(8, 10),
                      color: red.withOpacity(0.1),
                    ),
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(-1, -5),
                      color: red.withOpacity(0.1),
                    ),
                  ],
                ),
                child: const CustomText(
                  text: "map",
                  size: 20,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              // flex: 2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15.w),
                // margin: EdgeInsets.only(right: 10.w, left: 10.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.r),
                    topLeft: Radius.circular(40.r),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    SingleHospital(
                      name: "Facility Name",
                      value: "Facility Name Facility Name Facility Name",
                    ),
                    SingleHospital(
                      name: "Facility Type",
                      value: "Facility Name Facility Name Facility Name",
                    ),
                    SingleHospital(
                      name: "Ownership",
                      value: "Facility Name Facility Name",
                    ),
                    SingleHospital(
                      name: "Ward",
                      value: "Facility Name Facility Name",
                    ),
                    SingleHospital(
                      name: "L.G.A",
                      value: "Facility Name Facility Name",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
