// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loadUserProfile,
    required TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )
    updateBasicInfo,
    required TResult Function(String mobileNumber) sendPhoneUpdateOtp,
    required TResult Function(String newMobile, String otp) updateMobile,
    required TResult Function(File image) uploadProfileImage,
    required TResult Function(String newEmail) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
    changePassword,
    required TResult Function(Map<String, dynamic> address) addAddress,
    required TResult Function(Map<String, dynamic> address) updateAddress,
    required TResult Function(int addressId) deleteAddress,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loadUserProfile,
    TResult? Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult? Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult? Function(String newMobile, String otp)? updateMobile,
    TResult? Function(File image)? uploadProfileImage,
    TResult? Function(String newEmail)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
    changePassword,
    TResult? Function(Map<String, dynamic> address)? addAddress,
    TResult? Function(Map<String, dynamic> address)? updateAddress,
    TResult? Function(int addressId)? deleteAddress,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loadUserProfile,
    TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult Function(String newMobile, String otp)? updateMobile,
    TResult Function(File image)? uploadProfileImage,
    TResult Function(String newEmail)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
    changePassword,
    TResult Function(Map<String, dynamic> address)? addAddress,
    TResult Function(Map<String, dynamic> address)? updateAddress,
    TResult Function(int addressId)? deleteAddress,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateBasicInfo value) updateBasicInfo,
    required TResult Function(_SendPhoneUpdateOtp value) sendPhoneUpdateOtp,
    required TResult Function(_UpdateMobile value) updateMobile,
    required TResult Function(_UploadProfileImage value) uploadProfileImage,
    required TResult Function(_UpdateEmail value) updateEmail,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_AddAddress value) addAddress,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult? Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult? Function(_UpdateMobile value)? updateMobile,
    TResult? Function(_UploadProfileImage value)? uploadProfileImage,
    TResult? Function(_UpdateEmail value)? updateEmail,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_AddAddress value)? addAddress,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult Function(_UpdateMobile value)? updateMobile,
    TResult Function(_UploadProfileImage value)? uploadProfileImage,
    TResult Function(_UpdateEmail value)? updateEmail,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_AddAddress value)? addAddress,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileEventCopyWith<$Res> {
  factory $UserProfileEventCopyWith(
    UserProfileEvent value,
    $Res Function(UserProfileEvent) then,
  ) = _$UserProfileEventCopyWithImpl<$Res, UserProfileEvent>;
}

/// @nodoc
class _$UserProfileEventCopyWithImpl<$Res, $Val extends UserProfileEvent>
    implements $UserProfileEventCopyWith<$Res> {
  _$UserProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
    _$StartedImpl value,
    $Res Function(_$StartedImpl) then,
  ) = __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'UserProfileEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loadUserProfile,
    required TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )
    updateBasicInfo,
    required TResult Function(String mobileNumber) sendPhoneUpdateOtp,
    required TResult Function(String newMobile, String otp) updateMobile,
    required TResult Function(File image) uploadProfileImage,
    required TResult Function(String newEmail) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
    changePassword,
    required TResult Function(Map<String, dynamic> address) addAddress,
    required TResult Function(Map<String, dynamic> address) updateAddress,
    required TResult Function(int addressId) deleteAddress,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loadUserProfile,
    TResult? Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult? Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult? Function(String newMobile, String otp)? updateMobile,
    TResult? Function(File image)? uploadProfileImage,
    TResult? Function(String newEmail)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
    changePassword,
    TResult? Function(Map<String, dynamic> address)? addAddress,
    TResult? Function(Map<String, dynamic> address)? updateAddress,
    TResult? Function(int addressId)? deleteAddress,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loadUserProfile,
    TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult Function(String newMobile, String otp)? updateMobile,
    TResult Function(File image)? uploadProfileImage,
    TResult Function(String newEmail)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
    changePassword,
    TResult Function(Map<String, dynamic> address)? addAddress,
    TResult Function(Map<String, dynamic> address)? updateAddress,
    TResult Function(int addressId)? deleteAddress,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateBasicInfo value) updateBasicInfo,
    required TResult Function(_SendPhoneUpdateOtp value) sendPhoneUpdateOtp,
    required TResult Function(_UpdateMobile value) updateMobile,
    required TResult Function(_UploadProfileImage value) uploadProfileImage,
    required TResult Function(_UpdateEmail value) updateEmail,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_AddAddress value) addAddress,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult? Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult? Function(_UpdateMobile value)? updateMobile,
    TResult? Function(_UploadProfileImage value)? uploadProfileImage,
    TResult? Function(_UpdateEmail value)? updateEmail,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_AddAddress value)? addAddress,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult Function(_UpdateMobile value)? updateMobile,
    TResult Function(_UploadProfileImage value)? uploadProfileImage,
    TResult Function(_UpdateEmail value)? updateEmail,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_AddAddress value)? addAddress,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements UserProfileEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$LoadUserProfileImplCopyWith<$Res> {
  factory _$$LoadUserProfileImplCopyWith(
    _$LoadUserProfileImpl value,
    $Res Function(_$LoadUserProfileImpl) then,
  ) = __$$LoadUserProfileImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadUserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$LoadUserProfileImpl>
    implements _$$LoadUserProfileImplCopyWith<$Res> {
  __$$LoadUserProfileImplCopyWithImpl(
    _$LoadUserProfileImpl _value,
    $Res Function(_$LoadUserProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadUserProfileImpl implements _LoadUserProfile {
  const _$LoadUserProfileImpl();

  @override
  String toString() {
    return 'UserProfileEvent.loadUserProfile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadUserProfileImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loadUserProfile,
    required TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )
    updateBasicInfo,
    required TResult Function(String mobileNumber) sendPhoneUpdateOtp,
    required TResult Function(String newMobile, String otp) updateMobile,
    required TResult Function(File image) uploadProfileImage,
    required TResult Function(String newEmail) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
    changePassword,
    required TResult Function(Map<String, dynamic> address) addAddress,
    required TResult Function(Map<String, dynamic> address) updateAddress,
    required TResult Function(int addressId) deleteAddress,
  }) {
    return loadUserProfile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loadUserProfile,
    TResult? Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult? Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult? Function(String newMobile, String otp)? updateMobile,
    TResult? Function(File image)? uploadProfileImage,
    TResult? Function(String newEmail)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
    changePassword,
    TResult? Function(Map<String, dynamic> address)? addAddress,
    TResult? Function(Map<String, dynamic> address)? updateAddress,
    TResult? Function(int addressId)? deleteAddress,
  }) {
    return loadUserProfile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loadUserProfile,
    TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult Function(String newMobile, String otp)? updateMobile,
    TResult Function(File image)? uploadProfileImage,
    TResult Function(String newEmail)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
    changePassword,
    TResult Function(Map<String, dynamic> address)? addAddress,
    TResult Function(Map<String, dynamic> address)? updateAddress,
    TResult Function(int addressId)? deleteAddress,
    required TResult orElse(),
  }) {
    if (loadUserProfile != null) {
      return loadUserProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateBasicInfo value) updateBasicInfo,
    required TResult Function(_SendPhoneUpdateOtp value) sendPhoneUpdateOtp,
    required TResult Function(_UpdateMobile value) updateMobile,
    required TResult Function(_UploadProfileImage value) uploadProfileImage,
    required TResult Function(_UpdateEmail value) updateEmail,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_AddAddress value) addAddress,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
  }) {
    return loadUserProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult? Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult? Function(_UpdateMobile value)? updateMobile,
    TResult? Function(_UploadProfileImage value)? uploadProfileImage,
    TResult? Function(_UpdateEmail value)? updateEmail,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_AddAddress value)? addAddress,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
  }) {
    return loadUserProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult Function(_UpdateMobile value)? updateMobile,
    TResult Function(_UploadProfileImage value)? uploadProfileImage,
    TResult Function(_UpdateEmail value)? updateEmail,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_AddAddress value)? addAddress,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    required TResult orElse(),
  }) {
    if (loadUserProfile != null) {
      return loadUserProfile(this);
    }
    return orElse();
  }
}

