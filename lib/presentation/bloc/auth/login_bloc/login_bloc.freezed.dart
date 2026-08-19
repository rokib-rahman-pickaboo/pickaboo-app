// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) checkUserExists,
    required TResult Function(String username, String password)
    loginWithPassword,
    required TResult Function(
      String accessToken,
      String provider,
      String source,
      String? referralCode,
    )
    loginWithSocial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? checkUserExists,
    TResult? Function(String username, String password)? loginWithPassword,
    TResult? Function(
      String accessToken,
      String provider,
      String source,
      String? referralCode,
    )?
    loginWithSocial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? checkUserExists,
    TResult Function(String username, String password)? loginWithPassword,
    TResult Function(
      String accessToken,
      String provider,
      String source,
      String? referralCode,
    )?
    loginWithSocial,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckUserExists value) checkUserExists,
    required TResult Function(_LoginWithPassword value) loginWithPassword,
    required TResult Function(_LoginWithSocial value) loginWithSocial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckUserExists value)? checkUserExists,
    TResult? Function(_LoginWithPassword value)? loginWithPassword,
    TResult? Function(_LoginWithSocial value)? loginWithSocial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckUserExists value)? checkUserExists,
    TResult Function(_LoginWithPassword value)? loginWithPassword,
    TResult Function(_LoginWithSocial value)? loginWithSocial,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
    LoginEvent value,
    $Res Function(LoginEvent) then,
  ) = _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckUserExistsImplCopyWith<$Res> {
  factory _$$CheckUserExistsImplCopyWith(
    _$CheckUserExistsImpl value,
    $Res Function(_$CheckUserExistsImpl) then,
  ) = __$$CheckUserExistsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$CheckUserExistsImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$CheckUserExistsImpl>
    implements _$$CheckUserExistsImplCopyWith<$Res> {
  __$$CheckUserExistsImplCopyWithImpl(
    _$CheckUserExistsImpl _value,
    $Res Function(_$CheckUserExistsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? username = null}) {
    return _then(
      _$CheckUserExistsImpl(
        null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$CheckUserExistsImpl
    with DiagnosticableTreeMixin
    implements _CheckUserExists {
  const _$CheckUserExistsImpl(this.username);

  @override
  final String username;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginEvent.checkUserExists(username: $username)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginEvent.checkUserExists'))
      ..add(DiagnosticsProperty('username', username));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckUserExistsImpl &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckUserExistsImplCopyWith<_$CheckUserExistsImpl> get copyWith =>
      __$$CheckUserExistsImplCopyWithImpl<_$CheckUserExistsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) checkUserExists,
    required TResult Function(String username, String password)
    loginWithPassword,
    required TResult Function(
      String accessToken,
      String provider,
      String source,
      String? referralCode,
    )
    loginWithSocial,
  }) {
    return checkUserExists(username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? checkUserExists,
    TResult? Function(String username, String password)? loginWithPassword,
    TResult? Function(
      String accessToken,
      String provider,
      String source,
      String? referralCode,
    )?
    loginWithSocial,
  }) {
    return checkUserExists?.call(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? checkUserExists,
    TResult Function(String username, String password)? loginWithPassword,
    TResult Function(
      String accessToken,
      String provider,
      String source,
      String? referralCode,
    )?
    loginWithSocial,
    required TResult orElse(),
  }) {
    if (checkUserExists != null) {
      return checkUserExists(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckUserExists value) checkUserExists,
    required TResult Function(_LoginWithPassword value) loginWithPassword,
    required TResult Function(_LoginWithSocial value) loginWithSocial,
  }) {
    return checkUserExists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckUserExists value)? checkUserExists,
    TResult? Function(_LoginWithPassword value)? loginWithPassword,
    TResult? Function(_LoginWithSocial value)? loginWithSocial,
  }) {
    return checkUserExists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckUserExists value)? checkUserExists,
    TResult Function(_LoginWithPassword value)? loginWithPassword,
    TResult Function(_LoginWithSocial value)? loginWithSocial,
    required TResult orElse(),
  }) {
    if (checkUserExists != null) {
      return checkUserExists(this);
    }
    return orElse();
  }
}

