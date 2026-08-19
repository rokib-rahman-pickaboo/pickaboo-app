// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_autocomplete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceAutocompleteResponseImpl _$$PlaceAutocompleteResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PlaceAutocompleteResponseImpl(
  places:
      (json['places'] as List<dynamic>?)
          ?.map(
            (e) => AutocompletePlaceModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  status: (json['status'] as num?)?.toInt(),
);

Map<String, dynamic> _$$PlaceAutocompleteResponseImplToJson(
  _$PlaceAutocompleteResponseImpl instance,
) => <String, dynamic>{'places': instance.places, 'status': instance.status};

_$AutocompletePlaceModelImpl _$$AutocompletePlaceModelImplFromJson(
  Map<String, dynamic> json,
) => _$AutocompletePlaceModelImpl(
  id: (json['id'] as num?)?.toInt(),
  longitude: json['longitude'] as String?,
  latitude: json['latitude'] as String?,
  address: json['address'] as String?,
  city: json['city'] as String?,
  area: json['area'] as String?,
  postCode: (json['postCode'] as num?)?.toInt(),
  pType: json['pType'] as String?,
  subType: json['subType'] as String?,
  district: json['district'] as String?,
  uCode: json['uCode'] as String?,
  subArea: json['sub_area'] as String?,
  subDistrict: json['sub_district'] as String?,
);

Map<String, dynamic> _$$AutocompletePlaceModelImplToJson(
  _$AutocompletePlaceModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
  'address': instance.address,
  'city': instance.city,
  'area': instance.area,
  'postCode': instance.postCode,
  'pType': instance.pType,
  'subType': instance.subType,
  'district': instance.district,
  'uCode': instance.uCode,
  'sub_area': instance.subArea,
  'sub_district': instance.subDistrict,
};
