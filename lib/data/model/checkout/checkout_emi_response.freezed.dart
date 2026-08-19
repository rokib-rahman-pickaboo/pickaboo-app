// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_emi_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CheckoutEmiResponse _$CheckoutEmiResponseFromJson(Map<String, dynamic> json) {
  return _CheckoutEmiResponse.fromJson(json);
}

/// @nodoc
mixin _$CheckoutEmiResponse {
  @JsonKey(name: 'bank_emi_data')
  List<BankEmiDataModel>? get bankEmiData => throw _privateConstructorUsedError;
  @JsonKey(name: 'quote_shipping_cost')
  String? get quoteShippingCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'quote_billing_city')
  String? get quoteBillingCity => throw _privateConstructorUsedError;

  /// Serializes this CheckoutEmiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutEmiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutEmiResponseCopyWith<CheckoutEmiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutEmiResponseCopyWith<$Res> {
  factory $CheckoutEmiResponseCopyWith(
    CheckoutEmiResponse value,
    $Res Function(CheckoutEmiResponse) then,
  ) = _$CheckoutEmiResponseCopyWithImpl<$Res, CheckoutEmiResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'bank_emi_data') List<BankEmiDataModel>? bankEmiData,
    @JsonKey(name: 'quote_shipping_cost') String? quoteShippingCost,
    @JsonKey(name: 'quote_billing_city') String? quoteBillingCity,
  });
}

/// @nodoc
class _$CheckoutEmiResponseCopyWithImpl<$Res, $Val extends CheckoutEmiResponse>
    implements $CheckoutEmiResponseCopyWith<$Res> {
  _$CheckoutEmiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutEmiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankEmiData = freezed,
    Object? quoteShippingCost = freezed,
    Object? quoteBillingCity = freezed,
  }) {
    return _then(
      _value.copyWith(
            bankEmiData:
                freezed == bankEmiData
                    ? _value.bankEmiData
                    : bankEmiData // ignore: cast_nullable_to_non_nullable
                        as List<BankEmiDataModel>?,
            quoteShippingCost:
                freezed == quoteShippingCost
                    ? _value.quoteShippingCost
                    : quoteShippingCost // ignore: cast_nullable_to_non_nullable
                        as String?,
            quoteBillingCity:
                freezed == quoteBillingCity
                    ? _value.quoteBillingCity
                    : quoteBillingCity // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckoutEmiResponseImplCopyWith<$Res>
    implements $CheckoutEmiResponseCopyWith<$Res> {
  factory _$$CheckoutEmiResponseImplCopyWith(
    _$CheckoutEmiResponseImpl value,
    $Res Function(_$CheckoutEmiResponseImpl) then,
  ) = __$$CheckoutEmiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'bank_emi_data') List<BankEmiDataModel>? bankEmiData,
    @JsonKey(name: 'quote_shipping_cost') String? quoteShippingCost,
    @JsonKey(name: 'quote_billing_city') String? quoteBillingCity,
  });
}

