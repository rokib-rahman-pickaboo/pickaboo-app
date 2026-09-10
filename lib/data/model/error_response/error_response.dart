import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/core/constants/app_strings.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

@freezed
class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  factory ErrorResponse.unknown() =>
      const ErrorResponse(success: false, message: AppStrings.somethingWentWrong);
}