abstract class _CheckUserExists implements LoginEvent {
  const factory _CheckUserExists(final String username) = _$CheckUserExistsImpl;

  String get username;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckUserExistsImplCopyWith<_$CheckUserExistsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginWithPasswordImplCopyWith<$Res> {
  factory _$$LoginWithPasswordImplCopyWith(
    _$LoginWithPasswordImpl value,
    $Res Function(_$LoginWithPasswordImpl) then,
  ) = __$$LoginWithPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$LoginWithPasswordImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginWithPasswordImpl>
    implements _$$LoginWithPasswordImplCopyWith<$Res> {
  __$$LoginWithPasswordImplCopyWithImpl(
    _$LoginWithPasswordImpl _value,
    $Res Function(_$LoginWithPasswordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? username = null, Object? password = null}) {
    return _then(
      _$LoginWithPasswordImpl(
        username:
            null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                    as String,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$LoginWithPasswordImpl
    with DiagnosticableTreeMixin
    implements _LoginWithPassword {
  const _$LoginWithPasswordImpl({
    required this.username,
    required this.password,
  });

  @override
  final String username;
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginEvent.loginWithPassword(username: $username, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginEvent.loginWithPassword'))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithPasswordImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithPasswordImplCopyWith<_$LoginWithPasswordImpl> get copyWith =>
      __$$LoginWithPasswordImplCopyWithImpl<_$LoginWithPasswordImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) checkUserExists,
    required TResult Function(String username, String password)
    loginWithPassword,
    required TResult Function(
      String accessToken,
      String provider,
      String source,
      String? referralCode,
    )
    loginWithSocial,
  }) {
    return loginWithPassword(username, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? checkUserExists,
    TResult? Function(String username, String password)? loginWithPassword,
    TResult? Function(
      String accessToken,
      String provider,
      String source,
      String? referralCode,
    )?
    loginWithSocial,
  }) {
    return loginWithPassword?.call(username, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? checkUserExists,
    TResult Function(String username, String password)? loginWithPassword,
    TResult Function(
      String accessToken,
      String provider,
      String source,
      String? referralCode,
    )?
    loginWithSocial,
    required TResult orElse(),
  }) {
    if (loginWithPassword != null) {
      return loginWithPassword(username, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckUserExists value) checkUserExists,
    required TResult Function(_LoginWithPassword value) loginWithPassword,
    required TResult Function(_LoginWithSocial value) loginWithSocial,
  }) {
    return loginWithPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckUserExists value)? checkUserExists,
    TResult? Function(_LoginWithPassword value)? loginWithPassword,
    TResult? Function(_LoginWithSocial value)? loginWithSocial,
  }) {
    return loginWithPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckUserExists value)? checkUserExists,
    TResult Function(_LoginWithPassword value)? loginWithPassword,
    TResult Function(_LoginWithSocial value)? loginWithSocial,
    required TResult orElse(),
  }) {
    if (loginWithPassword != null) {
      return loginWithPassword(this);
    }
    return orElse();
  }
}

abstract class _LoginWithPassword implements LoginEvent {
  const factory _LoginWithPassword({
    required final String username,
    required final String password,
  }) = _$LoginWithPasswordImpl;

  String get username;
  String get password;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginWithPasswordImplCopyWith<_$LoginWithPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginWithSocialImplCopyWith<$Res> {
  factory _$$LoginWithSocialImplCopyWith(
    _$LoginWithSocialImpl value,
    $Res Function(_$LoginWithSocialImpl) then,
  ) = __$$LoginWithSocialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String accessToken,
    String provider,
    String source,
    String? referralCode,
  });
}

