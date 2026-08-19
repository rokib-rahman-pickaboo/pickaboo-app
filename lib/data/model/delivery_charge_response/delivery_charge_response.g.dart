// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_charge_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryChargeResponseImpl _$$DeliveryChargeResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DeliveryChargeResponseImpl(
  productId: (json['product_id'] as num?)?.toInt(),
  sku: json['sku'] as String?,
  slug: json['slug'] as String?,
  name: json['name'] as String?,
  qty: (json['qty'] as num?)?.toInt(),
  insideCharge: (json['inside_charge'] as num?)?.toInt(),
  outsideCharge: (json['outside_charge'] as num?)?.toInt(),
);

Map<String, dynamic> _$$DeliveryChargeResponseImplToJson(
  _$DeliveryChargeResponseImpl instance,
) => <String, dynamic>{
  'product_id': instance.productId,
  'sku': instance.sku,
  'slug': instance.slug,
  'name': instance.name,
  'qty': instance.qty,
  'inside_charge': instance.insideCharge,
  'outside_charge': instance.outsideCharge,
};
