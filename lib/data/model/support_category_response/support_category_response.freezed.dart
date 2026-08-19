// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_category_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SupportCategoryResponse _$SupportCategoryResponseFromJson(
  Map<String, dynamic> json,
) {
  return _SupportCategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$SupportCategoryResponse {
  @JsonKey(name: "category_id")
  String? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "childs")
  List<Child>? get childs => throw _privateConstructorUsedError;

  /// Serializes this SupportCategoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SupportCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupportCategoryResponseCopyWith<SupportCategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportCategoryResponseCopyWith<$Res> {
  factory $SupportCategoryResponseCopyWith(
    SupportCategoryResponse value,
    $Res Function(SupportCategoryResponse) then,
  ) = _$SupportCategoryResponseCopyWithImpl<$Res, SupportCategoryResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "category_id") String? categoryId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "childs") List<Child>? childs,
  });
}

/// @nodoc
class _$SupportCategoryResponseCopyWithImpl<
  $Res,
  $Val extends SupportCategoryResponse
>
    implements $SupportCategoryResponseCopyWith<$Res> {
  _$SupportCategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupportCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? childs = freezed,
  }) {
    return _then(
      _value.copyWith(
            categoryId:
                freezed == categoryId
                    ? _value.categoryId
                    : categoryId // ignore: cast_nullable_to_non_nullable
                        as String?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            childs:
                freezed == childs
                    ? _value.childs
                    : childs // ignore: cast_nullable_to_non_nullable
                        as List<Child>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SupportCategoryResponseImplCopyWith<$Res>
    implements $SupportCategoryResponseCopyWith<$Res> {
  factory _$$SupportCategoryResponseImplCopyWith(
    _$SupportCategoryResponseImpl value,
    $Res Function(_$SupportCategoryResponseImpl) then,
  ) = __$$SupportCategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "category_id") String? categoryId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "childs") List<Child>? childs,
  });
}

/// @nodoc
class __$$SupportCategoryResponseImplCopyWithImpl<$Res>
    extends
        _$SupportCategoryResponseCopyWithImpl<
          $Res,
          _$SupportCategoryResponseImpl
        >
    implements _$$SupportCategoryResponseImplCopyWith<$Res> {
  __$$SupportCategoryResponseImplCopyWithImpl(
    _$SupportCategoryResponseImpl _value,
    $Res Function(_$SupportCategoryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SupportCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? childs = freezed,
  }) {
    return _then(
      _$SupportCategoryResponseImpl(
        categoryId:
            freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                    as String?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        childs:
            freezed == childs
                ? _value._childs
                : childs // ignore: cast_nullable_to_non_nullable
                    as List<Child>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SupportCategoryResponseImpl implements _SupportCategoryResponse {
  const _$SupportCategoryResponseImpl({
    @JsonKey(name: "category_id") this.categoryId,
    @JsonKey(name: "name") this.name,
    @JsonKey(name: "childs") final List<Child>? childs,
  }) : _childs = childs;

  factory _$SupportCategoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupportCategoryResponseImplFromJson(json);

  @override
  @JsonKey(name: "category_id")
  final String? categoryId;
  @override
  @JsonKey(name: "name")
  final String? name;
  final List<Child>? _childs;
  @override
  @JsonKey(name: "childs")
  List<Child>? get childs {
    final value = _childs;
    if (value == null) return null;
    if (_childs is EqualUnmodifiableListView) return _childs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SupportCategoryResponse(categoryId: $categoryId, name: $name, childs: $childs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportCategoryResponseImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._childs, _childs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryId,
    name,
    const DeepCollectionEquality().hash(_childs),
  );

  /// Create a copy of SupportCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupportCategoryResponseImplCopyWith<_$SupportCategoryResponseImpl>
  get copyWith => __$$SupportCategoryResponseImplCopyWithImpl<
    _$SupportCategoryResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupportCategoryResponseImplToJson(this);
  }
}

abstract class _SupportCategoryResponse implements SupportCategoryResponse {
  const factory _SupportCategoryResponse({
    @JsonKey(name: "category_id") final String? categoryId,
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "childs") final List<Child>? childs,
  }) = _$SupportCategoryResponseImpl;

  factory _SupportCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$SupportCategoryResponseImpl.fromJson;

  @override
  @JsonKey(name: "category_id")
  String? get categoryId;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "childs")
  List<Child>? get childs;

  /// Create a copy of SupportCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupportCategoryResponseImplCopyWith<_$SupportCategoryResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

Child _$ChildFromJson(Map<String, dynamic> json) {
  return _Child.fromJson(json);
}

/// @nodoc
mixin _$Child {
  @JsonKey(name: "category_id")
  String? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "children_count")
  String? get childrenCount => throw _privateConstructorUsedError;

  /// Serializes this Child to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Child
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChildCopyWith<Child> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChildCopyWith<$Res> {
  factory $ChildCopyWith(Child value, $Res Function(Child) then) =
      _$ChildCopyWithImpl<$Res, Child>;
  @useResult
  $Res call({
    @JsonKey(name: "category_id") String? categoryId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "children_count") String? childrenCount,
  });
}

/// @nodoc
class _$ChildCopyWithImpl<$Res, $Val extends Child>
    implements $ChildCopyWith<$Res> {
  _$ChildCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Child
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? childrenCount = freezed,
  }) {
    return _then(
      _value.copyWith(
            categoryId:
                freezed == categoryId
                    ? _value.categoryId
                    : categoryId // ignore: cast_nullable_to_non_nullable
                        as String?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            childrenCount:
                freezed == childrenCount
                    ? _value.childrenCount
                    : childrenCount // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChildImplCopyWith<$Res> implements $ChildCopyWith<$Res> {
  factory _$$ChildImplCopyWith(
    _$ChildImpl value,
    $Res Function(_$ChildImpl) then,
  ) = __$$ChildImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "category_id") String? categoryId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "children_count") String? childrenCount,
  });
}

