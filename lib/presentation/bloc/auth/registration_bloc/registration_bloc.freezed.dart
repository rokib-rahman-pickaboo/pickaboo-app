// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RegistrationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String encryptedMobile, bool resend) sendOtp,
    required TResult Function(String mobile, String otp) verifyOtp,
    required TResult Function(
      String email,
      String firstName,
      String lastName,
      String password,
      String mobile,
      String otp,
      String? referralCode,
    )
    registerUser,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String encryptedMobile, bool resend)? sendOtp,
    TResult? Function(String mobile, String otp)? verifyOtp,
    TResult? Function(
      String email,
      String firstName,
      String lastName,
      String password,
      String mobile,
      String otp,
      String? referralCode,
    )?
    registerUser,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String encryptedMobile, bool resend)? sendOtp,
    TResult Function(String mobile, String otp)? verifyOtp,
    TResult Function(
      String email,
      String firstName,
      String lastName,
      String password,
      String mobile,
      String otp,
      String? referralCode,
    )?
    registerUser,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_RegisterUser value) registerUser,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_RegisterUser value)? registerUser,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_RegisterUser value)? registerUser,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationEventCopyWith<$Res> {
  factory $RegistrationEventCopyWith(
    RegistrationEvent value,
    $Res Function(RegistrationEvent) then,
  ) = _$RegistrationEventCopyWithImpl<$Res, RegistrationEvent>;
}

/// @nodoc
class _$RegistrationEventCopyWithImpl<$Res, $Val extends RegistrationEvent>
    implements $RegistrationEventCopyWith<$Res> {
  _$RegistrationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SendOtpImplCopyWith<$Res> {
  factory _$$SendOtpImplCopyWith(
    _$SendOtpImpl value,
    $Res Function(_$SendOtpImpl) then,
  ) = __$$SendOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String encryptedMobile, bool resend});
}

/// @nodoc
class __$$SendOtpImplCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res, _$SendOtpImpl>
    implements _$$SendOtpImplCopyWith<$Res> {
  __$$SendOtpImplCopyWithImpl(
    _$SendOtpImpl _value,
    $Res Function(_$SendOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? encryptedMobile = null, Object? resend = null}) {
    return _then(
      _$SendOtpImpl(
        encryptedMobile:
            null == encryptedMobile
                ? _value.encryptedMobile
                : encryptedMobile // ignore: cast_nullable_to_non_nullable
                    as String,
        resend:
            null == resend
                ? _value.resend
                : resend // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$SendOtpImpl with DiagnosticableTreeMixin implements _SendOtp {
  const _$SendOtpImpl({required this.encryptedMobile, this.resend = false});

  @override
  final String encryptedMobile;
  @override
  @JsonKey()
  final bool resend;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistrationEvent.sendOtp(encryptedMobile: $encryptedMobile, resend: $resend)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistrationEvent.sendOtp'))
      ..add(DiagnosticsProperty('encryptedMobile', encryptedMobile))
      ..add(DiagnosticsProperty('resend', resend));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtpImpl &&
            (identical(other.encryptedMobile, encryptedMobile) ||
                other.encryptedMobile == encryptedMobile) &&
            (identical(other.resend, resend) || other.resend == resend));
  }

  @override
  int get hashCode => Object.hash(runtimeType, encryptedMobile, resend);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOtpImplCopyWith<_$SendOtpImpl> get copyWith =>
      __$$SendOtpImplCopyWithImpl<_$SendOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String encryptedMobile, bool resend) sendOtp,
    required TResult Function(String mobile, String otp) verifyOtp,
    required TResult Function(
      String email,
      String firstName,
      String lastName,
      String password,
      String mobile,
      String otp,
      String? referralCode,
    )
    registerUser,
  }) {
    return sendOtp(encryptedMobile, resend);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String encryptedMobile, bool resend)? sendOtp,
    TResult? Function(String mobile, String otp)? verifyOtp,
    TResult? Function(
      String email,
      String firstName,
      String lastName,
      String password,
      String mobile,
      String otp,
      String? referralCode,
    )?
    registerUser,
  }) {
    return sendOtp?.call(encryptedMobile, resend);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String encryptedMobile, bool resend)? sendOtp,
    TResult Function(String mobile, String otp)? verifyOtp,
    TResult Function(
      String email,
      String firstName,
      String lastName,
      String password,
      String mobile,
      String otp,
      String? referralCode,
    )?
    registerUser,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(encryptedMobile, resend);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_RegisterUser value) registerUser,
  }) {
    return sendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_RegisterUser value)? registerUser,
  }) {
    return sendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_RegisterUser value)? registerUser,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(this);
    }
    return orElse();
  }
}

abstract class _SendOtp implements RegistrationEvent {
  const factory _SendOtp({
    required final String encryptedMobile,
    final bool resend,
  }) = _$SendOtpImpl;

  String get encryptedMobile;
  bool get resend;

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOtpImplCopyWith<_$SendOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyOtpImplCopyWith<$Res> {
  factory _$$VerifyOtpImplCopyWith(
    _$VerifyOtpImpl value,
    $Res Function(_$VerifyOtpImpl) then,
  ) = __$$VerifyOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String mobile, String otp});
}

