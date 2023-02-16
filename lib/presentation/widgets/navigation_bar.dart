import 'package:closest_hospital/logic/cubits/__cubits.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:closest_hospital/constants/__constants.dart';

class NavigationBars extends StatelessWidget {
  const NavigationBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // NavigationController navigationController = Get.find();

    final items = <Widget>[
      const Icon(Icons.home, size: 30, color: Colors.white),
      const Icon(Icons.location_pin, size: 30, color: Colors.white),
      const Icon(Icons.search, size: 30, color: Colors.white),
      const Icon(Icons.info_outline, size: 30, color: Colors.white),
    ];

    return CurvedNavigationBar(
      items: items,
      index: 0,
      height: 60,
      color: red,
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      onTap: (screen) {
        if (screen == 1) {
          context.read<ClosestHospitalsCubit>().getHospitals();
        }
        if (screen == 2) {
          context.read<StateHospitalsCubit>().getHospitals();
        }
        context.read<NavigationCubit>().changeScreenIndex(screen);
      },
    );
  }
}