/// @nodoc
class __$$LoginWithSocialImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginWithSocialImpl>
    implements _$$LoginWithSocialImplCopyWith<$Res> {
  __$$LoginWithSocialImplCopyWithImpl(
    _$LoginWithSocialImpl _value,
    $Res Function(_$LoginWithSocialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? provider = null,
    Object? source = null,
    Object? referralCode = freezed,
  }) {
    return _then(
      _$LoginWithSocialImpl(
        accessToken:
            null == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                    as String,
        provider:
            null == provider
                ? _value.provider
                : provider // ignore: cast_nullable_to_non_nullable
                    as String,
        source:
            null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
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

class _$LoginWithSocialImpl
    with DiagnosticableTreeMixin
    implements _LoginWithSocial {
  const _$LoginWithSocialImpl({
    required this.accessToken,
    required this.provider,
    required this.source,
    this.referralCode,
  });

  @override
  final String accessToken;
  @override
  final String provider;
  @override
  final String source;
  @override
  final String? referralCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginEvent.loginWithSocial(accessToken: $accessToken, provider: $provider, source: $source, referralCode: $referralCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginEvent.loginWithSocial'))
      ..add(DiagnosticsProperty('accessToken', accessToken))
      ..add(DiagnosticsProperty('provider', provider))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('referralCode', referralCode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithSocialImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, provider, source, referralCode);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithSocialImplCopyWith<_$LoginWithSocialImpl> get copyWith =>
      __$$LoginWithSocialImplCopyWithImpl<_$LoginWithSocialImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) checkUserExists,
    required TResult Function(String username, String password)
    loginWithPassword,
    required TResult Function(
      String accessToken,
      String provider,
      String source,
      String? referralCode,
    )
    loginWithSocial,
  }) {
    return loginWithSocial(accessToken, provider, source, referralCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? checkUserExists,
    TResult? Function(String username, String password)? loginWithPassword,
    TResult? Function(
      String accessToken,
      String provider,
      String source,
      String? referralCode,
    )?
    loginWithSocial,
  }) {
    return loginWithSocial?.call(accessToken, provider, source, referralCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? checkUserExists,
    TResult Function(String username, String password)? loginWithPassword,
    TResult Function(
      String accessToken,
      String provider,
      String source,
      String? referralCode,
    )?
    loginWithSocial,
    required TResult orElse(),
  }) {
    if (loginWithSocial != null) {
      return loginWithSocial(accessToken, provider, source, referralCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckUserExists value) checkUserExists,
    required TResult Function(_LoginWithPassword value) loginWithPassword,
    required TResult Function(_LoginWithSocial value) loginWithSocial,
  }) {
    return loginWithSocial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckUserExists value)? checkUserExists,
    TResult? Function(_LoginWithPassword value)? loginWithPassword,
    TResult? Function(_LoginWithSocial value)? loginWithSocial,
  }) {
    return loginWithSocial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckUserExists value)? checkUserExists,
    TResult Function(_LoginWithPassword value)? loginWithPassword,
    TResult Function(_LoginWithSocial value)? loginWithSocial,
    required TResult orElse(),
  }) {
    if (loginWithSocial != null) {
      return loginWithSocial(this);
    }
    return orElse();
  }
}

abstract class _LoginWithSocial implements LoginEvent {
  const factory _LoginWithSocial({
    required final String accessToken,
    required final String provider,
    required final String source,
    final String? referralCode,
  }) = _$LoginWithSocialImpl;

