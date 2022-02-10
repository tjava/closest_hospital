import 'package:closest_hospital/constants/init_dependencies.dart';
import 'package:closest_hospital/screens/about_us_screen.dart';
import 'package:closest_hospital/screens/closest_hospitals_screen.dart';
import 'package:closest_hospital/screens/home_screen.dart';
import 'package:closest_hospital/screens/state_hospitals_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(
            name: '/closestHospital', page: () => const ClosestHospitalSceen()),
        GetPage(
            name: '/stateHospital', page: () => const StateHospitalsScreen()),
        GetPage(name: '/aboutUs', page: () => const AboutUsScreen()),
      ],
      // home: const HomeScreen(),
    );
  }
}