abstract class _LoadUserProfile implements UserProfileEvent {
  const factory _LoadUserProfile() = _$LoadUserProfileImpl;
}

/// @nodoc
abstract class _$$UpdateBasicInfoImplCopyWith<$Res> {
  factory _$$UpdateBasicInfoImplCopyWith(
    _$UpdateBasicInfoImpl value,
    $Res Function(_$UpdateBasicInfoImpl) then,
  ) = __$$UpdateBasicInfoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String firstName, String lastName, String gender, String dob});
}

/// @nodoc
class __$$UpdateBasicInfoImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$UpdateBasicInfoImpl>
    implements _$$UpdateBasicInfoImplCopyWith<$Res> {
  __$$UpdateBasicInfoImplCopyWithImpl(
    _$UpdateBasicInfoImpl _value,
    $Res Function(_$UpdateBasicInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? gender = null,
    Object? dob = null,
  }) {
    return _then(
      _$UpdateBasicInfoImpl(
        firstName:
            null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                    as String,
        lastName:
            null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                    as String,
        gender:
            null == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                    as String,
        dob:
            null == dob
                ? _value.dob
                : dob // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$UpdateBasicInfoImpl implements _UpdateBasicInfo {
  const _$UpdateBasicInfoImpl({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dob,
  });

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String gender;
  @override
  final String dob;

  @override
  String toString() {
    return 'UserProfileEvent.updateBasicInfo(firstName: $firstName, lastName: $lastName, gender: $gender, dob: $dob)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateBasicInfoImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, gender, dob);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateBasicInfoImplCopyWith<_$UpdateBasicInfoImpl> get copyWith =>
      __$$UpdateBasicInfoImplCopyWithImpl<_$UpdateBasicInfoImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loadUserProfile,
    required TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )
    updateBasicInfo,
    required TResult Function(String mobileNumber) sendPhoneUpdateOtp,
    required TResult Function(String newMobile, String otp) updateMobile,
    required TResult Function(File image) uploadProfileImage,
    required TResult Function(String newEmail) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
    changePassword,
    required TResult Function(Map<String, dynamic> address) addAddress,
    required TResult Function(Map<String, dynamic> address) updateAddress,
    required TResult Function(int addressId) deleteAddress,
  }) {
    return updateBasicInfo(firstName, lastName, gender, dob);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loadUserProfile,
    TResult? Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult? Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult? Function(String newMobile, String otp)? updateMobile,
    TResult? Function(File image)? uploadProfileImage,
    TResult? Function(String newEmail)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
    changePassword,
    TResult? Function(Map<String, dynamic> address)? addAddress,
    TResult? Function(Map<String, dynamic> address)? updateAddress,
    TResult? Function(int addressId)? deleteAddress,
  }) {
    return updateBasicInfo?.call(firstName, lastName, gender, dob);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loadUserProfile,
    TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult Function(String newMobile, String otp)? updateMobile,
    TResult Function(File image)? uploadProfileImage,
    TResult Function(String newEmail)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
    changePassword,
    TResult Function(Map<String, dynamic> address)? addAddress,
    TResult Function(Map<String, dynamic> address)? updateAddress,
    TResult Function(int addressId)? deleteAddress,
    required TResult orElse(),
  }) {
    if (updateBasicInfo != null) {
      return updateBasicInfo(firstName, lastName, gender, dob);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateBasicInfo value) updateBasicInfo,
    required TResult Function(_SendPhoneUpdateOtp value) sendPhoneUpdateOtp,
    required TResult Function(_UpdateMobile value) updateMobile,
    required TResult Function(_UploadProfileImage value) uploadProfileImage,
    required TResult Function(_UpdateEmail value) updateEmail,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_AddAddress value) addAddress,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
  }) {
    return updateBasicInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult? Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult? Function(_UpdateMobile value)? updateMobile,
    TResult? Function(_UploadProfileImage value)? uploadProfileImage,
    TResult? Function(_UpdateEmail value)? updateEmail,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_AddAddress value)? addAddress,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
  }) {
    return updateBasicInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult Function(_UpdateMobile value)? updateMobile,
    TResult Function(_UploadProfileImage value)? uploadProfileImage,
    TResult Function(_UpdateEmail value)? updateEmail,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_AddAddress value)? addAddress,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    required TResult orElse(),
  }) {
    if (updateBasicInfo != null) {
      return updateBasicInfo(this);
    }
    return orElse();
  }
}

