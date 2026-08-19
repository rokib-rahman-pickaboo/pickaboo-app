import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_response.freezed.dart';
part 'content_response.g.dart';

@freezed
class ContentResponse with _$ContentResponse {
  const factory ContentResponse({
    @JsonKey(name: "page_id") String? pageId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "page_layout") String? pageLayout,
    @JsonKey(name: "meta_keywords") String? metaKeywords,
    @JsonKey(name: "meta_description") String? metaDescription,
    @JsonKey(name: "identifier") String? identifier,
    @JsonKey(name: "content_heading") String? contentHeading,
    @JsonKey(name: "content") String? content,
    @JsonKey(name: "creation_time") DateTime? creationTime,
    @JsonKey(name: "update_time") DateTime? updateTime,
    @JsonKey(name: "is_active") String? isActive,
    @JsonKey(name: "sort_order") String? sortOrder,
    @JsonKey(name: "meta_title") String? metaTitle,
  }) = _ContentResponse;

  factory ContentResponse.fromJson(Map<String, dynamic> json) =>
      _$ContentResponseFromJson(json);
}
