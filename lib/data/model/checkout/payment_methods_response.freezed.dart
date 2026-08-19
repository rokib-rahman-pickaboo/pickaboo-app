// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_methods_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PaymentMethodsResponse _$PaymentMethodsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _PaymentMethodsResponse.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodsResponse {
  @JsonKey(name: "payment_methods")
  List<PaymentMethodModel>? get paymentMethods =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "totals")
  CartTotals? get totals => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethodsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodsResponseCopyWith<PaymentMethodsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodsResponseCopyWith<$Res> {
  factory $PaymentMethodsResponseCopyWith(
    PaymentMethodsResponse value,
    $Res Function(PaymentMethodsResponse) then,
  ) = _$PaymentMethodsResponseCopyWithImpl<$Res, PaymentMethodsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "payment_methods") List<PaymentMethodModel>? paymentMethods,
    @JsonKey(name: "totals") CartTotals? totals,
  });

  $CartTotalsCopyWith<$Res>? get totals;
}

/// @nodoc
class _$PaymentMethodsResponseCopyWithImpl<
  $Res,
  $Val extends PaymentMethodsResponse
>
    implements $PaymentMethodsResponseCopyWith<$Res> {
  _$PaymentMethodsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? paymentMethods = freezed, Object? totals = freezed}) {
    return _then(
      _value.copyWith(
            paymentMethods:
                freezed == paymentMethods
                    ? _value.paymentMethods
                    : paymentMethods // ignore: cast_nullable_to_non_nullable
                        as List<PaymentMethodModel>?,
            totals:
                freezed == totals
                    ? _value.totals
                    : totals // ignore: cast_nullable_to_non_nullable
                        as CartTotals?,
          )
          as $Val,
    );
  }

  /// Create a copy of PaymentMethodsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CartTotalsCopyWith<$Res>? get totals {
    if (_value.totals == null) {
      return null;
    }

    return $CartTotalsCopyWith<$Res>(_value.totals!, (value) {
      return _then(_value.copyWith(totals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentMethodsResponseImplCopyWith<$Res>
    implements $PaymentMethodsResponseCopyWith<$Res> {
  factory _$$PaymentMethodsResponseImplCopyWith(
    _$PaymentMethodsResponseImpl value,
    $Res Function(_$PaymentMethodsResponseImpl) then,
  ) = __$$PaymentMethodsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "payment_methods") List<PaymentMethodModel>? paymentMethods,
    @JsonKey(name: "totals") CartTotals? totals,
  });

  @override
  $CartTotalsCopyWith<$Res>? get totals;
}

/// @nodoc
class __$$PaymentMethodsResponseImplCopyWithImpl<$Res>
    extends
        _$PaymentMethodsResponseCopyWithImpl<$Res, _$PaymentMethodsResponseImpl>
    implements _$$PaymentMethodsResponseImplCopyWith<$Res> {
  __$$PaymentMethodsResponseImplCopyWithImpl(
    _$PaymentMethodsResponseImpl _value,
    $Res Function(_$PaymentMethodsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentMethodsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? paymentMethods = freezed, Object? totals = freezed}) {
    return _then(
      _$PaymentMethodsResponseImpl(
        paymentMethods:
            freezed == paymentMethods
                ? _value._paymentMethods
                : paymentMethods // ignore: cast_nullable_to_non_nullable
                    as List<PaymentMethodModel>?,
        totals:
            freezed == totals
                ? _value.totals
                : totals // ignore: cast_nullable_to_non_nullable
                    as CartTotals?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodsResponseImpl implements _PaymentMethodsResponse {
  const _$PaymentMethodsResponseImpl({
    @JsonKey(name: "payment_methods")
    final List<PaymentMethodModel>? paymentMethods,
    @JsonKey(name: "totals") this.totals,
  }) : _paymentMethods = paymentMethods;

  factory _$PaymentMethodsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodsResponseImplFromJson(json);

  final List<PaymentMethodModel>? _paymentMethods;
  @override
  @JsonKey(name: "payment_methods")
  List<PaymentMethodModel>? get paymentMethods {
    final value = _paymentMethods;
    if (value == null) return null;
    if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "totals")
  final CartTotals? totals;

  @override
  String toString() {
    return 'PaymentMethodsResponse(paymentMethods: $paymentMethods, totals: $totals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodsResponseImpl &&
            const DeepCollectionEquality().equals(
              other._paymentMethods,
              _paymentMethods,
            ) &&
            (identical(other.totals, totals) || other.totals == totals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_paymentMethods),
    totals,
  );

  /// Create a copy of PaymentMethodsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodsResponseImplCopyWith<_$PaymentMethodsResponseImpl>
  get copyWith =>
      __$$PaymentMethodsResponseImplCopyWithImpl<_$PaymentMethodsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodsResponseImplToJson(this);
  }
}

abstract class _PaymentMethodsResponse implements PaymentMethodsResponse {
  const factory _PaymentMethodsResponse({
    @JsonKey(name: "payment_methods")
    final List<PaymentMethodModel>? paymentMethods,
    @JsonKey(name: "totals") final CartTotals? totals,
  }) = _$PaymentMethodsResponseImpl;

  factory _PaymentMethodsResponse.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodsResponseImpl.fromJson;

  @override
  @JsonKey(name: "payment_methods")
  List<PaymentMethodModel>? get paymentMethods;
  @override
  @JsonKey(name: "totals")
  CartTotals? get totals;

  /// Create a copy of PaymentMethodsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodsResponseImplCopyWith<_$PaymentMethodsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PaymentMethodModel _$PaymentMethodModelFromJson(Map<String, dynamic> json) {
  return _PaymentMethodModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodModel {
  @JsonKey(name: "code")
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "subtitle")
  String? get subtitle => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_gateway")
  String? get paymentGateway => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethodModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodModelCopyWith<PaymentMethodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodModelCopyWith<$Res> {
  factory $PaymentMethodModelCopyWith(
    PaymentMethodModel value,
    $Res Function(PaymentMethodModel) then,
  ) = _$PaymentMethodModelCopyWithImpl<$Res, PaymentMethodModel>;
  @useResult
  $Res call({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "subtitle") String? subtitle,
    @JsonKey(name: "payment_gateway") String? paymentGateway,
  });
}

/// @nodoc
class _$PaymentMethodModelCopyWithImpl<$Res, $Val extends PaymentMethodModel>
    implements $PaymentMethodModelCopyWith<$Res> {
  _$PaymentMethodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? paymentGateway = freezed,
  }) {
    return _then(
      _value.copyWith(
            code:
                freezed == code
                    ? _value.code
                    : code // ignore: cast_nullable_to_non_nullable
                        as String?,
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            subtitle:
                freezed == subtitle
                    ? _value.subtitle
                    : subtitle // ignore: cast_nullable_to_non_nullable
                        as String?,
            paymentGateway:
                freezed == paymentGateway
                    ? _value.paymentGateway
                    : paymentGateway // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentMethodModelImplCopyWith<$Res>
    implements $PaymentMethodModelCopyWith<$Res> {
  factory _$$PaymentMethodModelImplCopyWith(
    _$PaymentMethodModelImpl value,
    $Res Function(_$PaymentMethodModelImpl) then,
  ) = __$$PaymentMethodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "subtitle") String? subtitle,
    @JsonKey(name: "payment_gateway") String? paymentGateway,
  });
}

/// @nodoc
class __$$PaymentMethodModelImplCopyWithImpl<$Res>
    extends _$PaymentMethodModelCopyWithImpl<$Res, _$PaymentMethodModelImpl>
    implements _$$PaymentMethodModelImplCopyWith<$Res> {
  __$$PaymentMethodModelImplCopyWithImpl(
    _$PaymentMethodModelImpl _value,
    $Res Function(_$PaymentMethodModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? paymentGateway = freezed,
  }) {
    return _then(
      _$PaymentMethodModelImpl(
        code:
            freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                    as String?,
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        subtitle:
            freezed == subtitle
                ? _value.subtitle
                : subtitle // ignore: cast_nullable_to_non_nullable
                    as String?,
        paymentGateway:
            freezed == paymentGateway
                ? _value.paymentGateway
                : paymentGateway // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodModelImpl implements _PaymentMethodModel {
  const _$PaymentMethodModelImpl({
    @JsonKey(name: "code") this.code,
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "subtitle") this.subtitle,
    @JsonKey(name: "payment_gateway") this.paymentGateway,
  });

  factory _$PaymentMethodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodModelImplFromJson(json);

  @override
  @JsonKey(name: "code")
  final String? code;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "subtitle")
  final String? subtitle;
  @override
  @JsonKey(name: "payment_gateway")
  final String? paymentGateway;

  @override
  String toString() {
    return 'PaymentMethodModel(code: $code, title: $title, subtitle: $subtitle, paymentGateway: $paymentGateway)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.paymentGateway, paymentGateway) ||
                other.paymentGateway == paymentGateway));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, title, subtitle, paymentGateway);

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodModelImplCopyWith<_$PaymentMethodModelImpl> get copyWith =>
      __$$PaymentMethodModelImplCopyWithImpl<_$PaymentMethodModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodModelImplToJson(this);
  }
}

abstract class _PaymentMethodModel implements PaymentMethodModel {
  const factory _PaymentMethodModel({
    @JsonKey(name: "code") final String? code,
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "subtitle") final String? subtitle,
    @JsonKey(name: "payment_gateway") final String? paymentGateway,
  }) = _$PaymentMethodModelImpl;

  factory _PaymentMethodModel.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodModelImpl.fromJson;

  @override
  @JsonKey(name: "code")
  String? get code;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "subtitle")
  String? get subtitle;
  @override
  @JsonKey(name: "payment_gateway")
  String? get paymentGateway;

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodModelImplCopyWith<_$PaymentMethodModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
