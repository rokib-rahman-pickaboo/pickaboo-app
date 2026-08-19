// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_bin_verify_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CardBinVerifyResponse _$CardBinVerifyResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CardBinVerifyResponse.fromJson(json);
}

/// @nodoc
mixin _$CardBinVerifyResponse {
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
  @JsonKey(name: "is_applied")
  bool? get isApplied => throw _privateConstructorUsedError;
  @JsonKey(name: "bin_number")
  String? get binNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "card_type")
  String? get cardType => throw _privateConstructorUsedError;
  @JsonKey(name: "bank_name")
  String? get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_method")
  String? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: "status_code")
  int? get statusCode => throw _privateConstructorUsedError;

  /// Serializes this CardBinVerifyResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CardBinVerifyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardBinVerifyResponseCopyWith<CardBinVerifyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardBinVerifyResponseCopyWith<$Res> {
  factory $CardBinVerifyResponseCopyWith(
    CardBinVerifyResponse value,
    $Res Function(CardBinVerifyResponse) then,
  ) = _$CardBinVerifyResponseCopyWithImpl<$Res, CardBinVerifyResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "coupon_code") String? couponCode,
    @JsonKey(name: "discount_amount") int? discountAmount,
    @JsonKey(name: "rule_name") String? ruleName,
    @JsonKey(name: "is_applied") bool? isApplied,
    @JsonKey(name: "bin_number") String? binNumber,
    @JsonKey(name: "card_type") String? cardType,
    @JsonKey(name: "bank_name") String? bankName,
    @JsonKey(name: "payment_method") String? paymentMethod,
    @JsonKey(name: "status_code") int? statusCode,
  });
}

/// @nodoc
class _$CardBinVerifyResponseCopyWithImpl<
  $Res,
  $Val extends CardBinVerifyResponse
>
    implements $CardBinVerifyResponseCopyWith<$Res> {
  _$CardBinVerifyResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardBinVerifyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? couponCode = freezed,
    Object? discountAmount = freezed,
    Object? ruleName = freezed,
    Object? isApplied = freezed,
    Object? binNumber = freezed,
    Object? cardType = freezed,
    Object? bankName = freezed,
    Object? paymentMethod = freezed,
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
            isApplied:
                freezed == isApplied
                    ? _value.isApplied
                    : isApplied // ignore: cast_nullable_to_non_nullable
                        as bool?,
            binNumber:
                freezed == binNumber
                    ? _value.binNumber
                    : binNumber // ignore: cast_nullable_to_non_nullable
                        as String?,
            cardType:
                freezed == cardType
                    ? _value.cardType
                    : cardType // ignore: cast_nullable_to_non_nullable
                        as String?,
            bankName:
                freezed == bankName
                    ? _value.bankName
                    : bankName // ignore: cast_nullable_to_non_nullable
                        as String?,
            paymentMethod:
                freezed == paymentMethod
                    ? _value.paymentMethod
                    : paymentMethod // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CardBinVerifyResponseImplCopyWith<$Res>
    implements $CardBinVerifyResponseCopyWith<$Res> {
  factory _$$CardBinVerifyResponseImplCopyWith(
    _$CardBinVerifyResponseImpl value,
    $Res Function(_$CardBinVerifyResponseImpl) then,
  ) = __$$CardBinVerifyResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "coupon_code") String? couponCode,
    @JsonKey(name: "discount_amount") int? discountAmount,
    @JsonKey(name: "rule_name") String? ruleName,
    @JsonKey(name: "is_applied") bool? isApplied,
    @JsonKey(name: "bin_number") String? binNumber,
    @JsonKey(name: "card_type") String? cardType,
    @JsonKey(name: "bank_name") String? bankName,
    @JsonKey(name: "payment_method") String? paymentMethod,
    @JsonKey(name: "status_code") int? statusCode,
  });
}

