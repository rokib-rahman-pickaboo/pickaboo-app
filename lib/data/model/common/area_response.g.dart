// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AreaResponseImpl _$$AreaResponseImplFromJson(Map<String, dynamic> json) =>
    _$AreaResponseImpl(
      entityId: json['entity_id'] as String?,
      statesName: json['states_name'] as String?,
      citiesName: json['cities_name'] as String?,
      zipCode: json['zip_code'] as String?,
    );

Map<String, dynamic> _$$AreaResponseImplToJson(_$AreaResponseImpl instance) =>
    <String, dynamic>{
      'entity_id': instance.entityId,
      'states_name': instance.statesName,
      'cities_name': instance.citiesName,
      'zip_code': instance.zipCode,
    };
