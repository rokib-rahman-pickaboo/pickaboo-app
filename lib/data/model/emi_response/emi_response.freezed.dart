// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emi_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EmiResponse _$EmiResponseFromJson(Map<String, dynamic> json) {
  return _EmiResponse.fromJson(json);
}

/// @nodoc
mixin _$EmiResponse {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "icon")
  String? get icon => throw _privateConstructorUsedError;
  @JsonKey(name: "emi_tenures")
  List<EmiTenure>? get emiTenures => throw _privateConstructorUsedError;

  /// Serializes this EmiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmiResponseCopyWith<EmiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmiResponseCopyWith<$Res> {
  factory $EmiResponseCopyWith(
    EmiResponse value,
    $Res Function(EmiResponse) then,
  ) = _$EmiResponseCopyWithImpl<$Res, EmiResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "icon") String? icon,
    @JsonKey(name: "emi_tenures") List<EmiTenure>? emiTenures,
  });
}

/// @nodoc
class _$EmiResponseCopyWithImpl<$Res, $Val extends EmiResponse>
    implements $EmiResponseCopyWith<$Res> {
  _$EmiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? icon = freezed,
    Object? emiTenures = freezed,
  }) {
    return _then(
      _value.copyWith(
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            icon:
                freezed == icon
                    ? _value.icon
                    : icon // ignore: cast_nullable_to_non_nullable
                        as String?,
            emiTenures:
                freezed == emiTenures
                    ? _value.emiTenures
                    : emiTenures // ignore: cast_nullable_to_non_nullable
                        as List<EmiTenure>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmiResponseImplCopyWith<$Res>
    implements $EmiResponseCopyWith<$Res> {
  factory _$$EmiResponseImplCopyWith(
    _$EmiResponseImpl value,
    $Res Function(_$EmiResponseImpl) then,
  ) = __$$EmiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "icon") String? icon,
    @JsonKey(name: "emi_tenures") List<EmiTenure>? emiTenures,
  });
}

/// @nodoc
class __$$EmiResponseImplCopyWithImpl<$Res>
    extends _$EmiResponseCopyWithImpl<$Res, _$EmiResponseImpl>
    implements _$$EmiResponseImplCopyWith<$Res> {
  __$$EmiResponseImplCopyWithImpl(
    _$EmiResponseImpl _value,
    $Res Function(_$EmiResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? icon = freezed,
    Object? emiTenures = freezed,
  }) {
    return _then(
      _$EmiResponseImpl(
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        icon:
            freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                    as String?,
        emiTenures:
            freezed == emiTenures
                ? _value._emiTenures
                : emiTenures // ignore: cast_nullable_to_non_nullable
                    as List<EmiTenure>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmiResponseImpl implements _EmiResponse {
  const _$EmiResponseImpl({
    @JsonKey(name: "name") this.name,
    @JsonKey(name: "icon") this.icon,
    @JsonKey(name: "emi_tenures") final List<EmiTenure>? emiTenures,
  }) : _emiTenures = emiTenures;

  factory _$EmiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmiResponseImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "icon")
  final String? icon;
  final List<EmiTenure>? _emiTenures;
  @override
  @JsonKey(name: "emi_tenures")
  List<EmiTenure>? get emiTenures {
    final value = _emiTenures;
    if (value == null) return null;
    if (_emiTenures is EqualUnmodifiableListView) return _emiTenures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EmiResponse(name: $name, icon: $icon, emiTenures: $emiTenures)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmiResponseImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            const DeepCollectionEquality().equals(
              other._emiTenures,
              _emiTenures,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    icon,
    const DeepCollectionEquality().hash(_emiTenures),
  );

  /// Create a copy of EmiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmiResponseImplCopyWith<_$EmiResponseImpl> get copyWith =>
      __$$EmiResponseImplCopyWithImpl<_$EmiResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmiResponseImplToJson(this);
  }
}

abstract class _EmiResponse implements EmiResponse {
  const factory _EmiResponse({
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "icon") final String? icon,
    @JsonKey(name: "emi_tenures") final List<EmiTenure>? emiTenures,
  }) = _$EmiResponseImpl;

  factory _EmiResponse.fromJson(Map<String, dynamic> json) =
      _$EmiResponseImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "icon")
  String? get icon;
  @override
  @JsonKey(name: "emi_tenures")
  List<EmiTenure>? get emiTenures;

  /// Create a copy of EmiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmiResponseImplCopyWith<_$EmiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmiTenure _$EmiTenureFromJson(Map<String, dynamic> json) {
  return _EmiTenure.fromJson(json);
}

/// @nodoc
mixin _$EmiTenure {
  @JsonKey(name: "tenure")
  int? get tenure => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "convenience_fee")
  String? get convenienceFee => throw _privateConstructorUsedError;
  @JsonKey(name: "convenience_price")
  String? get conveniencePrice => throw _privateConstructorUsedError;
  @JsonKey(name: "monthly_payable")
  String? get monthlyPayable => throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  String? get total => throw _privateConstructorUsedError;

  /// Serializes this EmiTenure to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmiTenure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmiTenureCopyWith<EmiTenure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmiTenureCopyWith<$Res> {
  factory $EmiTenureCopyWith(EmiTenure value, $Res Function(EmiTenure) then) =
      _$EmiTenureCopyWithImpl<$Res, EmiTenure>;
  @useResult
  $Res call({
    @JsonKey(name: "tenure") int? tenure,
    @JsonKey(name: "price") String? price,
    @JsonKey(name: "convenience_fee") String? convenienceFee,
    @JsonKey(name: "convenience_price") String? conveniencePrice,
    @JsonKey(name: "monthly_payable") String? monthlyPayable,
    @JsonKey(name: "total") String? total,
  });
}