/// @nodoc
class __$$CheckoutEmiResponseImplCopyWithImpl<$Res>
    extends _$CheckoutEmiResponseCopyWithImpl<$Res, _$CheckoutEmiResponseImpl>
    implements _$$CheckoutEmiResponseImplCopyWith<$Res> {
  __$$CheckoutEmiResponseImplCopyWithImpl(
    _$CheckoutEmiResponseImpl _value,
    $Res Function(_$CheckoutEmiResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEmiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankEmiData = freezed,
    Object? quoteShippingCost = freezed,
    Object? quoteBillingCity = freezed,
  }) {
    return _then(
      _$CheckoutEmiResponseImpl(
        bankEmiData:
            freezed == bankEmiData
                ? _value._bankEmiData
                : bankEmiData // ignore: cast_nullable_to_non_nullable
                    as List<BankEmiDataModel>?,
        quoteShippingCost:
            freezed == quoteShippingCost
                ? _value.quoteShippingCost
                : quoteShippingCost // ignore: cast_nullable_to_non_nullable
                    as String?,
        quoteBillingCity:
            freezed == quoteBillingCity
                ? _value.quoteBillingCity
                : quoteBillingCity // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckoutEmiResponseImpl implements _CheckoutEmiResponse {
  const _$CheckoutEmiResponseImpl({
    @JsonKey(name: 'bank_emi_data') final List<BankEmiDataModel>? bankEmiData,
    @JsonKey(name: 'quote_shipping_cost') this.quoteShippingCost,
    @JsonKey(name: 'quote_billing_city') this.quoteBillingCity,
  }) : _bankEmiData = bankEmiData;

  factory _$CheckoutEmiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutEmiResponseImplFromJson(json);

  final List<BankEmiDataModel>? _bankEmiData;
  @override
  @JsonKey(name: 'bank_emi_data')
  List<BankEmiDataModel>? get bankEmiData {
    final value = _bankEmiData;
    if (value == null) return null;
    if (_bankEmiData is EqualUnmodifiableListView) return _bankEmiData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'quote_shipping_cost')
  final String? quoteShippingCost;
  @override
  @JsonKey(name: 'quote_billing_city')
  final String? quoteBillingCity;

  @override
  String toString() {
    return 'CheckoutEmiResponse(bankEmiData: $bankEmiData, quoteShippingCost: $quoteShippingCost, quoteBillingCity: $quoteBillingCity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutEmiResponseImpl &&
            const DeepCollectionEquality().equals(
              other._bankEmiData,
              _bankEmiData,
            ) &&
            (identical(other.quoteShippingCost, quoteShippingCost) ||
                other.quoteShippingCost == quoteShippingCost) &&
            (identical(other.quoteBillingCity, quoteBillingCity) ||
                other.quoteBillingCity == quoteBillingCity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_bankEmiData),
    quoteShippingCost,
    quoteBillingCity,
  );

  /// Create a copy of CheckoutEmiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutEmiResponseImplCopyWith<_$CheckoutEmiResponseImpl> get copyWith =>
      __$$CheckoutEmiResponseImplCopyWithImpl<_$CheckoutEmiResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutEmiResponseImplToJson(this);
  }
}

abstract class _CheckoutEmiResponse implements CheckoutEmiResponse {
  const factory _CheckoutEmiResponse({
    @JsonKey(name: 'bank_emi_data') final List<BankEmiDataModel>? bankEmiData,
    @JsonKey(name: 'quote_shipping_cost') final String? quoteShippingCost,
    @JsonKey(name: 'quote_billing_city') final String? quoteBillingCity,
  }) = _$CheckoutEmiResponseImpl;

  factory _CheckoutEmiResponse.fromJson(Map<String, dynamic> json) =
      _$CheckoutEmiResponseImpl.fromJson;

  @override
  @JsonKey(name: 'bank_emi_data')
  List<BankEmiDataModel>? get bankEmiData;
  @override
  @JsonKey(name: 'quote_shipping_cost')
  String? get quoteShippingCost;
  @override
  @JsonKey(name: 'quote_billing_city')
  String? get quoteBillingCity;

  /// Create a copy of CheckoutEmiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutEmiResponseImplCopyWith<_$CheckoutEmiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BankEmiDataModel _$BankEmiDataModelFromJson(Map<String, dynamic> json) {
  return _BankEmiDataModel.fromJson(json);
}

/// @nodoc
mixin _$BankEmiDataModel {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_getway')
  String? get paymentGateway => throw _privateConstructorUsedError;
  @JsonKey(name: 'emi_tenures')
  List<EmiTenureDetailModel>? get emiTenures =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'cemi_tenures')
  List<CemiTenureDetailModel>? get cemiTenures =>
      throw _privateConstructorUsedError;

  /// Serializes this BankEmiDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BankEmiDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankEmiDataModelCopyWith<BankEmiDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankEmiDataModelCopyWith<$Res> {
  factory $BankEmiDataModelCopyWith(
    BankEmiDataModel value,
    $Res Function(BankEmiDataModel) then,
  ) = _$BankEmiDataModelCopyWithImpl<$Res, BankEmiDataModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'payment_getway') String? paymentGateway,
    @JsonKey(name: 'emi_tenures') List<EmiTenureDetailModel>? emiTenures,
    @JsonKey(name: 'cemi_tenures') List<CemiTenureDetailModel>? cemiTenures,
  });
}

