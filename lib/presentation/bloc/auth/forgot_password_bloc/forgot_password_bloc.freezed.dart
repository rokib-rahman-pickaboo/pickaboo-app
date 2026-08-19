// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ForgotPasswordEvent {
  String get identifier => throw _privateConstructorUsedError;
  bool get isEmail => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String identifier, bool isEmail) sendOtp,
    required TResult Function(
      String identifier,
      bool isEmail,
      String otp,
      String newPassword,
    )
    resetPassword,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String identifier, bool isEmail)? sendOtp,
    TResult? Function(
      String identifier,
      bool isEmail,
      String otp,
      String newPassword,
    )?
    resetPassword,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String identifier, bool isEmail)? sendOtp,
    TResult Function(
      String identifier,
      bool isEmail,
      String otp,
      String newPassword,
    )?
    resetPassword,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_ResetPassword value) resetPassword,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgotPasswordEventCopyWith<ForgotPasswordEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordEventCopyWith<$Res> {
  factory $ForgotPasswordEventCopyWith(
    ForgotPasswordEvent value,
    $Res Function(ForgotPasswordEvent) then,
  ) = _$ForgotPasswordEventCopyWithImpl<$Res, ForgotPasswordEvent>;
  @useResult
  $Res call({String identifier, bool isEmail});
}

/// @nodoc
class _$ForgotPasswordEventCopyWithImpl<$Res, $Val extends ForgotPasswordEvent>
    implements $ForgotPasswordEventCopyWith<$Res> {
  _$ForgotPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? identifier = null, Object? isEmail = null}) {
    return _then(
      _value.copyWith(
            identifier:
                null == identifier
                    ? _value.identifier
                    : identifier // ignore: cast_nullable_to_non_nullable
                        as String,
            isEmail:
                null == isEmail
                    ? _value.isEmail
                    : isEmail // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SendOtpImplCopyWith<$Res>
    implements $ForgotPasswordEventCopyWith<$Res> {
  factory _$$SendOtpImplCopyWith(
    _$SendOtpImpl value,
    $Res Function(_$SendOtpImpl) then,
  ) = __$$SendOtpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String identifier, bool isEmail});
}

/// @nodoc
class __$$SendOtpImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$SendOtpImpl>
    implements _$$SendOtpImplCopyWith<$Res> {
  __$$SendOtpImplCopyWithImpl(
    _$SendOtpImpl _value,
    $Res Function(_$SendOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? identifier = null, Object? isEmail = null}) {
    return _then(
      _$SendOtpImpl(
        identifier:
            null == identifier
                ? _value.identifier
                : identifier // ignore: cast_nullable_to_non_nullable
                    as String,
        isEmail:
            null == isEmail
                ? _value.isEmail
                : isEmail // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$SendOtpImpl with DiagnosticableTreeMixin implements _SendOtp {
  const _$SendOtpImpl({required this.identifier, required this.isEmail});

  @override
  final String identifier;
  @override
  final bool isEmail;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordEvent.sendOtp(identifier: $identifier, isEmail: $isEmail)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForgotPasswordEvent.sendOtp'))
      ..add(DiagnosticsProperty('identifier', identifier))
      ..add(DiagnosticsProperty('isEmail', isEmail));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtpImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.isEmail, isEmail) || other.isEmail == isEmail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identifier, isEmail);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOtpImplCopyWith<_$SendOtpImpl> get copyWith =>
      __$$SendOtpImplCopyWithImpl<_$SendOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String identifier, bool isEmail) sendOtp,
    required TResult Function(
      String identifier,
      bool isEmail,
      String otp,
      String newPassword,
    )
    resetPassword,
  }) {
    return sendOtp(identifier, isEmail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String identifier, bool isEmail)? sendOtp,
    TResult? Function(
      String identifier,
      bool isEmail,
      String otp,
      String newPassword,
    )?
    resetPassword,
  }) {
    return sendOtp?.call(identifier, isEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String identifier, bool isEmail)? sendOtp,
    TResult Function(
      String identifier,
      bool isEmail,
      String otp,
      String newPassword,
    )?
    resetPassword,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(identifier, isEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_ResetPassword value) resetPassword,
  }) {
    return sendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
  }) {
    return sendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(this);
    }
    return orElse();
  }
}

abstract class _SendOtp implements ForgotPasswordEvent {
  const factory _SendOtp({
    required final String identifier,
    required final bool isEmail,
  }) = _$SendOtpImpl;

