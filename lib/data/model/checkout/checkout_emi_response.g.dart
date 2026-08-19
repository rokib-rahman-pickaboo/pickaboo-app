// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_emi_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckoutEmiResponseImpl _$$CheckoutEmiResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CheckoutEmiResponseImpl(
  bankEmiData:
      (json['bank_emi_data'] as List<dynamic>?)
          ?.map((e) => BankEmiDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  quoteShippingCost: json['quote_shipping_cost'] as String?,
  quoteBillingCity: json['quote_billing_city'] as String?,
);

Map<String, dynamic> _$$CheckoutEmiResponseImplToJson(
  _$CheckoutEmiResponseImpl instance,
) => <String, dynamic>{
  'bank_emi_data': instance.bankEmiData,
  'quote_shipping_cost': instance.quoteShippingCost,
  'quote_billing_city': instance.quoteBillingCity,
};

_$BankEmiDataModelImpl _$$BankEmiDataModelImplFromJson(
  Map<String, dynamic> json,
) => _$BankEmiDataModelImpl(
  name: json['name'] as String?,
  paymentGateway: json['payment_getway'] as String?,
  emiTenures:
      (json['emi_tenures'] as List<dynamic>?)
          ?.map((e) => EmiTenureDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  cemiTenures:
      (json['cemi_tenures'] as List<dynamic>?)
          ?.map(
            (e) => CemiTenureDetailModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$$BankEmiDataModelImplToJson(
  _$BankEmiDataModelImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'payment_getway': instance.paymentGateway,
  'emi_tenures': instance.emiTenures,
  'cemi_tenures': instance.cemiTenures,
};

_$EmiTenureDetailModelImpl _$$EmiTenureDetailModelImplFromJson(
  Map<String, dynamic> json,
) => _$EmiTenureDetailModelImpl(
  tenure: (json['tenure'] as num?)?.toInt(),
  price: json['price'],
  convenienceFee: json['convenience_fee'] as String?,
  conveniencePrice: json['convenience_price'] as String?,
  cConvenienceFee: json['cconvenience_fee'] as String?,
  cConveniencePrice: json['cconvenience_price'] as String?,
  monthlyPayable: json['monthly_payable'] as String?,
  total: json['total'] as String?,
  isSelected: json['isSelected'] as bool? ?? false,
);

Map<String, dynamic> _$$EmiTenureDetailModelImplToJson(
  _$EmiTenureDetailModelImpl instance,
) => <String, dynamic>{
  'tenure': instance.tenure,
  'price': instance.price,
  'convenience_fee': instance.convenienceFee,
  'convenience_price': instance.conveniencePrice,
  'cconvenience_fee': instance.cConvenienceFee,
  'cconvenience_price': instance.cConveniencePrice,
  'monthly_payable': instance.monthlyPayable,
  'total': instance.total,
  'isSelected': instance.isSelected,
};

_$CemiTenureDetailModelImpl _$$CemiTenureDetailModelImplFromJson(
  Map<String, dynamic> json,
) => _$CemiTenureDetailModelImpl(
  tenure: (json['tenure'] as num?)?.toInt(),
  price: json['price'],
  cConvenienceFee: json['cconvenience_fee'] as String?,
  cConveniencePrice: json['cconvenience_price'] as String?,
  monthlyPayable: json['monthly_payable'] as String?,
  total: json['total'] as String?,
  isSelected: json['isSelected'] as bool? ?? false,
);

Map<String, dynamic> _$$CemiTenureDetailModelImplToJson(
  _$CemiTenureDetailModelImpl instance,
) => <String, dynamic>{
  'tenure': instance.tenure,
  'price': instance.price,
  'cconvenience_fee': instance.cConvenienceFee,
  'cconvenience_price': instance.cConveniencePrice,
  'monthly_payable': instance.monthlyPayable,
  'total': instance.total,
  'isSelected': instance.isSelected,
};