/// @nodoc
class _$BankEmiDataModelCopyWithImpl<$Res, $Val extends BankEmiDataModel>
    implements $BankEmiDataModelCopyWith<$Res> {
  _$BankEmiDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BankEmiDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? paymentGateway = freezed,
    Object? emiTenures = freezed,
    Object? cemiTenures = freezed,
  }) {
    return _then(
      _value.copyWith(
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            paymentGateway:
                freezed == paymentGateway
                    ? _value.paymentGateway
                    : paymentGateway // ignore: cast_nullable_to_non_nullable
                        as String?,
            emiTenures:
                freezed == emiTenures
                    ? _value.emiTenures
                    : emiTenures // ignore: cast_nullable_to_non_nullable
                        as List<EmiTenureDetailModel>?,
            cemiTenures:
                freezed == cemiTenures
                    ? _value.cemiTenures
                    : cemiTenures // ignore: cast_nullable_to_non_nullable
                        as List<CemiTenureDetailModel>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BankEmiDataModelImplCopyWith<$Res>
    implements $BankEmiDataModelCopyWith<$Res> {
  factory _$$BankEmiDataModelImplCopyWith(
    _$BankEmiDataModelImpl value,
    $Res Function(_$BankEmiDataModelImpl) then,
  ) = __$$BankEmiDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'payment_getway') String? paymentGateway,
    @JsonKey(name: 'emi_tenures') List<EmiTenureDetailModel>? emiTenures,
    @JsonKey(name: 'cemi_tenures') List<CemiTenureDetailModel>? cemiTenures,
  });
}

/// @nodoc
class __$$BankEmiDataModelImplCopyWithImpl<$Res>
    extends _$BankEmiDataModelCopyWithImpl<$Res, _$BankEmiDataModelImpl>
    implements _$$BankEmiDataModelImplCopyWith<$Res> {
  __$$BankEmiDataModelImplCopyWithImpl(
    _$BankEmiDataModelImpl _value,
    $Res Function(_$BankEmiDataModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BankEmiDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? paymentGateway = freezed,
    Object? emiTenures = freezed,
    Object? cemiTenures = freezed,
  }) {
    return _then(
      _$BankEmiDataModelImpl(
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        paymentGateway:
            freezed == paymentGateway
                ? _value.paymentGateway
                : paymentGateway // ignore: cast_nullable_to_non_nullable
                    as String?,
        emiTenures:
            freezed == emiTenures
                ? _value._emiTenures
                : emiTenures // ignore: cast_nullable_to_non_nullable
                    as List<EmiTenureDetailModel>?,
        cemiTenures:
            freezed == cemiTenures
                ? _value._cemiTenures
                : cemiTenures // ignore: cast_nullable_to_non_nullable
                    as List<CemiTenureDetailModel>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BankEmiDataModelImpl implements _BankEmiDataModel {
  const _$BankEmiDataModelImpl({
    @JsonKey(name: 'name') this.name,
    @JsonKey(name: 'payment_getway') this.paymentGateway,
    @JsonKey(name: 'emi_tenures') final List<EmiTenureDetailModel>? emiTenures,
    @JsonKey(name: 'cemi_tenures')
    final List<CemiTenureDetailModel>? cemiTenures,
  }) : _emiTenures = emiTenures,
       _cemiTenures = cemiTenures;

  factory _$BankEmiDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankEmiDataModelImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'payment_getway')
  final String? paymentGateway;
  final List<EmiTenureDetailModel>? _emiTenures;
  @override
  @JsonKey(name: 'emi_tenures')
  List<EmiTenureDetailModel>? get emiTenures {
    final value = _emiTenures;
    if (value == null) return null;
    if (_emiTenures is EqualUnmodifiableListView) return _emiTenures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CemiTenureDetailModel>? _cemiTenures;
  @override
  @JsonKey(name: 'cemi_tenures')
  List<CemiTenureDetailModel>? get cemiTenures {
    final value = _cemiTenures;
    if (value == null) return null;
    if (_cemiTenures is EqualUnmodifiableListView) return _cemiTenures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BankEmiDataModel(name: $name, paymentGateway: $paymentGateway, emiTenures: $emiTenures, cemiTenures: $cemiTenures)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankEmiDataModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.paymentGateway, paymentGateway) ||
                other.paymentGateway == paymentGateway) &&
            const DeepCollectionEquality().equals(
              other._emiTenures,
              _emiTenures,
            ) &&
            const DeepCollectionEquality().equals(
              other._cemiTenures,
              _cemiTenures,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    paymentGateway,
    const DeepCollectionEquality().hash(_emiTenures),
    const DeepCollectionEquality().hash(_cemiTenures),
  );

  /// Create a copy of BankEmiDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankEmiDataModelImplCopyWith<_$BankEmiDataModelImpl> get copyWith =>
      __$$BankEmiDataModelImplCopyWithImpl<_$BankEmiDataModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BankEmiDataModelImplToJson(this);
  }
}

abstract class _BankEmiDataModel implements BankEmiDataModel {
  const factory _BankEmiDataModel({
    @JsonKey(name: 'name') final String? name,
    @JsonKey(name: 'payment_getway') final String? paymentGateway,
    @JsonKey(name: 'emi_tenures') final List<EmiTenureDetailModel>? emiTenures,
    @JsonKey(name: 'cemi_tenures')
    final List<CemiTenureDetailModel>? cemiTenures,
  }) = _$BankEmiDataModelImpl;

  factory _BankEmiDataModel.fromJson(Map<String, dynamic> json) =
      _$BankEmiDataModelImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'payment_getway')
  String? get paymentGateway;
  @override
  @JsonKey(name: 'emi_tenures')
  List<EmiTenureDetailModel>? get emiTenures;
  @override
  @JsonKey(name: 'cemi_tenures')
  List<CemiTenureDetailModel>? get cemiTenures;

  /// Create a copy of BankEmiDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankEmiDataModelImplCopyWith<_$BankEmiDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmiTenureDetailModel _$EmiTenureDetailModelFromJson(Map<String, dynamic> json) {
  return _EmiTenureDetailModel.fromJson(json);
}

/// @nodoc
mixin _$EmiTenureDetailModel {
  @JsonKey(name: 'tenure')
  int? get tenure => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  dynamic get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'convenience_fee')
  String? get convenienceFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'convenience_price')
  String? get conveniencePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'cconvenience_fee')
  String? get cConvenienceFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'cconvenience_price')
  String? get cConveniencePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_payable')
  String? get monthlyPayable => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  String? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSelected')
  bool get isSelected => throw _privateConstructorUsedError;

  /// Serializes this EmiTenureDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmiTenureDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmiTenureDetailModelCopyWith<EmiTenureDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmiTenureDetailModelCopyWith<$Res> {
  factory $EmiTenureDetailModelCopyWith(
    EmiTenureDetailModel value,
    $Res Function(EmiTenureDetailModel) then,
  ) = _$EmiTenureDetailModelCopyWithImpl<$Res, EmiTenureDetailModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'tenure') int? tenure,
    @JsonKey(name: 'price') dynamic price,
    @JsonKey(name: 'convenience_fee') String? convenienceFee,
    @JsonKey(name: 'convenience_price') String? conveniencePrice,
    @JsonKey(name: 'cconvenience_fee') String? cConvenienceFee,
    @JsonKey(name: 'cconvenience_price') String? cConveniencePrice,
    @JsonKey(name: 'monthly_payable') String? monthlyPayable,
    @JsonKey(name: 'total') String? total,
    @JsonKey(name: 'isSelected') bool isSelected,
  });
}

