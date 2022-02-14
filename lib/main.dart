import 'package:closest_hospital/constants/init_dependencies.dart';
import 'package:closest_hospital/layout.dart';
import 'package:closest_hospital/screens/facility_category.dart';
import 'package:closest_hospital/screens/single_hospital_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitDependencies(),
      title: 'Closest hospitals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Layout()),
        GetPage(
          name: '/singleHospital',
          page: () => const SingleHospitalScreen(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/facilityCategory',
          page: () => const FacilityCategory(),
          transition: Transition.rightToLeft,
        ),
      ],
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          // ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1700, name: DESKTOP),
        ],
      ),
    );
  }
}