/// @nodoc
class _$EmiTenureCopyWithImpl<$Res, $Val extends EmiTenure>
    implements $EmiTenureCopyWith<$Res> {
  _$EmiTenureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmiTenure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenure = freezed,
    Object? price = freezed,
    Object? convenienceFee = freezed,
    Object? conveniencePrice = freezed,
    Object? monthlyPayable = freezed,
    Object? total = freezed,
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
                        as String?,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmiTenureImplCopyWith<$Res>
    implements $EmiTenureCopyWith<$Res> {
  factory _$$EmiTenureImplCopyWith(
    _$EmiTenureImpl value,
    $Res Function(_$EmiTenureImpl) then,
  ) = __$$EmiTenureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "tenure") int? tenure,
    @JsonKey(name: "price") String? price,
    @JsonKey(name: "convenience_fee") String? convenienceFee,
    @JsonKey(name: "convenience_price") String? conveniencePrice,
    @JsonKey(name: "monthly_payable") String? monthlyPayable,
    @JsonKey(name: "total") String? total,
  });
}

/// @nodoc
class __$$EmiTenureImplCopyWithImpl<$Res>
    extends _$EmiTenureCopyWithImpl<$Res, _$EmiTenureImpl>
    implements _$$EmiTenureImplCopyWith<$Res> {
  __$$EmiTenureImplCopyWithImpl(
    _$EmiTenureImpl _value,
    $Res Function(_$EmiTenureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmiTenure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenure = freezed,
    Object? price = freezed,
    Object? convenienceFee = freezed,
    Object? conveniencePrice = freezed,
    Object? monthlyPayable = freezed,
    Object? total = freezed,
  }) {
    return _then(
      _$EmiTenureImpl(
        tenure:
            freezed == tenure
                ? _value.tenure
                : tenure // ignore: cast_nullable_to_non_nullable
                    as int?,
        price:
            freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as String?,
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmiTenureImpl implements _EmiTenure {
  const _$EmiTenureImpl({
    @JsonKey(name: "tenure") this.tenure,
    @JsonKey(name: "price") this.price,
    @JsonKey(name: "convenience_fee") this.convenienceFee,
    @JsonKey(name: "convenience_price") this.conveniencePrice,
    @JsonKey(name: "monthly_payable") this.monthlyPayable,
    @JsonKey(name: "total") this.total,
  });

  factory _$EmiTenureImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmiTenureImplFromJson(json);

  @override
  @JsonKey(name: "tenure")
  final int? tenure;
  @override
  @JsonKey(name: "price")
  final String? price;
  @override
  @JsonKey(name: "convenience_fee")
  final String? convenienceFee;
  @override
  @JsonKey(name: "convenience_price")
  final String? conveniencePrice;
  @override
  @JsonKey(name: "monthly_payable")
  final String? monthlyPayable;
  @override
  @JsonKey(name: "total")
  final String? total;

  @override
  String toString() {
    return 'EmiTenure(tenure: $tenure, price: $price, convenienceFee: $convenienceFee, conveniencePrice: $conveniencePrice, monthlyPayable: $monthlyPayable, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmiTenureImpl &&
            (identical(other.tenure, tenure) || other.tenure == tenure) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.convenienceFee, convenienceFee) ||
                other.convenienceFee == convenienceFee) &&
            (identical(other.conveniencePrice, conveniencePrice) ||
                other.conveniencePrice == conveniencePrice) &&
            (identical(other.monthlyPayable, monthlyPayable) ||
                other.monthlyPayable == monthlyPayable) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    tenure,
    price,
    convenienceFee,
    conveniencePrice,
    monthlyPayable,
    total,
  );

  /// Create a copy of EmiTenure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmiTenureImplCopyWith<_$EmiTenureImpl> get copyWith =>
      __$$EmiTenureImplCopyWithImpl<_$EmiTenureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmiTenureImplToJson(this);
  }
}

abstract class _EmiTenure implements EmiTenure {
  const factory _EmiTenure({
    @JsonKey(name: "tenure") final int? tenure,
    @JsonKey(name: "price") final String? price,
    @JsonKey(name: "convenience_fee") final String? convenienceFee,
    @JsonKey(name: "convenience_price") final String? conveniencePrice,
    @JsonKey(name: "monthly_payable") final String? monthlyPayable,
    @JsonKey(name: "total") final String? total,
  }) = _$EmiTenureImpl;

  factory _EmiTenure.fromJson(Map<String, dynamic> json) =
      _$EmiTenureImpl.fromJson;

  @override
  @JsonKey(name: "tenure")
  int? get tenure;
  @override
  @JsonKey(name: "price")
  String? get price;
  @override
  @JsonKey(name: "convenience_fee")
  String? get convenienceFee;
  @override
  @JsonKey(name: "convenience_price")
  String? get conveniencePrice;
  @override
  @JsonKey(name: "monthly_payable")
  String? get monthlyPayable;
  @override
  @JsonKey(name: "total")
  String? get total;

  /// Create a copy of EmiTenure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmiTenureImplCopyWith<_$EmiTenureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