  String get accessToken;
  String get provider;
  String get source;
  String? get referralCode;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginWithSocialImplCopyWith<_$LoginWithSocialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingUser,
    required TResult Function(String status, String message, int httpCode)
    userExists,
    required TResult Function(String status, String message, int httpCode)
    userNotFound,
    required TResult Function() loginLoading,
    required TResult Function(String status, bool isLogin) loginSuccess,
    required TResult Function(String error) loginFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingUser,
    TResult? Function(String status, String message, int httpCode)? userExists,
    TResult? Function(String status, String message, int httpCode)?
    userNotFound,
    TResult? Function()? loginLoading,
    TResult? Function(String status, bool isLogin)? loginSuccess,
    TResult? Function(String error)? loginFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingUser,
    TResult Function(String status, String message, int httpCode)? userExists,
    TResult Function(String status, String message, int httpCode)? userNotFound,
    TResult Function()? loginLoading,
    TResult Function(String status, bool isLogin)? loginSuccess,
    TResult Function(String error)? loginFailure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingUser value) checkingUser,
    required TResult Function(_UserExists value) userExists,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_LoginLoading value) loginLoading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_LoginFailure value) loginFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingUser value)? checkingUser,
    TResult? Function(_UserExists value)? userExists,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_LoginLoading value)? loginLoading,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_LoginFailure value)? loginFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingUser value)? checkingUser,
    TResult Function(_UserExists value)? userExists,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_LoginLoading value)? loginLoading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailure value)? loginFailure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
    LoginState value,
    $Res Function(LoginState) then,
  ) = _$LoginStateCopyWithImpl<$Res, LoginState>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
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
    extends _$LoginStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LoginState.initial'));
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
    required TResult Function() checkingUser,
    required TResult Function(String status, String message, int httpCode)
    userExists,
    required TResult Function(String status, String message, int httpCode)
    userNotFound,
    required TResult Function() loginLoading,
    required TResult Function(String status, bool isLogin) loginSuccess,
    required TResult Function(String error) loginFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingUser,
    TResult? Function(String status, String message, int httpCode)? userExists,
    TResult? Function(String status, String message, int httpCode)?
    userNotFound,
    TResult? Function()? loginLoading,
    TResult? Function(String status, bool isLogin)? loginSuccess,
    TResult? Function(String error)? loginFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingUser,
    TResult Function(String status, String message, int httpCode)? userExists,
    TResult Function(String status, String message, int httpCode)? userNotFound,
    TResult Function()? loginLoading,
    TResult Function(String status, bool isLogin)? loginSuccess,
    TResult Function(String error)? loginFailure,
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
    required TResult Function(_CheckingUser value) checkingUser,
    required TResult Function(_UserExists value) userExists,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_LoginLoading value) loginLoading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_LoginFailure value) loginFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingUser value)? checkingUser,
    TResult? Function(_UserExists value)? userExists,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_LoginLoading value)? loginLoading,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_LoginFailure value)? loginFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingUser value)? checkingUser,
    TResult Function(_UserExists value)? userExists,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_LoginLoading value)? loginLoading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailure value)? loginFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LoginState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$CheckingUserImplCopyWith<$Res> {
  factory _$$CheckingUserImplCopyWith(
    _$CheckingUserImpl value,
    $Res Function(_$CheckingUserImpl) then,
  ) = __$$CheckingUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckingUserImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$CheckingUserImpl>
    implements _$$CheckingUserImplCopyWith<$Res> {
  __$$CheckingUserImplCopyWithImpl(
    _$CheckingUserImpl _value,
    $Res Function(_$CheckingUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckingUserImpl with DiagnosticableTreeMixin implements _CheckingUser {
  const _$CheckingUserImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState.checkingUser()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LoginState.checkingUser'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckingUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingUser,
    required TResult Function(String status, String message, int httpCode)
    userExists,
    required TResult Function(String status, String message, int httpCode)
    userNotFound,
    required TResult Function() loginLoading,
    required TResult Function(String status, bool isLogin) loginSuccess,
    required TResult Function(String error) loginFailure,
  }) {
    return checkingUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingUser,
    TResult? Function(String status, String message, int httpCode)? userExists,
    TResult? Function(String status, String message, int httpCode)?
    userNotFound,
    TResult? Function()? loginLoading,
    TResult? Function(String status, bool isLogin)? loginSuccess,
    TResult? Function(String error)? loginFailure,
  }) {
    return checkingUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingUser,
    TResult Function(String status, String message, int httpCode)? userExists,
    TResult Function(String status, String message, int httpCode)? userNotFound,
    TResult Function()? loginLoading,
    TResult Function(String status, bool isLogin)? loginSuccess,
    TResult Function(String error)? loginFailure,
    required TResult orElse(),
  }) {
    if (checkingUser != null) {
      return checkingUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingUser value) checkingUser,
    required TResult Function(_UserExists value) userExists,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_LoginLoading value) loginLoading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_LoginFailure value) loginFailure,
  }) {
    return checkingUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingUser value)? checkingUser,
    TResult? Function(_UserExists value)? userExists,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_LoginLoading value)? loginLoading,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_LoginFailure value)? loginFailure,
  }) {
    return checkingUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingUser value)? checkingUser,
    TResult Function(_UserExists value)? userExists,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_LoginLoading value)? loginLoading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailure value)? loginFailure,
    required TResult orElse(),
  }) {
    if (checkingUser != null) {
      return checkingUser(this);
    }
    return orElse();
  }
}

