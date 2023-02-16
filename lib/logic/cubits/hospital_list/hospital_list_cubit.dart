import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:closest_hospital/data/models/hospital_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

part 'hospital_list_state.dart';

class HospitalListCubit extends Cubit<HospitalListState> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final geo = GeoFlutterFire();

  HospitalListCubit() : super(HospitalListState.initial());

  void getHospitals() async {
    final snapshot = await firebaseFirestore.collection("hospitals").get();
    final List<HospitalModel> hospitals =
        snapshot.docs.map((e) => HospitalModel.fromSnapshot(e)).toList();

    emit(state.copyWith(hospitals: hospitals));
    print(hospitals.length);
  }

  // Future<void> sendData() async {
  //   final String response = await rootBundle.loadString('assets/json/4.json');

  //   final data = fromJson(response);

  //   data.forEach((e) {
  //     double lat = e['Lat'];
  //     double long = e['Long'];
  //     GeoFirePoint myLocation = geo.point(latitude: lat, longitude: long);
  //     print(1);
  //     firebaseFirestore.collection('hospitals').add({
  //       "Facility_n": e['Facility_n'],
  //       "Facility_t": e['Facility_t'],
  //       "Ward": e['Ward'],
  //       "Ownership": e['Ownership'],
  //       "Lga": e['Lga'],
  //       "position": myLocation.data,
  //     });
  //   });
  // }

  List fromJson(String str) => List.from(json.decode(str)['features'].map((x) {
        return {
          "Facility_n": x['properties']['Facility_n'],
          "Facility_t": x['properties']['Facility_t'],
          "Ward": x['properties']['Ward'],
          "Ownership": x['properties']['Ownership'],
          "Lga": x['properties']['Lga'],
          "Lat": x['properties']['Lat'],
          "Long": x['properties']['Long'],
        };
      }));
}
