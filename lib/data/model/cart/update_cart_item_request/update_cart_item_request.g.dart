// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateCartItemRequestImpl _$$UpdateCartItemRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateCartItemRequestImpl(
  cartItem: CartItemUpdateRequest.fromJson(
    json['cartItem'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$UpdateCartItemRequestImplToJson(
  _$UpdateCartItemRequestImpl instance,
) => <String, dynamic>{'cartItem': instance.cartItem};

_$CartItemUpdateRequestImpl _$$CartItemUpdateRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CartItemUpdateRequestImpl(
  itemId: (json['item_id'] as num).toInt(),
  qty: (json['qty'] as num).toInt(),
  quoteId: json['quote_id'] as String,
);

Map<String, dynamic> _$$CartItemUpdateRequestImplToJson(
  _$CartItemUpdateRequestImpl instance,
) => <String, dynamic>{
  'item_id': instance.itemId,
  'qty': instance.qty,
  'quote_id': instance.quoteId,
};
