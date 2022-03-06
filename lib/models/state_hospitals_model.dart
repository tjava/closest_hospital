import 'package:closest_hospital/models/single_hospital_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state_hospitals_model.g.dart';

@JsonSerializable()
class StateHospitalsModel {
  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "features")
  List<SingleHospitalModel>? features;

  StateHospitalsModel();

  factory StateHospitalsModel.fromJson(Map<String, dynamic> json) =>
      _$StateHospitalsModelFromJson(json);
  Map<String, dynamic> toJson() => _$StateHospitalsModelToJson(this);
}
