// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_reviews_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReviewsResponseImpl _$$ProductReviewsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProductReviewsResponseImpl(
  totalReviews: (json['total_reviews'] as num?)?.toInt(),
  averageRating: (json['average_rating'] as num?)?.toDouble(),
  rating5Count: (json['rating5_count'] as num?)?.toInt(),
  rating4Count: (json['rating4_count'] as num?)?.toInt(),
  rating3Count: (json['rating3_count'] as num?)?.toInt(),
  rating2Count: (json['rating2_count'] as num?)?.toInt(),
  rating1Count: (json['rating1_count'] as num?)?.toInt(),
  currentPage: (json['current_page'] as num?)?.toInt(),
  pageSize: (json['page_size'] as num?)?.toInt(),
  totalPages: (json['total_pages'] as num?)?.toInt(),
  reviews:
      (json['reviews'] as List<dynamic>?)
          ?.map(
            (e) =>
                ProductReviewItemResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  ratingSummary: (json['rating_summary'] as num?)?.toInt(),
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
  reviewId: (json['review_id'] as num?)?.toInt(),
  postedOn:
      json['posted_on'] == null
          ? null
          : DateTime.parse(json['posted_on'] as String),
  reviewerName: json['reviewer_name'] as String?,
  reviewerImage: json['reviewer_image'] as String?,
  reviewerRating: (json['reviewer_rating'] as num?)?.toDouble(),
  title: json['title'] as String?,
  detail: json['detail'] as String?,
  isRecommended: json['is_recommended'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$$ProductReviewItemResponseImplToJson(
  _$ProductReviewItemResponseImpl instance,
) => <String, dynamic>{
  'review_id': instance.reviewId,
  'posted_on': instance.postedOn?.toIso8601String(),
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
  avgValue: (json['avg_value'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$ReviewDetailedRatingResponseImplToJson(
  _$ReviewDetailedRatingResponseImpl instance,
) => <String, dynamic>{
  'rating': instance.rating,
  'avg_value': instance.avgValue,
};
