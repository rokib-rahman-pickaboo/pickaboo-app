// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OtpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String identifier,
      String type,
      bool resend,
      String? recaptchaToken,
    )
    sendOtp,
    required TResult Function(String identifier, String otp, String type)
    verifyOtp,
    required TResult Function() resetState,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String identifier,
      String type,
      bool resend,
      String? recaptchaToken,
    )?
    sendOtp,
    TResult? Function(String identifier, String otp, String type)? verifyOtp,
    TResult? Function()? resetState,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String identifier,
      String type,
      bool resend,
      String? recaptchaToken,
    )?
    sendOtp,
    TResult Function(String identifier, String otp, String type)? verifyOtp,
    TResult Function()? resetState,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetState value) resetState,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetState value)? resetState,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetState value)? resetState,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpEventCopyWith<$Res> {
  factory $OtpEventCopyWith(OtpEvent value, $Res Function(OtpEvent) then) =
      _$OtpEventCopyWithImpl<$Res, OtpEvent>;
}

/// @nodoc
class _$OtpEventCopyWithImpl<$Res, $Val extends OtpEvent>
    implements $OtpEventCopyWith<$Res> {
  _$OtpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SendOtpImplCopyWith<$Res> {
  factory _$$SendOtpImplCopyWith(
    _$SendOtpImpl value,
    $Res Function(_$SendOtpImpl) then,
  ) = __$$SendOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String identifier,
    String type,
    bool resend,
    String? recaptchaToken,
  });
}

/// @nodoc
class __$$SendOtpImplCopyWithImpl<$Res>
    extends _$OtpEventCopyWithImpl<$Res, _$SendOtpImpl>
    implements _$$SendOtpImplCopyWith<$Res> {
  __$$SendOtpImplCopyWithImpl(
    _$SendOtpImpl _value,
    $Res Function(_$SendOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? type = null,
    Object? resend = null,
    Object? recaptchaToken = freezed,
  }) {
    return _then(
      _$SendOtpImpl(
        identifier:
            null == identifier
                ? _value.identifier
                : identifier // ignore: cast_nullable_to_non_nullable
                    as String,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String,
        resend:
            null == resend
                ? _value.resend
                : resend // ignore: cast_nullable_to_non_nullable
                    as bool,
        recaptchaToken:
            freezed == recaptchaToken
                ? _value.recaptchaToken
                : recaptchaToken // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$SendOtpImpl with DiagnosticableTreeMixin implements _SendOtp {
  const _$SendOtpImpl({
    required this.identifier,
    required this.type,
    this.resend = false,
    this.recaptchaToken,
  });

  @override
  final String identifier;
  @override
  final String type;
  @override
  @JsonKey()
  final bool resend;
  @override
  final String? recaptchaToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OtpEvent.sendOtp(identifier: $identifier, type: $type, resend: $resend, recaptchaToken: $recaptchaToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OtpEvent.sendOtp'))
      ..add(DiagnosticsProperty('identifier', identifier))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('resend', resend))
      ..add(DiagnosticsProperty('recaptchaToken', recaptchaToken));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtpImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.resend, resend) || other.resend == resend) &&
            (identical(other.recaptchaToken, recaptchaToken) ||
                other.recaptchaToken == recaptchaToken));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, identifier, type, resend, recaptchaToken);

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOtpImplCopyWith<_$SendOtpImpl> get copyWith =>
      __$$SendOtpImplCopyWithImpl<_$SendOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String identifier,
      String type,
      bool resend,
      String? recaptchaToken,
    )
    sendOtp,
    required TResult Function(String identifier, String otp, String type)
    verifyOtp,
    required TResult Function() resetState,
  }) {
    return sendOtp(identifier, type, resend, recaptchaToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String identifier,
      String type,
      bool resend,
      String? recaptchaToken,
    )?
    sendOtp,
    TResult? Function(String identifier, String otp, String type)? verifyOtp,
    TResult? Function()? resetState,
  }) {
    return sendOtp?.call(identifier, type, resend, recaptchaToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String identifier,
      String type,
      bool resend,
      String? recaptchaToken,
    )?
    sendOtp,
    TResult Function(String identifier, String otp, String type)? verifyOtp,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(identifier, type, resend, recaptchaToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetState value) resetState,
  }) {
    return sendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetState value)? resetState,
  }) {
    return sendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(this);
    }
    return orElse();
  }
}

