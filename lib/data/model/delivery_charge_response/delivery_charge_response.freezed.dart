// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_charge_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DeliveryChargeResponse _$DeliveryChargeResponseFromJson(
  Map<String, dynamic> json,
) {
  return _DeliveryChargeResponse.fromJson(json);
}

/// @nodoc
mixin _$DeliveryChargeResponse {
  @JsonKey(name: "product_id")
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: "sku")
  String? get sku => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "qty")
  int? get qty => throw _privateConstructorUsedError;
  @JsonKey(name: "inside_charge")
  int? get insideCharge => throw _privateConstructorUsedError;
  @JsonKey(name: "outside_charge")
  int? get outsideCharge => throw _privateConstructorUsedError;

  /// Serializes this DeliveryChargeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryChargeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryChargeResponseCopyWith<DeliveryChargeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryChargeResponseCopyWith<$Res> {
  factory $DeliveryChargeResponseCopyWith(
    DeliveryChargeResponse value,
    $Res Function(DeliveryChargeResponse) then,
  ) = _$DeliveryChargeResponseCopyWithImpl<$Res, DeliveryChargeResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "qty") int? qty,
    @JsonKey(name: "inside_charge") int? insideCharge,
    @JsonKey(name: "outside_charge") int? outsideCharge,
  });
}

/// @nodoc
class _$DeliveryChargeResponseCopyWithImpl<
  $Res,
  $Val extends DeliveryChargeResponse
>
    implements $DeliveryChargeResponseCopyWith<$Res> {
  _$DeliveryChargeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryChargeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? sku = freezed,
    Object? slug = freezed,
    Object? name = freezed,
    Object? qty = freezed,
    Object? insideCharge = freezed,
    Object? outsideCharge = freezed,
  }) {
    return _then(
      _value.copyWith(
            productId:
                freezed == productId
                    ? _value.productId
                    : productId // ignore: cast_nullable_to_non_nullable
                        as int?,
            sku:
                freezed == sku
                    ? _value.sku
                    : sku // ignore: cast_nullable_to_non_nullable
                        as String?,
            slug:
                freezed == slug
                    ? _value.slug
                    : slug // ignore: cast_nullable_to_non_nullable
                        as String?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            qty:
                freezed == qty
                    ? _value.qty
                    : qty // ignore: cast_nullable_to_non_nullable
                        as int?,
            insideCharge:
                freezed == insideCharge
                    ? _value.insideCharge
                    : insideCharge // ignore: cast_nullable_to_non_nullable
                        as int?,
            outsideCharge:
                freezed == outsideCharge
                    ? _value.outsideCharge
                    : outsideCharge // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeliveryChargeResponseImplCopyWith<$Res>
    implements $DeliveryChargeResponseCopyWith<$Res> {
  factory _$$DeliveryChargeResponseImplCopyWith(
    _$DeliveryChargeResponseImpl value,
    $Res Function(_$DeliveryChargeResponseImpl) then,
  ) = __$$DeliveryChargeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "qty") int? qty,
    @JsonKey(name: "inside_charge") int? insideCharge,
    @JsonKey(name: "outside_charge") int? outsideCharge,
  });
}

/// @nodoc
class __$$DeliveryChargeResponseImplCopyWithImpl<$Res>
    extends
        _$DeliveryChargeResponseCopyWithImpl<$Res, _$DeliveryChargeResponseImpl>
    implements _$$DeliveryChargeResponseImplCopyWith<$Res> {
  __$$DeliveryChargeResponseImplCopyWithImpl(
    _$DeliveryChargeResponseImpl _value,
    $Res Function(_$DeliveryChargeResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeliveryChargeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? sku = freezed,
    Object? slug = freezed,
    Object? name = freezed,
    Object? qty = freezed,
    Object? insideCharge = freezed,
    Object? outsideCharge = freezed,
  }) {
    return _then(
      _$DeliveryChargeResponseImpl(
        productId:
            freezed == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                    as int?,
        sku:
            freezed == sku
                ? _value.sku
                : sku // ignore: cast_nullable_to_non_nullable
                    as String?,
        slug:
            freezed == slug
                ? _value.slug
                : slug // ignore: cast_nullable_to_non_nullable
                    as String?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        qty:
            freezed == qty
                ? _value.qty
                : qty // ignore: cast_nullable_to_non_nullable
                    as int?,
        insideCharge:
            freezed == insideCharge
                ? _value.insideCharge
                : insideCharge // ignore: cast_nullable_to_non_nullable
                    as int?,
        outsideCharge:
            freezed == outsideCharge
                ? _value.outsideCharge
                : outsideCharge // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryChargeResponseImpl implements _DeliveryChargeResponse {
  const _$DeliveryChargeResponseImpl({
    @JsonKey(name: "product_id") this.productId,
    @JsonKey(name: "sku") this.sku,
    @JsonKey(name: "slug") this.slug,
    @JsonKey(name: "name") this.name,
    @JsonKey(name: "qty") this.qty,
    @JsonKey(name: "inside_charge") this.insideCharge,
    @JsonKey(name: "outside_charge") this.outsideCharge,
  });

  factory _$DeliveryChargeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryChargeResponseImplFromJson(json);

  @override
  @JsonKey(name: "product_id")
  final int? productId;
  @override
  @JsonKey(name: "sku")
  final String? sku;
  @override
  @JsonKey(name: "slug")
  final String? slug;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "qty")
  final int? qty;
  @override
  @JsonKey(name: "inside_charge")
  final int? insideCharge;
  @override
  @JsonKey(name: "outside_charge")
  final int? outsideCharge;

  @override
  String toString() {
    return 'DeliveryChargeResponse(productId: $productId, sku: $sku, slug: $slug, name: $name, qty: $qty, insideCharge: $insideCharge, outsideCharge: $outsideCharge)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryChargeResponseImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.insideCharge, insideCharge) ||
                other.insideCharge == insideCharge) &&
            (identical(other.outsideCharge, outsideCharge) ||
                other.outsideCharge == outsideCharge));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    productId,
    sku,
    slug,
    name,
    qty,
    insideCharge,
    outsideCharge,
  );

  /// Create a copy of DeliveryChargeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryChargeResponseImplCopyWith<_$DeliveryChargeResponseImpl>
  get copyWith =>
      __$$DeliveryChargeResponseImplCopyWithImpl<_$DeliveryChargeResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryChargeResponseImplToJson(this);
  }
}

abstract class _DeliveryChargeResponse implements DeliveryChargeResponse {
  const factory _DeliveryChargeResponse({
    @JsonKey(name: "product_id") final int? productId,
    @JsonKey(name: "sku") final String? sku,
    @JsonKey(name: "slug") final String? slug,
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "qty") final int? qty,
    @JsonKey(name: "inside_charge") final int? insideCharge,
    @JsonKey(name: "outside_charge") final int? outsideCharge,
  }) = _$DeliveryChargeResponseImpl;

  factory _DeliveryChargeResponse.fromJson(Map<String, dynamic> json) =
      _$DeliveryChargeResponseImpl.fromJson;

  @override
  @JsonKey(name: "product_id")
  int? get productId;
  @override
  @JsonKey(name: "sku")
  String? get sku;
  @override
  @JsonKey(name: "slug")
  String? get slug;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "qty")
  int? get qty;
  @override
  @JsonKey(name: "inside_charge")
  int? get insideCharge;
  @override
  @JsonKey(name: "outside_charge")
  int? get outsideCharge;

  /// Create a copy of DeliveryChargeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryChargeResponseImplCopyWith<_$DeliveryChargeResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
