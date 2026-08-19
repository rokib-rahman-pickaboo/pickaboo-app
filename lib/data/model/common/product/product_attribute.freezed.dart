// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_attribute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductAttribute _$ProductAttributeFromJson(Map<String, dynamic> json) {
  return _ProductAttribute.fromJson(json);
}

/// @nodoc
mixin _$ProductAttribute {
  @HiveField(0)
  @JsonKey(name: "code")
  String? get code => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "label")
  String? get label => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "value")
  String? get value => throw _privateConstructorUsedError;

  /// Serializes this ProductAttribute to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductAttribute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductAttributeCopyWith<ProductAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductAttributeCopyWith<$Res> {
  factory $ProductAttributeCopyWith(
    ProductAttribute value,
    $Res Function(ProductAttribute) then,
  ) = _$ProductAttributeCopyWithImpl<$Res, ProductAttribute>;
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "code") String? code,
    @HiveField(1) @JsonKey(name: "label") String? label,
    @HiveField(2) @JsonKey(name: "value") String? value,
  });
}

/// @nodoc
class _$ProductAttributeCopyWithImpl<$Res, $Val extends ProductAttribute>
    implements $ProductAttributeCopyWith<$Res> {
  _$ProductAttributeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductAttribute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? label = freezed,
    Object? value = freezed,
  }) {
    return _then(
      _value.copyWith(
            code:
                freezed == code
                    ? _value.code
                    : code // ignore: cast_nullable_to_non_nullable
                        as String?,
            label:
                freezed == label
                    ? _value.label
                    : label // ignore: cast_nullable_to_non_nullable
                        as String?,
            value:
                freezed == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductAttributeImplCopyWith<$Res>
    implements $ProductAttributeCopyWith<$Res> {
  factory _$$ProductAttributeImplCopyWith(
    _$ProductAttributeImpl value,
    $Res Function(_$ProductAttributeImpl) then,
  ) = __$$ProductAttributeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "code") String? code,
    @HiveField(1) @JsonKey(name: "label") String? label,
    @HiveField(2) @JsonKey(name: "value") String? value,
  });
}

/// @nodoc
class __$$ProductAttributeImplCopyWithImpl<$Res>
    extends _$ProductAttributeCopyWithImpl<$Res, _$ProductAttributeImpl>
    implements _$$ProductAttributeImplCopyWith<$Res> {
  __$$ProductAttributeImplCopyWithImpl(
    _$ProductAttributeImpl _value,
    $Res Function(_$ProductAttributeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductAttribute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? label = freezed,
    Object? value = freezed,
  }) {
    return _then(
      _$ProductAttributeImpl(
        code:
            freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                    as String?,
        label:
            freezed == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                    as String?,
        value:
            freezed == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductAttributeImpl implements _ProductAttribute {
  const _$ProductAttributeImpl({
    @HiveField(0) @JsonKey(name: "code") this.code,
    @HiveField(1) @JsonKey(name: "label") this.label,
    @HiveField(2) @JsonKey(name: "value") this.value,
  });

  factory _$ProductAttributeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductAttributeImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "code")
  final String? code;
  @override
  @HiveField(1)
  @JsonKey(name: "label")
  final String? label;
  @override
  @HiveField(2)
  @JsonKey(name: "value")
  final String? value;

  @override
  String toString() {
    return 'ProductAttribute(code: $code, label: $label, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductAttributeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, label, value);

  /// Create a copy of ProductAttribute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductAttributeImplCopyWith<_$ProductAttributeImpl> get copyWith =>
      __$$ProductAttributeImplCopyWithImpl<_$ProductAttributeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductAttributeImplToJson(this);
  }
}

abstract class _ProductAttribute implements ProductAttribute {
  const factory _ProductAttribute({
    @HiveField(0) @JsonKey(name: "code") final String? code,
    @HiveField(1) @JsonKey(name: "label") final String? label,
    @HiveField(2) @JsonKey(name: "value") final String? value,
  }) = _$ProductAttributeImpl;

  factory _ProductAttribute.fromJson(Map<String, dynamic> json) =
      _$ProductAttributeImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "code")
  String? get code;
  @override
  @HiveField(1)
  @JsonKey(name: "label")
  String? get label;
  @override
  @HiveField(2)
  @JsonKey(name: "value")
  String? get value;

  /// Create a copy of ProductAttribute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductAttributeImplCopyWith<_$ProductAttributeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