/// @nodoc
class __$$VerifyOtpImplCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res, _$VerifyOtpImpl>
    implements _$$VerifyOtpImplCopyWith<$Res> {
  __$$VerifyOtpImplCopyWithImpl(
    _$VerifyOtpImpl _value,
    $Res Function(_$VerifyOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mobile = null, Object? otp = null}) {
    return _then(
      _$VerifyOtpImpl(
        mobile:
            null == mobile
                ? _value.mobile
                : mobile // ignore: cast_nullable_to_non_nullable
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

class _$VerifyOtpImpl with DiagnosticableTreeMixin implements _VerifyOtp {
  const _$VerifyOtpImpl({required this.mobile, required this.otp});

  @override
  final String mobile;
  @override
  final String otp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistrationEvent.verifyOtp(mobile: $mobile, otp: $otp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistrationEvent.verifyOtp'))
      ..add(DiagnosticsProperty('mobile', mobile))
      ..add(DiagnosticsProperty('otp', otp));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpImpl &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mobile, otp);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      __$$VerifyOtpImplCopyWithImpl<_$VerifyOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String encryptedMobile, bool resend) sendOtp,
    required TResult Function(String mobile, String otp) verifyOtp,
    required TResult Function(
      String email,
      String firstName,
      String lastName,
      String password,
      String mobile,
      String otp,
      String? referralCode,
    )
    registerUser,
  }) {
    return verifyOtp(mobile, otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String encryptedMobile, bool resend)? sendOtp,
    TResult? Function(String mobile, String otp)? verifyOtp,
    TResult? Function(
      String email,
      String firstName,
      String lastName,
      String password,
      String mobile,
      String otp,
      String? referralCode,
    )?
    registerUser,
  }) {
    return verifyOtp?.call(mobile, otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String encryptedMobile, bool resend)? sendOtp,
    TResult Function(String mobile, String otp)? verifyOtp,
    TResult Function(
      String email,
      String firstName,
      String lastName,
      String password,
      String mobile,
      String otp,
      String? referralCode,
    )?
    registerUser,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(mobile, otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_RegisterUser value) registerUser,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_RegisterUser value)? registerUser,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_RegisterUser value)? registerUser,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class _VerifyOtp implements RegistrationEvent {
  const factory _VerifyOtp({
    required final String mobile,
    required final String otp,
  }) = _$VerifyOtpImpl;

  String get mobile;
  String get otp;

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterUserImplCopyWith<$Res> {
  factory _$$RegisterUserImplCopyWith(
    _$RegisterUserImpl value,
    $Res Function(_$RegisterUserImpl) then,
  ) = __$$RegisterUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String email,
    String firstName,
    String lastName,
    String password,
    String mobile,
    String otp,
    String? referralCode,
  });
}

/// @nodoc
class __$$RegisterUserImplCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res, _$RegisterUserImpl>
    implements _$$RegisterUserImplCopyWith<$Res> {
  __$$RegisterUserImplCopyWithImpl(
    _$RegisterUserImpl _value,
    $Res Function(_$RegisterUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? password = null,
    Object? mobile = null,
    Object? otp = null,
    Object? referralCode = freezed,
  }) {
    return _then(
      _$RegisterUserImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
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
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
        mobile:
            null == mobile
                ? _value.mobile
                : mobile // ignore: cast_nullable_to_non_nullable
                    as String,
        otp:
            null == otp
                ? _value.otp
                : otp // ignore: cast_nullable_to_non_nullable
                    as String,
        referralCode:
            freezed == referralCode
                ? _value.referralCode
                : referralCode // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$RegisterUserImpl with DiagnosticableTreeMixin implements _RegisterUser {
  const _$RegisterUserImpl({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.mobile,
    required this.otp,
    this.referralCode,
  });

  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String password;
  @override
  final String mobile;
  @override
  final String otp;
  @override
  final String? referralCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistrationEvent.registerUser(email: $email, firstName: $firstName, lastName: $lastName, password: $password, mobile: $mobile, otp: $otp, referralCode: $referralCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistrationEvent.registerUser'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('mobile', mobile))
      ..add(DiagnosticsProperty('otp', otp))
      ..add(DiagnosticsProperty('referralCode', referralCode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterUserImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    email,
    firstName,
    lastName,
    password,
    mobile,
    otp,
    referralCode,
  );

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterUserImplCopyWith<_$RegisterUserImpl> get copyWith =>
      __$$RegisterUserImplCopyWithImpl<_$RegisterUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String encryptedMobile, bool resend) sendOtp,
    required TResult Function(String mobile, String otp) verifyOtp,
    required TResult Function(
      String email,
      String firstName,
      String lastName,
      String password,
      String mobile,
      String otp,
      String? referralCode,
    )
    registerUser,
  }) {
    return registerUser(
      email,
      firstName,
      lastName,
      password,
      mobile,
      otp,
      referralCode,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String encryptedMobile, bool resend)? sendOtp,
    TResult? Function(String mobile, String otp)? verifyOtp,
    TResult? Function(
      String email,
      String firstName,
      String lastName,
      String password,
      String mobile,
      String otp,
      String? referralCode,
    )?
    registerUser,
  }) {
    return registerUser?.call(
      email,
      firstName,
      lastName,
      password,
      mobile,
      otp,
      referralCode,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String encryptedMobile, bool resend)? sendOtp,
    TResult Function(String mobile, String otp)? verifyOtp,
    TResult Function(
      String email,
      String firstName,
      String lastName,
      String password,
      String mobile,
      String otp,
      String? referralCode,
    )?
    registerUser,
    required TResult orElse(),
  }) {
    if (registerUser != null) {
      return registerUser(
        email,
        firstName,
        lastName,
        password,
        mobile,
        otp,
        referralCode,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_RegisterUser value) registerUser,
  }) {
    return registerUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_RegisterUser value)? registerUser,
  }) {
    return registerUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_RegisterUser value)? registerUser,
    required TResult orElse(),
  }) {
    if (registerUser != null) {
      return registerUser(this);
    }
    return orElse();
  }
}

abstract class _RegisterUser implements RegistrationEvent {
  const factory _RegisterUser({
    required final String email,
    required final String firstName,
    required final String lastName,
    required final String password,
    required final String mobile,
    required final String otp,
    final String? referralCode,
  }) = _$RegisterUserImpl;

