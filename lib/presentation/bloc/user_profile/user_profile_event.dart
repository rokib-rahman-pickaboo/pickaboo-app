import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_event.freezed.dart';

@freezed
class UserProfileEvent with _$UserProfileEvent {
  const factory UserProfileEvent.started() = _Started;
  const factory UserProfileEvent.loadUserProfile() = _LoadUserProfile;
  const factory UserProfileEvent.updateBasicInfo({
    required String firstName,
    required String lastName,
    required String gender,
    required String dob,
  }) = _UpdateBasicInfo;
  const factory UserProfileEvent.sendPhoneUpdateOtp(String mobileNumber) =
      _SendPhoneUpdateOtp;
  const factory UserProfileEvent.updateMobile({
    required String newMobile,
    required String otp,
  }) = _UpdateMobile;
  const factory UserProfileEvent.uploadProfileImage({required File image}) =
      _UploadProfileImage;
  const factory UserProfileEvent.sendEmailUpdateOtp(String email) =
      _SendEmailUpdateOtp;
  const factory UserProfileEvent.updateEmail({
    required String newEmail,
    required String otp,
  }) = _UpdateEmail;
  const factory UserProfileEvent.changePassword({
    required String currentPassword,
    required String newPassword,
  }) = _ChangePassword;
  const factory UserProfileEvent.addAddress({
    required Map<String, dynamic> address,
  }) = _AddAddress;
  const factory UserProfileEvent.updateAddress({
    required Map<String, dynamic> address,
  }) = _UpdateAddress;
  const factory UserProfileEvent.deleteAddress({required int addressId}) =
      _DeleteAddress;
  const factory UserProfileEvent.clear() = _Clear;
}
