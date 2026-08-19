// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipping_method_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ShippingMethodModel _$ShippingMethodModelFromJson(Map<String, dynamic> json) {
  return _ShippingMethodModel.fromJson(json);
}

/// @nodoc
mixin _$ShippingMethodModel {
  @JsonKey(name: "carrier_code")
  String? get carrierCode => throw _privateConstructorUsedError;
  @JsonKey(name: "method_code")
  String? get methodCode => throw _privateConstructorUsedError;
  @JsonKey(name: "carrier_title")
  String? get carrierTitle => throw _privateConstructorUsedError;
  @JsonKey(name: "method_title")
  String? get methodTitle => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "base_amount")
  double? get baseAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "available")
  bool? get available => throw _privateConstructorUsedError;
  @JsonKey(name: "error_message")
  String? get errorMessage => throw _privateConstructorUsedError;
  @JsonKey(name: "price_excl_tax")
  double? get priceExclTax => throw _privateConstructorUsedError;
  @JsonKey(name: "price_incl_tax")
  double? get priceInclTax => throw _privateConstructorUsedError;

  /// Serializes this ShippingMethodModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShippingMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShippingMethodModelCopyWith<ShippingMethodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShippingMethodModelCopyWith<$Res> {
  factory $ShippingMethodModelCopyWith(
    ShippingMethodModel value,
    $Res Function(ShippingMethodModel) then,
  ) = _$ShippingMethodModelCopyWithImpl<$Res, ShippingMethodModel>;
  @useResult
  $Res call({
    @JsonKey(name: "carrier_code") String? carrierCode,
    @JsonKey(name: "method_code") String? methodCode,
    @JsonKey(name: "carrier_title") String? carrierTitle,
    @JsonKey(name: "method_title") String? methodTitle,
    @JsonKey(name: "amount") double? amount,
    @JsonKey(name: "base_amount") double? baseAmount,
    @JsonKey(name: "available") bool? available,
    @JsonKey(name: "error_message") String? errorMessage,
    @JsonKey(name: "price_excl_tax") double? priceExclTax,
    @JsonKey(name: "price_incl_tax") double? priceInclTax,
  });
}

/// @nodoc
class _$ShippingMethodModelCopyWithImpl<$Res, $Val extends ShippingMethodModel>
    implements $ShippingMethodModelCopyWith<$Res> {
  _$ShippingMethodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShippingMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carrierCode = freezed,
    Object? methodCode = freezed,
    Object? carrierTitle = freezed,
    Object? methodTitle = freezed,
    Object? amount = freezed,
    Object? baseAmount = freezed,
    Object? available = freezed,
    Object? errorMessage = freezed,
    Object? priceExclTax = freezed,
    Object? priceInclTax = freezed,
  }) {
    return _then(
      _value.copyWith(
            carrierCode:
                freezed == carrierCode
                    ? _value.carrierCode
                    : carrierCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            methodCode:
                freezed == methodCode
                    ? _value.methodCode
                    : methodCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            carrierTitle:
                freezed == carrierTitle
                    ? _value.carrierTitle
                    : carrierTitle // ignore: cast_nullable_to_non_nullable
                        as String?,
            methodTitle:
                freezed == methodTitle
                    ? _value.methodTitle
                    : methodTitle // ignore: cast_nullable_to_non_nullable
                        as String?,
            amount:
                freezed == amount
                    ? _value.amount
                    : amount // ignore: cast_nullable_to_non_nullable
                        as double?,
            baseAmount:
                freezed == baseAmount
                    ? _value.baseAmount
                    : baseAmount // ignore: cast_nullable_to_non_nullable
                        as double?,
            available:
                freezed == available
                    ? _value.available
                    : available // ignore: cast_nullable_to_non_nullable
                        as bool?,
            errorMessage:
                freezed == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
            priceExclTax:
                freezed == priceExclTax
                    ? _value.priceExclTax
                    : priceExclTax // ignore: cast_nullable_to_non_nullable
                        as double?,
            priceInclTax:
                freezed == priceInclTax
                    ? _value.priceInclTax
                    : priceInclTax // ignore: cast_nullable_to_non_nullable
                        as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShippingMethodModelImplCopyWith<$Res>
    implements $ShippingMethodModelCopyWith<$Res> {
  factory _$$ShippingMethodModelImplCopyWith(
    _$ShippingMethodModelImpl value,
    $Res Function(_$ShippingMethodModelImpl) then,
  ) = __$$ShippingMethodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "carrier_code") String? carrierCode,
    @JsonKey(name: "method_code") String? methodCode,
    @JsonKey(name: "carrier_title") String? carrierTitle,
    @JsonKey(name: "method_title") String? methodTitle,
    @JsonKey(name: "amount") double? amount,
    @JsonKey(name: "base_amount") double? baseAmount,
    @JsonKey(name: "available") bool? available,
    @JsonKey(name: "error_message") String? errorMessage,
    @JsonKey(name: "price_excl_tax") double? priceExclTax,
    @JsonKey(name: "price_incl_tax") double? priceInclTax,
  });
}

