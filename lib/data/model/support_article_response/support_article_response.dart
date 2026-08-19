import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_article_response.freezed.dart';
part 'support_article_response.g.dart';

@freezed
class SupportArticleResponse with _$SupportArticleResponse {
  const factory SupportArticleResponse({
    @JsonKey(name: "article_id") String? articleId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "text") String? text,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _SupportArticleResponse;

  factory SupportArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$SupportArticleResponseFromJson(json);
}
