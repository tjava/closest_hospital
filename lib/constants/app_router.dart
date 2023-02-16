import 'package:closest_hospital/logic/cubits/__cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:closest_hospital/presentation/layout.dart';
import 'package:closest_hospital/presentation/screens/__screens.dart';

class AppRouter {
  static const root = '/';
  static const singleHospital = 'singleHospital';
  static const facilityCategory = 'facilityCategory';

  static Widget _layoutRouteBuilder(BuildContext context, GoRouterState state) {
    context.read<ClosestHospitalsCubit>().requestPermission();
    return const Layout();
  }

  static Widget _singleHospitalRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const SingleHospitalScreen();

  static Widget _facilityCategoryRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const FacilityCategoryScreen();

  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: root,
        name: 'root',
        builder: _layoutRouteBuilder,
        routes: [
          GoRoute(
            path: singleHospital,
            name: 'singleHospital',
            builder: _singleHospitalRouteBuilder,
          ),
          GoRoute(
            path: facilityCategory,
            name: 'facilityCategory',
            builder: _facilityCategoryRouteBuilder,
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
