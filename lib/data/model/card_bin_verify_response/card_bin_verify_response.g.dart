// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_bin_verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardBinVerifyResponseImpl _$$CardBinVerifyResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CardBinVerifyResponseImpl(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  couponCode: json['coupon_code'] as String?,
  discountAmount: (json['discount_amount'] as num?)?.toInt(),
  ruleName: json['rule_name'] as String?,
  isApplied: json['is_applied'] as bool?,
  binNumber: json['bin_number'] as String?,
  cardType: json['card_type'] as String?,
  bankName: json['bank_name'] as String?,
  paymentMethod: json['payment_method'] as String?,
  statusCode: (json['status_code'] as num?)?.toInt(),
);

Map<String, dynamic> _$$CardBinVerifyResponseImplToJson(
  _$CardBinVerifyResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'coupon_code': instance.couponCode,
  'discount_amount': instance.discountAmount,
  'rule_name': instance.ruleName,
  'is_applied': instance.isApplied,
  'bin_number': instance.binNumber,
  'card_type': instance.cardType,
  'bank_name': instance.bankName,
  'payment_method': instance.paymentMethod,
  'status_code': instance.statusCode,
};
