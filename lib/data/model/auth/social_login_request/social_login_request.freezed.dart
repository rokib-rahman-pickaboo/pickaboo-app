// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_login_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SocialLoginRequest _$SocialLoginRequestFromJson(Map<String, dynamic> json) {
  return _SocialLoginRequest.fromJson(json);
}

/// @nodoc
mixin _$SocialLoginRequest {
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'source')
  String get source => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_code')
  String get referralCode => throw _privateConstructorUsedError;

  /// Serializes this SocialLoginRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocialLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocialLoginRequestCopyWith<SocialLoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialLoginRequestCopyWith<$Res> {
  factory $SocialLoginRequestCopyWith(
    SocialLoginRequest value,
    $Res Function(SocialLoginRequest) then,
  ) = _$SocialLoginRequestCopyWithImpl<$Res, SocialLoginRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'access_token') String accessToken,
    @JsonKey(name: 'type') String type,
    @JsonKey(name: 'source') String source,
    @JsonKey(name: 'referral_code') String referralCode,
  });
}

/// @nodoc
class _$SocialLoginRequestCopyWithImpl<$Res, $Val extends SocialLoginRequest>
    implements $SocialLoginRequestCopyWith<$Res> {
  _$SocialLoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? type = null,
    Object? source = null,
    Object? referralCode = null,
  }) {
    return _then(
      _value.copyWith(
            accessToken:
                null == accessToken
                    ? _value.accessToken
                    : accessToken // ignore: cast_nullable_to_non_nullable
                        as String,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String,
            source:
                null == source
                    ? _value.source
                    : source // ignore: cast_nullable_to_non_nullable
                        as String,
            referralCode:
                null == referralCode
                    ? _value.referralCode
                    : referralCode // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SocialLoginRequestImplCopyWith<$Res>
    implements $SocialLoginRequestCopyWith<$Res> {
  factory _$$SocialLoginRequestImplCopyWith(
    _$SocialLoginRequestImpl value,
    $Res Function(_$SocialLoginRequestImpl) then,
  ) = __$$SocialLoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'access_token') String accessToken,
    @JsonKey(name: 'type') String type,
    @JsonKey(name: 'source') String source,
    @JsonKey(name: 'referral_code') String referralCode,
  });
}

/// @nodoc
class __$$SocialLoginRequestImplCopyWithImpl<$Res>
    extends _$SocialLoginRequestCopyWithImpl<$Res, _$SocialLoginRequestImpl>
    implements _$$SocialLoginRequestImplCopyWith<$Res> {
  __$$SocialLoginRequestImplCopyWithImpl(
    _$SocialLoginRequestImpl _value,
    $Res Function(_$SocialLoginRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SocialLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? type = null,
    Object? source = null,
    Object? referralCode = null,
  }) {
    return _then(
      _$SocialLoginRequestImpl(
        accessToken:
            null == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                    as String,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String,
        source:
            null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                    as String,
        referralCode:
            null == referralCode
                ? _value.referralCode
                : referralCode // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialLoginRequestImpl implements _SocialLoginRequest {
  const _$SocialLoginRequestImpl({
    @JsonKey(name: 'access_token') required this.accessToken,
    @JsonKey(name: 'type') required this.type,
    @JsonKey(name: 'source') required this.source,
    @JsonKey(name: 'referral_code') this.referralCode = '',
  });

  factory _$SocialLoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialLoginRequestImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'source')
  final String source;
  @override
  @JsonKey(name: 'referral_code')
  final String referralCode;

  @override
  String toString() {
    return 'SocialLoginRequest(accessToken: $accessToken, type: $type, source: $source, referralCode: $referralCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialLoginRequestImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, type, source, referralCode);

  /// Create a copy of SocialLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialLoginRequestImplCopyWith<_$SocialLoginRequestImpl> get copyWith =>
      __$$SocialLoginRequestImplCopyWithImpl<_$SocialLoginRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialLoginRequestImplToJson(this);
  }
}

abstract class _SocialLoginRequest implements SocialLoginRequest {
  const factory _SocialLoginRequest({
    @JsonKey(name: 'access_token') required final String accessToken,
    @JsonKey(name: 'type') required final String type,
    @JsonKey(name: 'source') required final String source,
    @JsonKey(name: 'referral_code') final String referralCode,
  }) = _$SocialLoginRequestImpl;

  factory _SocialLoginRequest.fromJson(Map<String, dynamic> json) =
      _$SocialLoginRequestImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'source')
  String get source;
  @override
  @JsonKey(name: 'referral_code')
  String get referralCode;

  /// Create a copy of SocialLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialLoginRequestImplCopyWith<_$SocialLoginRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