abstract class _CheckingUser implements LoginState {
  const factory _CheckingUser() = _$CheckingUserImpl;
}

/// @nodoc
abstract class _$$UserExistsImplCopyWith<$Res> {
  factory _$$UserExistsImplCopyWith(
    _$UserExistsImpl value,
    $Res Function(_$UserExistsImpl) then,
  ) = __$$UserExistsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String status, String message, int httpCode});
}

/// @nodoc
class __$$UserExistsImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$UserExistsImpl>
    implements _$$UserExistsImplCopyWith<$Res> {
  __$$UserExistsImplCopyWithImpl(
    _$UserExistsImpl _value,
    $Res Function(_$UserExistsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? httpCode = null,
  }) {
    return _then(
      _$UserExistsImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        httpCode:
            null == httpCode
                ? _value.httpCode
                : httpCode // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$UserExistsImpl with DiagnosticableTreeMixin implements _UserExists {
  const _$UserExistsImpl({
    required this.status,
    required this.message,
    required this.httpCode,
  });

  @override
  final String status;
  @override
  final String message;
  @override
  final int httpCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState.userExists(status: $status, message: $message, httpCode: $httpCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginState.userExists'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('httpCode', httpCode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserExistsImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.httpCode, httpCode) ||
                other.httpCode == httpCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, message, httpCode);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserExistsImplCopyWith<_$UserExistsImpl> get copyWith =>
      __$$UserExistsImplCopyWithImpl<_$UserExistsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingUser,
    required TResult Function(String status, String message, int httpCode)
    userExists,
    required TResult Function(String status, String message, int httpCode)
    userNotFound,
    required TResult Function() loginLoading,
    required TResult Function(String status, bool isLogin) loginSuccess,
    required TResult Function(String error) loginFailure,
  }) {
    return userExists(status, message, httpCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingUser,
    TResult? Function(String status, String message, int httpCode)? userExists,
    TResult? Function(String status, String message, int httpCode)?
    userNotFound,
    TResult? Function()? loginLoading,
    TResult? Function(String status, bool isLogin)? loginSuccess,
    TResult? Function(String error)? loginFailure,
  }) {
    return userExists?.call(status, message, httpCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingUser,
    TResult Function(String status, String message, int httpCode)? userExists,
    TResult Function(String status, String message, int httpCode)? userNotFound,
    TResult Function()? loginLoading,
    TResult Function(String status, bool isLogin)? loginSuccess,
    TResult Function(String error)? loginFailure,
    required TResult orElse(),
  }) {
    if (userExists != null) {
      return userExists(status, message, httpCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingUser value) checkingUser,
    required TResult Function(_UserExists value) userExists,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_LoginLoading value) loginLoading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_LoginFailure value) loginFailure,
  }) {
    return userExists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingUser value)? checkingUser,
    TResult? Function(_UserExists value)? userExists,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_LoginLoading value)? loginLoading,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_LoginFailure value)? loginFailure,
  }) {
    return userExists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingUser value)? checkingUser,
    TResult Function(_UserExists value)? userExists,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_LoginLoading value)? loginLoading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailure value)? loginFailure,
    required TResult orElse(),
  }) {
    if (userExists != null) {
      return userExists(this);
    }
    return orElse();
  }
}

