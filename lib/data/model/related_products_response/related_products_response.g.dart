// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RelatedProductsResponseImpl _$$RelatedProductsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RelatedProductsResponseImpl(
  similarProducts:
      (json['similar_products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
  recentlyViewedProducts:
      (json['recently_viewed_products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
  youMayAlsoLike:
      (json['you_may_also_like'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$RelatedProductsResponseImplToJson(
  _$RelatedProductsResponseImpl instance,
) => <String, dynamic>{
  'similar_products': instance.similarProducts,
  'recently_viewed_products': instance.recentlyViewedProducts,
  'you_may_also_like': instance.youMayAlsoLike,
};
