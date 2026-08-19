// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShippingMethodModelImpl _$$ShippingMethodModelImplFromJson(
  Map<String, dynamic> json,
) => _$ShippingMethodModelImpl(
  carrierCode: json['carrier_code'] as String?,
  methodCode: json['method_code'] as String?,
  carrierTitle: json['carrier_title'] as String?,
  methodTitle: json['method_title'] as String?,
  amount: (json['amount'] as num?)?.toDouble(),
  baseAmount: (json['base_amount'] as num?)?.toDouble(),
  available: json['available'] as bool?,
  errorMessage: json['error_message'] as String?,
  priceExclTax: (json['price_excl_tax'] as num?)?.toDouble(),
  priceInclTax: (json['price_incl_tax'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$ShippingMethodModelImplToJson(
  _$ShippingMethodModelImpl instance,
) => <String, dynamic>{
  'carrier_code': instance.carrierCode,
  'method_code': instance.methodCode,
  'carrier_title': instance.carrierTitle,
  'method_title': instance.methodTitle,
  'amount': instance.amount,
  'base_amount': instance.baseAmount,
  'available': instance.available,
  'error_message': instance.errorMessage,
  'price_excl_tax': instance.priceExclTax,
  'price_incl_tax': instance.priceInclTax,
};