abstract class _UserExists implements LoginState {
  const factory _UserExists({
    required final String status,
    required final String message,
    required final int httpCode,
  }) = _$UserExistsImpl;

  String get status;
  String get message;
  int get httpCode;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserExistsImplCopyWith<_$UserExistsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserNotFoundImplCopyWith<$Res> {
  factory _$$UserNotFoundImplCopyWith(
    _$UserNotFoundImpl value,
    $Res Function(_$UserNotFoundImpl) then,
  ) = __$$UserNotFoundImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String status, String message, int httpCode});
}

/// @nodoc
class __$$UserNotFoundImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$UserNotFoundImpl>
    implements _$$UserNotFoundImplCopyWith<$Res> {
  __$$UserNotFoundImplCopyWithImpl(
    _$UserNotFoundImpl _value,
    $Res Function(_$UserNotFoundImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? httpCode = null,
  }) {
    return _then(
      _$UserNotFoundImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        httpCode:
            null == httpCode
                ? _value.httpCode
                : httpCode // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$UserNotFoundImpl with DiagnosticableTreeMixin implements _UserNotFound {
  const _$UserNotFoundImpl({
    required this.status,
    required this.message,
    required this.httpCode,
  });

  @override
  final String status;
  @override
  final String message;
  @override
  final int httpCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState.userNotFound(status: $status, message: $message, httpCode: $httpCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginState.userNotFound'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('httpCode', httpCode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNotFoundImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.httpCode, httpCode) ||
                other.httpCode == httpCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, message, httpCode);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserNotFoundImplCopyWith<_$UserNotFoundImpl> get copyWith =>
      __$$UserNotFoundImplCopyWithImpl<_$UserNotFoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingUser,
    required TResult Function(String status, String message, int httpCode)
    userExists,
    required TResult Function(String status, String message, int httpCode)
    userNotFound,
    required TResult Function() loginLoading,
    required TResult Function(String status, bool isLogin) loginSuccess,
    required TResult Function(String error) loginFailure,
  }) {
    return userNotFound(status, message, httpCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingUser,
    TResult? Function(String status, String message, int httpCode)? userExists,
    TResult? Function(String status, String message, int httpCode)?
    userNotFound,
    TResult? Function()? loginLoading,
    TResult? Function(String status, bool isLogin)? loginSuccess,
    TResult? Function(String error)? loginFailure,
  }) {
    return userNotFound?.call(status, message, httpCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingUser,
    TResult Function(String status, String message, int httpCode)? userExists,
    TResult Function(String status, String message, int httpCode)? userNotFound,
    TResult Function()? loginLoading,
    TResult Function(String status, bool isLogin)? loginSuccess,
    TResult Function(String error)? loginFailure,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(status, message, httpCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingUser value) checkingUser,
    required TResult Function(_UserExists value) userExists,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_LoginLoading value) loginLoading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_LoginFailure value) loginFailure,
  }) {
    return userNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingUser value)? checkingUser,
    TResult? Function(_UserExists value)? userExists,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_LoginLoading value)? loginLoading,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_LoginFailure value)? loginFailure,
  }) {
    return userNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingUser value)? checkingUser,
    TResult Function(_UserExists value)? userExists,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_LoginLoading value)? loginLoading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailure value)? loginFailure,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(this);
    }
    return orElse();
  }
}

abstract class _UserNotFound implements LoginState {
  const factory _UserNotFound({
    required final String status,
    required final String message,
    required final int httpCode,
  }) = _$UserNotFoundImpl;

