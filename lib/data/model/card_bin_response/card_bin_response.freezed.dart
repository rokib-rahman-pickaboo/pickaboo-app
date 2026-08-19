// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_bin_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CardBinResponse _$CardBinResponseFromJson(Map<String, dynamic> json) {
  return _CardBinResponse.fromJson(json);
}

/// @nodoc
mixin _$CardBinResponse {
  @JsonKey(name: "success")
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "coupon_code")
  String? get couponCode => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_amount")
  int? get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "rule_name")
  String? get ruleName => throw _privateConstructorUsedError;
  @JsonKey(name: "status_code")
  int? get statusCode => throw _privateConstructorUsedError;

  /// Serializes this CardBinResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CardBinResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardBinResponseCopyWith<CardBinResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardBinResponseCopyWith<$Res> {
  factory $CardBinResponseCopyWith(
    CardBinResponse value,
    $Res Function(CardBinResponse) then,
  ) = _$CardBinResponseCopyWithImpl<$Res, CardBinResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "coupon_code") String? couponCode,
    @JsonKey(name: "discount_amount") int? discountAmount,
    @JsonKey(name: "rule_name") String? ruleName,
    @JsonKey(name: "status_code") int? statusCode,
  });
}

/// @nodoc
class _$CardBinResponseCopyWithImpl<$Res, $Val extends CardBinResponse>
    implements $CardBinResponseCopyWith<$Res> {
  _$CardBinResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardBinResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? couponCode = freezed,
    Object? discountAmount = freezed,
    Object? ruleName = freezed,
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
            couponCode:
                freezed == couponCode
                    ? _value.couponCode
                    : couponCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            discountAmount:
                freezed == discountAmount
                    ? _value.discountAmount
                    : discountAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            ruleName:
                freezed == ruleName
                    ? _value.ruleName
                    : ruleName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CardBinResponseImplCopyWith<$Res>
    implements $CardBinResponseCopyWith<$Res> {
  factory _$$CardBinResponseImplCopyWith(
    _$CardBinResponseImpl value,
    $Res Function(_$CardBinResponseImpl) then,
  ) = __$$CardBinResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "coupon_code") String? couponCode,
    @JsonKey(name: "discount_amount") int? discountAmount,
    @JsonKey(name: "rule_name") String? ruleName,
    @JsonKey(name: "status_code") int? statusCode,
  });
}

/// @nodoc
class __$$CardBinResponseImplCopyWithImpl<$Res>
    extends _$CardBinResponseCopyWithImpl<$Res, _$CardBinResponseImpl>
    implements _$$CardBinResponseImplCopyWith<$Res> {
  __$$CardBinResponseImplCopyWithImpl(
    _$CardBinResponseImpl _value,
    $Res Function(_$CardBinResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardBinResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? couponCode = freezed,
    Object? discountAmount = freezed,
    Object? ruleName = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(
      _$CardBinResponseImpl(
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
        couponCode:
            freezed == couponCode
                ? _value.couponCode
                : couponCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        discountAmount:
            freezed == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        ruleName:
            freezed == ruleName
                ? _value.ruleName
                : ruleName // ignore: cast_nullable_to_non_nullable
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
class _$CardBinResponseImpl implements _CardBinResponse {
  const _$CardBinResponseImpl({
    @JsonKey(name: "success") this.success,
    @JsonKey(name: "message") this.message,
    @JsonKey(name: "coupon_code") this.couponCode,
    @JsonKey(name: "discount_amount") this.discountAmount,
    @JsonKey(name: "rule_name") this.ruleName,
    @JsonKey(name: "status_code") this.statusCode,
  });

  factory _$CardBinResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardBinResponseImplFromJson(json);

  @override
  @JsonKey(name: "success")
  final bool? success;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "coupon_code")
  final String? couponCode;
  @override
  @JsonKey(name: "discount_amount")
  final int? discountAmount;
  @override
  @JsonKey(name: "rule_name")
  final String? ruleName;
  @override
  @JsonKey(name: "status_code")
  final int? statusCode;

  @override
  String toString() {
    return 'CardBinResponse(success: $success, message: $message, couponCode: $couponCode, discountAmount: $discountAmount, ruleName: $ruleName, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardBinResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.ruleName, ruleName) ||
                other.ruleName == ruleName) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    message,
    couponCode,
    discountAmount,
    ruleName,
    statusCode,
  );

  /// Create a copy of CardBinResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardBinResponseImplCopyWith<_$CardBinResponseImpl> get copyWith =>
      __$$CardBinResponseImplCopyWithImpl<_$CardBinResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CardBinResponseImplToJson(this);
  }
}

abstract class _CardBinResponse implements CardBinResponse {
  const factory _CardBinResponse({
    @JsonKey(name: "success") final bool? success,
    @JsonKey(name: "message") final String? message,
    @JsonKey(name: "coupon_code") final String? couponCode,
    @JsonKey(name: "discount_amount") final int? discountAmount,
    @JsonKey(name: "rule_name") final String? ruleName,
    @JsonKey(name: "status_code") final int? statusCode,
  }) = _$CardBinResponseImpl;

  factory _CardBinResponse.fromJson(Map<String, dynamic> json) =
      _$CardBinResponseImpl.fromJson;

  @override
  @JsonKey(name: "success")
  bool? get success;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "coupon_code")
  String? get couponCode;
  @override
  @JsonKey(name: "discount_amount")
  int? get discountAmount;
  @override
  @JsonKey(name: "rule_name")
  String? get ruleName;
  @override
  @JsonKey(name: "status_code")
  int? get statusCode;

  /// Create a copy of CardBinResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardBinResponseImplCopyWith<_$CardBinResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
