import 'package:freezed_annotation/freezed_annotation.dart';

part 'area_response.freezed.dart';
part 'area_response.g.dart';

@freezed
class AreaResponse with _$AreaResponse {
  const factory AreaResponse({
    @JsonKey(name: "entity_id") String? entityId,
    @JsonKey(name: "states_name") String? statesName,
    @JsonKey(name: "cities_name") String? citiesName,
    @JsonKey(name: "zip_code") String? zipCode,
  }) = _AreaResponse;

  factory AreaResponse.fromJson(Map<String, dynamic> json) =>
      _$AreaResponseFromJson(json);
}