  String get email;
  String get firstName;
  String get lastName;
  String get password;
  String get mobile;
  String get otp;
  String? get referralCode;

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterUserImplCopyWith<_$RegisterUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegistrationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingOtp,
    required TResult Function(String message) otpSent,
    required TResult Function(String error) otpSendFailed,
    required TResult Function() verifyingOtp,
    required TResult Function() otpVerified,
    required TResult Function(String error) otpVerificationFailed,
    required TResult Function() registrationLoading,
    required TResult Function(String message) registrationSuccess,
    required TResult Function(String error) registrationFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingOtp,
    TResult? Function(String message)? otpSent,
    TResult? Function(String error)? otpSendFailed,
    TResult? Function()? verifyingOtp,
    TResult? Function()? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
    TResult? Function()? registrationLoading,
    TResult? Function(String message)? registrationSuccess,
    TResult? Function(String error)? registrationFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingOtp,
    TResult Function(String message)? otpSent,
    TResult Function(String error)? otpSendFailed,
    TResult Function()? verifyingOtp,
    TResult Function()? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
    TResult Function()? registrationLoading,
    TResult Function(String message)? registrationSuccess,
    TResult Function(String error)? registrationFailure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingOtp value) sendingOtp,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_OtpSendFailed value) otpSendFailed,
    required TResult Function(_VerifyingOtp value) verifyingOtp,
    required TResult Function(_OtpVerified value) otpVerified,
    required TResult Function(_OtpVerificationFailed value)
    otpVerificationFailed,
    required TResult Function(_RegistrationLoading value) registrationLoading,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_RegistrationFailure value) registrationFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingOtp value)? sendingOtp,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_OtpSendFailed value)? otpSendFailed,
    TResult? Function(_VerifyingOtp value)? verifyingOtp,
    TResult? Function(_OtpVerified value)? otpVerified,
    TResult? Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult? Function(_RegistrationLoading value)? registrationLoading,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_RegistrationFailure value)? registrationFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingOtp value)? sendingOtp,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_OtpSendFailed value)? otpSendFailed,
    TResult Function(_VerifyingOtp value)? verifyingOtp,
    TResult Function(_OtpVerified value)? otpVerified,
    TResult Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult Function(_RegistrationLoading value)? registrationLoading,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_RegistrationFailure value)? registrationFailure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationStateCopyWith<$Res> {
  factory $RegistrationStateCopyWith(
    RegistrationState value,
    $Res Function(RegistrationState) then,
  ) = _$RegistrationStateCopyWithImpl<$Res, RegistrationState>;
}

/// @nodoc
class _$RegistrationStateCopyWithImpl<$Res, $Val extends RegistrationState>
    implements $RegistrationStateCopyWith<$Res> {
  _$RegistrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistrationState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'RegistrationState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingOtp,
    required TResult Function(String message) otpSent,
    required TResult Function(String error) otpSendFailed,
    required TResult Function() verifyingOtp,
    required TResult Function() otpVerified,
    required TResult Function(String error) otpVerificationFailed,
    required TResult Function() registrationLoading,
    required TResult Function(String message) registrationSuccess,
    required TResult Function(String error) registrationFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingOtp,
    TResult? Function(String message)? otpSent,
    TResult? Function(String error)? otpSendFailed,
    TResult? Function()? verifyingOtp,
    TResult? Function()? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
    TResult? Function()? registrationLoading,
    TResult? Function(String message)? registrationSuccess,
    TResult? Function(String error)? registrationFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingOtp,
    TResult Function(String message)? otpSent,
    TResult Function(String error)? otpSendFailed,
    TResult Function()? verifyingOtp,
    TResult Function()? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
    TResult Function()? registrationLoading,
    TResult Function(String message)? registrationSuccess,
    TResult Function(String error)? registrationFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingOtp value) sendingOtp,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_OtpSendFailed value) otpSendFailed,
    required TResult Function(_VerifyingOtp value) verifyingOtp,
    required TResult Function(_OtpVerified value) otpVerified,
    required TResult Function(_OtpVerificationFailed value)
    otpVerificationFailed,
    required TResult Function(_RegistrationLoading value) registrationLoading,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_RegistrationFailure value) registrationFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingOtp value)? sendingOtp,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_OtpSendFailed value)? otpSendFailed,
    TResult? Function(_VerifyingOtp value)? verifyingOtp,
    TResult? Function(_OtpVerified value)? otpVerified,
    TResult? Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult? Function(_RegistrationLoading value)? registrationLoading,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_RegistrationFailure value)? registrationFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingOtp value)? sendingOtp,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_OtpSendFailed value)? otpSendFailed,
    TResult Function(_VerifyingOtp value)? verifyingOtp,
    TResult Function(_OtpVerified value)? otpVerified,
    TResult Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult Function(_RegistrationLoading value)? registrationLoading,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_RegistrationFailure value)? registrationFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RegistrationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SendingOtpImplCopyWith<$Res> {
  factory _$$SendingOtpImplCopyWith(
    _$SendingOtpImpl value,
    $Res Function(_$SendingOtpImpl) then,
  ) = __$$SendingOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendingOtpImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$SendingOtpImpl>
    implements _$$SendingOtpImplCopyWith<$Res> {
  __$$SendingOtpImplCopyWithImpl(
    _$SendingOtpImpl _value,
    $Res Function(_$SendingOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendingOtpImpl with DiagnosticableTreeMixin implements _SendingOtp {
  const _$SendingOtpImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistrationState.sendingOtp()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistrationState.sendingOtp'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendingOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingOtp,
    required TResult Function(String message) otpSent,
    required TResult Function(String error) otpSendFailed,
    required TResult Function() verifyingOtp,
    required TResult Function() otpVerified,
    required TResult Function(String error) otpVerificationFailed,
    required TResult Function() registrationLoading,
    required TResult Function(String message) registrationSuccess,
    required TResult Function(String error) registrationFailure,
  }) {
    return sendingOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingOtp,
    TResult? Function(String message)? otpSent,
    TResult? Function(String error)? otpSendFailed,
    TResult? Function()? verifyingOtp,
    TResult? Function()? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
    TResult? Function()? registrationLoading,
    TResult? Function(String message)? registrationSuccess,
    TResult? Function(String error)? registrationFailure,
  }) {
    return sendingOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingOtp,
    TResult Function(String message)? otpSent,
    TResult Function(String error)? otpSendFailed,
    TResult Function()? verifyingOtp,
    TResult Function()? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
    TResult Function()? registrationLoading,
    TResult Function(String message)? registrationSuccess,
    TResult Function(String error)? registrationFailure,
    required TResult orElse(),
  }) {
    if (sendingOtp != null) {
      return sendingOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingOtp value) sendingOtp,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_OtpSendFailed value) otpSendFailed,
    required TResult Function(_VerifyingOtp value) verifyingOtp,
    required TResult Function(_OtpVerified value) otpVerified,
    required TResult Function(_OtpVerificationFailed value)
    otpVerificationFailed,
    required TResult Function(_RegistrationLoading value) registrationLoading,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_RegistrationFailure value) registrationFailure,
  }) {
    return sendingOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingOtp value)? sendingOtp,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_OtpSendFailed value)? otpSendFailed,
    TResult? Function(_VerifyingOtp value)? verifyingOtp,
    TResult? Function(_OtpVerified value)? otpVerified,
    TResult? Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult? Function(_RegistrationLoading value)? registrationLoading,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_RegistrationFailure value)? registrationFailure,
  }) {
    return sendingOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingOtp value)? sendingOtp,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_OtpSendFailed value)? otpSendFailed,
    TResult Function(_VerifyingOtp value)? verifyingOtp,
    TResult Function(_OtpVerified value)? otpVerified,
    TResult Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult Function(_RegistrationLoading value)? registrationLoading,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_RegistrationFailure value)? registrationFailure,
    required TResult orElse(),
  }) {
    if (sendingOtp != null) {
      return sendingOtp(this);
    }
    return orElse();
  }
}

