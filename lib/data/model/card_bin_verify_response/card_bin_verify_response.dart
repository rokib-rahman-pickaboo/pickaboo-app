import 'package:freezed_annotation/freezed_annotation.dart';


part 'card_bin_verify_response.freezed.dart';
part 'card_bin_verify_response.g.dart';

@freezed
class CardBinVerifyResponse with _$CardBinVerifyResponse {
  const factory CardBinVerifyResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "message")
    String? message,
    @JsonKey(name: "coupon_code")
    String? couponCode,
    @JsonKey(name: "discount_amount")
    int? discountAmount,
    @JsonKey(name: "rule_name")
    String? ruleName,
    @JsonKey(name: "is_applied")
    bool? isApplied,
    @JsonKey(name: "bin_number")
    String? binNumber,
    @JsonKey(name: "card_type")
    String? cardType,
    @JsonKey(name: "bank_name")
    String? bankName,
    @JsonKey(name: "payment_method")
    String? paymentMethod,
    @JsonKey(name: "status_code")
    int? statusCode,
  }) = _CardBinVerifyResponse;

  factory CardBinVerifyResponse.fromJson(Map<String, dynamic> json) => _$CardBinVerifyResponseFromJson(json);
}
