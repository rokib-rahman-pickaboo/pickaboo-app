// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommended_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecommendedProductResponseImpl _$$RecommendedProductResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RecommendedProductResponseImpl(
  productId: (json['product_id'] as num?)?.toInt(),
  productName: json['product_name'] as String?,
  sellerRecommendedProducts:
      (json['seller_recommended_products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$RecommendedProductResponseImplToJson(
  _$RecommendedProductResponseImpl instance,
) => <String, dynamic>{
  'product_id': instance.productId,
  'product_name': instance.productName,
  'seller_recommended_products': instance.sellerRecommendedProducts,
};
