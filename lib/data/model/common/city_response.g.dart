// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityResponseImpl _$$CityResponseImplFromJson(Map<String, dynamic> json) =>
    _$CityResponseImpl(
      entityId: json['entity_id'] as String?,
      statesName: json['states_name'] as String?,
      citiesName: json['cities_name'] as String?,
    );

Map<String, dynamic> _$$CityResponseImplToJson(_$CityResponseImpl instance) =>
    <String, dynamic>{
      'entity_id': instance.entityId,
      'states_name': instance.statesName,
      'cities_name': instance.citiesName,
    };
