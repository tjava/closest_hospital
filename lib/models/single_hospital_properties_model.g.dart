// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_hospital_properties_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleHospitalPropertiesModel _$SingleHospitalPropertiesModelFromJson(
        Map<String, dynamic> json) =>
    SingleHospitalPropertiesModel()
      ..facility_name = json['facility_name'] as String?
      ..facility_type = json['facility_type'] as String?
      ..ward = json['ward'] as String?
      ..ownership = json['ownership'] as String?
      ..lga = json['lga'] as String?
      ..lon = (json['lon'] as num?)?.toDouble()
      ..lat = (json['lat'] as num?)?.toDouble();

Map<String, dynamic> _$SingleHospitalPropertiesModelToJson(
        SingleHospitalPropertiesModel instance) =>
    <String, dynamic>{
      'facility_name': instance.facility_name,
      'facility_type': instance.facility_type,
      'ward': instance.ward,
      'ownership': instance.ownership,
      'lga': instance.lga,
      'lon': instance.lon,
      'lat': instance.lat,
    };
