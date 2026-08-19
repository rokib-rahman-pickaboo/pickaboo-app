import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_method_model.freezed.dart';
part 'shipping_method_model.g.dart';

@freezed
class ShippingMethodModel with _$ShippingMethodModel {
  const factory ShippingMethodModel({
    @JsonKey(name: "carrier_code") String? carrierCode,
    @JsonKey(name: "method_code") String? methodCode,
    @JsonKey(name: "carrier_title") String? carrierTitle,
    @JsonKey(name: "method_title") String? methodTitle,
    @JsonKey(name: "amount") double? amount,
    @JsonKey(name: "base_amount") double? baseAmount,
    @JsonKey(name: "available") bool? available,
    @JsonKey(name: "error_message") String? errorMessage,
    @JsonKey(name: "price_excl_tax") double? priceExclTax,
    @JsonKey(name: "price_incl_tax") double? priceInclTax,
  }) = _ShippingMethodModel;

  factory ShippingMethodModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingMethodModelFromJson(json);
}
