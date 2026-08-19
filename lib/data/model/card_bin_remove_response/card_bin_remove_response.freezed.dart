// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_bin_remove_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CardBinRemoveResponse _$CardBinRemoveResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CardBinRemoveResponse.fromJson(json);
}

/// @nodoc
mixin _$CardBinRemoveResponse {
  @JsonKey(name: "success")
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "previous_coupon")
  String? get previousCoupon => throw _privateConstructorUsedError;
  @JsonKey(name: "status_code")
  int? get statusCode => throw _privateConstructorUsedError;

  /// Serializes this CardBinRemoveResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CardBinRemoveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardBinRemoveResponseCopyWith<CardBinRemoveResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardBinRemoveResponseCopyWith<$Res> {
  factory $CardBinRemoveResponseCopyWith(
    CardBinRemoveResponse value,
    $Res Function(CardBinRemoveResponse) then,
  ) = _$CardBinRemoveResponseCopyWithImpl<$Res, CardBinRemoveResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "previous_coupon") String? previousCoupon,
    @JsonKey(name: "status_code") int? statusCode,
  });
}

/// @nodoc
class _$CardBinRemoveResponseCopyWithImpl<
  $Res,
  $Val extends CardBinRemoveResponse
>
    implements $CardBinRemoveResponseCopyWith<$Res> {
  _$CardBinRemoveResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardBinRemoveResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? previousCoupon = freezed,
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
            previousCoupon:
                freezed == previousCoupon
                    ? _value.previousCoupon
                    : previousCoupon // ignore: cast_nullable_to_non_nullable
                        as String?,
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
abstract class _$$CardBinRemoveResponseImplCopyWith<$Res>
    implements $CardBinRemoveResponseCopyWith<$Res> {
  factory _$$CardBinRemoveResponseImplCopyWith(
    _$CardBinRemoveResponseImpl value,
    $Res Function(_$CardBinRemoveResponseImpl) then,
  ) = __$$CardBinRemoveResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "previous_coupon") String? previousCoupon,
    @JsonKey(name: "status_code") int? statusCode,
  });
}

/// @nodoc
class __$$CardBinRemoveResponseImplCopyWithImpl<$Res>
    extends
        _$CardBinRemoveResponseCopyWithImpl<$Res, _$CardBinRemoveResponseImpl>
    implements _$$CardBinRemoveResponseImplCopyWith<$Res> {
  __$$CardBinRemoveResponseImplCopyWithImpl(
    _$CardBinRemoveResponseImpl _value,
    $Res Function(_$CardBinRemoveResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardBinRemoveResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? previousCoupon = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(
      _$CardBinRemoveResponseImpl(
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
        previousCoupon:
            freezed == previousCoupon
                ? _value.previousCoupon
                : previousCoupon // ignore: cast_nullable_to_non_nullable
                    as String?,
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
class _$CardBinRemoveResponseImpl implements _CardBinRemoveResponse {
  const _$CardBinRemoveResponseImpl({
    @JsonKey(name: "success") this.success,
    @JsonKey(name: "message") this.message,
    @JsonKey(name: "previous_coupon") this.previousCoupon,
    @JsonKey(name: "status_code") this.statusCode,
  });

  factory _$CardBinRemoveResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardBinRemoveResponseImplFromJson(json);

  @override
  @JsonKey(name: "success")
  final bool? success;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "previous_coupon")
  final String? previousCoupon;
  @override
  @JsonKey(name: "status_code")
  final int? statusCode;

  @override
  String toString() {
    return 'CardBinRemoveResponse(success: $success, message: $message, previousCoupon: $previousCoupon, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardBinRemoveResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.previousCoupon, previousCoupon) ||
                other.previousCoupon == previousCoupon) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, message, previousCoupon, statusCode);

  /// Create a copy of CardBinRemoveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardBinRemoveResponseImplCopyWith<_$CardBinRemoveResponseImpl>
  get copyWith =>
      __$$CardBinRemoveResponseImplCopyWithImpl<_$CardBinRemoveResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CardBinRemoveResponseImplToJson(this);
  }
}

abstract class _CardBinRemoveResponse implements CardBinRemoveResponse {
  const factory _CardBinRemoveResponse({
    @JsonKey(name: "success") final bool? success,
    @JsonKey(name: "message") final String? message,
    @JsonKey(name: "previous_coupon") final String? previousCoupon,
    @JsonKey(name: "status_code") final int? statusCode,
  }) = _$CardBinRemoveResponseImpl;

  factory _CardBinRemoveResponse.fromJson(Map<String, dynamic> json) =
      _$CardBinRemoveResponseImpl.fromJson;

  @override
  @JsonKey(name: "success")
  bool? get success;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "previous_coupon")
  String? get previousCoupon;
  @override
  @JsonKey(name: "status_code")
  int? get statusCode;

  /// Create a copy of CardBinRemoveResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardBinRemoveResponseImplCopyWith<_$CardBinRemoveResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
