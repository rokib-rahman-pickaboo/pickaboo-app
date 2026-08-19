// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionModel _$RegionModelFromJson(Map<String, dynamic> json) => RegionModel(
  regionCode: json['region_code'] as String,
  region: json['region'] as String,
  regionId: (json['region_id'] as num).toInt(),
);

Map<String, dynamic> _$RegionModelToJson(RegionModel instance) =>
    <String, dynamic>{
      'region_code': instance.regionCode,
      'region': instance.region,
      'region_id': instance.regionId,
    };