/// @nodoc
class _$EmiTenureDetailModelCopyWithImpl<
  $Res,
  $Val extends EmiTenureDetailModel
>
    implements $EmiTenureDetailModelCopyWith<$Res> {
  _$EmiTenureDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmiTenureDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenure = freezed,
    Object? price = freezed,
    Object? convenienceFee = freezed,
    Object? conveniencePrice = freezed,
    Object? cConvenienceFee = freezed,
    Object? cConveniencePrice = freezed,
    Object? monthlyPayable = freezed,
    Object? total = freezed,
    Object? isSelected = null,
  }) {
    return _then(
      _value.copyWith(
            tenure:
                freezed == tenure
                    ? _value.tenure
                    : tenure // ignore: cast_nullable_to_non_nullable
                        as int?,
            price:
                freezed == price
                    ? _value.price
                    : price // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            convenienceFee:
                freezed == convenienceFee
                    ? _value.convenienceFee
                    : convenienceFee // ignore: cast_nullable_to_non_nullable
                        as String?,
            conveniencePrice:
                freezed == conveniencePrice
                    ? _value.conveniencePrice
                    : conveniencePrice // ignore: cast_nullable_to_non_nullable
                        as String?,
            cConvenienceFee:
                freezed == cConvenienceFee
                    ? _value.cConvenienceFee
                    : cConvenienceFee // ignore: cast_nullable_to_non_nullable
                        as String?,
            cConveniencePrice:
                freezed == cConveniencePrice
                    ? _value.cConveniencePrice
                    : cConveniencePrice // ignore: cast_nullable_to_non_nullable
                        as String?,
            monthlyPayable:
                freezed == monthlyPayable
                    ? _value.monthlyPayable
                    : monthlyPayable // ignore: cast_nullable_to_non_nullable
                        as String?,
            total:
                freezed == total
                    ? _value.total
                    : total // ignore: cast_nullable_to_non_nullable
                        as String?,
            isSelected:
                null == isSelected
                    ? _value.isSelected
                    : isSelected // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmiTenureDetailModelImplCopyWith<$Res>
    implements $EmiTenureDetailModelCopyWith<$Res> {
  factory _$$EmiTenureDetailModelImplCopyWith(
    _$EmiTenureDetailModelImpl value,
    $Res Function(_$EmiTenureDetailModelImpl) then,
  ) = __$$EmiTenureDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'tenure') int? tenure,
    @JsonKey(name: 'price') dynamic price,
    @JsonKey(name: 'convenience_fee') String? convenienceFee,
    @JsonKey(name: 'convenience_price') String? conveniencePrice,
    @JsonKey(name: 'cconvenience_fee') String? cConvenienceFee,
    @JsonKey(name: 'cconvenience_price') String? cConveniencePrice,
    @JsonKey(name: 'monthly_payable') String? monthlyPayable,
    @JsonKey(name: 'total') String? total,
    @JsonKey(name: 'isSelected') bool isSelected,
  });
}