/// @nodoc
class __$$ChildImplCopyWithImpl<$Res>
    extends _$ChildCopyWithImpl<$Res, _$ChildImpl>
    implements _$$ChildImplCopyWith<$Res> {
  __$$ChildImplCopyWithImpl(
    _$ChildImpl _value,
    $Res Function(_$ChildImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Child
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? childrenCount = freezed,
  }) {
    return _then(
      _$ChildImpl(
        categoryId:
            freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                    as String?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        childrenCount:
            freezed == childrenCount
                ? _value.childrenCount
                : childrenCount // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChildImpl implements _Child {
  const _$ChildImpl({
    @JsonKey(name: "category_id") this.categoryId,
    @JsonKey(name: "name") this.name,
    @JsonKey(name: "children_count") this.childrenCount,
  });

  factory _$ChildImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChildImplFromJson(json);

  @override
  @JsonKey(name: "category_id")
  final String? categoryId;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "children_count")
  final String? childrenCount;

  @override
  String toString() {
    return 'Child(categoryId: $categoryId, name: $name, childrenCount: $childrenCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChildImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.childrenCount, childrenCount) ||
                other.childrenCount == childrenCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, categoryId, name, childrenCount);

  /// Create a copy of Child
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChildImplCopyWith<_$ChildImpl> get copyWith =>
      __$$ChildImplCopyWithImpl<_$ChildImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChildImplToJson(this);
  }
}

abstract class _Child implements Child {
  const factory _Child({
    @JsonKey(name: "category_id") final String? categoryId,
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "children_count") final String? childrenCount,
  }) = _$ChildImpl;

  factory _Child.fromJson(Map<String, dynamic> json) = _$ChildImpl.fromJson;

  @override
  @JsonKey(name: "category_id")
  String? get categoryId;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "children_count")
  String? get childrenCount;

  /// Create a copy of Child
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChildImplCopyWith<_$ChildImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