abstract class _SendingOtp implements RegistrationState {
  const factory _SendingOtp() = _$SendingOtpImpl;
}

/// @nodoc
abstract class _$$OtpSentImplCopyWith<$Res> {
  factory _$$OtpSentImplCopyWith(
    _$OtpSentImpl value,
    $Res Function(_$OtpSentImpl) then,
  ) = __$$OtpSentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$OtpSentImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$OtpSentImpl>
    implements _$$OtpSentImplCopyWith<$Res> {
  __$$OtpSentImplCopyWithImpl(
    _$OtpSentImpl _value,
    $Res Function(_$OtpSentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$OtpSentImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$OtpSentImpl with DiagnosticableTreeMixin implements _OtpSent {
  const _$OtpSentImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistrationState.otpSent(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistrationState.otpSent'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpSentImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpSentImplCopyWith<_$OtpSentImpl> get copyWith =>
      __$$OtpSentImplCopyWithImpl<_$OtpSentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingOtp,
    required TResult Function(String message) otpSent,
    required TResult Function(String error) otpSendFailed,
    required TResult Function() verifyingOtp,
    required TResult Function() otpVerified,
    required TResult Function(String error) otpVerificationFailed,
    required TResult Function() registrationLoading,
    required TResult Function(String message) registrationSuccess,
    required TResult Function(String error) registrationFailure,
  }) {
    return otpSent(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingOtp,
    TResult? Function(String message)? otpSent,
    TResult? Function(String error)? otpSendFailed,
    TResult? Function()? verifyingOtp,
    TResult? Function()? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
    TResult? Function()? registrationLoading,
    TResult? Function(String message)? registrationSuccess,
    TResult? Function(String error)? registrationFailure,
  }) {
    return otpSent?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingOtp,
    TResult Function(String message)? otpSent,
    TResult Function(String error)? otpSendFailed,
    TResult Function()? verifyingOtp,
    TResult Function()? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
    TResult Function()? registrationLoading,
    TResult Function(String message)? registrationSuccess,
    TResult Function(String error)? registrationFailure,
    required TResult orElse(),
  }) {
    if (otpSent != null) {
      return otpSent(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingOtp value) sendingOtp,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_OtpSendFailed value) otpSendFailed,
    required TResult Function(_VerifyingOtp value) verifyingOtp,
    required TResult Function(_OtpVerified value) otpVerified,
    required TResult Function(_OtpVerificationFailed value)
    otpVerificationFailed,
    required TResult Function(_RegistrationLoading value) registrationLoading,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_RegistrationFailure value) registrationFailure,
  }) {
    return otpSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingOtp value)? sendingOtp,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_OtpSendFailed value)? otpSendFailed,
    TResult? Function(_VerifyingOtp value)? verifyingOtp,
    TResult? Function(_OtpVerified value)? otpVerified,
    TResult? Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult? Function(_RegistrationLoading value)? registrationLoading,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_RegistrationFailure value)? registrationFailure,
  }) {
    return otpSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingOtp value)? sendingOtp,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_OtpSendFailed value)? otpSendFailed,
    TResult Function(_VerifyingOtp value)? verifyingOtp,
    TResult Function(_OtpVerified value)? otpVerified,
    TResult Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult Function(_RegistrationLoading value)? registrationLoading,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_RegistrationFailure value)? registrationFailure,
    required TResult orElse(),
  }) {
    if (otpSent != null) {
      return otpSent(this);
    }
    return orElse();
  }
}

abstract class _OtpSent implements RegistrationState {
  const factory _OtpSent(final String message) = _$OtpSentImpl;

