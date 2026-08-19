// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_cache_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CategoryCacheWrapper _$CategoryCacheWrapperFromJson(Map<String, dynamic> json) {
  return _CategoryCacheWrapper.fromJson(json);
}

/// @nodoc
mixin _$CategoryCacheWrapper {
  @HiveField(0)
  List<CategoryResponse> get categories => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime get cachedAt => throw _privateConstructorUsedError;

  /// Serializes this CategoryCacheWrapper to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCacheWrapperCopyWith<CategoryCacheWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCacheWrapperCopyWith<$Res> {
  factory $CategoryCacheWrapperCopyWith(
    CategoryCacheWrapper value,
    $Res Function(CategoryCacheWrapper) then,
  ) = _$CategoryCacheWrapperCopyWithImpl<$Res, CategoryCacheWrapper>;
  @useResult
  $Res call({
    @HiveField(0) List<CategoryResponse> categories,
    @HiveField(1) DateTime cachedAt,
  });
}

/// @nodoc
class _$CategoryCacheWrapperCopyWithImpl<
  $Res,
  $Val extends CategoryCacheWrapper
>
    implements $CategoryCacheWrapperCopyWith<$Res> {
  _$CategoryCacheWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categories = null, Object? cachedAt = null}) {
    return _then(
      _value.copyWith(
            categories:
                null == categories
                    ? _value.categories
                    : categories // ignore: cast_nullable_to_non_nullable
                        as List<CategoryResponse>,
            cachedAt:
                null == cachedAt
                    ? _value.cachedAt
                    : cachedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryCacheWrapperImplCopyWith<$Res>
    implements $CategoryCacheWrapperCopyWith<$Res> {
  factory _$$CategoryCacheWrapperImplCopyWith(
    _$CategoryCacheWrapperImpl value,
    $Res Function(_$CategoryCacheWrapperImpl) then,
  ) = __$$CategoryCacheWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(0) List<CategoryResponse> categories,
    @HiveField(1) DateTime cachedAt,
  });
}

/// @nodoc
class __$$CategoryCacheWrapperImplCopyWithImpl<$Res>
    extends _$CategoryCacheWrapperCopyWithImpl<$Res, _$CategoryCacheWrapperImpl>
    implements _$$CategoryCacheWrapperImplCopyWith<$Res> {
  __$$CategoryCacheWrapperImplCopyWithImpl(
    _$CategoryCacheWrapperImpl _value,
    $Res Function(_$CategoryCacheWrapperImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categories = null, Object? cachedAt = null}) {
    return _then(
      _$CategoryCacheWrapperImpl(
        categories:
            null == categories
                ? _value._categories
                : categories // ignore: cast_nullable_to_non_nullable
                    as List<CategoryResponse>,
        cachedAt:
            null == cachedAt
                ? _value.cachedAt
                : cachedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryCacheWrapperImpl implements _CategoryCacheWrapper {
  const _$CategoryCacheWrapperImpl({
    @HiveField(0) required final List<CategoryResponse> categories,
    @HiveField(1) required this.cachedAt,
  }) : _categories = categories;

  factory _$CategoryCacheWrapperImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryCacheWrapperImplFromJson(json);

  final List<CategoryResponse> _categories;
  @override
  @HiveField(0)
  List<CategoryResponse> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @HiveField(1)
  final DateTime cachedAt;

  @override
  String toString() {
    return 'CategoryCacheWrapper(categories: $categories, cachedAt: $cachedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryCacheWrapperImpl &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_categories),
    cachedAt,
  );

  /// Create a copy of CategoryCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryCacheWrapperImplCopyWith<_$CategoryCacheWrapperImpl>
  get copyWith =>
      __$$CategoryCacheWrapperImplCopyWithImpl<_$CategoryCacheWrapperImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryCacheWrapperImplToJson(this);
  }
}

abstract class _CategoryCacheWrapper implements CategoryCacheWrapper {
  const factory _CategoryCacheWrapper({
    @HiveField(0) required final List<CategoryResponse> categories,
    @HiveField(1) required final DateTime cachedAt,
  }) = _$CategoryCacheWrapperImpl;

  factory _CategoryCacheWrapper.fromJson(Map<String, dynamic> json) =
      _$CategoryCacheWrapperImpl.fromJson;

  @override
  @HiveField(0)
  List<CategoryResponse> get categories;
  @override
  @HiveField(1)
  DateTime get cachedAt;

  /// Create a copy of CategoryCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryCacheWrapperImplCopyWith<_$CategoryCacheWrapperImpl>
  get copyWith => throw _privateConstructorUsedError;
}
