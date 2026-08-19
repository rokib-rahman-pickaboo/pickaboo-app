// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_bin_status_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CardBinStatusResponse _$CardBinStatusResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CardBinStatusResponse.fromJson(json);
}

/// @nodoc
mixin _$CardBinStatusResponse {
  @JsonKey(name: "success")
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "status_code")
  int? get statusCode => throw _privateConstructorUsedError;

  /// Serializes this CardBinStatusResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CardBinStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardBinStatusResponseCopyWith<CardBinStatusResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardBinStatusResponseCopyWith<$Res> {
  factory $CardBinStatusResponseCopyWith(
    CardBinStatusResponse value,
    $Res Function(CardBinStatusResponse) then,
  ) = _$CardBinStatusResponseCopyWithImpl<$Res, CardBinStatusResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "is_active") bool? isActive,
    @JsonKey(name: "status_code") int? statusCode,
  });
}

/// @nodoc
class _$CardBinStatusResponseCopyWithImpl<
  $Res,
  $Val extends CardBinStatusResponse
>
    implements $CardBinStatusResponseCopyWith<$Res> {
  _$CardBinStatusResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardBinStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? isActive = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(
      _value.copyWith(
            success:
                freezed == success
                    ? _value.success
                    : success // ignore: cast_nullable_to_non_nullable
                        as bool?,
            message:
                freezed == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String?,
            isActive:
                freezed == isActive
                    ? _value.isActive
                    : isActive // ignore: cast_nullable_to_non_nullable
                        as bool?,
            statusCode:
                freezed == statusCode
                    ? _value.statusCode
                    : statusCode // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CardBinStatusResponseImplCopyWith<$Res>
    implements $CardBinStatusResponseCopyWith<$Res> {
  factory _$$CardBinStatusResponseImplCopyWith(
    _$CardBinStatusResponseImpl value,
    $Res Function(_$CardBinStatusResponseImpl) then,
  ) = __$$CardBinStatusResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "is_active") bool? isActive,
    @JsonKey(name: "status_code") int? statusCode,
  });
}

/// @nodoc
class __$$CardBinStatusResponseImplCopyWithImpl<$Res>
    extends
        _$CardBinStatusResponseCopyWithImpl<$Res, _$CardBinStatusResponseImpl>
    implements _$$CardBinStatusResponseImplCopyWith<$Res> {
  __$$CardBinStatusResponseImplCopyWithImpl(
    _$CardBinStatusResponseImpl _value,
    $Res Function(_$CardBinStatusResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardBinStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? isActive = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(
      _$CardBinStatusResponseImpl(
        success:
            freezed == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                    as bool?,
        message:
            freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String?,
        isActive:
            freezed == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                    as bool?,
        statusCode:
            freezed == statusCode
                ? _value.statusCode
                : statusCode // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CardBinStatusResponseImpl implements _CardBinStatusResponse {
  const _$CardBinStatusResponseImpl({
    @JsonKey(name: "success") this.success,
    @JsonKey(name: "message") this.message,
    @JsonKey(name: "is_active") this.isActive,
    @JsonKey(name: "status_code") this.statusCode,
  });

  factory _$CardBinStatusResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardBinStatusResponseImplFromJson(json);

  @override
  @JsonKey(name: "success")
  final bool? success;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "is_active")
  final bool? isActive;
  @override
  @JsonKey(name: "status_code")
  final int? statusCode;

  @override
  String toString() {
    return 'CardBinStatusResponse(success: $success, message: $message, isActive: $isActive, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardBinStatusResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, message, isActive, statusCode);

  /// Create a copy of CardBinStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardBinStatusResponseImplCopyWith<_$CardBinStatusResponseImpl>
  get copyWith =>
      __$$CardBinStatusResponseImplCopyWithImpl<_$CardBinStatusResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CardBinStatusResponseImplToJson(this);
  }
}

abstract class _CardBinStatusResponse implements CardBinStatusResponse {
  const factory _CardBinStatusResponse({
    @JsonKey(name: "success") final bool? success,
    @JsonKey(name: "message") final String? message,
    @JsonKey(name: "is_active") final bool? isActive,
    @JsonKey(name: "status_code") final int? statusCode,
  }) = _$CardBinStatusResponseImpl;

  factory _CardBinStatusResponse.fromJson(Map<String, dynamic> json) =
      _$CardBinStatusResponseImpl.fromJson;

  @override
  @JsonKey(name: "success")
  bool? get success;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "is_active")
  bool? get isActive;
  @override
  @JsonKey(name: "status_code")
  int? get statusCode;

  /// Create a copy of CardBinStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardBinStatusResponseImplCopyWith<_$CardBinStatusResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
