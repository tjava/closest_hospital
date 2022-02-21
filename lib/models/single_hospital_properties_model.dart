import 'package:json_annotation/json_annotation.dart';

part 'single_hospital_properties_model.g.dart';

@JsonSerializable()
class SingleHospitalPropertiesModel {
  @JsonKey(name: "facility_name")
  // ignore: non_constant_identifier_names
  String? facility_name;

  @JsonKey(name: "facility_type")
  // ignore: non_constant_identifier_names
  String? facility_type;

  @JsonKey(name: "ward")
  String? ward;

  @JsonKey(name: "ownership")
  String? ownership;

  @JsonKey(name: "lga")
  String? lga;

  @JsonKey(name: "lon")
  double? lon;

  @JsonKey(name: "lat")
  double? lat;

  SingleHospitalPropertiesModel();

  factory SingleHospitalPropertiesModel.fromJson(Map<String, dynamic> json) =>
      _$SingleHospitalPropertiesModelFromJson(json);
  Map<String, dynamic> toJson() => _$SingleHospitalPropertiesModelToJson(this);
}
