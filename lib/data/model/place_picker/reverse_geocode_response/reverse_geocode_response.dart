import 'package:freezed_annotation/freezed_annotation.dart';

part 'reverse_geocode_response.freezed.dart';
part 'reverse_geocode_response.g.dart';

class FlexibleAddressConverter
    implements JsonConverter<FlexibleAddress?, Object?> {
  const FlexibleAddressConverter();

  @override
  FlexibleAddress? fromJson(Object? json) {
    if (json == null) return null;
    if (json is String) return FlexibleAddress.string(json);
    if (json is Map<String, dynamic>) {
      return FlexibleAddress.object(ReverseGeoAddressObject.fromJson(json));
    }
    return null;
  }

  @override
  Object? toJson(FlexibleAddress? value) {
    if (value == null) return null;
    return value.when(
      object: (addr) => addr.toJson(),
      string: (val) => val,
    );
  }
}

@freezed
class ReverseGeocodeResponse with _$ReverseGeocodeResponse {
  const factory ReverseGeocodeResponse({
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'source') String? source,
    @JsonKey(name: 'company_address') String? companyAddress,

    @JsonKey(name: 'address')
    @FlexibleAddressConverter()
    FlexibleAddress? address,

    @JsonKey(name: 'full_address')
    @FlexibleAddressConverter()
    FlexibleAddress? fullAddress,

    @JsonKey(name: 'place') ReverseGeocodePlace? place,
  }) = _ReverseGeocodeResponse;

  factory ReverseGeocodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ReverseGeocodeResponseFromJson(json);
}

@freezed
class ReverseGeoAddressObject with _$ReverseGeoAddressObject {
  const factory ReverseGeoAddressObject({
    @JsonKey(name: 'place') ReverseGeocodePlace? place,
    @JsonKey(name: 'status') int? status,
  }) = _ReverseGeoAddressObject;

  factory ReverseGeoAddressObject.fromJson(Map<String, dynamic> json) =>
      _$ReverseGeoAddressObjectFromJson(json);
}

@freezed
class ReverseGeocodePlace with _$ReverseGeocodePlace {
  const factory ReverseGeocodePlace({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'distance_within_meters') int? distanceWithinMeters,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'area') String? area,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'country') String? country,
    @JsonKey(name: 'district') String? district,
    @JsonKey(name: 'sub_district') String? subDistrict,
    @JsonKey(name: 'division') String? division,

    @JsonKey(name: 'postCode') Object? postCode,
    @JsonKey(name: 'post_code') Object? postCodeSnake,
    @JsonKey(name: 'address_components')
    ReverseGeocodeAddressComponents? addressComponents,
    @JsonKey(name: 'area_components')
    ReverseGeocodeAreaComponents? areaComponents,
  }) = _ReverseGeocodePlace;

  factory ReverseGeocodePlace.fromJson(Map<String, dynamic> json) =>
      _$ReverseGeocodePlaceFromJson(json);
}

@freezed
class ReverseGeocodeAddressComponents with _$ReverseGeocodeAddressComponents {
  const factory ReverseGeocodeAddressComponents({
    @JsonKey(name: 'place_name') String? placeName,
    @JsonKey(name: 'house') String? house,
    @JsonKey(name: 'road') String? road,
  }) = _ReverseGeocodeAddressComponents;

  factory ReverseGeocodeAddressComponents.fromJson(
          Map<String, dynamic> json) =>
      _$ReverseGeocodeAddressComponentsFromJson(json);
}

@freezed
class ReverseGeocodeAreaComponents with _$ReverseGeocodeAreaComponents {
  const factory ReverseGeocodeAreaComponents({
    @JsonKey(name: 'area') String? area,
    @JsonKey(name: 'sub_area') String? subArea,
  }) = _ReverseGeocodeAreaComponents;

  factory ReverseGeocodeAreaComponents.fromJson(Map<String, dynamic> json) =>
      _$ReverseGeocodeAreaComponentsFromJson(json);
}

@freezed
class FlexibleAddress with _$FlexibleAddress {
  const FlexibleAddress._();

  const factory FlexibleAddress.object(ReverseGeoAddressObject value) =
      FlexibleAddressObject;
  const factory FlexibleAddress.string(String value) = FlexibleAddressString;

  String asDisplayString() => when(
        object: (a) {
          final p = a.place;
          for (final candidate in [
            p?.addressComponents?.placeName,
            p?.address,
            p?.area,
            p?.city,
            p?.district,
            p?.country,
          ]) {
            if (candidate != null && candidate.trim().isNotEmpty) {
              return candidate;
            }
          }
          return '(unknown address)';
        },
        string: (s) => s.trim().isEmpty ? '(unknown address)' : s,
      );
}