/// @nodoc
class __$$EmiTenureDetailModelImplCopyWithImpl<$Res>
    extends _$EmiTenureDetailModelCopyWithImpl<$Res, _$EmiTenureDetailModelImpl>
    implements _$$EmiTenureDetailModelImplCopyWith<$Res> {
  __$$EmiTenureDetailModelImplCopyWithImpl(
    _$EmiTenureDetailModelImpl _value,
    $Res Function(_$EmiTenureDetailModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmiTenureDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenure = freezed,
    Object? price = freezed,
    Object? convenienceFee = freezed,
    Object? conveniencePrice = freezed,
    Object? cConvenienceFee = freezed,
    Object? cConveniencePrice = freezed,
    Object? monthlyPayable = freezed,
    Object? total = freezed,
    Object? isSelected = null,
  }) {
    return _then(
      _$EmiTenureDetailModelImpl(
        tenure:
            freezed == tenure
                ? _value.tenure
                : tenure // ignore: cast_nullable_to_non_nullable
                    as int?,
        price:
            freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        convenienceFee:
            freezed == convenienceFee
                ? _value.convenienceFee
                : convenienceFee // ignore: cast_nullable_to_non_nullable
                    as String?,
        conveniencePrice:
            freezed == conveniencePrice
                ? _value.conveniencePrice
                : conveniencePrice // ignore: cast_nullable_to_non_nullable
                    as String?,
        cConvenienceFee:
            freezed == cConvenienceFee
                ? _value.cConvenienceFee
                : cConvenienceFee // ignore: cast_nullable_to_non_nullable
                    as String?,
        cConveniencePrice:
            freezed == cConveniencePrice
                ? _value.cConveniencePrice
                : cConveniencePrice // ignore: cast_nullable_to_non_nullable
                    as String?,
        monthlyPayable:
            freezed == monthlyPayable
                ? _value.monthlyPayable
                : monthlyPayable // ignore: cast_nullable_to_non_nullable
                    as String?,
        total:
            freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                    as String?,
        isSelected:
            null == isSelected
                ? _value.isSelected
                : isSelected // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmiTenureDetailModelImpl implements _EmiTenureDetailModel {
  const _$EmiTenureDetailModelImpl({
    @JsonKey(name: 'tenure') this.tenure,
    @JsonKey(name: 'price') this.price,
    @JsonKey(name: 'convenience_fee') this.convenienceFee,
    @JsonKey(name: 'convenience_price') this.conveniencePrice,
    @JsonKey(name: 'cconvenience_fee') this.cConvenienceFee,
    @JsonKey(name: 'cconvenience_price') this.cConveniencePrice,
    @JsonKey(name: 'monthly_payable') this.monthlyPayable,
    @JsonKey(name: 'total') this.total,
    @JsonKey(name: 'isSelected') this.isSelected = false,
  });

  factory _$EmiTenureDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmiTenureDetailModelImplFromJson(json);

  @override
  @JsonKey(name: 'tenure')
  final int? tenure;
  @override
  @JsonKey(name: 'price')
  final dynamic price;
  @override
  @JsonKey(name: 'convenience_fee')
  final String? convenienceFee;
  @override
  @JsonKey(name: 'convenience_price')
  final String? conveniencePrice;
  @override
  @JsonKey(name: 'cconvenience_fee')
  final String? cConvenienceFee;
  @override
  @JsonKey(name: 'cconvenience_price')
  final String? cConveniencePrice;
  @override
  @JsonKey(name: 'monthly_payable')
  final String? monthlyPayable;
  @override
  @JsonKey(name: 'total')
  final String? total;
  @override
  @JsonKey(name: 'isSelected')
  final bool isSelected;

  @override
  String toString() {
    return 'EmiTenureDetailModel(tenure: $tenure, price: $price, convenienceFee: $convenienceFee, conveniencePrice: $conveniencePrice, cConvenienceFee: $cConvenienceFee, cConveniencePrice: $cConveniencePrice, monthlyPayable: $monthlyPayable, total: $total, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmiTenureDetailModelImpl &&
            (identical(other.tenure, tenure) || other.tenure == tenure) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            (identical(other.convenienceFee, convenienceFee) ||
                other.convenienceFee == convenienceFee) &&
            (identical(other.conveniencePrice, conveniencePrice) ||
                other.conveniencePrice == conveniencePrice) &&
            (identical(other.cConvenienceFee, cConvenienceFee) ||
                other.cConvenienceFee == cConvenienceFee) &&
            (identical(other.cConveniencePrice, cConveniencePrice) ||
                other.cConveniencePrice == cConveniencePrice) &&
            (identical(other.monthlyPayable, monthlyPayable) ||
                other.monthlyPayable == monthlyPayable) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    tenure,
    const DeepCollectionEquality().hash(price),
    convenienceFee,
    conveniencePrice,
    cConvenienceFee,
    cConveniencePrice,
    monthlyPayable,
    total,
    isSelected,
  );

  /// Create a copy of EmiTenureDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmiTenureDetailModelImplCopyWith<_$EmiTenureDetailModelImpl>
  get copyWith =>
      __$$EmiTenureDetailModelImplCopyWithImpl<_$EmiTenureDetailModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EmiTenureDetailModelImplToJson(this);
  }
}

abstract class _EmiTenureDetailModel implements EmiTenureDetailModel {
  const factory _EmiTenureDetailModel({
    @JsonKey(name: 'tenure') final int? tenure,
    @JsonKey(name: 'price') final dynamic price,
    @JsonKey(name: 'convenience_fee') final String? convenienceFee,
    @JsonKey(name: 'convenience_price') final String? conveniencePrice,
    @JsonKey(name: 'cconvenience_fee') final String? cConvenienceFee,
    @JsonKey(name: 'cconvenience_price') final String? cConveniencePrice,
    @JsonKey(name: 'monthly_payable') final String? monthlyPayable,
    @JsonKey(name: 'total') final String? total,
    @JsonKey(name: 'isSelected') final bool isSelected,
  }) = _$EmiTenureDetailModelImpl;

  factory _EmiTenureDetailModel.fromJson(Map<String, dynamic> json) =
      _$EmiTenureDetailModelImpl.fromJson;

  @override
  @JsonKey(name: 'tenure')
  int? get tenure;
  @override
  @JsonKey(name: 'price')
  dynamic get price;
  @override
  @JsonKey(name: 'convenience_fee')
  String? get convenienceFee;
  @override
  @JsonKey(name: 'convenience_price')
  String? get conveniencePrice;
  @override
  @JsonKey(name: 'cconvenience_fee')
  String? get cConvenienceFee;
  @override
  @JsonKey(name: 'cconvenience_price')
  String? get cConveniencePrice;
  @override
  @JsonKey(name: 'monthly_payable')
  String? get monthlyPayable;
  @override
  @JsonKey(name: 'total')
  String? get total;
  @override
  @JsonKey(name: 'isSelected')
  bool get isSelected;

  /// Create a copy of EmiTenureDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmiTenureDetailModelImplCopyWith<_$EmiTenureDetailModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CemiTenureDetailModel _$CemiTenureDetailModelFromJson(
  Map<String, dynamic> json,
) {
  return _CemiTenureDetailModel.fromJson(json);
}

/// @nodoc
mixin _$CemiTenureDetailModel {
  @JsonKey(name: 'tenure')
  int? get tenure => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  dynamic get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'cconvenience_fee')
  String? get cConvenienceFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'cconvenience_price')
  String? get cConveniencePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_payable')
  String? get monthlyPayable => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  String? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSelected')
  bool get isSelected => throw _privateConstructorUsedError;

  /// Serializes this CemiTenureDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CemiTenureDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CemiTenureDetailModelCopyWith<CemiTenureDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CemiTenureDetailModelCopyWith<$Res> {
  factory $CemiTenureDetailModelCopyWith(
    CemiTenureDetailModel value,
    $Res Function(CemiTenureDetailModel) then,
  ) = _$CemiTenureDetailModelCopyWithImpl<$Res, CemiTenureDetailModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'tenure') int? tenure,
    @JsonKey(name: 'price') dynamic price,
    @JsonKey(name: 'cconvenience_fee') String? cConvenienceFee,
    @JsonKey(name: 'cconvenience_price') String? cConveniencePrice,
    @JsonKey(name: 'monthly_payable') String? monthlyPayable,
    @JsonKey(name: 'total') String? total,
    @JsonKey(name: 'isSelected') bool isSelected,
  });
}

