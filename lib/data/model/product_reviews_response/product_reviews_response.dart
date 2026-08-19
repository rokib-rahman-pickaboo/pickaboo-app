import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_reviews_response.freezed.dart';
part 'product_reviews_response.g.dart';

@freezed
class ProductReviewsResponse with _$ProductReviewsResponse {
  const factory ProductReviewsResponse({
    @JsonKey(name: "total_reviews") int? totalReviews,
    @JsonKey(name: "average_rating") double? averageRating,
    @JsonKey(name: "rating5_count") int? rating5Count,
    @JsonKey(name: "rating4_count") int? rating4Count,
    @JsonKey(name: "rating3_count") int? rating3Count,
    @JsonKey(name: "rating2_count") int? rating2Count,
    @JsonKey(name: "rating1_count") int? rating1Count,
    @JsonKey(name: "current_page") int? currentPage,
    @JsonKey(name: "page_size") int? pageSize,
    @JsonKey(name: "total_pages") int? totalPages,
    @JsonKey(name: "reviews") List<ProductReviewItemResponse>? reviews,
    @JsonKey(name: "rating_summary") int? ratingSummary,
    @JsonKey(name: "detailed_ratings")
    List<ReviewDetailedRatingResponse>? detailedRatings,
    @JsonKey(name: "all_review_images") List<String>? allReviewImages,
  }) = _ProductReviewsResponse;

  factory ProductReviewsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewsResponseFromJson(json);
}

@freezed
class ProductReviewItemResponse with _$ProductReviewItemResponse {
  const factory ProductReviewItemResponse({
    @JsonKey(name: "review_id") int? reviewId,
    @JsonKey(name: "posted_on") DateTime? postedOn,
    @JsonKey(name: "reviewer_name") String? reviewerName,
    @JsonKey(name: "reviewer_image") String? reviewerImage,
    @JsonKey(name: "reviewer_rating") double? reviewerRating,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "detail") String? detail,
    @JsonKey(name: "is_recommended") String? isRecommended,
    @JsonKey(name: "images") List<String>? images,
  }) = _ProductReviewItemResponse;

  factory ProductReviewItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewItemResponseFromJson(json);
}

@freezed
class ReviewDetailedRatingResponse with _$ReviewDetailedRatingResponse {
  const factory ReviewDetailedRatingResponse({
    @JsonKey(name: "rating") String? rating,
    @JsonKey(name: "avg_value") double? avgValue,
  }) = _ReviewDetailedRatingResponse;

  factory ReviewDetailedRatingResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewDetailedRatingResponseFromJson(json);
}