  @override
  String get identifier;
  @override
  bool get isEmail;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOtpImplCopyWith<_$SendOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordImplCopyWith<$Res>
    implements $ForgotPasswordEventCopyWith<$Res> {
  factory _$$ResetPasswordImplCopyWith(
    _$ResetPasswordImpl value,
    $Res Function(_$ResetPasswordImpl) then,
  ) = __$$ResetPasswordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String identifier, bool isEmail, String otp, String newPassword});
}

/// @nodoc
class __$$ResetPasswordImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$ResetPasswordImpl>
    implements _$$ResetPasswordImplCopyWith<$Res> {
  __$$ResetPasswordImplCopyWithImpl(
    _$ResetPasswordImpl _value,
    $Res Function(_$ResetPasswordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? isEmail = null,
    Object? otp = null,
    Object? newPassword = null,
  }) {
    return _then(
      _$ResetPasswordImpl(
        identifier:
            null == identifier
                ? _value.identifier
                : identifier // ignore: cast_nullable_to_non_nullable
                    as String,
        isEmail:
            null == isEmail
                ? _value.isEmail
                : isEmail // ignore: cast_nullable_to_non_nullable
                    as bool,
        otp:
            null == otp
                ? _value.otp
                : otp // ignore: cast_nullable_to_non_nullable
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

class _$ResetPasswordImpl
    with DiagnosticableTreeMixin
    implements _ResetPassword {
  const _$ResetPasswordImpl({
    required this.identifier,
    required this.isEmail,
    required this.otp,
    required this.newPassword,
  });

  @override
  final String identifier;
  @override
  final bool isEmail;
  @override
  final String otp;
  @override
  final String newPassword;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordEvent.resetPassword(identifier: $identifier, isEmail: $isEmail, otp: $otp, newPassword: $newPassword)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForgotPasswordEvent.resetPassword'))
      ..add(DiagnosticsProperty('identifier', identifier))
      ..add(DiagnosticsProperty('isEmail', isEmail))
      ..add(DiagnosticsProperty('otp', otp))
      ..add(DiagnosticsProperty('newPassword', newPassword));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.isEmail, isEmail) || other.isEmail == isEmail) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, identifier, isEmail, otp, newPassword);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordImplCopyWith<_$ResetPasswordImpl> get copyWith =>
      __$$ResetPasswordImplCopyWithImpl<_$ResetPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String identifier, bool isEmail) sendOtp,
    required TResult Function(
      String identifier,
      bool isEmail,
      String otp,
      String newPassword,
    )
    resetPassword,
  }) {
    return resetPassword(identifier, isEmail, otp, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String identifier, bool isEmail)? sendOtp,
    TResult? Function(
      String identifier,
      bool isEmail,
      String otp,
      String newPassword,
    )?
    resetPassword,
  }) {
    return resetPassword?.call(identifier, isEmail, otp, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String identifier, bool isEmail)? sendOtp,
    TResult Function(
      String identifier,
      bool isEmail,
      String otp,
      String newPassword,
    )?
    resetPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(identifier, isEmail, otp, newPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_ResetPassword value) resetPassword,
  }) {
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
  }) {
    return resetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class _ResetPassword implements ForgotPasswordEvent {
  const factory _ResetPassword({
    required final String identifier,
    required final bool isEmail,
    required final String otp,
    required final String newPassword,
  }) = _$ResetPasswordImpl;

  @override
  String get identifier;
  @override
  bool get isEmail;
  String get otp;
  String get newPassword;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordImplCopyWith<_$ResetPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgotPasswordState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingOtp,
    required TResult Function(String message) otpSent,
    required TResult Function(String error) otpSendFailed,
    required TResult Function() resettingPassword,
    required TResult Function(String message) passwordResetSuccess,
    required TResult Function(String error) passwordResetFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingOtp,
    TResult? Function(String message)? otpSent,
    TResult? Function(String error)? otpSendFailed,
    TResult? Function()? resettingPassword,
    TResult? Function(String message)? passwordResetSuccess,
    TResult? Function(String error)? passwordResetFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingOtp,
    TResult Function(String message)? otpSent,
    TResult Function(String error)? otpSendFailed,
    TResult Function()? resettingPassword,
    TResult Function(String message)? passwordResetSuccess,
    TResult Function(String error)? passwordResetFailure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingOtp value) sendingOtp,
    required TResult Function(_OtpSent value) otpSent,
    required TResult Function(_OtpSendFailed value) otpSendFailed,
    required TResult Function(_ResettingPassword value) resettingPassword,
    required TResult Function(_PasswordResetSuccess value) passwordResetSuccess,
    required TResult Function(_PasswordResetFailure value) passwordResetFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingOtp value)? sendingOtp,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_OtpSendFailed value)? otpSendFailed,
    TResult? Function(_ResettingPassword value)? resettingPassword,
    TResult? Function(_PasswordResetSuccess value)? passwordResetSuccess,
    TResult? Function(_PasswordResetFailure value)? passwordResetFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingOtp value)? sendingOtp,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_OtpSendFailed value)? otpSendFailed,
    TResult Function(_ResettingPassword value)? resettingPassword,
    TResult Function(_PasswordResetSuccess value)? passwordResetSuccess,
    TResult Function(_PasswordResetFailure value)? passwordResetFailure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordStateCopyWith(
    ForgotPasswordState value,
    $Res Function(ForgotPasswordState) then,
  ) = _$ForgotPasswordStateCopyWithImpl<$Res, ForgotPasswordState>;
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res, $Val extends ForgotPasswordState>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordState
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
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ForgotPasswordState.initial'));
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
    required TResult Function() resettingPassword,
    required TResult Function(String message) passwordResetSuccess,
    required TResult Function(String error) passwordResetFailure,
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
    TResult? Function()? resettingPassword,
    TResult? Function(String message)? passwordResetSuccess,
    TResult? Function(String error)? passwordResetFailure,
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
    TResult Function()? resettingPassword,
    TResult Function(String message)? passwordResetSuccess,
    TResult Function(String error)? passwordResetFailure,
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
    required TResult Function(_ResettingPassword value) resettingPassword,
    required TResult Function(_PasswordResetSuccess value) passwordResetSuccess,
    required TResult Function(_PasswordResetFailure value) passwordResetFailure,
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
    TResult? Function(_ResettingPassword value)? resettingPassword,
    TResult? Function(_PasswordResetSuccess value)? passwordResetSuccess,
    TResult? Function(_PasswordResetFailure value)? passwordResetFailure,
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
    TResult Function(_ResettingPassword value)? resettingPassword,
    TResult Function(_PasswordResetSuccess value)? passwordResetSuccess,
    TResult Function(_PasswordResetFailure value)? passwordResetFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ForgotPasswordState {
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
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$SendingOtpImpl>
    implements _$$SendingOtpImplCopyWith<$Res> {
  __$$SendingOtpImplCopyWithImpl(
    _$SendingOtpImpl _value,
    $Res Function(_$SendingOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendingOtpImpl with DiagnosticableTreeMixin implements _SendingOtp {
  const _$SendingOtpImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordState.sendingOtp()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForgotPasswordState.sendingOtp'));
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
    required TResult Function() resettingPassword,
    required TResult Function(String message) passwordResetSuccess,
    required TResult Function(String error) passwordResetFailure,
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
    TResult? Function()? resettingPassword,
    TResult? Function(String message)? passwordResetSuccess,
    TResult? Function(String error)? passwordResetFailure,
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
    TResult Function()? resettingPassword,
    TResult Function(String message)? passwordResetSuccess,
    TResult Function(String error)? passwordResetFailure,
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
    required TResult Function(_ResettingPassword value) resettingPassword,
    required TResult Function(_PasswordResetSuccess value) passwordResetSuccess,
    required TResult Function(_PasswordResetFailure value) passwordResetFailure,
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
    TResult? Function(_ResettingPassword value)? resettingPassword,
    TResult? Function(_PasswordResetSuccess value)? passwordResetSuccess,
    TResult? Function(_PasswordResetFailure value)? passwordResetFailure,
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
    TResult Function(_ResettingPassword value)? resettingPassword,
    TResult Function(_PasswordResetSuccess value)? passwordResetSuccess,
    TResult Function(_PasswordResetFailure value)? passwordResetFailure,
    required TResult orElse(),
  }) {
    if (sendingOtp != null) {
      return sendingOtp(this);
    }
    return orElse();
  }
}

abstract class _SendingOtp implements ForgotPasswordState {
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
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$OtpSentImpl>
    implements _$$OtpSentImplCopyWith<$Res> {
  __$$OtpSentImplCopyWithImpl(
    _$OtpSentImpl _value,
    $Res Function(_$OtpSentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordState
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
    return 'ForgotPasswordState.otpSent(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForgotPasswordState.otpSent'))
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

  /// Create a copy of ForgotPasswordState
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
    required TResult Function() resettingPassword,
    required TResult Function(String message) passwordResetSuccess,
    required TResult Function(String error) passwordResetFailure,
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
    TResult? Function()? resettingPassword,
    TResult? Function(String message)? passwordResetSuccess,
    TResult? Function(String error)? passwordResetFailure,
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
    TResult Function()? resettingPassword,
    TResult Function(String message)? passwordResetSuccess,
    TResult Function(String error)? passwordResetFailure,
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
    required TResult Function(_ResettingPassword value) resettingPassword,
    required TResult Function(_PasswordResetSuccess value) passwordResetSuccess,
    required TResult Function(_PasswordResetFailure value) passwordResetFailure,
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
    TResult? Function(_ResettingPassword value)? resettingPassword,
    TResult? Function(_PasswordResetSuccess value)? passwordResetSuccess,
    TResult? Function(_PasswordResetFailure value)? passwordResetFailure,
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
    TResult Function(_ResettingPassword value)? resettingPassword,
    TResult Function(_PasswordResetSuccess value)? passwordResetSuccess,
    TResult Function(_PasswordResetFailure value)? passwordResetFailure,
    required TResult orElse(),
  }) {
    if (otpSent != null) {
      return otpSent(this);
    }
    return orElse();
  }
}

abstract class _OtpSent implements ForgotPasswordState {
  const factory _OtpSent(final String message) = _$OtpSentImpl;

  String get message;

  /// Create a copy of ForgotPasswordState
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
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$OtpSendFailedImpl>
    implements _$$OtpSendFailedImplCopyWith<$Res> {
  __$$OtpSendFailedImplCopyWithImpl(
    _$OtpSendFailedImpl _value,
    $Res Function(_$OtpSendFailedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordState
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
    return 'ForgotPasswordState.otpSendFailed(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForgotPasswordState.otpSendFailed'))
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

  /// Create a copy of ForgotPasswordState
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
    required TResult Function() resettingPassword,
    required TResult Function(String message) passwordResetSuccess,
    required TResult Function(String error) passwordResetFailure,
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
    TResult? Function()? resettingPassword,
    TResult? Function(String message)? passwordResetSuccess,
    TResult? Function(String error)? passwordResetFailure,
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
    TResult Function()? resettingPassword,
    TResult Function(String message)? passwordResetSuccess,
    TResult Function(String error)? passwordResetFailure,
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
    required TResult Function(_ResettingPassword value) resettingPassword,
    required TResult Function(_PasswordResetSuccess value) passwordResetSuccess,
    required TResult Function(_PasswordResetFailure value) passwordResetFailure,
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
    TResult? Function(_ResettingPassword value)? resettingPassword,
    TResult? Function(_PasswordResetSuccess value)? passwordResetSuccess,
    TResult? Function(_PasswordResetFailure value)? passwordResetFailure,
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
    TResult Function(_ResettingPassword value)? resettingPassword,
    TResult Function(_PasswordResetSuccess value)? passwordResetSuccess,
    TResult Function(_PasswordResetFailure value)? passwordResetFailure,
    required TResult orElse(),
  }) {
    if (otpSendFailed != null) {
      return otpSendFailed(this);
    }
    return orElse();
  }
}

