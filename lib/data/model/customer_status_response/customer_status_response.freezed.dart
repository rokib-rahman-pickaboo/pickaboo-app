// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_status_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CustomerStatusResponse _$CustomerStatusResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CustomerStatusResponse.fromJson(json);
}

/// @nodoc
mixin _$CustomerStatusResponse {
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "http_code")
  int? get httpCode => throw _privateConstructorUsedError;

  /// Serializes this CustomerStatusResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerStatusResponseCopyWith<CustomerStatusResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerStatusResponseCopyWith<$Res> {
  factory $CustomerStatusResponseCopyWith(
    CustomerStatusResponse value,
    $Res Function(CustomerStatusResponse) then,
  ) = _$CustomerStatusResponseCopyWithImpl<$Res, CustomerStatusResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "http_code") int? httpCode,
  });
}

/// @nodoc
class _$CustomerStatusResponseCopyWithImpl<
  $Res,
  $Val extends CustomerStatusResponse
>
    implements $CustomerStatusResponseCopyWith<$Res> {
  _$CustomerStatusResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? httpCode = freezed,
  }) {
    return _then(
      _value.copyWith(
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String?,
            message:
                freezed == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String?,
            httpCode:
                freezed == httpCode
                    ? _value.httpCode
                    : httpCode // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomerStatusResponseImplCopyWith<$Res>
    implements $CustomerStatusResponseCopyWith<$Res> {
  factory _$$CustomerStatusResponseImplCopyWith(
    _$CustomerStatusResponseImpl value,
    $Res Function(_$CustomerStatusResponseImpl) then,
  ) = __$$CustomerStatusResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "http_code") int? httpCode,
  });
}

/// @nodoc
class __$$CustomerStatusResponseImplCopyWithImpl<$Res>
    extends
        _$CustomerStatusResponseCopyWithImpl<$Res, _$CustomerStatusResponseImpl>
    implements _$$CustomerStatusResponseImplCopyWith<$Res> {
  __$$CustomerStatusResponseImplCopyWithImpl(
    _$CustomerStatusResponseImpl _value,
    $Res Function(_$CustomerStatusResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? httpCode = freezed,
  }) {
    return _then(
      _$CustomerStatusResponseImpl(
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String?,
        message:
            freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String?,
        httpCode:
            freezed == httpCode
                ? _value.httpCode
                : httpCode // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerStatusResponseImpl implements _CustomerStatusResponse {
  const _$CustomerStatusResponseImpl({
    @JsonKey(name: "status") this.status,
    @JsonKey(name: "message") this.message,
    @JsonKey(name: "http_code") this.httpCode,
  });

  factory _$CustomerStatusResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerStatusResponseImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "http_code")
  final int? httpCode;

  @override
  String toString() {
    return 'CustomerStatusResponse(status: $status, message: $message, httpCode: $httpCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerStatusResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.httpCode, httpCode) ||
                other.httpCode == httpCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, httpCode);

  /// Create a copy of CustomerStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerStatusResponseImplCopyWith<_$CustomerStatusResponseImpl>
  get copyWith =>
      __$$CustomerStatusResponseImplCopyWithImpl<_$CustomerStatusResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerStatusResponseImplToJson(this);
  }
}

abstract class _CustomerStatusResponse implements CustomerStatusResponse {
  const factory _CustomerStatusResponse({
    @JsonKey(name: "status") final String? status,
    @JsonKey(name: "message") final String? message,
    @JsonKey(name: "http_code") final int? httpCode,
  }) = _$CustomerStatusResponseImpl;

  factory _CustomerStatusResponse.fromJson(Map<String, dynamic> json) =
      _$CustomerStatusResponseImpl.fromJson;

  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "http_code")
  int? get httpCode;

  /// Create a copy of CustomerStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerStatusResponseImplCopyWith<_$CustomerStatusResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
