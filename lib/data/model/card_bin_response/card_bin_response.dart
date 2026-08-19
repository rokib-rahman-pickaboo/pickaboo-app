import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_bin_response.freezed.dart';
part 'card_bin_response.g.dart';

@freezed
class CardBinResponse with _$CardBinResponse {
  const factory CardBinResponse({
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
    @JsonKey(name: "status_code")
    int? statusCode,
  }) = _CardBinResponse;

  factory CardBinResponse.fromJson(Map<String, dynamic> json) => _$CardBinResponseFromJson(json);
}
