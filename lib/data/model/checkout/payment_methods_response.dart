import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/data/model/cart/checkout_response/checkout_response.dart';

part 'payment_methods_response.freezed.dart';
part 'payment_methods_response.g.dart';

@freezed
class PaymentMethodsResponse with _$PaymentMethodsResponse {
  const factory PaymentMethodsResponse({
    @JsonKey(name: "payment_methods") List<PaymentMethodModel>? paymentMethods,
    @JsonKey(name: "totals") CartTotals? totals,
  }) = _PaymentMethodsResponse;

  factory PaymentMethodsResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodsResponseFromJson(json);
}

@freezed
class PaymentMethodModel with _$PaymentMethodModel {
  const factory PaymentMethodModel({
    @JsonKey(name: "code")
    String? code,
    @JsonKey(name: "title")
    String? title,
    @JsonKey(name: "subtitle")
    String? subtitle,
    @JsonKey(name: "payment_gateway")
    String? paymentGateway,
  }) = _PaymentMethodModel;

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodModelFromJson(json);
}
