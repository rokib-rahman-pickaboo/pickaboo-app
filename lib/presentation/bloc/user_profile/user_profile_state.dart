import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/domain/entity/auth/user_entity.dart';

part 'user_profile_state.freezed.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState.initial() = _Initial;
  const factory UserProfileState.loading({
    UserEntity? currentUser,
    String? imageUrl,
    String? mobileNumber,
  }) = _Loading;
  const factory UserProfileState.loaded({
    required UserEntity user,
    String? imageUrl,
    String? mobileNumber,
  }) = _Loaded;
  const factory UserProfileState.updating({
    required UserEntity currentUser,
    String? imageUrl,
    String? mobileNumber,
  }) = _Updating;
  const factory UserProfileState.basicInfoUpdateSuccess({
    required String message,
    required UserEntity user,
    String? imageUrl,
    String? mobileNumber,
  }) = _BasicInfoUpdateSuccess;
  const factory UserProfileState.mobileUpdateSuccess({
    required String message,
    required UserEntity user,
    String? imageUrl,
    String? mobileNumber,
  }) = _MobileUpdateSuccess;
  const factory UserProfileState.imageUploadSuccess({
    required String message,
    required UserEntity user,
    String? imageUrl,
    String? mobileNumber,
  }) = _ImageUploadSuccess;
  const factory UserProfileState.updateRequiresLogout(String message) =
      _UpdateRequiresLogout;
  const factory UserProfileState.phoneUpdateOtpSent({
    required String mobileNumber,
    required UserEntity user,
    String? imageUrl,
  }) = _PhoneUpdateOtpSent;
  const factory UserProfileState.emailUpdateOtpSent({
    required String email,
    required UserEntity user,
    String? imageUrl,
    String? mobileNumber,
  }) = _EmailUpdateOtpSent;
  const factory UserProfileState.emailUpdateSuccess({
    required String message,
    required UserEntity user,
    String? imageUrl,
    String? mobileNumber,
  }) = _EmailUpdateSuccess;
  const factory UserProfileState.error(String message) = _Error;
}
