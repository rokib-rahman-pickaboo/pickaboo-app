// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CheckUserResponse _$CheckUserResponseFromJson(Map<String, dynamic> json) {
  return _CheckUserResponse.fromJson(json);
}

/// @nodoc
mixin _$CheckUserResponse {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'http_code')
  int get httpCode => throw _privateConstructorUsedError;

  /// Serializes this CheckUserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckUserResponseCopyWith<CheckUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckUserResponseCopyWith<$Res> {
  factory $CheckUserResponseCopyWith(
    CheckUserResponse value,
    $Res Function(CheckUserResponse) then,
  ) = _$CheckUserResponseCopyWithImpl<$Res, CheckUserResponse>;
  @useResult
  $Res call({
    String status,
    String message,
    @JsonKey(name: 'http_code') int httpCode,
  });
}

/// @nodoc
class _$CheckUserResponseCopyWithImpl<$Res, $Val extends CheckUserResponse>
    implements $CheckUserResponseCopyWith<$Res> {
  _$CheckUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? httpCode = null,
  }) {
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckUserResponseImplCopyWith<$Res>
    implements $CheckUserResponseCopyWith<$Res> {
  factory _$$CheckUserResponseImplCopyWith(
    _$CheckUserResponseImpl value,
    $Res Function(_$CheckUserResponseImpl) then,
  ) = __$$CheckUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String status,
    String message,
    @JsonKey(name: 'http_code') int httpCode,
  });
}

/// @nodoc
class __$$CheckUserResponseImplCopyWithImpl<$Res>
    extends _$CheckUserResponseCopyWithImpl<$Res, _$CheckUserResponseImpl>
    implements _$$CheckUserResponseImplCopyWith<$Res> {
  __$$CheckUserResponseImplCopyWithImpl(
    _$CheckUserResponseImpl _value,
    $Res Function(_$CheckUserResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? httpCode = null,
  }) {
    return _then(
      _$CheckUserResponseImpl(
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
@JsonSerializable()
class _$CheckUserResponseImpl implements _CheckUserResponse {
  const _$CheckUserResponseImpl({
    required this.status,
    required this.message,
    @JsonKey(name: 'http_code') required this.httpCode,
  });

  factory _$CheckUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckUserResponseImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  @JsonKey(name: 'http_code')
  final int httpCode;

  @override
  String toString() {
    return 'CheckUserResponse(status: $status, message: $message, httpCode: $httpCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckUserResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.httpCode, httpCode) ||
                other.httpCode == httpCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, httpCode);

  /// Create a copy of CheckUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckUserResponseImplCopyWith<_$CheckUserResponseImpl> get copyWith =>
      __$$CheckUserResponseImplCopyWithImpl<_$CheckUserResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckUserResponseImplToJson(this);
  }
}

abstract class _CheckUserResponse implements CheckUserResponse {
  const factory _CheckUserResponse({
    required final String status,
    required final String message,
    @JsonKey(name: 'http_code') required final int httpCode,
  }) = _$CheckUserResponseImpl;

  factory _CheckUserResponse.fromJson(Map<String, dynamic> json) =
      _$CheckUserResponseImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  @JsonKey(name: 'http_code')
  int get httpCode;

  /// Create a copy of CheckUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckUserResponseImplCopyWith<_$CheckUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
