import 'package:closest_hospital/models/single_hospital_properties_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_hospital_model.g.dart';

@JsonSerializable()
class SingleHospitalModel {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "geometry")
  String? geometry;

  @JsonKey(name: "properties")
  SingleHospitalPropertiesModel? properties;

  SingleHospitalModel();

  factory SingleHospitalModel.fromJson(Map<String, dynamic> json) =>
      _$SingleHospitalModelFromJson(json);
  Map<String, dynamic> toJson() => _$SingleHospitalModelToJson(this);
}