abstract class _UpdateBasicInfo implements UserProfileEvent {
  const factory _UpdateBasicInfo({
    required final String firstName,
    required final String lastName,
    required final String gender,
    required final String dob,
  }) = _$UpdateBasicInfoImpl;

  String get firstName;
  String get lastName;
  String get gender;
  String get dob;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateBasicInfoImplCopyWith<_$UpdateBasicInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendPhoneUpdateOtpImplCopyWith<$Res> {
  factory _$$SendPhoneUpdateOtpImplCopyWith(
    _$SendPhoneUpdateOtpImpl value,
    $Res Function(_$SendPhoneUpdateOtpImpl) then,
  ) = __$$SendPhoneUpdateOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String mobileNumber});
}

/// @nodoc
class __$$SendPhoneUpdateOtpImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$SendPhoneUpdateOtpImpl>
    implements _$$SendPhoneUpdateOtpImplCopyWith<$Res> {
  __$$SendPhoneUpdateOtpImplCopyWithImpl(
    _$SendPhoneUpdateOtpImpl _value,
    $Res Function(_$SendPhoneUpdateOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mobileNumber = null}) {
    return _then(
      _$SendPhoneUpdateOtpImpl(
        null == mobileNumber
            ? _value.mobileNumber
            : mobileNumber // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$SendPhoneUpdateOtpImpl implements _SendPhoneUpdateOtp {
  const _$SendPhoneUpdateOtpImpl(this.mobileNumber);

  @override
  final String mobileNumber;

  @override
  String toString() {
    return 'UserProfileEvent.sendPhoneUpdateOtp(mobileNumber: $mobileNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendPhoneUpdateOtpImpl &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mobileNumber);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendPhoneUpdateOtpImplCopyWith<_$SendPhoneUpdateOtpImpl> get copyWith =>
      __$$SendPhoneUpdateOtpImplCopyWithImpl<_$SendPhoneUpdateOtpImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loadUserProfile,
    required TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )
    updateBasicInfo,
    required TResult Function(String mobileNumber) sendPhoneUpdateOtp,
    required TResult Function(String newMobile, String otp) updateMobile,
    required TResult Function(File image) uploadProfileImage,
    required TResult Function(String newEmail) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
    changePassword,
    required TResult Function(Map<String, dynamic> address) addAddress,
    required TResult Function(Map<String, dynamic> address) updateAddress,
    required TResult Function(int addressId) deleteAddress,
  }) {
    return sendPhoneUpdateOtp(mobileNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loadUserProfile,
    TResult? Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult? Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult? Function(String newMobile, String otp)? updateMobile,
    TResult? Function(File image)? uploadProfileImage,
    TResult? Function(String newEmail)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
    changePassword,
    TResult? Function(Map<String, dynamic> address)? addAddress,
    TResult? Function(Map<String, dynamic> address)? updateAddress,
    TResult? Function(int addressId)? deleteAddress,
  }) {
    return sendPhoneUpdateOtp?.call(mobileNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loadUserProfile,
    TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult Function(String newMobile, String otp)? updateMobile,
    TResult Function(File image)? uploadProfileImage,
    TResult Function(String newEmail)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
    changePassword,
    TResult Function(Map<String, dynamic> address)? addAddress,
    TResult Function(Map<String, dynamic> address)? updateAddress,
    TResult Function(int addressId)? deleteAddress,
    required TResult orElse(),
  }) {
    if (sendPhoneUpdateOtp != null) {
      return sendPhoneUpdateOtp(mobileNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateBasicInfo value) updateBasicInfo,
    required TResult Function(_SendPhoneUpdateOtp value) sendPhoneUpdateOtp,
    required TResult Function(_UpdateMobile value) updateMobile,
    required TResult Function(_UploadProfileImage value) uploadProfileImage,
    required TResult Function(_UpdateEmail value) updateEmail,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_AddAddress value) addAddress,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
  }) {
    return sendPhoneUpdateOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult? Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult? Function(_UpdateMobile value)? updateMobile,
    TResult? Function(_UploadProfileImage value)? uploadProfileImage,
    TResult? Function(_UpdateEmail value)? updateEmail,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_AddAddress value)? addAddress,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
  }) {
    return sendPhoneUpdateOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult Function(_UpdateMobile value)? updateMobile,
    TResult Function(_UploadProfileImage value)? uploadProfileImage,
    TResult Function(_UpdateEmail value)? updateEmail,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_AddAddress value)? addAddress,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    required TResult orElse(),
  }) {
    if (sendPhoneUpdateOtp != null) {
      return sendPhoneUpdateOtp(this);
    }
    return orElse();
  }
}

abstract class _SendPhoneUpdateOtp implements UserProfileEvent {
  const factory _SendPhoneUpdateOtp(final String mobileNumber) =
      _$SendPhoneUpdateOtpImpl;

