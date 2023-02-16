import 'package:closest_hospital/constants/__constants.dart';
import 'package:closest_hospital/firebase_options.dart';
import 'package:closest_hospital/logic/cubits/__cubits.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider<HospitalListCubit>(
          create: (context) => HospitalListCubit(),
        ),
        BlocProvider<ClosestHospitalsCubit>(
          create: (context) => ClosestHospitalsCubit(),
        ),
        BlocProvider<StateSearchCubit>(
          create: (context) => StateSearchCubit(),
        ),
        BlocProvider<StateHospitalsCubit>(
          create: (context) => StateHospitalsCubit(
            stateSearchCubit: BlocProvider.of<StateSearchCubit>(context),
          ),
        ),
        BlocProvider<SpecialistHospitalsCubit>(
          create: (context) => SpecialistHospitalsCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 812),
        minTextAdapt: false,
        splitScreenMode: true,
        builder: (context, builder) {
          return MaterialApp.router(
            title: 'Closest hospitals',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
