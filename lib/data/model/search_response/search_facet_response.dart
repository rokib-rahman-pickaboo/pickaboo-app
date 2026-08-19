import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_facet_response.freezed.dart';
part 'search_facet_response.g.dart';

@freezed
class SearchFacetResponse with _$SearchFacetResponse {
  const factory SearchFacetResponse({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'default_title') String? defaultTitle,
    @JsonKey(name: 'attribute') String? attribute,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'buckets') List<FacetBucketResponse>? buckets,
  }) = _SearchFacetResponse;

  factory SearchFacetResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchFacetResponseFromJson(json);
}

@freezed
class FacetBucketResponse with _$FacetBucketResponse {
  const factory FacetBucketResponse({
    @JsonKey(name: 'value') String? value,
    @JsonKey(name: 'count') int? count,
  }) = _FacetBucketResponse;

  factory FacetBucketResponse.fromJson(Map<String, dynamic> json) =>
      _$FacetBucketResponseFromJson(json);
}