  String get status;
  String get message;
  int get httpCode;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserNotFoundImplCopyWith<_$UserNotFoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginLoadingImplCopyWith<$Res> {
  factory _$$LoginLoadingImplCopyWith(
    _$LoginLoadingImpl value,
    $Res Function(_$LoginLoadingImpl) then,
  ) = __$$LoginLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginLoadingImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginLoadingImpl>
    implements _$$LoginLoadingImplCopyWith<$Res> {
  __$$LoginLoadingImplCopyWithImpl(
    _$LoginLoadingImpl _value,
    $Res Function(_$LoginLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginLoadingImpl with DiagnosticableTreeMixin implements _LoginLoading {
  const _$LoginLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState.loginLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LoginState.loginLoading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingUser,
    required TResult Function(String status, String message, int httpCode)
    userExists,
    required TResult Function(String status, String message, int httpCode)
    userNotFound,
    required TResult Function() loginLoading,
    required TResult Function(String status, bool isLogin) loginSuccess,
    required TResult Function(String error) loginFailure,
  }) {
    return loginLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingUser,
    TResult? Function(String status, String message, int httpCode)? userExists,
    TResult? Function(String status, String message, int httpCode)?
    userNotFound,
    TResult? Function()? loginLoading,
    TResult? Function(String status, bool isLogin)? loginSuccess,
    TResult? Function(String error)? loginFailure,
  }) {
    return loginLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingUser,
    TResult Function(String status, String message, int httpCode)? userExists,
    TResult Function(String status, String message, int httpCode)? userNotFound,
    TResult Function()? loginLoading,
    TResult Function(String status, bool isLogin)? loginSuccess,
    TResult Function(String error)? loginFailure,
    required TResult orElse(),
  }) {
    if (loginLoading != null) {
      return loginLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingUser value) checkingUser,
    required TResult Function(_UserExists value) userExists,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_LoginLoading value) loginLoading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_LoginFailure value) loginFailure,
  }) {
    return loginLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingUser value)? checkingUser,
    TResult? Function(_UserExists value)? userExists,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_LoginLoading value)? loginLoading,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_LoginFailure value)? loginFailure,
  }) {
    return loginLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingUser value)? checkingUser,
    TResult Function(_UserExists value)? userExists,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_LoginLoading value)? loginLoading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailure value)? loginFailure,
    required TResult orElse(),
  }) {
    if (loginLoading != null) {
      return loginLoading(this);
    }
    return orElse();
  }
}

abstract class _LoginLoading implements LoginState {
  const factory _LoginLoading() = _$LoginLoadingImpl;
}

/// @nodoc
abstract class _$$LoginSuccessImplCopyWith<$Res> {
  factory _$$LoginSuccessImplCopyWith(
    _$LoginSuccessImpl value,
    $Res Function(_$LoginSuccessImpl) then,
  ) = __$$LoginSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String status, bool isLogin});
}

