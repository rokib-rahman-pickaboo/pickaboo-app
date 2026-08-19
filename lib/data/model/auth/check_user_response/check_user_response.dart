import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_user_response.freezed.dart';
part 'check_user_response.g.dart';

@freezed
class CheckUserResponse with _$CheckUserResponse {
  const factory CheckUserResponse({
    required String status,
    required String message,
    @JsonKey(name: 'http_code') required int httpCode,
  }) = _CheckUserResponse;

  factory CheckUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckUserResponseFromJson(json);
}
