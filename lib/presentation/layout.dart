import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:closest_hospital/logic/cubits/navigation/navigation_cubit.dart';
import 'package:closest_hospital/presentation/screens/__screens.dart';
import 'package:closest_hospital/presentation/widgets/__widgets.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  static const screens = <Widget>[
    HomeScreen(),
    ClosestHospitalSceen(),
    StateHospitalsScreen(),
    AboutUsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[context.watch<NavigationCubit>().state.index],
      bottomNavigationBar: const NavigationBars(),
    );
  }
}