  String get mobileNumber;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendPhoneUpdateOtpImplCopyWith<_$SendPhoneUpdateOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateMobileImplCopyWith<$Res> {
  factory _$$UpdateMobileImplCopyWith(
    _$UpdateMobileImpl value,
    $Res Function(_$UpdateMobileImpl) then,
  ) = __$$UpdateMobileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String newMobile, String otp});
}

/// @nodoc
class __$$UpdateMobileImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$UpdateMobileImpl>
    implements _$$UpdateMobileImplCopyWith<$Res> {
  __$$UpdateMobileImplCopyWithImpl(
    _$UpdateMobileImpl _value,
    $Res Function(_$UpdateMobileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? newMobile = null, Object? otp = null}) {
    return _then(
      _$UpdateMobileImpl(
        newMobile:
            null == newMobile
                ? _value.newMobile
                : newMobile // ignore: cast_nullable_to_non_nullable
                    as String,
        otp:
            null == otp
                ? _value.otp
                : otp // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$UpdateMobileImpl implements _UpdateMobile {
  const _$UpdateMobileImpl({required this.newMobile, required this.otp});

  @override
  final String newMobile;
  @override
  final String otp;

  @override
  String toString() {
    return 'UserProfileEvent.updateMobile(newMobile: $newMobile, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMobileImpl &&
            (identical(other.newMobile, newMobile) ||
                other.newMobile == newMobile) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newMobile, otp);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateMobileImplCopyWith<_$UpdateMobileImpl> get copyWith =>
      __$$UpdateMobileImplCopyWithImpl<_$UpdateMobileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loadUserProfile,
    required TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )
    updateBasicInfo,
    required TResult Function(String mobileNumber) sendPhoneUpdateOtp,
    required TResult Function(String newMobile, String otp) updateMobile,
    required TResult Function(File image) uploadProfileImage,
    required TResult Function(String newEmail) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
    changePassword,
    required TResult Function(Map<String, dynamic> address) addAddress,
    required TResult Function(Map<String, dynamic> address) updateAddress,
    required TResult Function(int addressId) deleteAddress,
  }) {
    return updateMobile(newMobile, otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loadUserProfile,
    TResult? Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult? Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult? Function(String newMobile, String otp)? updateMobile,
    TResult? Function(File image)? uploadProfileImage,
    TResult? Function(String newEmail)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
    changePassword,
    TResult? Function(Map<String, dynamic> address)? addAddress,
    TResult? Function(Map<String, dynamic> address)? updateAddress,
    TResult? Function(int addressId)? deleteAddress,
  }) {
    return updateMobile?.call(newMobile, otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loadUserProfile,
    TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult Function(String newMobile, String otp)? updateMobile,
    TResult Function(File image)? uploadProfileImage,
    TResult Function(String newEmail)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
    changePassword,
    TResult Function(Map<String, dynamic> address)? addAddress,
    TResult Function(Map<String, dynamic> address)? updateAddress,
    TResult Function(int addressId)? deleteAddress,
    required TResult orElse(),
  }) {
    if (updateMobile != null) {
      return updateMobile(newMobile, otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateBasicInfo value) updateBasicInfo,
    required TResult Function(_SendPhoneUpdateOtp value) sendPhoneUpdateOtp,
    required TResult Function(_UpdateMobile value) updateMobile,
    required TResult Function(_UploadProfileImage value) uploadProfileImage,
    required TResult Function(_UpdateEmail value) updateEmail,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_AddAddress value) addAddress,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
  }) {
    return updateMobile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult? Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult? Function(_UpdateMobile value)? updateMobile,
    TResult? Function(_UploadProfileImage value)? uploadProfileImage,
    TResult? Function(_UpdateEmail value)? updateEmail,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_AddAddress value)? addAddress,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
  }) {
    return updateMobile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult Function(_UpdateMobile value)? updateMobile,
    TResult Function(_UploadProfileImage value)? uploadProfileImage,
    TResult Function(_UpdateEmail value)? updateEmail,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_AddAddress value)? addAddress,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    required TResult orElse(),
  }) {
    if (updateMobile != null) {
      return updateMobile(this);
    }
    return orElse();
  }
}

abstract class _UpdateMobile implements UserProfileEvent {
  const factory _UpdateMobile({
    required final String newMobile,
    required final String otp,
  }) = _$UpdateMobileImpl;

  String get newMobile;
  String get otp;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateMobileImplCopyWith<_$UpdateMobileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadProfileImageImplCopyWith<$Res> {
  factory _$$UploadProfileImageImplCopyWith(
    _$UploadProfileImageImpl value,
    $Res Function(_$UploadProfileImageImpl) then,
  ) = __$$UploadProfileImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File image});
}

/// @nodoc
class __$$UploadProfileImageImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$UploadProfileImageImpl>
    implements _$$UploadProfileImageImplCopyWith<$Res> {
  __$$UploadProfileImageImplCopyWithImpl(
    _$UploadProfileImageImpl _value,
    $Res Function(_$UploadProfileImageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? image = null}) {
    return _then(
      _$UploadProfileImageImpl(
        image:
            null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as File,
      ),
    );
  }
}

/// @nodoc

class _$UploadProfileImageImpl implements _UploadProfileImage {
  const _$UploadProfileImageImpl({required this.image});

  @override
  final File image;