/// @nodoc
class _$CemiTenureDetailModelCopyWithImpl<
  $Res,
  $Val extends CemiTenureDetailModel
>
    implements $CemiTenureDetailModelCopyWith<$Res> {
  _$CemiTenureDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CemiTenureDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenure = freezed,
    Object? price = freezed,
    Object? cConvenienceFee = freezed,
    Object? cConveniencePrice = freezed,
    Object? monthlyPayable = freezed,
    Object? total = freezed,
    Object? isSelected = null,
  }) {
    return _then(
      _value.copyWith(
            tenure:
                freezed == tenure
                    ? _value.tenure
                    : tenure // ignore: cast_nullable_to_non_nullable
                        as int?,
            price:
                freezed == price
                    ? _value.price
                    : price // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            cConvenienceFee:
                freezed == cConvenienceFee
                    ? _value.cConvenienceFee
                    : cConvenienceFee // ignore: cast_nullable_to_non_nullable
                        as String?,
            cConveniencePrice:
                freezed == cConveniencePrice
                    ? _value.cConveniencePrice
                    : cConveniencePrice // ignore: cast_nullable_to_non_nullable
                        as String?,
            monthlyPayable:
                freezed == monthlyPayable
                    ? _value.monthlyPayable
                    : monthlyPayable // ignore: cast_nullable_to_non_nullable
                        as String?,
            total:
                freezed == total
                    ? _value.total
                    : total // ignore: cast_nullable_to_non_nullable
                        as String?,
            isSelected:
                null == isSelected
                    ? _value.isSelected
                    : isSelected // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CemiTenureDetailModelImplCopyWith<$Res>
    implements $CemiTenureDetailModelCopyWith<$Res> {
  factory _$$CemiTenureDetailModelImplCopyWith(
    _$CemiTenureDetailModelImpl value,
    $Res Function(_$CemiTenureDetailModelImpl) then,
  ) = __$$CemiTenureDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'tenure') int? tenure,
    @JsonKey(name: 'price') dynamic price,
    @JsonKey(name: 'cconvenience_fee') String? cConvenienceFee,
    @JsonKey(name: 'cconvenience_price') String? cConveniencePrice,
    @JsonKey(name: 'monthly_payable') String? monthlyPayable,
    @JsonKey(name: 'total') String? total,
    @JsonKey(name: 'isSelected') bool isSelected,
  });
}