  String get message;

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpSentImplCopyWith<_$OtpSentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtpSendFailedImplCopyWith<$Res> {
  factory _$$OtpSendFailedImplCopyWith(
    _$OtpSendFailedImpl value,
    $Res Function(_$OtpSendFailedImpl) then,
  ) = __$$OtpSendFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$OtpSendFailedImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$OtpSendFailedImpl>
    implements _$$OtpSendFailedImplCopyWith<$Res> {
  __$$OtpSendFailedImplCopyWithImpl(
    _$OtpSendFailedImpl _value,
    $Res Function(_$OtpSendFailedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$OtpSendFailedImpl(
        null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$OtpSendFailedImpl
    with DiagnosticableTreeMixin
    implements _OtpSendFailed {
  const _$OtpSendFailedImpl(this.error);

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistrationState.otpSendFailed(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistrationState.otpSendFailed'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpSendFailedImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpSendFailedImplCopyWith<_$OtpSendFailedImpl> get copyWith =>
      __$$OtpSendFailedImplCopyWithImpl<_$OtpSendFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingOtp,
    required TResult Function(String message) otpSent,
    required TResult Function(String error) otpSendFailed,
    required TResult Function() verifyingOtp,
    required TResult Function() otpVerified,
    required TResult Function(String error) otpVerificationFailed,
    required TResult Function() registrationLoading,
    required TResult Function(String message) registrationSuccess,
    required TResult Function(String error) registrationFailure,
  }) {
    return otpSendFailed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingOtp,
    TResult? Function(String message)? otpSent,
    TResult? Function(String error)? otpSendFailed,
    TResult? Function()? verifyingOtp,
    TResult? Function()? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
    TResult? Function()? registrationLoading,
    TResult? Function(String message)? registrationSuccess,
    TResult? Function(String error)? registrationFailure,
  }) {
    return otpSendFailed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingOtp,
    TResult Function(String message)? otpSent,
    TResult Function(String error)? otpSendFailed,
    TResult Function()? verifyingOtp,
    TResult Function()? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
    TResult Function()? registrationLoading,
    TResult Function(String message)? registrationSuccess,
    TResult Function(String error)? registrationFailure,
    required TResult orElse(),
  }) {
    if (otpSendFailed != null) {
      return otpSendFailed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingOtp value) sendingOtp,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_OtpSendFailed value) otpSendFailed,
    required TResult Function(_VerifyingOtp value) verifyingOtp,
    required TResult Function(_OtpVerified value) otpVerified,
    required TResult Function(_OtpVerificationFailed value)
    otpVerificationFailed,
    required TResult Function(_RegistrationLoading value) registrationLoading,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_RegistrationFailure value) registrationFailure,
  }) {
    return otpSendFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingOtp value)? sendingOtp,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_OtpSendFailed value)? otpSendFailed,
    TResult? Function(_VerifyingOtp value)? verifyingOtp,
    TResult? Function(_OtpVerified value)? otpVerified,
    TResult? Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult? Function(_RegistrationLoading value)? registrationLoading,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_RegistrationFailure value)? registrationFailure,
  }) {
    return otpSendFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingOtp value)? sendingOtp,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_OtpSendFailed value)? otpSendFailed,
    TResult Function(_VerifyingOtp value)? verifyingOtp,
    TResult Function(_OtpVerified value)? otpVerified,
    TResult Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult Function(_RegistrationLoading value)? registrationLoading,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_RegistrationFailure value)? registrationFailure,
    required TResult orElse(),
  }) {
    if (otpSendFailed != null) {
      return otpSendFailed(this);
    }
    return orElse();
  }
}

abstract class _OtpSendFailed implements RegistrationState {
  const factory _OtpSendFailed(final String error) = _$OtpSendFailedImpl;

  String get error;

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpSendFailedImplCopyWith<_$OtpSendFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyingOtpImplCopyWith<$Res> {
  factory _$$VerifyingOtpImplCopyWith(
    _$VerifyingOtpImpl value,
    $Res Function(_$VerifyingOtpImpl) then,
  ) = __$$VerifyingOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifyingOtpImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$VerifyingOtpImpl>
    implements _$$VerifyingOtpImplCopyWith<$Res> {
  __$$VerifyingOtpImplCopyWithImpl(
    _$VerifyingOtpImpl _value,
    $Res Function(_$VerifyingOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VerifyingOtpImpl with DiagnosticableTreeMixin implements _VerifyingOtp {
  const _$VerifyingOtpImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistrationState.verifyingOtp()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistrationState.verifyingOtp'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerifyingOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingOtp,
    required TResult Function(String message) otpSent,
    required TResult Function(String error) otpSendFailed,
    required TResult Function() verifyingOtp,
    required TResult Function() otpVerified,
    required TResult Function(String error) otpVerificationFailed,
    required TResult Function() registrationLoading,
    required TResult Function(String message) registrationSuccess,
    required TResult Function(String error) registrationFailure,
  }) {
    return verifyingOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingOtp,
    TResult? Function(String message)? otpSent,
    TResult? Function(String error)? otpSendFailed,
    TResult? Function()? verifyingOtp,
    TResult? Function()? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
    TResult? Function()? registrationLoading,
    TResult? Function(String message)? registrationSuccess,
    TResult? Function(String error)? registrationFailure,
  }) {
    return verifyingOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingOtp,
    TResult Function(String message)? otpSent,
    TResult Function(String error)? otpSendFailed,
    TResult Function()? verifyingOtp,
    TResult Function()? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
    TResult Function()? registrationLoading,
    TResult Function(String message)? registrationSuccess,
    TResult Function(String error)? registrationFailure,
    required TResult orElse(),
  }) {
    if (verifyingOtp != null) {
      return verifyingOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingOtp value) sendingOtp,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_OtpSendFailed value) otpSendFailed,
    required TResult Function(_VerifyingOtp value) verifyingOtp,
    required TResult Function(_OtpVerified value) otpVerified,
    required TResult Function(_OtpVerificationFailed value)
    otpVerificationFailed,
    required TResult Function(_RegistrationLoading value) registrationLoading,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_RegistrationFailure value) registrationFailure,
  }) {
    return verifyingOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingOtp value)? sendingOtp,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_OtpSendFailed value)? otpSendFailed,
    TResult? Function(_VerifyingOtp value)? verifyingOtp,
    TResult? Function(_OtpVerified value)? otpVerified,
    TResult? Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult? Function(_RegistrationLoading value)? registrationLoading,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_RegistrationFailure value)? registrationFailure,
  }) {
    return verifyingOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingOtp value)? sendingOtp,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_OtpSendFailed value)? otpSendFailed,
    TResult Function(_VerifyingOtp value)? verifyingOtp,
    TResult Function(_OtpVerified value)? otpVerified,
    TResult Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult Function(_RegistrationLoading value)? registrationLoading,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_RegistrationFailure value)? registrationFailure,
    required TResult orElse(),
  }) {
    if (verifyingOtp != null) {
      return verifyingOtp(this);
    }
    return orElse();
  }
}

abstract class _VerifyingOtp implements RegistrationState {
  const factory _VerifyingOtp() = _$VerifyingOtpImpl;
}