  @override
  String toString() {
    return 'UserProfileEvent.uploadProfileImage(image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadProfileImageImpl &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadProfileImageImplCopyWith<_$UploadProfileImageImpl> get copyWith =>
      __$$UploadProfileImageImplCopyWithImpl<_$UploadProfileImageImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loadUserProfile,
    required TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )
    updateBasicInfo,
    required TResult Function(String mobileNumber) sendPhoneUpdateOtp,
    required TResult Function(String newMobile, String otp) updateMobile,
    required TResult Function(File image) uploadProfileImage,
    required TResult Function(String newEmail) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
    changePassword,
    required TResult Function(Map<String, dynamic> address) addAddress,
    required TResult Function(Map<String, dynamic> address) updateAddress,
    required TResult Function(int addressId) deleteAddress,
  }) {
    return uploadProfileImage(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loadUserProfile,
    TResult? Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult? Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult? Function(String newMobile, String otp)? updateMobile,
    TResult? Function(File image)? uploadProfileImage,
    TResult? Function(String newEmail)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
    changePassword,
    TResult? Function(Map<String, dynamic> address)? addAddress,
    TResult? Function(Map<String, dynamic> address)? updateAddress,
    TResult? Function(int addressId)? deleteAddress,
  }) {
    return uploadProfileImage?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loadUserProfile,
    TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult Function(String newMobile, String otp)? updateMobile,
    TResult Function(File image)? uploadProfileImage,
    TResult Function(String newEmail)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
    changePassword,
    TResult Function(Map<String, dynamic> address)? addAddress,
    TResult Function(Map<String, dynamic> address)? updateAddress,
    TResult Function(int addressId)? deleteAddress,
    required TResult orElse(),
  }) {
    if (uploadProfileImage != null) {
      return uploadProfileImage(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateBasicInfo value) updateBasicInfo,
    required TResult Function(_SendPhoneUpdateOtp value) sendPhoneUpdateOtp,
    required TResult Function(_UpdateMobile value) updateMobile,
    required TResult Function(_UploadProfileImage value) uploadProfileImage,
    required TResult Function(_UpdateEmail value) updateEmail,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_AddAddress value) addAddress,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
  }) {
    return uploadProfileImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult? Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult? Function(_UpdateMobile value)? updateMobile,
    TResult? Function(_UploadProfileImage value)? uploadProfileImage,
    TResult? Function(_UpdateEmail value)? updateEmail,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_AddAddress value)? addAddress,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
  }) {
    return uploadProfileImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult Function(_UpdateMobile value)? updateMobile,
    TResult Function(_UploadProfileImage value)? uploadProfileImage,
    TResult Function(_UpdateEmail value)? updateEmail,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_AddAddress value)? addAddress,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    required TResult orElse(),
  }) {
    if (uploadProfileImage != null) {
      return uploadProfileImage(this);
    }
    return orElse();
  }
}

abstract class _UploadProfileImage implements UserProfileEvent {
  const factory _UploadProfileImage({required final File image}) =
      _$UploadProfileImageImpl;

  File get image;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadProfileImageImplCopyWith<_$UploadProfileImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateEmailImplCopyWith<$Res> {
  factory _$$UpdateEmailImplCopyWith(
    _$UpdateEmailImpl value,
    $Res Function(_$UpdateEmailImpl) then,
  ) = __$$UpdateEmailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String newEmail});
}

/// @nodoc
class __$$UpdateEmailImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$UpdateEmailImpl>
    implements _$$UpdateEmailImplCopyWith<$Res> {
  __$$UpdateEmailImplCopyWithImpl(
    _$UpdateEmailImpl _value,
    $Res Function(_$UpdateEmailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? newEmail = null}) {
    return _then(
      _$UpdateEmailImpl(
        null == newEmail
            ? _value.newEmail
            : newEmail // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$UpdateEmailImpl implements _UpdateEmail {
  const _$UpdateEmailImpl(this.newEmail);

  @override
  final String newEmail;

  @override
  String toString() {
    return 'UserProfileEvent.updateEmail(newEmail: $newEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateEmailImpl &&
            (identical(other.newEmail, newEmail) ||
                other.newEmail == newEmail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newEmail);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateEmailImplCopyWith<_$UpdateEmailImpl> get copyWith =>
      __$$UpdateEmailImplCopyWithImpl<_$UpdateEmailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loadUserProfile,
    required TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )
    updateBasicInfo,
    required TResult Function(String mobileNumber) sendPhoneUpdateOtp,
    required TResult Function(String newMobile, String otp) updateMobile,
    required TResult Function(File image) uploadProfileImage,
    required TResult Function(String newEmail) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
    changePassword,
    required TResult Function(Map<String, dynamic> address) addAddress,
    required TResult Function(Map<String, dynamic> address) updateAddress,
    required TResult Function(int addressId) deleteAddress,
  }) {
    return updateEmail(newEmail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loadUserProfile,
    TResult? Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult? Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult? Function(String newMobile, String otp)? updateMobile,
    TResult? Function(File image)? uploadProfileImage,
    TResult? Function(String newEmail)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
    changePassword,
    TResult? Function(Map<String, dynamic> address)? addAddress,
    TResult? Function(Map<String, dynamic> address)? updateAddress,
    TResult? Function(int addressId)? deleteAddress,
  }) {
    return updateEmail?.call(newEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loadUserProfile,
    TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult Function(String newMobile, String otp)? updateMobile,
    TResult Function(File image)? uploadProfileImage,
    TResult Function(String newEmail)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
    changePassword,
    TResult Function(Map<String, dynamic> address)? addAddress,
    TResult Function(Map<String, dynamic> address)? updateAddress,
    TResult Function(int addressId)? deleteAddress,
    required TResult orElse(),
  }) {
    if (updateEmail != null) {
      return updateEmail(newEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateBasicInfo value) updateBasicInfo,
    required TResult Function(_SendPhoneUpdateOtp value) sendPhoneUpdateOtp,
    required TResult Function(_UpdateMobile value) updateMobile,
    required TResult Function(_UploadProfileImage value) uploadProfileImage,
    required TResult Function(_UpdateEmail value) updateEmail,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_AddAddress value) addAddress,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
  }) {
    return updateEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult? Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult? Function(_UpdateMobile value)? updateMobile,
    TResult? Function(_UploadProfileImage value)? uploadProfileImage,
    TResult? Function(_UpdateEmail value)? updateEmail,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_AddAddress value)? addAddress,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
  }) {
    return updateEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult Function(_UpdateMobile value)? updateMobile,
    TResult Function(_UploadProfileImage value)? uploadProfileImage,
    TResult Function(_UpdateEmail value)? updateEmail,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_AddAddress value)? addAddress,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    required TResult orElse(),
  }) {
    if (updateEmail != null) {
      return updateEmail(this);
    }
    return orElse();
  }
}

