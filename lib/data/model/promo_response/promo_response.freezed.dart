// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promo_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PromoResponse _$PromoResponseFromJson(Map<String, dynamic> json) {
  return _PromoResponse.fromJson(json);
}

/// @nodoc
mixin _$PromoResponse {
  @JsonKey(name: "is_eligible")
  bool? get isEligible => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "coupon_code")
  String? get couponCode => throw _privateConstructorUsedError;

  /// Serializes this PromoResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromoResponseCopyWith<PromoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromoResponseCopyWith<$Res> {
  factory $PromoResponseCopyWith(
    PromoResponse value,
    $Res Function(PromoResponse) then,
  ) = _$PromoResponseCopyWithImpl<$Res, PromoResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "is_eligible") bool? isEligible,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "coupon_code") String? couponCode,
  });
}

/// @nodoc
class _$PromoResponseCopyWithImpl<$Res, $Val extends PromoResponse>
    implements $PromoResponseCopyWith<$Res> {
  _$PromoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEligible = freezed,
    Object? message = freezed,
    Object? couponCode = freezed,
  }) {
    return _then(
      _value.copyWith(
            isEligible:
                freezed == isEligible
                    ? _value.isEligible
                    : isEligible // ignore: cast_nullable_to_non_nullable
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PromoResponseImplCopyWith<$Res>
    implements $PromoResponseCopyWith<$Res> {
  factory _$$PromoResponseImplCopyWith(
    _$PromoResponseImpl value,
    $Res Function(_$PromoResponseImpl) then,
  ) = __$$PromoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "is_eligible") bool? isEligible,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "coupon_code") String? couponCode,
  });
}

/// @nodoc
class __$$PromoResponseImplCopyWithImpl<$Res>
    extends _$PromoResponseCopyWithImpl<$Res, _$PromoResponseImpl>
    implements _$$PromoResponseImplCopyWith<$Res> {
  __$$PromoResponseImplCopyWithImpl(
    _$PromoResponseImpl _value,
    $Res Function(_$PromoResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PromoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEligible = freezed,
    Object? message = freezed,
    Object? couponCode = freezed,
  }) {
    return _then(
      _$PromoResponseImpl(
        isEligible:
            freezed == isEligible
                ? _value.isEligible
                : isEligible // ignore: cast_nullable_to_non_nullable
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PromoResponseImpl implements _PromoResponse {
  const _$PromoResponseImpl({
    @JsonKey(name: "is_eligible") this.isEligible,
    @JsonKey(name: "message") this.message,
    @JsonKey(name: "coupon_code") this.couponCode,
  });

  factory _$PromoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromoResponseImplFromJson(json);

  @override
  @JsonKey(name: "is_eligible")
  final bool? isEligible;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "coupon_code")
  final String? couponCode;

  @override
  String toString() {
    return 'PromoResponse(isEligible: $isEligible, message: $message, couponCode: $couponCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromoResponseImpl &&
            (identical(other.isEligible, isEligible) ||
                other.isEligible == isEligible) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isEligible, message, couponCode);

  /// Create a copy of PromoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromoResponseImplCopyWith<_$PromoResponseImpl> get copyWith =>
      __$$PromoResponseImplCopyWithImpl<_$PromoResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromoResponseImplToJson(this);
  }
}

abstract class _PromoResponse implements PromoResponse {
  const factory _PromoResponse({
    @JsonKey(name: "is_eligible") final bool? isEligible,
    @JsonKey(name: "message") final String? message,
    @JsonKey(name: "coupon_code") final String? couponCode,
  }) = _$PromoResponseImpl;

  factory _PromoResponse.fromJson(Map<String, dynamic> json) =
      _$PromoResponseImpl.fromJson;

  @override
  @JsonKey(name: "is_eligible")
  bool? get isEligible;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "coupon_code")
  String? get couponCode;

  /// Create a copy of PromoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromoResponseImplCopyWith<_$PromoResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
