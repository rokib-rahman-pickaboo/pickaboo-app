import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_status_response.freezed.dart';
part 'customer_status_response.g.dart';

@freezed
class CustomerStatusResponse with _$CustomerStatusResponse {
  const factory CustomerStatusResponse({
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "http_code") int? httpCode,
  }) = _CustomerStatusResponse;

  factory CustomerStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerStatusResponseFromJson(json);
}
