// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemResponseImpl _$$CartItemResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CartItemResponseImpl(
  itemId: (json['item_id'] as num?)?.toInt(),
  sku: json['sku'] as String?,
  qty: (json['qty'] as num?)?.toInt(),
  name: json['name'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  productType: json['product_type'] as String?,
  quoteId: json['quote_id'] as String?,
  productOption:
      json['product_option'] == null
          ? null
          : ProductOptionResponse.fromJson(
            json['product_option'] as Map<String, dynamic>,
          ),
  rowTotal: (json['row_total'] as num?)?.toDouble(),
  rowTotalWithDiscount: (json['row_total_with_discount'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$CartItemResponseImplToJson(
  _$CartItemResponseImpl instance,
) => <String, dynamic>{
  'item_id': instance.itemId,
  'sku': instance.sku,
  'qty': instance.qty,
  'name': instance.name,
  'price': instance.price,
  'product_type': instance.productType,
  'quote_id': instance.quoteId,
  'product_option': instance.productOption,
  'row_total': instance.rowTotal,
  'row_total_with_discount': instance.rowTotalWithDiscount,
};
