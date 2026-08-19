import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_autocomplete_response.freezed.dart';
part 'place_autocomplete_response.g.dart';

@freezed
class PlaceAutocompleteResponse with _$PlaceAutocompleteResponse {
  const factory PlaceAutocompleteResponse({
    @JsonKey(name: 'places') List<AutocompletePlaceModel>? places,
    @JsonKey(name: 'status') int? status,
  }) = _PlaceAutocompleteResponse;

  factory PlaceAutocompleteResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceAutocompleteResponseFromJson(json);
}

@freezed
class AutocompletePlaceModel with _$AutocompletePlaceModel {
  const factory AutocompletePlaceModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'longitude') String? longitude,
    @JsonKey(name: 'latitude') String? latitude,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'area') String? area,
    @JsonKey(name: 'postCode') int? postCode,
    @JsonKey(name: 'pType') String? pType,
    @JsonKey(name: 'subType') String? subType,
    @JsonKey(name: 'district') String? district,
    @JsonKey(name: 'uCode') String? uCode,
    @JsonKey(name: 'sub_area') String? subArea,
    @JsonKey(name: 'sub_district') String? subDistrict,
  }) = _AutocompletePlaceModel;

  factory AutocompletePlaceModel.fromJson(Map<String, dynamic> json) =>
      _$AutocompletePlaceModelFromJson(json);
}