/// @nodoc
abstract class _$$OtpVerifiedImplCopyWith<$Res> {
  factory _$$OtpVerifiedImplCopyWith(
    _$OtpVerifiedImpl value,
    $Res Function(_$OtpVerifiedImpl) then,
  ) = __$$OtpVerifiedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OtpVerifiedImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$OtpVerifiedImpl>
    implements _$$OtpVerifiedImplCopyWith<$Res> {
  __$$OtpVerifiedImplCopyWithImpl(
    _$OtpVerifiedImpl _value,
    $Res Function(_$OtpVerifiedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OtpVerifiedImpl with DiagnosticableTreeMixin implements _OtpVerified {
  const _$OtpVerifiedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistrationState.otpVerified()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistrationState.otpVerified'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OtpVerifiedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingOtp,
    required TResult Function(String message) otpSent,
    required TResult Function(String error) otpSendFailed,
    required TResult Function() verifyingOtp,
    required TResult Function() otpVerified,
    required TResult Function(String error) otpVerificationFailed,
    required TResult Function() registrationLoading,
    required TResult Function(String message) registrationSuccess,
    required TResult Function(String error) registrationFailure,
  }) {
    return otpVerified();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingOtp,
    TResult? Function(String message)? otpSent,
    TResult? Function(String error)? otpSendFailed,
    TResult? Function()? verifyingOtp,
    TResult? Function()? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
    TResult? Function()? registrationLoading,
    TResult? Function(String message)? registrationSuccess,
    TResult? Function(String error)? registrationFailure,
  }) {
    return otpVerified?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingOtp,
    TResult Function(String message)? otpSent,
    TResult Function(String error)? otpSendFailed,
    TResult Function()? verifyingOtp,
    TResult Function()? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
    TResult Function()? registrationLoading,
    TResult Function(String message)? registrationSuccess,
    TResult Function(String error)? registrationFailure,
    required TResult orElse(),
  }) {
    if (otpVerified != null) {
      return otpVerified();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingOtp value) sendingOtp,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_OtpSendFailed value) otpSendFailed,
    required TResult Function(_VerifyingOtp value) verifyingOtp,
    required TResult Function(_OtpVerified value) otpVerified,
    required TResult Function(_OtpVerificationFailed value)
    otpVerificationFailed,
    required TResult Function(_RegistrationLoading value) registrationLoading,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_RegistrationFailure value) registrationFailure,
  }) {
    return otpVerified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingOtp value)? sendingOtp,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_OtpSendFailed value)? otpSendFailed,
    TResult? Function(_VerifyingOtp value)? verifyingOtp,
    TResult? Function(_OtpVerified value)? otpVerified,
    TResult? Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult? Function(_RegistrationLoading value)? registrationLoading,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_RegistrationFailure value)? registrationFailure,
  }) {
    return otpVerified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingOtp value)? sendingOtp,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_OtpSendFailed value)? otpSendFailed,
    TResult Function(_VerifyingOtp value)? verifyingOtp,
    TResult Function(_OtpVerified value)? otpVerified,
    TResult Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult Function(_RegistrationLoading value)? registrationLoading,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_RegistrationFailure value)? registrationFailure,
    required TResult orElse(),
  }) {
    if (otpVerified != null) {
      return otpVerified(this);
    }
    return orElse();
  }
}

abstract class _OtpVerified implements RegistrationState {
  const factory _OtpVerified() = _$OtpVerifiedImpl;
}

/// @nodoc
abstract class _$$OtpVerificationFailedImplCopyWith<$Res> {
  factory _$$OtpVerificationFailedImplCopyWith(
    _$OtpVerificationFailedImpl value,
    $Res Function(_$OtpVerificationFailedImpl) then,
  ) = __$$OtpVerificationFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$OtpVerificationFailedImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$OtpVerificationFailedImpl>
    implements _$$OtpVerificationFailedImplCopyWith<$Res> {
  __$$OtpVerificationFailedImplCopyWithImpl(
    _$OtpVerificationFailedImpl _value,
    $Res Function(_$OtpVerificationFailedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$OtpVerificationFailedImpl(
        null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$OtpVerificationFailedImpl
    with DiagnosticableTreeMixin
    implements _OtpVerificationFailed {
  const _$OtpVerificationFailedImpl(this.error);

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistrationState.otpVerificationFailed(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty('type', 'RegistrationState.otpVerificationFailed'),
      )
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpVerificationFailedImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpVerificationFailedImplCopyWith<_$OtpVerificationFailedImpl>
  get copyWith =>
      __$$OtpVerificationFailedImplCopyWithImpl<_$OtpVerificationFailedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingOtp,
    required TResult Function(String message) otpSent,
    required TResult Function(String error) otpSendFailed,
    required TResult Function() verifyingOtp,
    required TResult Function() otpVerified,
    required TResult Function(String error) otpVerificationFailed,
    required TResult Function() registrationLoading,
    required TResult Function(String message) registrationSuccess,
    required TResult Function(String error) registrationFailure,
  }) {
    return otpVerificationFailed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingOtp,
    TResult? Function(String message)? otpSent,
    TResult? Function(String error)? otpSendFailed,
    TResult? Function()? verifyingOtp,
    TResult? Function()? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
    TResult? Function()? registrationLoading,
    TResult? Function(String message)? registrationSuccess,
    TResult? Function(String error)? registrationFailure,
  }) {
    return otpVerificationFailed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingOtp,
    TResult Function(String message)? otpSent,
    TResult Function(String error)? otpSendFailed,
    TResult Function()? verifyingOtp,
    TResult Function()? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
    TResult Function()? registrationLoading,
    TResult Function(String message)? registrationSuccess,
    TResult Function(String error)? registrationFailure,
    required TResult orElse(),
  }) {
    if (otpVerificationFailed != null) {
      return otpVerificationFailed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingOtp value) sendingOtp,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_OtpSendFailed value) otpSendFailed,
    required TResult Function(_VerifyingOtp value) verifyingOtp,
    required TResult Function(_OtpVerified value) otpVerified,
    required TResult Function(_OtpVerificationFailed value)
    otpVerificationFailed,
    required TResult Function(_RegistrationLoading value) registrationLoading,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_RegistrationFailure value) registrationFailure,
  }) {
    return otpVerificationFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingOtp value)? sendingOtp,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_OtpSendFailed value)? otpSendFailed,
    TResult? Function(_VerifyingOtp value)? verifyingOtp,
    TResult? Function(_OtpVerified value)? otpVerified,
    TResult? Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult? Function(_RegistrationLoading value)? registrationLoading,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_RegistrationFailure value)? registrationFailure,
  }) {
    return otpVerificationFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingOtp value)? sendingOtp,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_OtpSendFailed value)? otpSendFailed,
    TResult Function(_VerifyingOtp value)? verifyingOtp,
    TResult Function(_OtpVerified value)? otpVerified,
    TResult Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult Function(_RegistrationLoading value)? registrationLoading,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_RegistrationFailure value)? registrationFailure,
    required TResult orElse(),
  }) {
    if (otpVerificationFailed != null) {
      return otpVerificationFailed(this);
    }
    return orElse();
  }
}

