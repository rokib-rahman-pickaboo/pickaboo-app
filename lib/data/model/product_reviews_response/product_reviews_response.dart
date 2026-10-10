import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/core/utils/date_time_utils.dart';

part 'product_reviews_response.freezed.dart';
part 'product_reviews_response.g.dart';

double? _toDoubleSafe(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is num) return value.toDouble();
  if (value is String) return num.tryParse(value)?.toDouble();
  return null;
}

int? _toIntSafe(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return num.tryParse(value)?.toInt();
  return null;
}

@freezed
class ProductReviewsResponse with _$ProductReviewsResponse {
  const factory ProductReviewsResponse({
    @JsonKey(name: "total_reviews", fromJson: _toIntSafe) int? totalReviews,
    @JsonKey(name: "average_rating", fromJson: _toDoubleSafe) double? averageRating,
    @JsonKey(name: "rating5_count", fromJson: _toIntSafe) int? rating5Count,
    @JsonKey(name: "rating4_count", fromJson: _toIntSafe) int? rating4Count,
    @JsonKey(name: "rating3_count", fromJson: _toIntSafe) int? rating3Count,
    @JsonKey(name: "rating2_count", fromJson: _toIntSafe) int? rating2Count,
    @JsonKey(name: "rating1_count", fromJson: _toIntSafe) int? rating1Count,
    @JsonKey(name: "current_page", fromJson: _toIntSafe) int? currentPage,
    @JsonKey(name: "page_size", fromJson: _toIntSafe) int? pageSize,
    @JsonKey(name: "total_pages", fromJson: _toIntSafe) int? totalPages,
    @JsonKey(name: "reviews") List<ProductReviewItemResponse>? reviews,
    @JsonKey(name: "rating_summary", fromJson: _toIntSafe) int? ratingSummary,
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
    @JsonKey(name: "review_id", fromJson: _toIntSafe) int? reviewId,
    @JsonKey(name: "posted_on", fromJson: safeDateTimeFromJson, toJson: safeDateTimeToJson)
    DateTime? postedOn,
    @JsonKey(name: "reviewer_name") String? reviewerName,
    @JsonKey(name: "reviewer_image") String? reviewerImage,
    @JsonKey(name: "reviewer_rating", fromJson: _toDoubleSafe) double? reviewerRating,
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
    @JsonKey(name: "avg_value", fromJson: _toDoubleSafe) double? avgValue,
  }) = _ReviewDetailedRatingResponse;

  factory ReviewDetailedRatingResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewDetailedRatingResponseFromJson(json);
}
