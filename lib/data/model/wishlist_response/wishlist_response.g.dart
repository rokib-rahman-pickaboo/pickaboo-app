// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WishlistResponseImpl _$$WishlistResponseImplFromJson(
  Map<String, dynamic> json,
) => _$WishlistResponseImpl(
  wishlistItemId: json['wishlist_item_id'] as String?,
  wishlistId: json['wishlist_id'] as String?,
  productId: json['product_id'] as String?,
  productUrlKey: json['product_url_key'] as String?,
  productName: json['product_name'] as String?,
  productType: json['product_type'] as String?,
  sku: json['sku'] as String?,
  storeId: json['store_id'] as String?,
  addedAt:
      json['added_at'] == null
          ? null
          : DateTime.parse(json['added_at'] as String),
  image: json['image'] as String?,
  description: json['description'],
  varient:
      (json['varient'] as List<dynamic>?)
          ?.map((e) => Varient.fromJson(e as Map<String, dynamic>))
          .toList(),
  soldBy: json['sold_by'] as String?,
  regularPrice: (json['regular_price'] as num?)?.toInt(),
  specialPrice: (json['special_price'] as num?)?.toInt(),
  discount: (json['discount'] as num?)?.toInt(),
  isAvailable: json['is_available'] as bool?,
  shareUrl: json['share_url'] as String?,
);

Map<String, dynamic> _$$WishlistResponseImplToJson(
  _$WishlistResponseImpl instance,
) => <String, dynamic>{
  'wishlist_item_id': instance.wishlistItemId,
  'wishlist_id': instance.wishlistId,
  'product_id': instance.productId,
  'product_url_key': instance.productUrlKey,
  'product_name': instance.productName,
  'product_type': instance.productType,
  'sku': instance.sku,
  'store_id': instance.storeId,
  'added_at': instance.addedAt?.toIso8601String(),
  'image': instance.image,
  'description': instance.description,
  'varient': instance.varient,
  'sold_by': instance.soldBy,
  'regular_price': instance.regularPrice,
  'special_price': instance.specialPrice,
  'discount': instance.discount,
  'is_available': instance.isAvailable,
  'share_url': instance.shareUrl,
};

_$VarientImpl _$$VarientImplFromJson(Map<String, dynamic> json) =>
    _$VarientImpl(
      optionId: json['option_id'] as String?,
      optionName: json['option_name'] as String?,
      options:
          (json['options'] as List<dynamic>?)
              ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$VarientImplToJson(_$VarientImpl instance) =>
    <String, dynamic>{
      'option_id': instance.optionId,
      'option_name': instance.optionName,
      'options': instance.options,
    };

_$OptionImpl _$$OptionImplFromJson(Map<String, dynamic> json) => _$OptionImpl(
  optionValue: json['option_value'] as String?,
  optionText: json['option_text'] as String?,
);

Map<String, dynamic> _$$OptionImplToJson(_$OptionImpl instance) =>
    <String, dynamic>{
      'option_value': instance.optionValue,
      'option_text': instance.optionText,
    };