/// @nodoc
class __$$ShippingMethodModelImplCopyWithImpl<$Res>
    extends _$ShippingMethodModelCopyWithImpl<$Res, _$ShippingMethodModelImpl>
    implements _$$ShippingMethodModelImplCopyWith<$Res> {
  __$$ShippingMethodModelImplCopyWithImpl(
    _$ShippingMethodModelImpl _value,
    $Res Function(_$ShippingMethodModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShippingMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carrierCode = freezed,
    Object? methodCode = freezed,
    Object? carrierTitle = freezed,
    Object? methodTitle = freezed,
    Object? amount = freezed,
    Object? baseAmount = freezed,
    Object? available = freezed,
    Object? errorMessage = freezed,
    Object? priceExclTax = freezed,
    Object? priceInclTax = freezed,
  }) {
    return _then(
      _$ShippingMethodModelImpl(
        carrierCode:
            freezed == carrierCode
                ? _value.carrierCode
                : carrierCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        methodCode:
            freezed == methodCode
                ? _value.methodCode
                : methodCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        carrierTitle:
            freezed == carrierTitle
                ? _value.carrierTitle
                : carrierTitle // ignore: cast_nullable_to_non_nullable
                    as String?,
        methodTitle:
            freezed == methodTitle
                ? _value.methodTitle
                : methodTitle // ignore: cast_nullable_to_non_nullable
                    as String?,
        amount:
            freezed == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                    as double?,
        baseAmount:
            freezed == baseAmount
                ? _value.baseAmount
                : baseAmount // ignore: cast_nullable_to_non_nullable
                    as double?,
        available:
            freezed == available
                ? _value.available
                : available // ignore: cast_nullable_to_non_nullable
                    as bool?,
        errorMessage:
            freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
        priceExclTax:
            freezed == priceExclTax
                ? _value.priceExclTax
                : priceExclTax // ignore: cast_nullable_to_non_nullable
                    as double?,
        priceInclTax:
            freezed == priceInclTax
                ? _value.priceInclTax
                : priceInclTax // ignore: cast_nullable_to_non_nullable
                    as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShippingMethodModelImpl implements _ShippingMethodModel {
  const _$ShippingMethodModelImpl({
    @JsonKey(name: "carrier_code") this.carrierCode,
    @JsonKey(name: "method_code") this.methodCode,
    @JsonKey(name: "carrier_title") this.carrierTitle,
    @JsonKey(name: "method_title") this.methodTitle,
    @JsonKey(name: "amount") this.amount,
    @JsonKey(name: "base_amount") this.baseAmount,
    @JsonKey(name: "available") this.available,
    @JsonKey(name: "error_message") this.errorMessage,
    @JsonKey(name: "price_excl_tax") this.priceExclTax,
    @JsonKey(name: "price_incl_tax") this.priceInclTax,
  });

  factory _$ShippingMethodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShippingMethodModelImplFromJson(json);

  @override
  @JsonKey(name: "carrier_code")
  final String? carrierCode;
  @override
  @JsonKey(name: "method_code")
  final String? methodCode;
  @override
  @JsonKey(name: "carrier_title")
  final String? carrierTitle;
  @override
  @JsonKey(name: "method_title")
  final String? methodTitle;
  @override
  @JsonKey(name: "amount")
  final double? amount;
  @override
  @JsonKey(name: "base_amount")
  final double? baseAmount;
  @override
  @JsonKey(name: "available")
  final bool? available;
  @override
  @JsonKey(name: "error_message")
  final String? errorMessage;
  @override
  @JsonKey(name: "price_excl_tax")
  final double? priceExclTax;
  @override
  @JsonKey(name: "price_incl_tax")
  final double? priceInclTax;

  @override
  String toString() {
    return 'ShippingMethodModel(carrierCode: $carrierCode, methodCode: $methodCode, carrierTitle: $carrierTitle, methodTitle: $methodTitle, amount: $amount, baseAmount: $baseAmount, available: $available, errorMessage: $errorMessage, priceExclTax: $priceExclTax, priceInclTax: $priceInclTax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShippingMethodModelImpl &&
            (identical(other.carrierCode, carrierCode) ||
                other.carrierCode == carrierCode) &&
            (identical(other.methodCode, methodCode) ||
                other.methodCode == methodCode) &&
            (identical(other.carrierTitle, carrierTitle) ||
                other.carrierTitle == carrierTitle) &&
            (identical(other.methodTitle, methodTitle) ||
                other.methodTitle == methodTitle) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.baseAmount, baseAmount) ||
                other.baseAmount == baseAmount) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.priceExclTax, priceExclTax) ||
                other.priceExclTax == priceExclTax) &&
            (identical(other.priceInclTax, priceInclTax) ||
                other.priceInclTax == priceInclTax));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    carrierCode,
    methodCode,
    carrierTitle,
    methodTitle,
    amount,
    baseAmount,
    available,
    errorMessage,
    priceExclTax,
    priceInclTax,
  );

  /// Create a copy of ShippingMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShippingMethodModelImplCopyWith<_$ShippingMethodModelImpl> get copyWith =>
      __$$ShippingMethodModelImplCopyWithImpl<_$ShippingMethodModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ShippingMethodModelImplToJson(this);
  }
}

