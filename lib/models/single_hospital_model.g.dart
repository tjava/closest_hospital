// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_hospital_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleHospitalModel _$SingleHospitalModelFromJson(Map<String, dynamic> json) =>
    SingleHospitalModel()
      ..id = json['id'] as int?
      ..type = json['type'] as String?
      ..geometry = json['geometry'] as String?
      ..properties = json['properties'] == null
          ? null
          : SingleHospitalPropertiesModel.fromJson(
              json['properties'] as Map<String, dynamic>);

Map<String, dynamic> _$SingleHospitalModelToJson(
        SingleHospitalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'geometry': instance.geometry,
      'properties': instance.properties,
    };
