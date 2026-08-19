// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_option_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductOptionResponse _$ProductOptionResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ProductOptionResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductOptionResponse {
  @JsonKey(name: "extension_attributes")
  ExtensionAttributesResponse? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this ProductOptionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductOptionResponseCopyWith<ProductOptionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductOptionResponseCopyWith<$Res> {
  factory $ProductOptionResponseCopyWith(
    ProductOptionResponse value,
    $Res Function(ProductOptionResponse) then,
  ) = _$ProductOptionResponseCopyWithImpl<$Res, ProductOptionResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "extension_attributes")
    ExtensionAttributesResponse? extensionAttributes,
  });

  $ExtensionAttributesResponseCopyWith<$Res>? get extensionAttributes;
}

/// @nodoc
class _$ProductOptionResponseCopyWithImpl<
  $Res,
  $Val extends ProductOptionResponse
>
    implements $ProductOptionResponseCopyWith<$Res> {
  _$ProductOptionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? extensionAttributes = freezed}) {
    return _then(
      _value.copyWith(
            extensionAttributes:
                freezed == extensionAttributes
                    ? _value.extensionAttributes
                    : extensionAttributes // ignore: cast_nullable_to_non_nullable
                        as ExtensionAttributesResponse?,
          )
          as $Val,
    );
  }

  /// Create a copy of ProductOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExtensionAttributesResponseCopyWith<$Res>? get extensionAttributes {
    if (_value.extensionAttributes == null) {
      return null;
    }

    return $ExtensionAttributesResponseCopyWith<$Res>(
      _value.extensionAttributes!,
      (value) {
        return _then(_value.copyWith(extensionAttributes: value) as $Val);
      },
    );
  }
}

/// @nodoc
abstract class _$$ProductOptionResponseImplCopyWith<$Res>
    implements $ProductOptionResponseCopyWith<$Res> {
  factory _$$ProductOptionResponseImplCopyWith(
    _$ProductOptionResponseImpl value,
    $Res Function(_$ProductOptionResponseImpl) then,
  ) = __$$ProductOptionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "extension_attributes")
    ExtensionAttributesResponse? extensionAttributes,
  });

  @override
  $ExtensionAttributesResponseCopyWith<$Res>? get extensionAttributes;
}

