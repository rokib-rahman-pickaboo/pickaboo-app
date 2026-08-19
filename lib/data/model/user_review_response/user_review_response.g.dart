// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserReviewResponseImpl _$$UserReviewResponseImplFromJson(
  Map<String, dynamic> json,
) => _$UserReviewResponseImpl(
  reviewId: (json['review_id'] as num?)?.toInt(),
  postedOn:
      json['posted_on'] == null
          ? null
          : DateTime.parse(json['posted_on'] as String),
  productId: (json['product_id'] as num?)?.toInt(),
  productUrlKey: json['product_url_key'] as String?,
  productName: json['product_name'] as String?,
  productImage: json['product_image'] as String?,
  reviwerRating: (json['reviwer_rating'] as num?)?.toInt(),
  title: json['title'] as String?,
  detail: json['detail'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$$UserReviewResponseImplToJson(
  _$UserReviewResponseImpl instance,
) => <String, dynamic>{
  'review_id': instance.reviewId,
  'posted_on': instance.postedOn?.toIso8601String(),
  'product_id': instance.productId,
  'product_url_key': instance.productUrlKey,
  'product_name': instance.productName,
  'product_image': instance.productImage,
  'reviwer_rating': instance.reviwerRating,
  'title': instance.title,
  'detail': instance.detail,
  'images': instance.images,
};