abstract class _OtpVerificationFailed implements RegistrationState {
  const factory _OtpVerificationFailed(final String error) =
      _$OtpVerificationFailedImpl;

  String get error;

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpVerificationFailedImplCopyWith<_$OtpVerificationFailedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegistrationLoadingImplCopyWith<$Res> {
  factory _$$RegistrationLoadingImplCopyWith(
    _$RegistrationLoadingImpl value,
    $Res Function(_$RegistrationLoadingImpl) then,
  ) = __$$RegistrationLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegistrationLoadingImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$RegistrationLoadingImpl>
    implements _$$RegistrationLoadingImplCopyWith<$Res> {
  __$$RegistrationLoadingImplCopyWithImpl(
    _$RegistrationLoadingImpl _value,
    $Res Function(_$RegistrationLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RegistrationLoadingImpl
    with DiagnosticableTreeMixin
    implements _RegistrationLoading {
  const _$RegistrationLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistrationState.registrationLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(
      DiagnosticsProperty('type', 'RegistrationState.registrationLoading'),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingOtp,
    required TResult Function(String message) otpSent,
    required TResult Function(String error) otpSendFailed,
    required TResult Function() verifyingOtp,
    required TResult Function() otpVerified,
    required TResult Function(String error) otpVerificationFailed,
    required TResult Function() registrationLoading,
    required TResult Function(String message) registrationSuccess,
    required TResult Function(String error) registrationFailure,
  }) {
    return registrationLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingOtp,
    TResult? Function(String message)? otpSent,
    TResult? Function(String error)? otpSendFailed,
    TResult? Function()? verifyingOtp,
    TResult? Function()? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
    TResult? Function()? registrationLoading,
    TResult? Function(String message)? registrationSuccess,
    TResult? Function(String error)? registrationFailure,
  }) {
    return registrationLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingOtp,
    TResult Function(String message)? otpSent,
    TResult Function(String error)? otpSendFailed,
    TResult Function()? verifyingOtp,
    TResult Function()? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
    TResult Function()? registrationLoading,
    TResult Function(String message)? registrationSuccess,
    TResult Function(String error)? registrationFailure,
    required TResult orElse(),
  }) {
    if (registrationLoading != null) {
      return registrationLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingOtp value) sendingOtp,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_OtpSendFailed value) otpSendFailed,
    required TResult Function(_VerifyingOtp value) verifyingOtp,
    required TResult Function(_OtpVerified value) otpVerified,
    required TResult Function(_OtpVerificationFailed value)
    otpVerificationFailed,
    required TResult Function(_RegistrationLoading value) registrationLoading,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_RegistrationFailure value) registrationFailure,
  }) {
    return registrationLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingOtp value)? sendingOtp,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_OtpSendFailed value)? otpSendFailed,
    TResult? Function(_VerifyingOtp value)? verifyingOtp,
    TResult? Function(_OtpVerified value)? otpVerified,
    TResult? Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult? Function(_RegistrationLoading value)? registrationLoading,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_RegistrationFailure value)? registrationFailure,
  }) {
    return registrationLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingOtp value)? sendingOtp,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_OtpSendFailed value)? otpSendFailed,
    TResult Function(_VerifyingOtp value)? verifyingOtp,
    TResult Function(_OtpVerified value)? otpVerified,
    TResult Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult Function(_RegistrationLoading value)? registrationLoading,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_RegistrationFailure value)? registrationFailure,
    required TResult orElse(),
  }) {
    if (registrationLoading != null) {
      return registrationLoading(this);
    }
    return orElse();
  }
}

abstract class _RegistrationLoading implements RegistrationState {
  const factory _RegistrationLoading() = _$RegistrationLoadingImpl;
}