abstract class _OtpSendFailed implements ForgotPasswordState {
  const factory _OtpSendFailed(final String error) = _$OtpSendFailedImpl;

  String get error;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpSendFailedImplCopyWith<_$OtpSendFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResettingPasswordImplCopyWith<$Res> {
  factory _$$ResettingPasswordImplCopyWith(
    _$ResettingPasswordImpl value,
    $Res Function(_$ResettingPasswordImpl) then,
  ) = __$$ResettingPasswordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResettingPasswordImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$ResettingPasswordImpl>
    implements _$$ResettingPasswordImplCopyWith<$Res> {
  __$$ResettingPasswordImplCopyWithImpl(
    _$ResettingPasswordImpl _value,
    $Res Function(_$ResettingPasswordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResettingPasswordImpl
    with DiagnosticableTreeMixin
    implements _ResettingPassword {
  const _$ResettingPasswordImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordState.resettingPassword()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(
      DiagnosticsProperty('type', 'ForgotPasswordState.resettingPassword'),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResettingPasswordImpl);
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
    required TResult Function() resettingPassword,
    required TResult Function(String message) passwordResetSuccess,
    required TResult Function(String error) passwordResetFailure,
  }) {
    return resettingPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingOtp,
    TResult? Function(String message)? otpSent,
    TResult? Function(String error)? otpSendFailed,
    TResult? Function()? resettingPassword,
    TResult? Function(String message)? passwordResetSuccess,
    TResult? Function(String error)? passwordResetFailure,
  }) {
    return resettingPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingOtp,
    TResult Function(String message)? otpSent,
    TResult Function(String error)? otpSendFailed,
    TResult Function()? resettingPassword,
    TResult Function(String message)? passwordResetSuccess,
    TResult Function(String error)? passwordResetFailure,
    required TResult orElse(),
  }) {
    if (resettingPassword != null) {
      return resettingPassword();
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
    required TResult Function(_ResettingPassword value) resettingPassword,
    required TResult Function(_PasswordResetSuccess value) passwordResetSuccess,
    required TResult Function(_PasswordResetFailure value) passwordResetFailure,
  }) {
    return resettingPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingOtp value)? sendingOtp,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_OtpSendFailed value)? otpSendFailed,
    TResult? Function(_ResettingPassword value)? resettingPassword,
    TResult? Function(_PasswordResetSuccess value)? passwordResetSuccess,
    TResult? Function(_PasswordResetFailure value)? passwordResetFailure,
  }) {
    return resettingPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingOtp value)? sendingOtp,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_OtpSendFailed value)? otpSendFailed,
    TResult Function(_ResettingPassword value)? resettingPassword,
    TResult Function(_PasswordResetSuccess value)? passwordResetSuccess,
    TResult Function(_PasswordResetFailure value)? passwordResetFailure,
    required TResult orElse(),
  }) {
    if (resettingPassword != null) {
      return resettingPassword(this);
    }
    return orElse();
  }
}

