// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_methods_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodsResponseImpl _$$PaymentMethodsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PaymentMethodsResponseImpl(
  paymentMethods:
      (json['payment_methods'] as List<dynamic>?)
          ?.map((e) => PaymentMethodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  totals:
      json['totals'] == null
          ? null
          : CartTotals.fromJson(json['totals'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$PaymentMethodsResponseImplToJson(
  _$PaymentMethodsResponseImpl instance,
) => <String, dynamic>{
  'payment_methods': instance.paymentMethods,
  'totals': instance.totals,
};

_$PaymentMethodModelImpl _$$PaymentMethodModelImplFromJson(
  Map<String, dynamic> json,
) => _$PaymentMethodModelImpl(
  code: json['code'] as String?,
  title: json['title'] as String?,
  subtitle: json['subtitle'] as String?,
  paymentGateway: json['payment_gateway'] as String?,
);

Map<String, dynamic> _$$PaymentMethodModelImplToJson(
  _$PaymentMethodModelImpl instance,
) => <String, dynamic>{
  'code': instance.code,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'payment_gateway': instance.paymentGateway,
};
