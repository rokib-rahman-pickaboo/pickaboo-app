import 'package:freezed_annotation/freezed_annotation.dart';

part 'cms_block_response.freezed.dart';
part 'cms_block_response.g.dart';

@freezed
class CmsBlockResponse with _$CmsBlockResponse {
  const factory CmsBlockResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "identifier") String? identifier,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "content") String? content,
    @JsonKey(name: "active") bool? active,
    @JsonKey(name: "creation_time") String? creationTime,
    @JsonKey(name: "update_time") String? updateTime,
  }) = _CmsBlockResponse;

  factory CmsBlockResponse.fromJson(Map<String, dynamic> json) =>
      _$CmsBlockResponseFromJson(json);
}