abstract class _UpdateEmail implements UserProfileEvent {
  const factory _UpdateEmail(final String newEmail) = _$UpdateEmailImpl;

  String get newEmail;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateEmailImplCopyWith<_$UpdateEmailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangePasswordImplCopyWith<$Res> {
  factory _$$ChangePasswordImplCopyWith(
    _$ChangePasswordImpl value,
    $Res Function(_$ChangePasswordImpl) then,
  ) = __$$ChangePasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String currentPassword, String newPassword});
}

/// @nodoc
class __$$ChangePasswordImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$ChangePasswordImpl>
    implements _$$ChangePasswordImplCopyWith<$Res> {
  __$$ChangePasswordImplCopyWithImpl(
    _$ChangePasswordImpl _value,
    $Res Function(_$ChangePasswordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currentPassword = null, Object? newPassword = null}) {
    return _then(
      _$ChangePasswordImpl(
        currentPassword:
            null == currentPassword
                ? _value.currentPassword
                : currentPassword // ignore: cast_nullable_to_non_nullable
                    as String,
        newPassword:
            null == newPassword
                ? _value.newPassword
                : newPassword // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$ChangePasswordImpl implements _ChangePassword {
  const _$ChangePasswordImpl({
    required this.currentPassword,
    required this.newPassword,
  });

  @override
  final String currentPassword;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'UserProfileEvent.changePassword(currentPassword: $currentPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordImpl &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPassword, newPassword);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordImplCopyWith<_$ChangePasswordImpl> get copyWith =>
      __$$ChangePasswordImplCopyWithImpl<_$ChangePasswordImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loadUserProfile,
    required TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )
    updateBasicInfo,
    required TResult Function(String mobileNumber) sendPhoneUpdateOtp,
    required TResult Function(String newMobile, String otp) updateMobile,
    required TResult Function(File image) uploadProfileImage,
    required TResult Function(String newEmail) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
    changePassword,
    required TResult Function(Map<String, dynamic> address) addAddress,
    required TResult Function(Map<String, dynamic> address) updateAddress,
    required TResult Function(int addressId) deleteAddress,
  }) {
    return changePassword(currentPassword, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loadUserProfile,
    TResult? Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult? Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult? Function(String newMobile, String otp)? updateMobile,
    TResult? Function(File image)? uploadProfileImage,
    TResult? Function(String newEmail)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
    changePassword,
    TResult? Function(Map<String, dynamic> address)? addAddress,
    TResult? Function(Map<String, dynamic> address)? updateAddress,
    TResult? Function(int addressId)? deleteAddress,
  }) {
    return changePassword?.call(currentPassword, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loadUserProfile,
    TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult Function(String newMobile, String otp)? updateMobile,
    TResult Function(File image)? uploadProfileImage,
    TResult Function(String newEmail)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
    changePassword,
    TResult Function(Map<String, dynamic> address)? addAddress,
    TResult Function(Map<String, dynamic> address)? updateAddress,
    TResult Function(int addressId)? deleteAddress,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(currentPassword, newPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateBasicInfo value) updateBasicInfo,
    required TResult Function(_SendPhoneUpdateOtp value) sendPhoneUpdateOtp,
    required TResult Function(_UpdateMobile value) updateMobile,
    required TResult Function(_UploadProfileImage value) uploadProfileImage,
    required TResult Function(_UpdateEmail value) updateEmail,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_AddAddress value) addAddress,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
  }) {
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult? Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult? Function(_UpdateMobile value)? updateMobile,
    TResult? Function(_UploadProfileImage value)? uploadProfileImage,
    TResult? Function(_UpdateEmail value)? updateEmail,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_AddAddress value)? addAddress,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
  }) {
    return changePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult Function(_UpdateMobile value)? updateMobile,
    TResult Function(_UploadProfileImage value)? uploadProfileImage,
    TResult Function(_UpdateEmail value)? updateEmail,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_AddAddress value)? addAddress,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class _ChangePassword implements UserProfileEvent {
  const factory _ChangePassword({
    required final String currentPassword,
    required final String newPassword,
  }) = _$ChangePasswordImpl;

  String get currentPassword;
  String get newPassword;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePasswordImplCopyWith<_$ChangePasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddAddressImplCopyWith<$Res> {
  factory _$$AddAddressImplCopyWith(
    _$AddAddressImpl value,
    $Res Function(_$AddAddressImpl) then,
  ) = __$$AddAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> address});
}

