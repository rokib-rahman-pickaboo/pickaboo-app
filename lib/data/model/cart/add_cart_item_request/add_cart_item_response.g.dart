// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cart_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddCartItemResponseImpl _$$AddCartItemResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AddCartItemResponseImpl(
  itemId: (json['item_id'] as num?)?.toInt(),
  sku: json['sku'] as String?,
  qty: (json['qty'] as num?)?.toInt(),
  name: json['name'] as String?,
  price: (json['price'] as num?)?.toInt(),
  productType: json['product_type'] as String?,
  quoteId: json['quote_id'] as String?,
  extensionAttributes:
      json['extension_attributes'] == null
          ? null
          : ExtensionAttributes.fromJson(
            json['extension_attributes'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$$AddCartItemResponseImplToJson(
  _$AddCartItemResponseImpl instance,
) => <String, dynamic>{
  'item_id': instance.itemId,
  'sku': instance.sku,
  'qty': instance.qty,
  'name': instance.name,
  'price': instance.price,
  'product_type': instance.productType,
  'quote_id': instance.quoteId,
  'extension_attributes': instance.extensionAttributes,
};

_$ExtensionAttributesImpl _$$ExtensionAttributesImplFromJson(
  Map<String, dynamic> json,
) => _$ExtensionAttributesImpl(
  cartItemsCount: (json['cart_items_count'] as num?)?.toInt(),
  cartItemsQty: (json['cart_items_qty'] as num?)?.toInt(),
  productId: (json['product_id'] as num?)?.toInt(),
  productUrlKey: json['product_url_key'] as String?,
  categoryIds:
      (json['category_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  categoryNames:
      (json['category_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  stockAvailable: json['stock_available'] as bool?,
  brandId: json['brand_id'] as String?,
  brand: json['brand'] as String?,
  imageUrl: json['image_url'] as String?,
  soldBy: json['sold_by'] as String?,
  regularPrice: (json['regular_price'] as num?)?.toInt(),
  spacialPrice: (json['spacial_price'] as num?)?.toInt(),
  discount: json['discount'] as String?,
  itemSubtotal: (json['item_subtotal'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ExtensionAttributesImplToJson(
  _$ExtensionAttributesImpl instance,
) => <String, dynamic>{
  'cart_items_count': instance.cartItemsCount,
  'cart_items_qty': instance.cartItemsQty,
  'product_id': instance.productId,
  'product_url_key': instance.productUrlKey,
  'category_ids': instance.categoryIds,
  'category_names': instance.categoryNames,
  'stock_available': instance.stockAvailable,
  'brand_id': instance.brandId,
  'brand': instance.brand,
  'image_url': instance.imageUrl,
  'sold_by': instance.soldBy,
  'regular_price': instance.regularPrice,
  'spacial_price': instance.spacialPrice,
  'discount': instance.discount,
  'item_subtotal': instance.itemSubtotal,
};
