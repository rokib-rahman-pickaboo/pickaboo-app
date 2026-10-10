// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_reviews_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReviewsResponseImpl _$$ProductReviewsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProductReviewsResponseImpl(
  totalReviews: _toIntSafe(json['total_reviews']),
  averageRating: _toDoubleSafe(json['average_rating']),
  rating5Count: _toIntSafe(json['rating5_count']),
  rating4Count: _toIntSafe(json['rating4_count']),
  rating3Count: _toIntSafe(json['rating3_count']),
  rating2Count: _toIntSafe(json['rating2_count']),
  rating1Count: _toIntSafe(json['rating1_count']),
  currentPage: _toIntSafe(json['current_page']),
  pageSize: _toIntSafe(json['page_size']),
  totalPages: _toIntSafe(json['total_pages']),
  reviews:
      (json['reviews'] as List<dynamic>?)
          ?.map(
            (e) =>
                ProductReviewItemResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  ratingSummary: _toIntSafe(json['rating_summary']),
  detailedRatings:
      (json['detailed_ratings'] as List<dynamic>?)
          ?.map(
            (e) => ReviewDetailedRatingResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
  allReviewImages:
      (json['all_review_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
);

Map<String, dynamic> _$$ProductReviewsResponseImplToJson(
  _$ProductReviewsResponseImpl instance,
) => <String, dynamic>{
  'total_reviews': instance.totalReviews,
  'average_rating': instance.averageRating,
  'rating5_count': instance.rating5Count,
  'rating4_count': instance.rating4Count,
  'rating3_count': instance.rating3Count,
  'rating2_count': instance.rating2Count,
  'rating1_count': instance.rating1Count,
  'current_page': instance.currentPage,
  'page_size': instance.pageSize,
  'total_pages': instance.totalPages,
  'reviews': instance.reviews,
  'rating_summary': instance.ratingSummary,
  'detailed_ratings': instance.detailedRatings,
  'all_review_images': instance.allReviewImages,
};

_$ProductReviewItemResponseImpl _$$ProductReviewItemResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProductReviewItemResponseImpl(
  reviewId: _toIntSafe(json['review_id']),
  postedOn: safeDateTimeFromJson(json['posted_on']),
  reviewerName: json['reviewer_name'] as String?,
  reviewerImage: json['reviewer_image'] as String?,
  reviewerRating: _toDoubleSafe(json['reviewer_rating']),
  title: json['title'] as String?,
  detail: json['detail'] as String?,
  isRecommended: json['is_recommended'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$$ProductReviewItemResponseImplToJson(
  _$ProductReviewItemResponseImpl instance,
) => <String, dynamic>{
  'review_id': instance.reviewId,
  'posted_on': safeDateTimeToJson(instance.postedOn),
  'reviewer_name': instance.reviewerName,
  'reviewer_image': instance.reviewerImage,
  'reviewer_rating': instance.reviewerRating,
  'title': instance.title,
  'detail': instance.detail,
  'is_recommended': instance.isRecommended,
  'images': instance.images,
};

_$ReviewDetailedRatingResponseImpl _$$ReviewDetailedRatingResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ReviewDetailedRatingResponseImpl(
  rating: json['rating'] as String?,
  avgValue: _toDoubleSafe(json['avg_value']),
);

Map<String, dynamic> _$$ReviewDetailedRatingResponseImplToJson(
  _$ReviewDetailedRatingResponseImpl instance,
) => <String, dynamic>{
  'rating': instance.rating,
  'avg_value': instance.avgValue,
};
