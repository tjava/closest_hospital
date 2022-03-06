// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_hospitals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateHospitalsModel _$StateHospitalsModelFromJson(Map<String, dynamic> json) =>
    StateHospitalsModel()
      ..type = json['type'] as String?
      ..features = (json['features'] as List<dynamic>?)
          ?.map((e) => SingleHospitalModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$StateHospitalsModelToJson(
        StateHospitalsModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'features': instance.features,
    };