abstract class _ResettingPassword implements ForgotPasswordState {
  const factory _ResettingPassword() = _$ResettingPasswordImpl;
}

/// @nodoc
abstract class _$$PasswordResetSuccessImplCopyWith<$Res> {
  factory _$$PasswordResetSuccessImplCopyWith(
    _$PasswordResetSuccessImpl value,
    $Res Function(_$PasswordResetSuccessImpl) then,
  ) = __$$PasswordResetSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PasswordResetSuccessImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$PasswordResetSuccessImpl>
    implements _$$PasswordResetSuccessImplCopyWith<$Res> {
  __$$PasswordResetSuccessImplCopyWithImpl(
    _$PasswordResetSuccessImpl _value,
    $Res Function(_$PasswordResetSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$PasswordResetSuccessImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$PasswordResetSuccessImpl
    with DiagnosticableTreeMixin
    implements _PasswordResetSuccess {
  const _$PasswordResetSuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordState.passwordResetSuccess(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty('type', 'ForgotPasswordState.passwordResetSuccess'),
      )
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordResetSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordResetSuccessImplCopyWith<_$PasswordResetSuccessImpl>
  get copyWith =>
      __$$PasswordResetSuccessImplCopyWithImpl<_$PasswordResetSuccessImpl>(
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
    required TResult Function() resettingPassword,
    required TResult Function(String message) passwordResetSuccess,
    required TResult Function(String error) passwordResetFailure,
  }) {
    return passwordResetSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingOtp,
    TResult? Function(String message)? otpSent,
    TResult? Function(String error)? otpSendFailed,
    TResult? Function()? resettingPassword,
    TResult? Function(String message)? passwordResetSuccess,
    TResult? Function(String error)? passwordResetFailure,
  }) {
    return passwordResetSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingOtp,
    TResult Function(String message)? otpSent,
    TResult Function(String error)? otpSendFailed,
    TResult Function()? resettingPassword,
    TResult Function(String message)? passwordResetSuccess,
    TResult Function(String error)? passwordResetFailure,
    required TResult orElse(),
  }) {
    if (passwordResetSuccess != null) {
      return passwordResetSuccess(message);
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
    required TResult Function(_ResettingPassword value) resettingPassword,
    required TResult Function(_PasswordResetSuccess value) passwordResetSuccess,
    required TResult Function(_PasswordResetFailure value) passwordResetFailure,
  }) {
    return passwordResetSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingOtp value)? sendingOtp,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_OtpSendFailed value)? otpSendFailed,
    TResult? Function(_ResettingPassword value)? resettingPassword,
    TResult? Function(_PasswordResetSuccess value)? passwordResetSuccess,
    TResult? Function(_PasswordResetFailure value)? passwordResetFailure,
  }) {
    return passwordResetSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingOtp value)? sendingOtp,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_OtpSendFailed value)? otpSendFailed,
    TResult Function(_ResettingPassword value)? resettingPassword,
    TResult Function(_PasswordResetSuccess value)? passwordResetSuccess,
    TResult Function(_PasswordResetFailure value)? passwordResetFailure,
    required TResult orElse(),
  }) {
    if (passwordResetSuccess != null) {
      return passwordResetSuccess(this);
    }
    return orElse();
  }
}

