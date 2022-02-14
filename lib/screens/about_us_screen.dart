import 'package:closest_hospital/constants/colors.dart';
import 'package:closest_hospital/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: 'About App',
                    size: 50,
                    color: dark,
                  ),
                  Icon(
                    Icons.info_outline,
                    size: 50,
                    color: red,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(right: 10, left: 10),
              child: SizedBox(
                height: 200,
                width: 200,
                child: SvgPicture.asset('assets/images/about.svg'),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: RichText(
                text: TextSpan(
                  text:
                      "Closest hospitals app is a NIGERIA free and opensource mobile app design to get you the closest hospital or any medical facilities around the range of 3km of your current location.\n\n",
                  style: TextStyle(
                    fontSize: 25,
                    color: dark,
                  ),
                  children: [
                    TextSpan(
                      text: "contact : devtaiwo@gmail.com\n",
                      style: TextStyle(
                        fontSize: 20,
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
    );
  }
}
