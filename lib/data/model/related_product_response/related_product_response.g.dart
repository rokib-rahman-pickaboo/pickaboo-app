// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RelatedProductResponseImpl _$$RelatedProductResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RelatedProductResponseImpl(
  productId: (json['product_id'] as num?)?.toInt(),
  productName: json['product_name'] as String?,
  relatedProducts:
      (json['related_products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$RelatedProductResponseImplToJson(
  _$RelatedProductResponseImpl instance,
) => <String, dynamic>{
  'product_id': instance.productId,
  'product_name': instance.productName,
  'related_products': instance.relatedProducts,
};