/// @nodoc
class __$$LoginSuccessImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginSuccessImpl>
    implements _$$LoginSuccessImplCopyWith<$Res> {
  __$$LoginSuccessImplCopyWithImpl(
    _$LoginSuccessImpl _value,
    $Res Function(_$LoginSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null, Object? isLogin = null}) {
    return _then(
      _$LoginSuccessImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        isLogin:
            null == isLogin
                ? _value.isLogin
                : isLogin // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$LoginSuccessImpl with DiagnosticableTreeMixin implements _LoginSuccess {
  const _$LoginSuccessImpl({required this.status, required this.isLogin});

  @override
  final String status;
  @override
  final bool isLogin;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState.loginSuccess(status: $status, isLogin: $isLogin)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginState.loginSuccess'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('isLogin', isLogin));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginSuccessImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, isLogin);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginSuccessImplCopyWith<_$LoginSuccessImpl> get copyWith =>
      __$$LoginSuccessImplCopyWithImpl<_$LoginSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingUser,
    required TResult Function(String status, String message, int httpCode)
    userExists,
    required TResult Function(String status, String message, int httpCode)
    userNotFound,
    required TResult Function() loginLoading,
    required TResult Function(String status, bool isLogin) loginSuccess,
    required TResult Function(String error) loginFailure,
  }) {
    return loginSuccess(status, isLogin);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingUser,
    TResult? Function(String status, String message, int httpCode)? userExists,
    TResult? Function(String status, String message, int httpCode)?
    userNotFound,
    TResult? Function()? loginLoading,
    TResult? Function(String status, bool isLogin)? loginSuccess,
    TResult? Function(String error)? loginFailure,
  }) {
    return loginSuccess?.call(status, isLogin);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingUser,
    TResult Function(String status, String message, int httpCode)? userExists,
    TResult Function(String status, String message, int httpCode)? userNotFound,
    TResult Function()? loginLoading,
    TResult Function(String status, bool isLogin)? loginSuccess,
    TResult Function(String error)? loginFailure,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess(status, isLogin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingUser value) checkingUser,
    required TResult Function(_UserExists value) userExists,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_LoginLoading value) loginLoading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_LoginFailure value) loginFailure,
  }) {
    return loginSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingUser value)? checkingUser,
    TResult? Function(_UserExists value)? userExists,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_LoginLoading value)? loginLoading,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_LoginFailure value)? loginFailure,
  }) {
    return loginSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingUser value)? checkingUser,
    TResult Function(_UserExists value)? userExists,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_LoginLoading value)? loginLoading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailure value)? loginFailure,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoginSuccess implements LoginState {
  const factory _LoginSuccess({
    required final String status,
    required final bool isLogin,
  }) = _$LoginSuccessImpl;

  String get status;
  bool get isLogin;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginSuccessImplCopyWith<_$LoginSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginFailureImplCopyWith<$Res> {
  factory _$$LoginFailureImplCopyWith(
    _$LoginFailureImpl value,
    $Res Function(_$LoginFailureImpl) then,
  ) = __$$LoginFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$LoginFailureImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginFailureImpl>
    implements _$$LoginFailureImplCopyWith<$Res> {
  __$$LoginFailureImplCopyWithImpl(
    _$LoginFailureImpl _value,
    $Res Function(_$LoginFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$LoginFailureImpl(
        null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$LoginFailureImpl with DiagnosticableTreeMixin implements _LoginFailure {
  const _$LoginFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState.loginFailure(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginState.loginFailure'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginFailureImplCopyWith<_$LoginFailureImpl> get copyWith =>
      __$$LoginFailureImplCopyWithImpl<_$LoginFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingUser,
    required TResult Function(String status, String message, int httpCode)
    userExists,
    required TResult Function(String status, String message, int httpCode)
    userNotFound,
    required TResult Function() loginLoading,
    required TResult Function(String status, bool isLogin) loginSuccess,
    required TResult Function(String error) loginFailure,
  }) {
    return loginFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingUser,
    TResult? Function(String status, String message, int httpCode)? userExists,
    TResult? Function(String status, String message, int httpCode)?
    userNotFound,
    TResult? Function()? loginLoading,
    TResult? Function(String status, bool isLogin)? loginSuccess,
    TResult? Function(String error)? loginFailure,
  }) {
    return loginFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingUser,
    TResult Function(String status, String message, int httpCode)? userExists,
    TResult Function(String status, String message, int httpCode)? userNotFound,
    TResult Function()? loginLoading,
    TResult Function(String status, bool isLogin)? loginSuccess,
    TResult Function(String error)? loginFailure,
    required TResult orElse(),
  }) {
    if (loginFailure != null) {
      return loginFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingUser value) checkingUser,
    required TResult Function(_UserExists value) userExists,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(_LoginLoading value) loginLoading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_LoginFailure value) loginFailure,
  }) {
    return loginFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingUser value)? checkingUser,
    TResult? Function(_UserExists value)? userExists,
    TResult? Function(_UserNotFound value)? userNotFound,
    TResult? Function(_LoginLoading value)? loginLoading,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_LoginFailure value)? loginFailure,
  }) {
    return loginFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingUser value)? checkingUser,
    TResult Function(_UserExists value)? userExists,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(_LoginLoading value)? loginLoading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailure value)? loginFailure,
    required TResult orElse(),
  }) {
    if (loginFailure != null) {
      return loginFailure(this);
    }
    return orElse();
  }
}

abstract class _LoginFailure implements LoginState {
  const factory _LoginFailure(final String error) = _$LoginFailureImpl;

  String get error;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginFailureImplCopyWith<_$LoginFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
