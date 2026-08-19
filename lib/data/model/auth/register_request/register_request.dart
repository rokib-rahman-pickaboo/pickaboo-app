import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request.freezed.dart';
part 'register_request.g.dart';

@freezed
class CustomerData with _$CustomerData {
  const factory CustomerData({
    required String email,
    required String firstname,
    required String lastname,
    @JsonKey(name: 'store_id') @Default(0) int storeId,
    @JsonKey(name: 'website_id') @Default(0) int websiteId,
    @JsonKey(name: 'disable_auto_group_change')
    @Default(0)
    int disableAutoGroupChange,
  }) = _CustomerData;

  factory CustomerData.fromJson(Map<String, dynamic> json) =>
      _$CustomerDataFromJson(json);
}

@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required CustomerData customer,
    required String password,
    required String mobile,
    required String otp,
    @JsonKey(name: 'referral_code') @Default('') String referralCode,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}