/// @nodoc
abstract class _$$RegistrationSuccessImplCopyWith<$Res> {
  factory _$$RegistrationSuccessImplCopyWith(
    _$RegistrationSuccessImpl value,
    $Res Function(_$RegistrationSuccessImpl) then,
  ) = __$$RegistrationSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RegistrationSuccessImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$RegistrationSuccessImpl>
    implements _$$RegistrationSuccessImplCopyWith<$Res> {
  __$$RegistrationSuccessImplCopyWithImpl(
    _$RegistrationSuccessImpl _value,
    $Res Function(_$RegistrationSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$RegistrationSuccessImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$RegistrationSuccessImpl
    with DiagnosticableTreeMixin
    implements _RegistrationSuccess {
  const _$RegistrationSuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistrationState.registrationSuccess(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty('type', 'RegistrationState.registrationSuccess'),
      )
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationSuccessImplCopyWith<_$RegistrationSuccessImpl> get copyWith =>
      __$$RegistrationSuccessImplCopyWithImpl<_$RegistrationSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingOtp,
    required TResult Function(String message) otpSent,
    required TResult Function(String error) otpSendFailed,
    required TResult Function() verifyingOtp,
    required TResult Function() otpVerified,
    required TResult Function(String error) otpVerificationFailed,
    required TResult Function() registrationLoading,
    required TResult Function(String message) registrationSuccess,
    required TResult Function(String error) registrationFailure,
  }) {
    return registrationSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingOtp,
    TResult? Function(String message)? otpSent,
    TResult? Function(String error)? otpSendFailed,
    TResult? Function()? verifyingOtp,
    TResult? Function()? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
    TResult? Function()? registrationLoading,
    TResult? Function(String message)? registrationSuccess,
    TResult? Function(String error)? registrationFailure,
  }) {
    return registrationSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingOtp,
    TResult Function(String message)? otpSent,
    TResult Function(String error)? otpSendFailed,
    TResult Function()? verifyingOtp,
    TResult Function()? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
    TResult Function()? registrationLoading,
    TResult Function(String message)? registrationSuccess,
    TResult Function(String error)? registrationFailure,
    required TResult orElse(),
  }) {
    if (registrationSuccess != null) {
      return registrationSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingOtp value) sendingOtp,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_OtpSendFailed value) otpSendFailed,
    required TResult Function(_VerifyingOtp value) verifyingOtp,
    required TResult Function(_OtpVerified value) otpVerified,
    required TResult Function(_OtpVerificationFailed value)
    otpVerificationFailed,
    required TResult Function(_RegistrationLoading value) registrationLoading,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_RegistrationFailure value) registrationFailure,
  }) {
    return registrationSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingOtp value)? sendingOtp,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_OtpSendFailed value)? otpSendFailed,
    TResult? Function(_VerifyingOtp value)? verifyingOtp,
    TResult? Function(_OtpVerified value)? otpVerified,
    TResult? Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult? Function(_RegistrationLoading value)? registrationLoading,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_RegistrationFailure value)? registrationFailure,
  }) {
    return registrationSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingOtp value)? sendingOtp,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_OtpSendFailed value)? otpSendFailed,
    TResult Function(_VerifyingOtp value)? verifyingOtp,
    TResult Function(_OtpVerified value)? otpVerified,
    TResult Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult Function(_RegistrationLoading value)? registrationLoading,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_RegistrationFailure value)? registrationFailure,
    required TResult orElse(),
  }) {
    if (registrationSuccess != null) {
      return registrationSuccess(this);
    }
    return orElse();
  }
}

abstract class _RegistrationSuccess implements RegistrationState {
  const factory _RegistrationSuccess(final String message) =
      _$RegistrationSuccessImpl;

  String get message;

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationSuccessImplCopyWith<_$RegistrationSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegistrationFailureImplCopyWith<$Res> {
  factory _$$RegistrationFailureImplCopyWith(
    _$RegistrationFailureImpl value,
    $Res Function(_$RegistrationFailureImpl) then,
  ) = __$$RegistrationFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$RegistrationFailureImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$RegistrationFailureImpl>
    implements _$$RegistrationFailureImplCopyWith<$Res> {
  __$$RegistrationFailureImplCopyWithImpl(
    _$RegistrationFailureImpl _value,
    $Res Function(_$RegistrationFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$RegistrationFailureImpl(
        null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$RegistrationFailureImpl
    with DiagnosticableTreeMixin
    implements _RegistrationFailure {
  const _$RegistrationFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistrationState.registrationFailure(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty('type', 'RegistrationState.registrationFailure'),
      )
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationFailureImplCopyWith<_$RegistrationFailureImpl> get copyWith =>
      __$$RegistrationFailureImplCopyWithImpl<_$RegistrationFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingOtp,
    required TResult Function(String message) otpSent,
    required TResult Function(String error) otpSendFailed,
    required TResult Function() verifyingOtp,
    required TResult Function() otpVerified,
    required TResult Function(String error) otpVerificationFailed,
    required TResult Function() registrationLoading,
    required TResult Function(String message) registrationSuccess,
    required TResult Function(String error) registrationFailure,
  }) {
    return registrationFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingOtp,
    TResult? Function(String message)? otpSent,
    TResult? Function(String error)? otpSendFailed,
    TResult? Function()? verifyingOtp,
    TResult? Function()? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
    TResult? Function()? registrationLoading,
    TResult? Function(String message)? registrationSuccess,
    TResult? Function(String error)? registrationFailure,
  }) {
    return registrationFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingOtp,
    TResult Function(String message)? otpSent,
    TResult Function(String error)? otpSendFailed,
    TResult Function()? verifyingOtp,
    TResult Function()? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
    TResult Function()? registrationLoading,
    TResult Function(String message)? registrationSuccess,
    TResult Function(String error)? registrationFailure,
    required TResult orElse(),
  }) {
    if (registrationFailure != null) {
      return registrationFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingOtp value) sendingOtp,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_OtpSendFailed value) otpSendFailed,
    required TResult Function(_VerifyingOtp value) verifyingOtp,
    required TResult Function(_OtpVerified value) otpVerified,
    required TResult Function(_OtpVerificationFailed value)
    otpVerificationFailed,
    required TResult Function(_RegistrationLoading value) registrationLoading,
    required TResult Function(_RegistrationSuccess value) registrationSuccess,
    required TResult Function(_RegistrationFailure value) registrationFailure,
  }) {
    return registrationFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingOtp value)? sendingOtp,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_OtpSendFailed value)? otpSendFailed,
    TResult? Function(_VerifyingOtp value)? verifyingOtp,
    TResult? Function(_OtpVerified value)? otpVerified,
    TResult? Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult? Function(_RegistrationLoading value)? registrationLoading,
    TResult? Function(_RegistrationSuccess value)? registrationSuccess,
    TResult? Function(_RegistrationFailure value)? registrationFailure,
  }) {
    return registrationFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingOtp value)? sendingOtp,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_OtpSendFailed value)? otpSendFailed,
    TResult Function(_VerifyingOtp value)? verifyingOtp,
    TResult Function(_OtpVerified value)? otpVerified,
    TResult Function(_OtpVerificationFailed value)? otpVerificationFailed,
    TResult Function(_RegistrationLoading value)? registrationLoading,
    TResult Function(_RegistrationSuccess value)? registrationSuccess,
    TResult Function(_RegistrationFailure value)? registrationFailure,
    required TResult orElse(),
  }) {
    if (registrationFailure != null) {
      return registrationFailure(this);
    }
    return orElse();
  }
}

abstract class _RegistrationFailure implements RegistrationState {
  const factory _RegistrationFailure(final String error) =
      _$RegistrationFailureImpl;

  String get error;

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationFailureImplCopyWith<_$RegistrationFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
