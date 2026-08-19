import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_review_response.freezed.dart';
part 'user_review_response.g.dart';

@freezed
class UserReviewResponse with _$UserReviewResponse {
  const factory UserReviewResponse({
    @JsonKey(name: "review_id")
    int? reviewId,
    @JsonKey(name: "posted_on")
    DateTime? postedOn,
    @JsonKey(name: "product_id")
    int? productId,
    @JsonKey(name: "product_url_key")
    String? productUrlKey,
    @JsonKey(name: "product_name")
    String? productName,
    @JsonKey(name: "product_image")
    String? productImage,
    @JsonKey(name: "reviwer_rating")
    int? reviwerRating,
    @JsonKey(name: "title")
    String? title,
    @JsonKey(name: "detail")
    String? detail,
    @JsonKey(name: "images")
    List<String>? images,
  }) = _UserReviewResponse;

  factory UserReviewResponse.fromJson(Map<String, dynamic> json) => _$UserReviewResponseFromJson(json);
}