/// @nodoc
class __$$AddAddressImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$AddAddressImpl>
    implements _$$AddAddressImplCopyWith<$Res> {
  __$$AddAddressImplCopyWithImpl(
    _$AddAddressImpl _value,
    $Res Function(_$AddAddressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? address = null}) {
    return _then(
      _$AddAddressImpl(
        address:
            null == address
                ? _value._address
                : address // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

class _$AddAddressImpl implements _AddAddress {
  const _$AddAddressImpl({required final Map<String, dynamic> address})
    : _address = address;

  final Map<String, dynamic> _address;
  @override
  Map<String, dynamic> get address {
    if (_address is EqualUnmodifiableMapView) return _address;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_address);
  }

  @override
  String toString() {
    return 'UserProfileEvent.addAddress(address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAddressImpl &&
            const DeepCollectionEquality().equals(other._address, _address));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_address));

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAddressImplCopyWith<_$AddAddressImpl> get copyWith =>
      __$$AddAddressImplCopyWithImpl<_$AddAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loadUserProfile,
    required TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )
    updateBasicInfo,
    required TResult Function(String mobileNumber) sendPhoneUpdateOtp,
    required TResult Function(String newMobile, String otp) updateMobile,
    required TResult Function(File image) uploadProfileImage,
    required TResult Function(String newEmail) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
    changePassword,
    required TResult Function(Map<String, dynamic> address) addAddress,
    required TResult Function(Map<String, dynamic> address) updateAddress,
    required TResult Function(int addressId) deleteAddress,
  }) {
    return addAddress(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loadUserProfile,
    TResult? Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult? Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult? Function(String newMobile, String otp)? updateMobile,
    TResult? Function(File image)? uploadProfileImage,
    TResult? Function(String newEmail)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
    changePassword,
    TResult? Function(Map<String, dynamic> address)? addAddress,
    TResult? Function(Map<String, dynamic> address)? updateAddress,
    TResult? Function(int addressId)? deleteAddress,
  }) {
    return addAddress?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loadUserProfile,
    TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult Function(String newMobile, String otp)? updateMobile,
    TResult Function(File image)? uploadProfileImage,
    TResult Function(String newEmail)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
    changePassword,
    TResult Function(Map<String, dynamic> address)? addAddress,
    TResult Function(Map<String, dynamic> address)? updateAddress,
    TResult Function(int addressId)? deleteAddress,
    required TResult orElse(),
  }) {
    if (addAddress != null) {
      return addAddress(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateBasicInfo value) updateBasicInfo,
    required TResult Function(_SendPhoneUpdateOtp value) sendPhoneUpdateOtp,
    required TResult Function(_UpdateMobile value) updateMobile,
    required TResult Function(_UploadProfileImage value) uploadProfileImage,
    required TResult Function(_UpdateEmail value) updateEmail,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_AddAddress value) addAddress,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
  }) {
    return addAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult? Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult? Function(_UpdateMobile value)? updateMobile,
    TResult? Function(_UploadProfileImage value)? uploadProfileImage,
    TResult? Function(_UpdateEmail value)? updateEmail,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_AddAddress value)? addAddress,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
  }) {
    return addAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult Function(_UpdateMobile value)? updateMobile,
    TResult Function(_UploadProfileImage value)? uploadProfileImage,
    TResult Function(_UpdateEmail value)? updateEmail,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_AddAddress value)? addAddress,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    required TResult orElse(),
  }) {
    if (addAddress != null) {
      return addAddress(this);
    }
    return orElse();
  }
}

abstract class _AddAddress implements UserProfileEvent {
  const factory _AddAddress({required final Map<String, dynamic> address}) =
      _$AddAddressImpl;

  Map<String, dynamic> get address;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddAddressImplCopyWith<_$AddAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateAddressImplCopyWith<$Res> {
  factory _$$UpdateAddressImplCopyWith(
    _$UpdateAddressImpl value,
    $Res Function(_$UpdateAddressImpl) then,
  ) = __$$UpdateAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> address});
}

/// @nodoc
class __$$UpdateAddressImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$UpdateAddressImpl>
    implements _$$UpdateAddressImplCopyWith<$Res> {
  __$$UpdateAddressImplCopyWithImpl(
    _$UpdateAddressImpl _value,
    $Res Function(_$UpdateAddressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? address = null}) {
    return _then(
      _$UpdateAddressImpl(
        address:
            null == address
                ? _value._address
                : address // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

class _$UpdateAddressImpl implements _UpdateAddress {
  const _$UpdateAddressImpl({required final Map<String, dynamic> address})
    : _address = address;

  final Map<String, dynamic> _address;
  @override
  Map<String, dynamic> get address {
    if (_address is EqualUnmodifiableMapView) return _address;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_address);
  }

  @override
  String toString() {
    return 'UserProfileEvent.updateAddress(address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAddressImpl &&
            const DeepCollectionEquality().equals(other._address, _address));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_address));

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAddressImplCopyWith<_$UpdateAddressImpl> get copyWith =>
      __$$UpdateAddressImplCopyWithImpl<_$UpdateAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loadUserProfile,
    required TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )
    updateBasicInfo,
    required TResult Function(String mobileNumber) sendPhoneUpdateOtp,
    required TResult Function(String newMobile, String otp) updateMobile,
    required TResult Function(File image) uploadProfileImage,
    required TResult Function(String newEmail) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
    changePassword,
    required TResult Function(Map<String, dynamic> address) addAddress,
    required TResult Function(Map<String, dynamic> address) updateAddress,
    required TResult Function(int addressId) deleteAddress,
  }) {
    return updateAddress(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loadUserProfile,
    TResult? Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult? Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult? Function(String newMobile, String otp)? updateMobile,
    TResult? Function(File image)? uploadProfileImage,
    TResult? Function(String newEmail)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
    changePassword,
    TResult? Function(Map<String, dynamic> address)? addAddress,
    TResult? Function(Map<String, dynamic> address)? updateAddress,
    TResult? Function(int addressId)? deleteAddress,
  }) {
    return updateAddress?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loadUserProfile,
    TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult Function(String newMobile, String otp)? updateMobile,
    TResult Function(File image)? uploadProfileImage,
    TResult Function(String newEmail)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
    changePassword,
    TResult Function(Map<String, dynamic> address)? addAddress,
    TResult Function(Map<String, dynamic> address)? updateAddress,
    TResult Function(int addressId)? deleteAddress,
    required TResult orElse(),
  }) {
    if (updateAddress != null) {
      return updateAddress(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateBasicInfo value) updateBasicInfo,
    required TResult Function(_SendPhoneUpdateOtp value) sendPhoneUpdateOtp,
    required TResult Function(_UpdateMobile value) updateMobile,
    required TResult Function(_UploadProfileImage value) uploadProfileImage,
    required TResult Function(_UpdateEmail value) updateEmail,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_AddAddress value) addAddress,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
  }) {
    return updateAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult? Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult? Function(_UpdateMobile value)? updateMobile,
    TResult? Function(_UploadProfileImage value)? uploadProfileImage,
    TResult? Function(_UpdateEmail value)? updateEmail,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_AddAddress value)? addAddress,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
  }) {
    return updateAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult Function(_UpdateMobile value)? updateMobile,
    TResult Function(_UploadProfileImage value)? uploadProfileImage,
    TResult Function(_UpdateEmail value)? updateEmail,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_AddAddress value)? addAddress,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    required TResult orElse(),
  }) {
    if (updateAddress != null) {
      return updateAddress(this);
    }
    return orElse();
  }
}

