// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SellerProductsResponseImpl _$$SellerProductsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SellerProductsResponseImpl(
  vendorName: json['vendor_name'] as String?,
  vendorMetaKeywords: json['vendor_meta_keywords'],
  vendorMetaDescription: json['vendor_meta_description'],
  totalCount: (json['total_count'] as num?)?.toInt(),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$SellerProductsResponseImplToJson(
  _$SellerProductsResponseImpl instance,
) => <String, dynamic>{
  'vendor_name': instance.vendorName,
  'vendor_meta_keywords': instance.vendorMetaKeywords,
  'vendor_meta_description': instance.vendorMetaDescription,
  'total_count': instance.totalCount,
  'items': instance.items,
};
