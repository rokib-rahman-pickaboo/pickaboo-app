// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reverse_geocode_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReverseGeocodeResponseImpl _$$ReverseGeocodeResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ReverseGeocodeResponseImpl(
  status: (json['status'] as num?)?.toInt(),
  source: json['source'] as String?,
  companyAddress: json['company_address'] as String?,
  address: const FlexibleAddressConverter().fromJson(json['address']),
  fullAddress: const FlexibleAddressConverter().fromJson(json['full_address']),
  place:
      json['place'] == null
          ? null
          : ReverseGeocodePlace.fromJson(json['place'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ReverseGeocodeResponseImplToJson(
  _$ReverseGeocodeResponseImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'source': instance.source,
  'company_address': instance.companyAddress,
  'address': const FlexibleAddressConverter().toJson(instance.address),
  'full_address': const FlexibleAddressConverter().toJson(instance.fullAddress),
  'place': instance.place,
};

_$ReverseGeoAddressObjectImpl _$$ReverseGeoAddressObjectImplFromJson(
  Map<String, dynamic> json,
) => _$ReverseGeoAddressObjectImpl(
  place:
      json['place'] == null
          ? null
          : ReverseGeocodePlace.fromJson(json['place'] as Map<String, dynamic>),
  status: (json['status'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ReverseGeoAddressObjectImplToJson(
  _$ReverseGeoAddressObjectImpl instance,
) => <String, dynamic>{'place': instance.place, 'status': instance.status};

_$ReverseGeocodePlaceImpl _$$ReverseGeocodePlaceImplFromJson(
  Map<String, dynamic> json,
) => _$ReverseGeocodePlaceImpl(
  id: (json['id'] as num?)?.toInt(),
  distanceWithinMeters: (json['distance_within_meters'] as num?)?.toInt(),
  address: json['address'] as String?,
  area: json['area'] as String?,
  city: json['city'] as String?,
  country: json['country'] as String?,
  district: json['district'] as String?,
  subDistrict: json['sub_district'] as String?,
  division: json['division'] as String?,
  postCode: json['postCode'],
  postCodeSnake: json['post_code'],
  addressComponents:
      json['address_components'] == null
          ? null
          : ReverseGeocodeAddressComponents.fromJson(
            json['address_components'] as Map<String, dynamic>,
          ),
  areaComponents:
      json['area_components'] == null
          ? null
          : ReverseGeocodeAreaComponents.fromJson(
            json['area_components'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$$ReverseGeocodePlaceImplToJson(
  _$ReverseGeocodePlaceImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'distance_within_meters': instance.distanceWithinMeters,
  'address': instance.address,
  'area': instance.area,
  'city': instance.city,
  'country': instance.country,
  'district': instance.district,
  'sub_district': instance.subDistrict,
  'division': instance.division,
  'postCode': instance.postCode,
  'post_code': instance.postCodeSnake,
  'address_components': instance.addressComponents,
  'area_components': instance.areaComponents,
};

_$ReverseGeocodeAddressComponentsImpl
_$$ReverseGeocodeAddressComponentsImplFromJson(Map<String, dynamic> json) =>
    _$ReverseGeocodeAddressComponentsImpl(
      placeName: json['place_name'] as String?,
      house: json['house'] as String?,
      road: json['road'] as String?,
    );

Map<String, dynamic> _$$ReverseGeocodeAddressComponentsImplToJson(
  _$ReverseGeocodeAddressComponentsImpl instance,
) => <String, dynamic>{
  'place_name': instance.placeName,
  'house': instance.house,
  'road': instance.road,
};

_$ReverseGeocodeAreaComponentsImpl _$$ReverseGeocodeAreaComponentsImplFromJson(
  Map<String, dynamic> json,
) => _$ReverseGeocodeAreaComponentsImpl(
  area: json['area'] as String?,
  subArea: json['sub_area'] as String?,
);

Map<String, dynamic> _$$ReverseGeocodeAreaComponentsImplToJson(
  _$ReverseGeocodeAreaComponentsImpl instance,
) => <String, dynamic>{'area': instance.area, 'sub_area': instance.subArea};
