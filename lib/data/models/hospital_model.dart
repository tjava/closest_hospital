import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// List<HospitalModel> hospitalModelFromJson(String str) =>
//     List<HospitalModel>.from(
//         json.decode(str).map((x) => HospitalModel.fromJson(x)));

// String hospitalModelToJson(List<HospitalModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<HospitalModel> hospitalModelFromSnapshot(
        List<DocumentSnapshot> documant) =>
    List<HospitalModel>.from(
        documant.map((x) => HospitalModel.fromSnapshot(x)));

class HospitalModel {
  HospitalModel({
    required this.id,
    required this.facilityName,
    required this.facilityType,
    required this.ward,
    required this.ownership,
    required this.lga,
    required this.position,
  });

  String id;
  String facilityName;
  String facilityType;
  String ward;
  String ownership;
  String lga;
  Map position;

  factory HospitalModel.fromSnapshot(
    DocumentSnapshot documant,
  ) {
    // DocumentSnapshot<Map<String, dynamic>> documant,
    // final data = documant.data();

    return HospitalModel(
      id: documant.id,
      facilityName: documant["Facility_n"],
      facilityType: documant["Facility_t"],
      ward: documant["Ward"],
      ownership: documant["Ownership"],
      lga: documant["Lga"],
      position: documant["position"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "facility_name": facilityName,
        "facility_type": facilityType,
        "ward": ward,
        "ownership": ownership,
        "lga": lga,
        "position": position,
      };
}
