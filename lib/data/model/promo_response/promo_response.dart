import 'package:freezed_annotation/freezed_annotation.dart';


part 'promo_response.freezed.dart';
part 'promo_response.g.dart';

@freezed
class PromoResponse with _$PromoResponse {
  const factory PromoResponse({
    @JsonKey(name: "is_eligible")
    bool? isEligible,
    @JsonKey(name: "message")
    String? message,
    @JsonKey(name: "coupon_code")
    String? couponCode,
  }) = _PromoResponse;

  factory PromoResponse.fromJson(Map<String, dynamic> json) => _$PromoResponseFromJson(json);
}
