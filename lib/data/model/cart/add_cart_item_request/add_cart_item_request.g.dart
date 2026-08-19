// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cart_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddCartItemRequestImpl _$$AddCartItemRequestImplFromJson(
  Map<String, dynamic> json,
) => _$AddCartItemRequestImpl(
  cartItem: CartItem.fromJson(json['cartItem'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AddCartItemRequestImplToJson(
  _$AddCartItemRequestImpl instance,
) => <String, dynamic>{'cartItem': instance.cartItem};

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      quoteId: json['quote_id'] as String,
      sku: json['sku'] as String,
      qty: (json['qty'] as num).toInt(),
      productType: json['product_type'] as String?,
      productOption:
          json['product_option'] == null
              ? null
              : ProductOption.fromJson(
                json['product_option'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'quote_id': instance.quoteId,
      'sku': instance.sku,
      'qty': instance.qty,
      'product_type': instance.productType,
      'product_option': instance.productOption,
    };

_$ProductOptionImpl _$$ProductOptionImplFromJson(Map<String, dynamic> json) =>
    _$ProductOptionImpl(
      extensionAttributes:
          json['extension_attributes'] == null
              ? null
              : ExtensionAttributes.fromJson(
                json['extension_attributes'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$$ProductOptionImplToJson(_$ProductOptionImpl instance) =>
    <String, dynamic>{'extension_attributes': instance.extensionAttributes};

_$ExtensionAttributesImpl _$$ExtensionAttributesImplFromJson(
  Map<String, dynamic> json,
) => _$ExtensionAttributesImpl(
  configurableItemOptions:
      (json['configurable_item_options'] as List<dynamic>?)
          ?.map((e) => MOption.fromJson(e as Map<String, dynamic>))
          .toList(),
  customOptions:
      (json['custom_options'] as List<dynamic>?)
          ?.map((e) => MOption.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$ExtensionAttributesImplToJson(
  _$ExtensionAttributesImpl instance,
) => <String, dynamic>{
  'configurable_item_options': instance.configurableItemOptions,
  'custom_options': instance.customOptions,
};

_$MOptionImpl _$$MOptionImplFromJson(Map<String, dynamic> json) =>
    _$MOptionImpl(
      optionId: _anyToString(json['option_id']),
      optionValue: _anyToString(json['option_value']),
    );

Map<String, dynamic> _$$MOptionImplToJson(_$MOptionImpl instance) =>
    <String, dynamic>{
      'option_id': instance.optionId,
      'option_value': instance.optionValue,
    };
