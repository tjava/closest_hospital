import 'package:closest_hospital/constants/colors.dart';
import 'package:closest_hospital/widget/custom_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: blue,
      child: const Center(
        child: CustomText(text: "Closest hospitals app."),
      ),
    );
  }
}
