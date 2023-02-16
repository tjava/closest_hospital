import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:closest_hospital/constants/__constants.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double hight;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.circular({
    Key? key,
    required this.width,
    required this.hight,
    this.shapeBorder = const CircleBorder(),
  }) : super(key: key);

  const ShimmerWidget.rectangular({
    super.key,
    this.width = double.infinity,
    required this.hight,
  }) : shapeBorder = const RoundedRectangleBorder();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: blurGrey,
      highlightColor: blurRed,
      child: Container(
        width: width,
        height: hight,
        decoration: ShapeDecoration(
          color: lightGrey,
          shape: shapeBorder,
        ),
      ),
    );
  }
}