abstract class _PasswordResetSuccess implements ForgotPasswordState {
  const factory _PasswordResetSuccess(final String message) =
      _$PasswordResetSuccessImpl;

  String get message;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordResetSuccessImplCopyWith<_$PasswordResetSuccessImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordResetFailureImplCopyWith<$Res> {
  factory _$$PasswordResetFailureImplCopyWith(
    _$PasswordResetFailureImpl value,
    $Res Function(_$PasswordResetFailureImpl) then,
  ) = __$$PasswordResetFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PasswordResetFailureImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$PasswordResetFailureImpl>
    implements _$$PasswordResetFailureImplCopyWith<$Res> {
  __$$PasswordResetFailureImplCopyWithImpl(
    _$PasswordResetFailureImpl _value,
    $Res Function(_$PasswordResetFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$PasswordResetFailureImpl(
        null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$PasswordResetFailureImpl
    with DiagnosticableTreeMixin
    implements _PasswordResetFailure {
  const _$PasswordResetFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordState.passwordResetFailure(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty('type', 'ForgotPasswordState.passwordResetFailure'),
      )
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordResetFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordResetFailureImplCopyWith<_$PasswordResetFailureImpl>
  get copyWith =>
      __$$PasswordResetFailureImplCopyWithImpl<_$PasswordResetFailureImpl>(
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
    required TResult Function() resettingPassword,
    required TResult Function(String message) passwordResetSuccess,
    required TResult Function(String error) passwordResetFailure,
  }) {
    return passwordResetFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingOtp,
    TResult? Function(String message)? otpSent,
    TResult? Function(String error)? otpSendFailed,
    TResult? Function()? resettingPassword,
    TResult? Function(String message)? passwordResetSuccess,
    TResult? Function(String error)? passwordResetFailure,
  }) {
    return passwordResetFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingOtp,
    TResult Function(String message)? otpSent,
    TResult Function(String error)? otpSendFailed,
    TResult Function()? resettingPassword,
    TResult Function(String message)? passwordResetSuccess,
    TResult Function(String error)? passwordResetFailure,
    required TResult orElse(),
  }) {
    if (passwordResetFailure != null) {
      return passwordResetFailure(error);
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
    required TResult Function(_ResettingPassword value) resettingPassword,
    required TResult Function(_PasswordResetSuccess value) passwordResetSuccess,
    required TResult Function(_PasswordResetFailure value) passwordResetFailure,
  }) {
    return passwordResetFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingOtp value)? sendingOtp,
    TResult? Function(_OtpSent value)? otpSent,
    TResult? Function(_OtpSendFailed value)? otpSendFailed,
    TResult? Function(_ResettingPassword value)? resettingPassword,
    TResult? Function(_PasswordResetSuccess value)? passwordResetSuccess,
    TResult? Function(_PasswordResetFailure value)? passwordResetFailure,
  }) {
    return passwordResetFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingOtp value)? sendingOtp,
    TResult Function(_OtpSent value)? otpSent,
    TResult Function(_OtpSendFailed value)? otpSendFailed,
    TResult Function(_ResettingPassword value)? resettingPassword,
    TResult Function(_PasswordResetSuccess value)? passwordResetSuccess,
    TResult Function(_PasswordResetFailure value)? passwordResetFailure,
    required TResult orElse(),
  }) {
    if (passwordResetFailure != null) {
      return passwordResetFailure(this);
    }
    return orElse();
  }
}

abstract class _PasswordResetFailure implements ForgotPasswordState {
  const factory _PasswordResetFailure(final String error) =
      _$PasswordResetFailureImpl;

  String get error;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordResetFailureImplCopyWith<_$PasswordResetFailureImpl>
  get copyWith => throw _privateConstructorUsedError;
}