/// @nodoc
class __$$ProductOptionResponseImplCopyWithImpl<$Res>
    extends
        _$ProductOptionResponseCopyWithImpl<$Res, _$ProductOptionResponseImpl>
    implements _$$ProductOptionResponseImplCopyWith<$Res> {
  __$$ProductOptionResponseImplCopyWithImpl(
    _$ProductOptionResponseImpl _value,
    $Res Function(_$ProductOptionResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? extensionAttributes = freezed}) {
    return _then(
      _$ProductOptionResponseImpl(
        extensionAttributes:
            freezed == extensionAttributes
                ? _value.extensionAttributes
                : extensionAttributes // ignore: cast_nullable_to_non_nullable
                    as ExtensionAttributesResponse?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductOptionResponseImpl implements _ProductOptionResponse {
  const _$ProductOptionResponseImpl({
    @JsonKey(name: "extension_attributes") this.extensionAttributes,
  });

  factory _$ProductOptionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductOptionResponseImplFromJson(json);

  @override
  @JsonKey(name: "extension_attributes")
  final ExtensionAttributesResponse? extensionAttributes;

  @override
  String toString() {
    return 'ProductOptionResponse(extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductOptionResponseImpl &&
            (identical(other.extensionAttributes, extensionAttributes) ||
                other.extensionAttributes == extensionAttributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, extensionAttributes);

  /// Create a copy of ProductOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductOptionResponseImplCopyWith<_$ProductOptionResponseImpl>
  get copyWith =>
      __$$ProductOptionResponseImplCopyWithImpl<_$ProductOptionResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductOptionResponseImplToJson(this);
  }
}

abstract class _ProductOptionResponse implements ProductOptionResponse {
  const factory _ProductOptionResponse({
    @JsonKey(name: "extension_attributes")
    final ExtensionAttributesResponse? extensionAttributes,
  }) = _$ProductOptionResponseImpl;

  factory _ProductOptionResponse.fromJson(Map<String, dynamic> json) =
      _$ProductOptionResponseImpl.fromJson;

  @override
  @JsonKey(name: "extension_attributes")
  ExtensionAttributesResponse? get extensionAttributes;

  /// Create a copy of ProductOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductOptionResponseImplCopyWith<_$ProductOptionResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ExtensionAttributesResponse _$ExtensionAttributesResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ExtensionAttributesResponse.fromJson(json);
}

/// @nodoc
mixin _$ExtensionAttributesResponse {
  @JsonKey(name: "configurable_item_options")
  List<ConfigurableItemOptionResponse>? get configurableItemOptions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "custom_options")
  List<ConfigurableItemOptionResponse>? get customOptions =>
      throw _privateConstructorUsedError;

  /// Serializes this ExtensionAttributesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtensionAttributesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtensionAttributesResponseCopyWith<ExtensionAttributesResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtensionAttributesResponseCopyWith<$Res> {
  factory $ExtensionAttributesResponseCopyWith(
    ExtensionAttributesResponse value,
    $Res Function(ExtensionAttributesResponse) then,
  ) =
      _$ExtensionAttributesResponseCopyWithImpl<
        $Res,
        ExtensionAttributesResponse
      >;
  @useResult
  $Res call({
    @JsonKey(name: "configurable_item_options")
    List<ConfigurableItemOptionResponse>? configurableItemOptions,
    @JsonKey(name: "custom_options")
    List<ConfigurableItemOptionResponse>? customOptions,
  });
}

/// @nodoc
class _$ExtensionAttributesResponseCopyWithImpl<
  $Res,
  $Val extends ExtensionAttributesResponse
>
    implements $ExtensionAttributesResponseCopyWith<$Res> {
  _$ExtensionAttributesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtensionAttributesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configurableItemOptions = freezed,
    Object? customOptions = freezed,
  }) {
    return _then(
      _value.copyWith(
            configurableItemOptions:
                freezed == configurableItemOptions
                    ? _value.configurableItemOptions
                    : configurableItemOptions // ignore: cast_nullable_to_non_nullable
                        as List<ConfigurableItemOptionResponse>?,
            customOptions:
                freezed == customOptions
                    ? _value.customOptions
                    : customOptions // ignore: cast_nullable_to_non_nullable
                        as List<ConfigurableItemOptionResponse>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExtensionAttributesResponseImplCopyWith<$Res>
    implements $ExtensionAttributesResponseCopyWith<$Res> {
  factory _$$ExtensionAttributesResponseImplCopyWith(
    _$ExtensionAttributesResponseImpl value,
    $Res Function(_$ExtensionAttributesResponseImpl) then,
  ) = __$$ExtensionAttributesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "configurable_item_options")
    List<ConfigurableItemOptionResponse>? configurableItemOptions,
    @JsonKey(name: "custom_options")
    List<ConfigurableItemOptionResponse>? customOptions,
  });
}

/// @nodoc
class __$$ExtensionAttributesResponseImplCopyWithImpl<$Res>
    extends
        _$ExtensionAttributesResponseCopyWithImpl<
          $Res,
          _$ExtensionAttributesResponseImpl
        >
    implements _$$ExtensionAttributesResponseImplCopyWith<$Res> {
  __$$ExtensionAttributesResponseImplCopyWithImpl(
    _$ExtensionAttributesResponseImpl _value,
    $Res Function(_$ExtensionAttributesResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExtensionAttributesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configurableItemOptions = freezed,
    Object? customOptions = freezed,
  }) {
    return _then(
      _$ExtensionAttributesResponseImpl(
        configurableItemOptions:
            freezed == configurableItemOptions
                ? _value._configurableItemOptions
                : configurableItemOptions // ignore: cast_nullable_to_non_nullable
                    as List<ConfigurableItemOptionResponse>?,
        customOptions:
            freezed == customOptions
                ? _value._customOptions
                : customOptions // ignore: cast_nullable_to_non_nullable
                    as List<ConfigurableItemOptionResponse>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtensionAttributesResponseImpl
    implements _ExtensionAttributesResponse {
  const _$ExtensionAttributesResponseImpl({
    @JsonKey(name: "configurable_item_options")
    final List<ConfigurableItemOptionResponse>? configurableItemOptions,
    @JsonKey(name: "custom_options")
    final List<ConfigurableItemOptionResponse>? customOptions,
  }) : _configurableItemOptions = configurableItemOptions,
       _customOptions = customOptions;

  factory _$ExtensionAttributesResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ExtensionAttributesResponseImplFromJson(json);

  final List<ConfigurableItemOptionResponse>? _configurableItemOptions;
  @override
  @JsonKey(name: "configurable_item_options")
  List<ConfigurableItemOptionResponse>? get configurableItemOptions {
    final value = _configurableItemOptions;
    if (value == null) return null;
    if (_configurableItemOptions is EqualUnmodifiableListView)
      return _configurableItemOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ConfigurableItemOptionResponse>? _customOptions;
  @override
  @JsonKey(name: "custom_options")
  List<ConfigurableItemOptionResponse>? get customOptions {
    final value = _customOptions;
    if (value == null) return null;
    if (_customOptions is EqualUnmodifiableListView) return _customOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ExtensionAttributesResponse(configurableItemOptions: $configurableItemOptions, customOptions: $customOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtensionAttributesResponseImpl &&
            const DeepCollectionEquality().equals(
              other._configurableItemOptions,
              _configurableItemOptions,
            ) &&
            const DeepCollectionEquality().equals(
              other._customOptions,
              _customOptions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_configurableItemOptions),
    const DeepCollectionEquality().hash(_customOptions),
  );

  /// Create a copy of ExtensionAttributesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtensionAttributesResponseImplCopyWith<_$ExtensionAttributesResponseImpl>
  get copyWith => __$$ExtensionAttributesResponseImplCopyWithImpl<
    _$ExtensionAttributesResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtensionAttributesResponseImplToJson(this);
  }
}

abstract class _ExtensionAttributesResponse
    implements ExtensionAttributesResponse {
  const factory _ExtensionAttributesResponse({
    @JsonKey(name: "configurable_item_options")
    final List<ConfigurableItemOptionResponse>? configurableItemOptions,
    @JsonKey(name: "custom_options")
    final List<ConfigurableItemOptionResponse>? customOptions,
  }) = _$ExtensionAttributesResponseImpl;

  factory _ExtensionAttributesResponse.fromJson(Map<String, dynamic> json) =
      _$ExtensionAttributesResponseImpl.fromJson;

  @override
  @JsonKey(name: "configurable_item_options")
  List<ConfigurableItemOptionResponse>? get configurableItemOptions;
  @override
  @JsonKey(name: "custom_options")
  List<ConfigurableItemOptionResponse>? get customOptions;

  /// Create a copy of ExtensionAttributesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtensionAttributesResponseImplCopyWith<_$ExtensionAttributesResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ConfigurableItemOptionResponse _$ConfigurableItemOptionResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ConfigurableItemOptionResponse.fromJson(json);
}

/// @nodoc
mixin _$ConfigurableItemOptionResponse {
  @JsonKey(name: "option_id", fromJson: _anyToString)
  String? get optionId => throw _privateConstructorUsedError;
  @JsonKey(name: "option_value", fromJson: _anyToString)
  String? get optionValue => throw _privateConstructorUsedError;

  /// Serializes this ConfigurableItemOptionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfigurableItemOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfigurableItemOptionResponseCopyWith<ConfigurableItemOptionResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigurableItemOptionResponseCopyWith<$Res> {
  factory $ConfigurableItemOptionResponseCopyWith(
    ConfigurableItemOptionResponse value,
    $Res Function(ConfigurableItemOptionResponse) then,
  ) =
      _$ConfigurableItemOptionResponseCopyWithImpl<
        $Res,
        ConfigurableItemOptionResponse
      >;
  @useResult
  $Res call({
    @JsonKey(name: "option_id", fromJson: _anyToString) String? optionId,
    @JsonKey(name: "option_value", fromJson: _anyToString) String? optionValue,
  });
}

/// @nodoc
class _$ConfigurableItemOptionResponseCopyWithImpl<
  $Res,
  $Val extends ConfigurableItemOptionResponse
>
    implements $ConfigurableItemOptionResponseCopyWith<$Res> {
  _$ConfigurableItemOptionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfigurableItemOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? optionId = freezed, Object? optionValue = freezed}) {
    return _then(
      _value.copyWith(
            optionId:
                freezed == optionId
                    ? _value.optionId
                    : optionId // ignore: cast_nullable_to_non_nullable
                        as String?,
            optionValue:
                freezed == optionValue
                    ? _value.optionValue
                    : optionValue // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConfigurableItemOptionResponseImplCopyWith<$Res>
    implements $ConfigurableItemOptionResponseCopyWith<$Res> {
  factory _$$ConfigurableItemOptionResponseImplCopyWith(
    _$ConfigurableItemOptionResponseImpl value,
    $Res Function(_$ConfigurableItemOptionResponseImpl) then,
  ) = __$$ConfigurableItemOptionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "option_id", fromJson: _anyToString) String? optionId,
    @JsonKey(name: "option_value", fromJson: _anyToString) String? optionValue,
  });
}

/// @nodoc
class __$$ConfigurableItemOptionResponseImplCopyWithImpl<$Res>
    extends
        _$ConfigurableItemOptionResponseCopyWithImpl<
          $Res,
          _$ConfigurableItemOptionResponseImpl
        >
    implements _$$ConfigurableItemOptionResponseImplCopyWith<$Res> {
  __$$ConfigurableItemOptionResponseImplCopyWithImpl(
    _$ConfigurableItemOptionResponseImpl _value,
    $Res Function(_$ConfigurableItemOptionResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConfigurableItemOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? optionId = freezed, Object? optionValue = freezed}) {
    return _then(
      _$ConfigurableItemOptionResponseImpl(
        optionId:
            freezed == optionId
                ? _value.optionId
                : optionId // ignore: cast_nullable_to_non_nullable
                    as String?,
        optionValue:
            freezed == optionValue
                ? _value.optionValue
                : optionValue // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigurableItemOptionResponseImpl
    implements _ConfigurableItemOptionResponse {
  const _$ConfigurableItemOptionResponseImpl({
    @JsonKey(name: "option_id", fromJson: _anyToString) this.optionId,
    @JsonKey(name: "option_value", fromJson: _anyToString) this.optionValue,
  });

  factory _$ConfigurableItemOptionResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ConfigurableItemOptionResponseImplFromJson(json);

  @override
  @JsonKey(name: "option_id", fromJson: _anyToString)
  final String? optionId;
  @override
  @JsonKey(name: "option_value", fromJson: _anyToString)
  final String? optionValue;

  @override
  String toString() {
    return 'ConfigurableItemOptionResponse(optionId: $optionId, optionValue: $optionValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigurableItemOptionResponseImpl &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId) &&
            (identical(other.optionValue, optionValue) ||
                other.optionValue == optionValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, optionId, optionValue);

  /// Create a copy of ConfigurableItemOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigurableItemOptionResponseImplCopyWith<
    _$ConfigurableItemOptionResponseImpl
  >
  get copyWith => __$$ConfigurableItemOptionResponseImplCopyWithImpl<
    _$ConfigurableItemOptionResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigurableItemOptionResponseImplToJson(this);
  }
}

abstract class _ConfigurableItemOptionResponse
    implements ConfigurableItemOptionResponse {
  const factory _ConfigurableItemOptionResponse({
    @JsonKey(name: "option_id", fromJson: _anyToString) final String? optionId,
    @JsonKey(name: "option_value", fromJson: _anyToString)
    final String? optionValue,
  }) = _$ConfigurableItemOptionResponseImpl;

  factory _ConfigurableItemOptionResponse.fromJson(Map<String, dynamic> json) =
      _$ConfigurableItemOptionResponseImpl.fromJson;

  @override
  @JsonKey(name: "option_id", fromJson: _anyToString)
  String? get optionId;
  @override
  @JsonKey(name: "option_value", fromJson: _anyToString)
  String? get optionValue;

  /// Create a copy of ConfigurableItemOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigurableItemOptionResponseImplCopyWith<
    _$ConfigurableItemOptionResponseImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