abstract class _ShippingMethodModel implements ShippingMethodModel {
  const factory _ShippingMethodModel({
    @JsonKey(name: "carrier_code") final String? carrierCode,
    @JsonKey(name: "method_code") final String? methodCode,
    @JsonKey(name: "carrier_title") final String? carrierTitle,
    @JsonKey(name: "method_title") final String? methodTitle,
    @JsonKey(name: "amount") final double? amount,
    @JsonKey(name: "base_amount") final double? baseAmount,
    @JsonKey(name: "available") final bool? available,
    @JsonKey(name: "error_message") final String? errorMessage,
    @JsonKey(name: "price_excl_tax") final double? priceExclTax,
    @JsonKey(name: "price_incl_tax") final double? priceInclTax,
  }) = _$ShippingMethodModelImpl;

  factory _ShippingMethodModel.fromJson(Map<String, dynamic> json) =
      _$ShippingMethodModelImpl.fromJson;

  @override
  @JsonKey(name: "carrier_code")
  String? get carrierCode;
  @override
  @JsonKey(name: "method_code")
  String? get methodCode;
  @override
  @JsonKey(name: "carrier_title")
  String? get carrierTitle;
  @override
  @JsonKey(name: "method_title")
  String? get methodTitle;
  @override
  @JsonKey(name: "amount")
  double? get amount;
  @override
  @JsonKey(name: "base_amount")
  double? get baseAmount;
  @override
  @JsonKey(name: "available")
  bool? get available;
  @override
  @JsonKey(name: "error_message")
  String? get errorMessage;
  @override
  @JsonKey(name: "price_excl_tax")
  double? get priceExclTax;
  @override
  @JsonKey(name: "price_incl_tax")
  double? get priceInclTax;

  /// Create a copy of ShippingMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShippingMethodModelImplCopyWith<_$ShippingMethodModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
