import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_emi_response.freezed.dart';
part 'checkout_emi_response.g.dart';

@freezed
class CheckoutEmiResponse with _$CheckoutEmiResponse {
  const factory CheckoutEmiResponse({
    @JsonKey(name: 'bank_emi_data') List<BankEmiDataModel>? bankEmiData,
    @JsonKey(name: 'quote_shipping_cost') String? quoteShippingCost,
    @JsonKey(name: 'quote_billing_city') String? quoteBillingCity,
  }) = _CheckoutEmiResponse;

  factory CheckoutEmiResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckoutEmiResponseFromJson(json);
}

@freezed
class BankEmiDataModel with _$BankEmiDataModel {
  const factory BankEmiDataModel({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'payment_getway') String? paymentGateway,
    @JsonKey(name: 'emi_tenures') List<EmiTenureDetailModel>? emiTenures,
    @JsonKey(name: 'cemi_tenures') List<CemiTenureDetailModel>? cemiTenures,
  }) = _BankEmiDataModel;

  factory BankEmiDataModel.fromJson(Map<String, dynamic> json) =>
      _$BankEmiDataModelFromJson(json);
}

@freezed
class EmiTenureDetailModel with _$EmiTenureDetailModel {
  const factory EmiTenureDetailModel({
    @JsonKey(name: 'tenure') int? tenure,
    @JsonKey(name: 'price') dynamic price,
    @JsonKey(name: 'convenience_fee') String? convenienceFee,
    @JsonKey(name: 'convenience_price') String? conveniencePrice,
    @JsonKey(name: 'cconvenience_fee') String? cConvenienceFee,
    @JsonKey(name: 'cconvenience_price') String? cConveniencePrice,
    @JsonKey(name: 'monthly_payable') String? monthlyPayable,
    @JsonKey(name: 'total') String? total,
    @JsonKey(name: 'isSelected') @Default(false) bool isSelected,
  }) = _EmiTenureDetailModel;

  factory EmiTenureDetailModel.fromJson(Map<String, dynamic> json) =>
      _$EmiTenureDetailModelFromJson(json);
}

@freezed
class CemiTenureDetailModel with _$CemiTenureDetailModel {
  const factory CemiTenureDetailModel({
    @JsonKey(name: 'tenure') int? tenure,
    @JsonKey(name: 'price') dynamic price,
    @JsonKey(name: 'cconvenience_fee') String? cConvenienceFee,
    @JsonKey(name: 'cconvenience_price') String? cConveniencePrice,
    @JsonKey(name: 'monthly_payable') String? monthlyPayable,
    @JsonKey(name: 'total') String? total,
    @JsonKey(name: 'isSelected') @Default(false) bool isSelected,
  }) = _CemiTenureDetailModel;

  factory CemiTenureDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CemiTenureDetailModelFromJson(json);
}
