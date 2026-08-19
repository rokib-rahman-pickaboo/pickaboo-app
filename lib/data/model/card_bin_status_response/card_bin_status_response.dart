import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_bin_status_response.freezed.dart';
part 'card_bin_status_response.g.dart';

@freezed
class CardBinStatusResponse with _$CardBinStatusResponse {
  const factory CardBinStatusResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "message")
    String? message,
    @JsonKey(name: "is_active")
    bool? isActive,
    @JsonKey(name: "status_code")
    int? statusCode,
  }) = _CardBinStatusResponse;

  factory CardBinStatusResponse.fromJson(Map<String, dynamic> json) => _$CardBinStatusResponseFromJson(json);
}
