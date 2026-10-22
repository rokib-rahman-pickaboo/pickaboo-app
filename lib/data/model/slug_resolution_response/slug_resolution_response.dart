import 'package:freezed_annotation/freezed_annotation.dart';

part 'slug_resolution_response.freezed.dart';
part 'slug_resolution_response.g.dart';

String? _stringFromJson(dynamic value) => value?.toString();

@freezed
class SlugResolutionResponse with _$SlugResolutionResponse {
  const factory SlugResolutionResponse({
    @JsonKey(name: 'prodId', fromJson: _stringFromJson) String? prodId,
    @JsonKey(name: 'exec_time', fromJson: _stringFromJson) String? execTime,
  }) = _SlugResolutionResponse;

  factory SlugResolutionResponse.fromJson(Map<String, dynamic> json) =>
      _$SlugResolutionResponseFromJson(json);
}
