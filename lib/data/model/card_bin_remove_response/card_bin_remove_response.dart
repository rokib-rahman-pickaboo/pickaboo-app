import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_bin_remove_response.freezed.dart';
part 'card_bin_remove_response.g.dart';

@freezed
class CardBinRemoveResponse with _$CardBinRemoveResponse {
  const factory CardBinRemoveResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "message")
    String? message,
    @JsonKey(name: "previous_coupon")
    String? previousCoupon,
    @JsonKey(name: "status_code")
    int? statusCode,
  }) = _CardBinRemoveResponse;

  factory CardBinRemoveResponse.fromJson(Map<String, dynamic> json) => _$CardBinRemoveResponseFromJson(json);
}