/// @nodoc
class __$$CardBinVerifyResponseImplCopyWithImpl<$Res>
    extends
        _$CardBinVerifyResponseCopyWithImpl<$Res, _$CardBinVerifyResponseImpl>
    implements _$$CardBinVerifyResponseImplCopyWith<$Res> {
  __$$CardBinVerifyResponseImplCopyWithImpl(
    _$CardBinVerifyResponseImpl _value,
    $Res Function(_$CardBinVerifyResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardBinVerifyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? couponCode = freezed,
    Object? discountAmount = freezed,
    Object? ruleName = freezed,
    Object? isApplied = freezed,
    Object? binNumber = freezed,
    Object? cardType = freezed,
    Object? bankName = freezed,
    Object? paymentMethod = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(
      _$CardBinVerifyResponseImpl(
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
        isApplied:
            freezed == isApplied
                ? _value.isApplied
                : isApplied // ignore: cast_nullable_to_non_nullable
                    as bool?,
        binNumber:
            freezed == binNumber
                ? _value.binNumber
                : binNumber // ignore: cast_nullable_to_non_nullable
                    as String?,
        cardType:
            freezed == cardType
                ? _value.cardType
                : cardType // ignore: cast_nullable_to_non_nullable
                    as String?,
        bankName:
            freezed == bankName
                ? _value.bankName
                : bankName // ignore: cast_nullable_to_non_nullable
                    as String?,
        paymentMethod:
            freezed == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
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
class _$CardBinVerifyResponseImpl implements _CardBinVerifyResponse {
  const _$CardBinVerifyResponseImpl({
    @JsonKey(name: "success") this.success,
    @JsonKey(name: "message") this.message,
    @JsonKey(name: "coupon_code") this.couponCode,
    @JsonKey(name: "discount_amount") this.discountAmount,
    @JsonKey(name: "rule_name") this.ruleName,
    @JsonKey(name: "is_applied") this.isApplied,
    @JsonKey(name: "bin_number") this.binNumber,
    @JsonKey(name: "card_type") this.cardType,
    @JsonKey(name: "bank_name") this.bankName,
    @JsonKey(name: "payment_method") this.paymentMethod,
    @JsonKey(name: "status_code") this.statusCode,
  });

  factory _$CardBinVerifyResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardBinVerifyResponseImplFromJson(json);

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
  @JsonKey(name: "is_applied")
  final bool? isApplied;
  @override
  @JsonKey(name: "bin_number")
  final String? binNumber;
  @override
  @JsonKey(name: "card_type")
  final String? cardType;
  @override
  @JsonKey(name: "bank_name")
  final String? bankName;
  @override
  @JsonKey(name: "payment_method")
  final String? paymentMethod;
  @override
  @JsonKey(name: "status_code")
  final int? statusCode;

  @override
  String toString() {
    return 'CardBinVerifyResponse(success: $success, message: $message, couponCode: $couponCode, discountAmount: $discountAmount, ruleName: $ruleName, isApplied: $isApplied, binNumber: $binNumber, cardType: $cardType, bankName: $bankName, paymentMethod: $paymentMethod, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardBinVerifyResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.ruleName, ruleName) ||
                other.ruleName == ruleName) &&
            (identical(other.isApplied, isApplied) ||
                other.isApplied == isApplied) &&
            (identical(other.binNumber, binNumber) ||
                other.binNumber == binNumber) &&
            (identical(other.cardType, cardType) ||
                other.cardType == cardType) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
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
    isApplied,
    binNumber,
    cardType,
    bankName,
    paymentMethod,
    statusCode,
  );

  /// Create a copy of CardBinVerifyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardBinVerifyResponseImplCopyWith<_$CardBinVerifyResponseImpl>
  get copyWith =>
      __$$CardBinVerifyResponseImplCopyWithImpl<_$CardBinVerifyResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CardBinVerifyResponseImplToJson(this);
  }
}

abstract class _CardBinVerifyResponse implements CardBinVerifyResponse {
  const factory _CardBinVerifyResponse({
    @JsonKey(name: "success") final bool? success,
    @JsonKey(name: "message") final String? message,
    @JsonKey(name: "coupon_code") final String? couponCode,
    @JsonKey(name: "discount_amount") final int? discountAmount,
    @JsonKey(name: "rule_name") final String? ruleName,
    @JsonKey(name: "is_applied") final bool? isApplied,
    @JsonKey(name: "bin_number") final String? binNumber,
    @JsonKey(name: "card_type") final String? cardType,
    @JsonKey(name: "bank_name") final String? bankName,
    @JsonKey(name: "payment_method") final String? paymentMethod,
    @JsonKey(name: "status_code") final int? statusCode,
  }) = _$CardBinVerifyResponseImpl;

  factory _CardBinVerifyResponse.fromJson(Map<String, dynamic> json) =
      _$CardBinVerifyResponseImpl.fromJson;

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
  @JsonKey(name: "is_applied")
  bool? get isApplied;
  @override
  @JsonKey(name: "bin_number")
  String? get binNumber;
  @override
  @JsonKey(name: "card_type")
  String? get cardType;
  @override
  @JsonKey(name: "bank_name")
  String? get bankName;
  @override
  @JsonKey(name: "payment_method")
  String? get paymentMethod;
  @override
  @JsonKey(name: "status_code")
  int? get statusCode;

  /// Create a copy of CardBinVerifyResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardBinVerifyResponseImplCopyWith<_$CardBinVerifyResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
