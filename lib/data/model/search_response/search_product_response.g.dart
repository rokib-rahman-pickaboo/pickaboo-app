// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchProductResponseImpl _$$SearchProductResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SearchProductResponseImpl(
  productId: json['product_id'] as String?,
  originalProductId: json['original_product_id'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  link: json['link'] as String?,
  price: json['price'] as String?,
  listPrice: json['list_price'] as String?,
  quantity: json['quantity'] as String?,
  productCode: json['product_code'] as String?,
  imageLink: json['image_link'] as String?,
  totalReviews: json['total_reviews'] as String?,
  reviewsAverageScore: json['reviews_average_score'] as String?,
  urlKey: json['url_key'] as String?,
  typeId: json['type_id'] as String?,
  emiAvailable: json['emi_available'] as String?,
  expressDelivery: json['express_delivery'] as String?,
);

Map<String, dynamic> _$$SearchProductResponseImplToJson(
  _$SearchProductResponseImpl instance,
) => <String, dynamic>{
  'product_id': instance.productId,
  'original_product_id': instance.originalProductId,
  'title': instance.title,
  'description': instance.description,
  'link': instance.link,
  'price': instance.price,
  'list_price': instance.listPrice,
  'quantity': instance.quantity,
  'product_code': instance.productCode,
  'image_link': instance.imageLink,
  'total_reviews': instance.totalReviews,
  'reviews_average_score': instance.reviewsAverageScore,
  'url_key': instance.urlKey,
  'type_id': instance.typeId,
  'emi_available': instance.emiAvailable,
  'express_delivery': instance.expressDelivery,
};
