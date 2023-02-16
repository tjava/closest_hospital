import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:closest_hospital/data/models/hospital_model.dart';

part 'closest_hospitals_state.dart';

class ClosestHospitalsCubit extends Cubit<ClosestHospitalsState> {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final GeoFlutterFire geo = GeoFlutterFire();
  final Location location = Location();

  ClosestHospitalsCubit() : super(ClosestHospitalsState.initial());

  void getHospitals() async {
    emit(state.copyWith(isLoading: true));

    final LocationData locationResult = await location.getLocation();

    GeoFirePoint center = geo.point(
      latitude: locationResult.latitude!,
      longitude: locationResult.longitude!,
    );

    final collectionReference = firebaseFirestore.collection('hospitals');

    double radius = 3;
    String field = 'position';

    Stream<List<DocumentSnapshot>> streamHospitals = geo
        .collection(collectionRef: collectionReference)
        .within(center: center, radius: radius, field: field);

    streamHospitals.listen((List<DocumentSnapshot> documentList) {
      final List<HospitalModel> hospitals =
          hospitalModelFromSnapshot(documentList);
      emit(state.copyWith(hospitals: hospitals));
      emit(state.copyWith(isLoading: false));
    });
  }

  void requestPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      print('Permission Granted');
    } else if (status.isDenied) {
      requestPermission();
      print('Permission Denied');
    } else if (status.isPermanentlyDenied) {
      print('Permission Permanently Denied');
      openAppSettings();
    }
  }
}
