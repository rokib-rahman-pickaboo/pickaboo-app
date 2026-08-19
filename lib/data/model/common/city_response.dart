import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_response.freezed.dart';
part 'city_response.g.dart';

@freezed
class CityResponse with _$CityResponse {
  const factory CityResponse({
    @JsonKey(name: "entity_id") String? entityId,
    @JsonKey(name: "states_name") String? statesName,
    @JsonKey(name: "cities_name") String? citiesName,
  }) = _CityResponse;

  factory CityResponse.fromJson(Map<String, dynamic> json) =>
      _$CityResponseFromJson(json);
}
