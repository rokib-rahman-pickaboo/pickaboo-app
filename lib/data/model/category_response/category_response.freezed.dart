// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) {
  return _CategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$CategoryResponse {
  @HiveField(0)
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "slug")
  String? get slug => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: "is_special")
  String? get isSpecial => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: "icon")
  String? get icon => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: "childs")
  List<CategoryResponse>? get childs => throw _privateConstructorUsedError;

  /// Serializes this CategoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryResponseCopyWith<CategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryResponseCopyWith<$Res> {
  factory $CategoryResponseCopyWith(
    CategoryResponse value,
    $Res Function(CategoryResponse) then,
  ) = _$CategoryResponseCopyWithImpl<$Res, CategoryResponse>;
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "id") String? id,
    @HiveField(1) @JsonKey(name: "slug") String? slug,
    @HiveField(2) @JsonKey(name: "name") String? name,
    @HiveField(3) @JsonKey(name: "is_special") String? isSpecial,
    @HiveField(4) @JsonKey(name: "icon") String? icon,
    @HiveField(5) @JsonKey(name: "childs") List<CategoryResponse>? childs,
  });
}

/// @nodoc
class _$CategoryResponseCopyWithImpl<$Res, $Val extends CategoryResponse>
    implements $CategoryResponseCopyWith<$Res> {
  _$CategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? name = freezed,
    Object? isSpecial = freezed,
    Object? icon = freezed,
    Object? childs = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
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
            isSpecial:
                freezed == isSpecial
                    ? _value.isSpecial
                    : isSpecial // ignore: cast_nullable_to_non_nullable
                        as String?,
            icon:
                freezed == icon
                    ? _value.icon
                    : icon // ignore: cast_nullable_to_non_nullable
                        as String?,
            childs:
                freezed == childs
                    ? _value.childs
                    : childs // ignore: cast_nullable_to_non_nullable
                        as List<CategoryResponse>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryResponseImplCopyWith<$Res>
    implements $CategoryResponseCopyWith<$Res> {
  factory _$$CategoryResponseImplCopyWith(
    _$CategoryResponseImpl value,
    $Res Function(_$CategoryResponseImpl) then,
  ) = __$$CategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "id") String? id,
    @HiveField(1) @JsonKey(name: "slug") String? slug,
    @HiveField(2) @JsonKey(name: "name") String? name,
    @HiveField(3) @JsonKey(name: "is_special") String? isSpecial,
    @HiveField(4) @JsonKey(name: "icon") String? icon,
    @HiveField(5) @JsonKey(name: "childs") List<CategoryResponse>? childs,
  });
}

/// @nodoc
class __$$CategoryResponseImplCopyWithImpl<$Res>
    extends _$CategoryResponseCopyWithImpl<$Res, _$CategoryResponseImpl>
    implements _$$CategoryResponseImplCopyWith<$Res> {
  __$$CategoryResponseImplCopyWithImpl(
    _$CategoryResponseImpl _value,
    $Res Function(_$CategoryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? name = freezed,
    Object? isSpecial = freezed,
    Object? icon = freezed,
    Object? childs = freezed,
  }) {
    return _then(
      _$CategoryResponseImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
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
        isSpecial:
            freezed == isSpecial
                ? _value.isSpecial
                : isSpecial // ignore: cast_nullable_to_non_nullable
                    as String?,
        icon:
            freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                    as String?,
        childs:
            freezed == childs
                ? _value._childs
                : childs // ignore: cast_nullable_to_non_nullable
                    as List<CategoryResponse>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryResponseImpl implements _CategoryResponse {
  const _$CategoryResponseImpl({
    @HiveField(0) @JsonKey(name: "id") this.id,
    @HiveField(1) @JsonKey(name: "slug") this.slug,
    @HiveField(2) @JsonKey(name: "name") this.name,
    @HiveField(3) @JsonKey(name: "is_special") this.isSpecial,
    @HiveField(4) @JsonKey(name: "icon") this.icon,
    @HiveField(5) @JsonKey(name: "childs") final List<CategoryResponse>? childs,
  }) : _childs = childs;

  factory _$CategoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryResponseImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "id")
  final String? id;
  @override
  @HiveField(1)
  @JsonKey(name: "slug")
  final String? slug;
  @override
  @HiveField(2)
  @JsonKey(name: "name")
  final String? name;
  @override
  @HiveField(3)
  @JsonKey(name: "is_special")
  final String? isSpecial;
  @override
  @HiveField(4)
  @JsonKey(name: "icon")
  final String? icon;
  final List<CategoryResponse>? _childs;
  @override
  @HiveField(5)
  @JsonKey(name: "childs")
  List<CategoryResponse>? get childs {
    final value = _childs;
    if (value == null) return null;
    if (_childs is EqualUnmodifiableListView) return _childs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CategoryResponse(id: $id, slug: $slug, name: $name, isSpecial: $isSpecial, icon: $icon, childs: $childs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isSpecial, isSpecial) ||
                other.isSpecial == isSpecial) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            const DeepCollectionEquality().equals(other._childs, _childs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    slug,
    name,
    isSpecial,
    icon,
    const DeepCollectionEquality().hash(_childs),
  );

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryResponseImplCopyWith<_$CategoryResponseImpl> get copyWith =>
      __$$CategoryResponseImplCopyWithImpl<_$CategoryResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryResponseImplToJson(this);
  }
}

abstract class _CategoryResponse implements CategoryResponse {
  const factory _CategoryResponse({
    @HiveField(0) @JsonKey(name: "id") final String? id,
    @HiveField(1) @JsonKey(name: "slug") final String? slug,
    @HiveField(2) @JsonKey(name: "name") final String? name,
    @HiveField(3) @JsonKey(name: "is_special") final String? isSpecial,
    @HiveField(4) @JsonKey(name: "icon") final String? icon,
    @HiveField(5) @JsonKey(name: "childs") final List<CategoryResponse>? childs,
  }) = _$CategoryResponseImpl;

  factory _CategoryResponse.fromJson(Map<String, dynamic> json) =
      _$CategoryResponseImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "id")
  String? get id;
  @override
  @HiveField(1)
  @JsonKey(name: "slug")
  String? get slug;
  @override
  @HiveField(2)
  @JsonKey(name: "name")
  String? get name;
  @override
  @HiveField(3)
  @JsonKey(name: "is_special")
  String? get isSpecial;
  @override
  @HiveField(4)
  @JsonKey(name: "icon")
  String? get icon;
  @override
  @HiveField(5)
  @JsonKey(name: "childs")
  List<CategoryResponse>? get childs;

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryResponseImplCopyWith<_$CategoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