abstract class _SendOtp implements OtpEvent {
  const factory _SendOtp({
    required final String identifier,
    required final String type,
    final bool resend,
    final String? recaptchaToken,
  }) = _$SendOtpImpl;

  String get identifier;
  String get type;
  bool get resend;
  String? get recaptchaToken;

  /// Create a copy of OtpEvent
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
  $Res call({String identifier, String otp, String type});
}

/// @nodoc
class __$$VerifyOtpImplCopyWithImpl<$Res>
    extends _$OtpEventCopyWithImpl<$Res, _$VerifyOtpImpl>
    implements _$$VerifyOtpImplCopyWith<$Res> {
  __$$VerifyOtpImplCopyWithImpl(
    _$VerifyOtpImpl _value,
    $Res Function(_$VerifyOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? otp = null,
    Object? type = null,
  }) {
    return _then(
      _$VerifyOtpImpl(
        identifier:
            null == identifier
                ? _value.identifier
                : identifier // ignore: cast_nullable_to_non_nullable
                    as String,
        otp:
            null == otp
                ? _value.otp
                : otp // ignore: cast_nullable_to_non_nullable
                    as String,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$VerifyOtpImpl with DiagnosticableTreeMixin implements _VerifyOtp {
  const _$VerifyOtpImpl({
    required this.identifier,
    required this.otp,
    required this.type,
  });

  @override
  final String identifier;
  @override
  final String otp;
  @override
  final String type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OtpEvent.verifyOtp(identifier: $identifier, otp: $otp, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OtpEvent.verifyOtp'))
      ..add(DiagnosticsProperty('identifier', identifier))
      ..add(DiagnosticsProperty('otp', otp))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identifier, otp, type);

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      __$$VerifyOtpImplCopyWithImpl<_$VerifyOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String identifier,
      String type,
      bool resend,
      String? recaptchaToken,
    )
    sendOtp,
    required TResult Function(String identifier, String otp, String type)
    verifyOtp,
    required TResult Function() resetState,
  }) {
    return verifyOtp(identifier, otp, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String identifier,
      String type,
      bool resend,
      String? recaptchaToken,
    )?
    sendOtp,
    TResult? Function(String identifier, String otp, String type)? verifyOtp,
    TResult? Function()? resetState,
  }) {
    return verifyOtp?.call(identifier, otp, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String identifier,
      String type,
      bool resend,
      String? recaptchaToken,
    )?
    sendOtp,
    TResult Function(String identifier, String otp, String type)? verifyOtp,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(identifier, otp, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetState value) resetState,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetState value)? resetState,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class _VerifyOtp implements OtpEvent {
  const factory _VerifyOtp({
    required final String identifier,
    required final String otp,
    required final String type,
  }) = _$VerifyOtpImpl;

  String get identifier;
  String get otp;
  String get type;

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetStateImplCopyWith<$Res> {
  factory _$$ResetStateImplCopyWith(
    _$ResetStateImpl value,
    $Res Function(_$ResetStateImpl) then,
  ) = __$$ResetStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetStateImplCopyWithImpl<$Res>
    extends _$OtpEventCopyWithImpl<$Res, _$ResetStateImpl>
    implements _$$ResetStateImplCopyWith<$Res> {
  __$$ResetStateImplCopyWithImpl(
    _$ResetStateImpl _value,
    $Res Function(_$ResetStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetStateImpl with DiagnosticableTreeMixin implements _ResetState {
  const _$ResetStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OtpEvent.resetState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'OtpEvent.resetState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String identifier,
      String type,
      bool resend,
      String? recaptchaToken,
    )
    sendOtp,
    required TResult Function(String identifier, String otp, String type)
    verifyOtp,
    required TResult Function() resetState,
  }) {
    return resetState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String identifier,
      String type,
      bool resend,
      String? recaptchaToken,
    )?
    sendOtp,
    TResult? Function(String identifier, String otp, String type)? verifyOtp,
    TResult? Function()? resetState,
  }) {
    return resetState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String identifier,
      String type,
      bool resend,
      String? recaptchaToken,
    )?
    sendOtp,
    TResult Function(String identifier, String otp, String type)? verifyOtp,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetState value) resetState,
  }) {
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetState value)? resetState,
  }) {
    return resetState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState(this);
    }
    return orElse();
  }
}