/// @nodoc
class __$$CemiTenureDetailModelImplCopyWithImpl<$Res>
    extends
        _$CemiTenureDetailModelCopyWithImpl<$Res, _$CemiTenureDetailModelImpl>
    implements _$$CemiTenureDetailModelImplCopyWith<$Res> {
  __$$CemiTenureDetailModelImplCopyWithImpl(
    _$CemiTenureDetailModelImpl _value,
    $Res Function(_$CemiTenureDetailModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CemiTenureDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenure = freezed,
    Object? price = freezed,
    Object? cConvenienceFee = freezed,
    Object? cConveniencePrice = freezed,
    Object? monthlyPayable = freezed,
    Object? total = freezed,
    Object? isSelected = null,
  }) {
    return _then(
      _$CemiTenureDetailModelImpl(
        tenure:
            freezed == tenure
                ? _value.tenure
                : tenure // ignore: cast_nullable_to_non_nullable
                    as int?,
        price:
            freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        cConvenienceFee:
            freezed == cConvenienceFee
                ? _value.cConvenienceFee
                : cConvenienceFee // ignore: cast_nullable_to_non_nullable
                    as String?,
        cConveniencePrice:
            freezed == cConveniencePrice
                ? _value.cConveniencePrice
                : cConveniencePrice // ignore: cast_nullable_to_non_nullable
                    as String?,
        monthlyPayable:
            freezed == monthlyPayable
                ? _value.monthlyPayable
                : monthlyPayable // ignore: cast_nullable_to_non_nullable
                    as String?,
        total:
            freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                    as String?,
        isSelected:
            null == isSelected
                ? _value.isSelected
                : isSelected // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CemiTenureDetailModelImpl implements _CemiTenureDetailModel {
  const _$CemiTenureDetailModelImpl({
    @JsonKey(name: 'tenure') this.tenure,
    @JsonKey(name: 'price') this.price,
    @JsonKey(name: 'cconvenience_fee') this.cConvenienceFee,
    @JsonKey(name: 'cconvenience_price') this.cConveniencePrice,
    @JsonKey(name: 'monthly_payable') this.monthlyPayable,
    @JsonKey(name: 'total') this.total,
    @JsonKey(name: 'isSelected') this.isSelected = false,
  });

  factory _$CemiTenureDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CemiTenureDetailModelImplFromJson(json);

  @override
  @JsonKey(name: 'tenure')
  final int? tenure;
  @override
  @JsonKey(name: 'price')
  final dynamic price;
  @override
  @JsonKey(name: 'cconvenience_fee')
  final String? cConvenienceFee;
  @override
  @JsonKey(name: 'cconvenience_price')
  final String? cConveniencePrice;
  @override
  @JsonKey(name: 'monthly_payable')
  final String? monthlyPayable;
  @override
  @JsonKey(name: 'total')
  final String? total;
  @override
  @JsonKey(name: 'isSelected')
  final bool isSelected;

  @override
  String toString() {
    return 'CemiTenureDetailModel(tenure: $tenure, price: $price, cConvenienceFee: $cConvenienceFee, cConveniencePrice: $cConveniencePrice, monthlyPayable: $monthlyPayable, total: $total, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CemiTenureDetailModelImpl &&
            (identical(other.tenure, tenure) || other.tenure == tenure) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            (identical(other.cConvenienceFee, cConvenienceFee) ||
                other.cConvenienceFee == cConvenienceFee) &&
            (identical(other.cConveniencePrice, cConveniencePrice) ||
                other.cConveniencePrice == cConveniencePrice) &&
            (identical(other.monthlyPayable, monthlyPayable) ||
                other.monthlyPayable == monthlyPayable) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    tenure,
    const DeepCollectionEquality().hash(price),
    cConvenienceFee,
    cConveniencePrice,
    monthlyPayable,
    total,
    isSelected,
  );

  /// Create a copy of CemiTenureDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CemiTenureDetailModelImplCopyWith<_$CemiTenureDetailModelImpl>
  get copyWith =>
      __$$CemiTenureDetailModelImplCopyWithImpl<_$CemiTenureDetailModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CemiTenureDetailModelImplToJson(this);
  }
}

abstract class _CemiTenureDetailModel implements CemiTenureDetailModel {
  const factory _CemiTenureDetailModel({
    @JsonKey(name: 'tenure') final int? tenure,
    @JsonKey(name: 'price') final dynamic price,
    @JsonKey(name: 'cconvenience_fee') final String? cConvenienceFee,
    @JsonKey(name: 'cconvenience_price') final String? cConveniencePrice,
    @JsonKey(name: 'monthly_payable') final String? monthlyPayable,
    @JsonKey(name: 'total') final String? total,
    @JsonKey(name: 'isSelected') final bool isSelected,
  }) = _$CemiTenureDetailModelImpl;

  factory _CemiTenureDetailModel.fromJson(Map<String, dynamic> json) =
      _$CemiTenureDetailModelImpl.fromJson;

  @override
  @JsonKey(name: 'tenure')
  int? get tenure;
  @override
  @JsonKey(name: 'price')
  dynamic get price;
  @override
  @JsonKey(name: 'cconvenience_fee')
  String? get cConvenienceFee;
  @override
  @JsonKey(name: 'cconvenience_price')
  String? get cConveniencePrice;
  @override
  @JsonKey(name: 'monthly_payable')
  String? get monthlyPayable;
  @override
  @JsonKey(name: 'total')
  String? get total;
  @override
  @JsonKey(name: 'isSelected')
  bool get isSelected;

  /// Create a copy of CemiTenureDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CemiTenureDetailModelImplCopyWith<_$CemiTenureDetailModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