abstract class _UpdateAddress implements UserProfileEvent {
  const factory _UpdateAddress({required final Map<String, dynamic> address}) =
      _$UpdateAddressImpl;

  Map<String, dynamic> get address;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateAddressImplCopyWith<_$UpdateAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteAddressImplCopyWith<$Res> {
  factory _$$DeleteAddressImplCopyWith(
    _$DeleteAddressImpl value,
    $Res Function(_$DeleteAddressImpl) then,
  ) = __$$DeleteAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int addressId});
}

/// @nodoc
class __$$DeleteAddressImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$DeleteAddressImpl>
    implements _$$DeleteAddressImplCopyWith<$Res> {
  __$$DeleteAddressImplCopyWithImpl(
    _$DeleteAddressImpl _value,
    $Res Function(_$DeleteAddressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? addressId = null}) {
    return _then(
      _$DeleteAddressImpl(
        addressId:
            null == addressId
                ? _value.addressId
                : addressId // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$DeleteAddressImpl implements _DeleteAddress {
  const _$DeleteAddressImpl({required this.addressId});

  @override
  final int addressId;

  @override
  String toString() {
    return 'UserProfileEvent.deleteAddress(addressId: $addressId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAddressImpl &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addressId);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteAddressImplCopyWith<_$DeleteAddressImpl> get copyWith =>
      __$$DeleteAddressImplCopyWithImpl<_$DeleteAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loadUserProfile,
    required TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )
    updateBasicInfo,
    required TResult Function(String mobileNumber) sendPhoneUpdateOtp,
    required TResult Function(String newMobile, String otp) updateMobile,
    required TResult Function(File image) uploadProfileImage,
    required TResult Function(String newEmail) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
    changePassword,
    required TResult Function(Map<String, dynamic> address) addAddress,
    required TResult Function(Map<String, dynamic> address) updateAddress,
    required TResult Function(int addressId) deleteAddress,
  }) {
    return deleteAddress(addressId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loadUserProfile,
    TResult? Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult? Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult? Function(String newMobile, String otp)? updateMobile,
    TResult? Function(File image)? uploadProfileImage,
    TResult? Function(String newEmail)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
    changePassword,
    TResult? Function(Map<String, dynamic> address)? addAddress,
    TResult? Function(Map<String, dynamic> address)? updateAddress,
    TResult? Function(int addressId)? deleteAddress,
  }) {
    return deleteAddress?.call(addressId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loadUserProfile,
    TResult Function(
      String firstName,
      String lastName,
      String gender,
      String dob,
    )?
    updateBasicInfo,
    TResult Function(String mobileNumber)? sendPhoneUpdateOtp,
    TResult Function(String newMobile, String otp)? updateMobile,
    TResult Function(File image)? uploadProfileImage,
    TResult Function(String newEmail)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
    changePassword,
    TResult Function(Map<String, dynamic> address)? addAddress,
    TResult Function(Map<String, dynamic> address)? updateAddress,
    TResult Function(int addressId)? deleteAddress,
    required TResult orElse(),
  }) {
    if (deleteAddress != null) {
      return deleteAddress(addressId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateBasicInfo value) updateBasicInfo,
    required TResult Function(_SendPhoneUpdateOtp value) sendPhoneUpdateOtp,
    required TResult Function(_UpdateMobile value) updateMobile,
    required TResult Function(_UploadProfileImage value) uploadProfileImage,
    required TResult Function(_UpdateEmail value) updateEmail,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_AddAddress value) addAddress,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
  }) {
    return deleteAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult? Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult? Function(_UpdateMobile value)? updateMobile,
    TResult? Function(_UploadProfileImage value)? uploadProfileImage,
    TResult? Function(_UpdateEmail value)? updateEmail,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_AddAddress value)? addAddress,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
  }) {
    return deleteAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateBasicInfo value)? updateBasicInfo,
    TResult Function(_SendPhoneUpdateOtp value)? sendPhoneUpdateOtp,
    TResult Function(_UpdateMobile value)? updateMobile,
    TResult Function(_UploadProfileImage value)? uploadProfileImage,
    TResult Function(_UpdateEmail value)? updateEmail,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_AddAddress value)? addAddress,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    required TResult orElse(),
  }) {
    if (deleteAddress != null) {
      return deleteAddress(this);
    }
    return orElse();
  }
}

abstract class _DeleteAddress implements UserProfileEvent {
  const factory _DeleteAddress({required final int addressId}) =
      _$DeleteAddressImpl;

  int get addressId;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteAddressImplCopyWith<_$DeleteAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