abstract class _ResetState implements OtpEvent {
  const factory _ResetState() = _$ResetStateImpl;
}

/// @nodoc
mixin _$OtpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingOtp,
    required TResult Function(String message) otpSent,
    required TResult Function(String error) otpSendFailed,
    required TResult Function() verifyingOtp,
    required TResult Function(String message) otpVerified,
    required TResult Function(String error) otpVerificationFailed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingOtp,
    TResult? Function(String message)? otpSent,
    TResult? Function(String error)? otpSendFailed,
    TResult? Function()? verifyingOtp,
    TResult? Function(String message)? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingOtp,
    TResult Function(String message)? otpSent,
    TResult Function(String error)? otpSendFailed,
    TResult Function()? verifyingOtp,
    TResult Function(String message)? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
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
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpStateCopyWith<$Res> {
  factory $OtpStateCopyWith(OtpState value, $Res Function(OtpState) then) =
      _$OtpStateCopyWithImpl<$Res, OtpState>;
}

/// @nodoc
class _$OtpStateCopyWithImpl<$Res, $Val extends OtpState>
    implements $OtpStateCopyWith<$Res> {
  _$OtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpState
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
    extends _$OtpStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OtpState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'OtpState.initial'));
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
    required TResult Function(String message) otpVerified,
    required TResult Function(String error) otpVerificationFailed,
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
    TResult? Function(String message)? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
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
    TResult Function(String message)? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
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
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OtpState {
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
    extends _$OtpStateCopyWithImpl<$Res, _$SendingOtpImpl>
    implements _$$SendingOtpImplCopyWith<$Res> {
  __$$SendingOtpImplCopyWithImpl(
    _$SendingOtpImpl _value,
    $Res Function(_$SendingOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendingOtpImpl with DiagnosticableTreeMixin implements _SendingOtp {
  const _$SendingOtpImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OtpState.sendingOtp()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'OtpState.sendingOtp'));
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
    required TResult Function(String message) otpVerified,
    required TResult Function(String error) otpVerificationFailed,
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
    TResult? Function(String message)? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
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
    TResult Function(String message)? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
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
    required TResult orElse(),
  }) {
    if (sendingOtp != null) {
      return sendingOtp(this);
    }
    return orElse();
  }
}

abstract class _SendingOtp implements OtpState {
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
    extends _$OtpStateCopyWithImpl<$Res, _$OtpSentImpl>
    implements _$$OtpSentImplCopyWith<$Res> {
  __$$OtpSentImplCopyWithImpl(
    _$OtpSentImpl _value,
    $Res Function(_$OtpSentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
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
    return 'OtpState.otpSent(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OtpState.otpSent'))
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

  /// Create a copy of OtpState
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
    required TResult Function(String message) otpVerified,
    required TResult Function(String error) otpVerificationFailed,
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
    TResult? Function(String message)? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
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
    TResult Function(String message)? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
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
    required TResult orElse(),
  }) {
    if (otpSent != null) {
      return otpSent(this);
    }
    return orElse();
  }
}

abstract class _OtpSent implements OtpState {
  const factory _OtpSent(final String message) = _$OtpSentImpl;

  String get message;

  /// Create a copy of OtpState
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
    extends _$OtpStateCopyWithImpl<$Res, _$OtpSendFailedImpl>
    implements _$$OtpSendFailedImplCopyWith<$Res> {
  __$$OtpSendFailedImplCopyWithImpl(
    _$OtpSendFailedImpl _value,
    $Res Function(_$OtpSendFailedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
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
    return 'OtpState.otpSendFailed(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OtpState.otpSendFailed'))
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

  /// Create a copy of OtpState
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
    required TResult Function(String message) otpVerified,
    required TResult Function(String error) otpVerificationFailed,
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
    TResult? Function(String message)? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
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
    TResult Function(String message)? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
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
    required TResult orElse(),
  }) {
    if (otpSendFailed != null) {
      return otpSendFailed(this);
    }
    return orElse();
  }
}

abstract class _OtpSendFailed implements OtpState {
  const factory _OtpSendFailed(final String error) = _$OtpSendFailedImpl;

  String get error;

  /// Create a copy of OtpState
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
    extends _$OtpStateCopyWithImpl<$Res, _$VerifyingOtpImpl>
    implements _$$VerifyingOtpImplCopyWith<$Res> {
  __$$VerifyingOtpImplCopyWithImpl(
    _$VerifyingOtpImpl _value,
    $Res Function(_$VerifyingOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VerifyingOtpImpl with DiagnosticableTreeMixin implements _VerifyingOtp {
  const _$VerifyingOtpImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OtpState.verifyingOtp()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'OtpState.verifyingOtp'));
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
    required TResult Function(String message) otpVerified,
    required TResult Function(String error) otpVerificationFailed,
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
    TResult? Function(String message)? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
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
    TResult Function(String message)? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
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
    required TResult orElse(),
  }) {
    if (verifyingOtp != null) {
      return verifyingOtp(this);
    }
    return orElse();
  }
}

abstract class _VerifyingOtp implements OtpState {
  const factory _VerifyingOtp() = _$VerifyingOtpImpl;
}

/// @nodoc
abstract class _$$OtpVerifiedImplCopyWith<$Res> {
  factory _$$OtpVerifiedImplCopyWith(
    _$OtpVerifiedImpl value,
    $Res Function(_$OtpVerifiedImpl) then,
  ) = __$$OtpVerifiedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$OtpVerifiedImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$OtpVerifiedImpl>
    implements _$$OtpVerifiedImplCopyWith<$Res> {
  __$$OtpVerifiedImplCopyWithImpl(
    _$OtpVerifiedImpl _value,
    $Res Function(_$OtpVerifiedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$OtpVerifiedImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$OtpVerifiedImpl with DiagnosticableTreeMixin implements _OtpVerified {
  const _$OtpVerifiedImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OtpState.otpVerified(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OtpState.otpVerified'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpVerifiedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpVerifiedImplCopyWith<_$OtpVerifiedImpl> get copyWith =>
      __$$OtpVerifiedImplCopyWithImpl<_$OtpVerifiedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingOtp,
    required TResult Function(String message) otpSent,
    required TResult Function(String error) otpSendFailed,
    required TResult Function() verifyingOtp,
    required TResult Function(String message) otpVerified,
    required TResult Function(String error) otpVerificationFailed,
  }) {
    return otpVerified(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingOtp,
    TResult? Function(String message)? otpSent,
    TResult? Function(String error)? otpSendFailed,
    TResult? Function()? verifyingOtp,
    TResult? Function(String message)? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
  }) {
    return otpVerified?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingOtp,
    TResult Function(String message)? otpSent,
    TResult Function(String error)? otpSendFailed,
    TResult Function()? verifyingOtp,
    TResult Function(String message)? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
    required TResult orElse(),
  }) {
    if (otpVerified != null) {
      return otpVerified(message);
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
    required TResult orElse(),
  }) {
    if (otpVerified != null) {
      return otpVerified(this);
    }
    return orElse();
  }
}

abstract class _OtpVerified implements OtpState {
  const factory _OtpVerified(final String message) = _$OtpVerifiedImpl;

  String get message;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpVerifiedImplCopyWith<_$OtpVerifiedImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$OtpStateCopyWithImpl<$Res, _$OtpVerificationFailedImpl>
    implements _$$OtpVerificationFailedImplCopyWith<$Res> {
  __$$OtpVerificationFailedImplCopyWithImpl(
    _$OtpVerificationFailedImpl _value,
    $Res Function(_$OtpVerificationFailedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
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
    return 'OtpState.otpVerificationFailed(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OtpState.otpVerificationFailed'))
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

  /// Create a copy of OtpState
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
    required TResult Function(String message) otpVerified,
    required TResult Function(String error) otpVerificationFailed,
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
    TResult? Function(String message)? otpVerified,
    TResult? Function(String error)? otpVerificationFailed,
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
    TResult Function(String message)? otpVerified,
    TResult Function(String error)? otpVerificationFailed,
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
    required TResult orElse(),
  }) {
    if (otpVerificationFailed != null) {
      return otpVerificationFailed(this);
    }
    return orElse();
  }
}

abstract class _OtpVerificationFailed implements OtpState {
  const factory _OtpVerificationFailed(final String error) =
      _$OtpVerificationFailedImpl;

  String get error;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpVerificationFailedImplCopyWith<_$OtpVerificationFailedImpl>
  get copyWith => throw _privateConstructorUsedError;
}
