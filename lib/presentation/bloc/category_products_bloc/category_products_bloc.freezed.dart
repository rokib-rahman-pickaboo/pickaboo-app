// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_products_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CategoryProductsEvent {
  String get categoryKey => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String categoryKey) getProducts,
    required TResult Function(String categoryKey) refresh,
    required TResult Function(
      String categoryKey,
      Map<String, List<String>> filters,
    )
    applyFilters,
    required TResult Function(String categoryKey, String sortValue) applySort,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String categoryKey)? getProducts,
    TResult? Function(String categoryKey)? refresh,
    TResult? Function(String categoryKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult? Function(String categoryKey, String sortValue)? applySort,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String categoryKey)? getProducts,
    TResult Function(String categoryKey)? refresh,
    TResult Function(String categoryKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult Function(String categoryKey, String sortValue)? applySort,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProducts value) getProducts,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilters value) applyFilters,
    required TResult Function(_ApplySort value) applySort,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProducts value)? getProducts,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilters value)? applyFilters,
    TResult? Function(_ApplySort value)? applySort,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProducts value)? getProducts,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilters value)? applyFilters,
    TResult Function(_ApplySort value)? applySort,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of CategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryProductsEventCopyWith<CategoryProductsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryProductsEventCopyWith<$Res> {
  factory $CategoryProductsEventCopyWith(
    CategoryProductsEvent value,
    $Res Function(CategoryProductsEvent) then,
  ) = _$CategoryProductsEventCopyWithImpl<$Res, CategoryProductsEvent>;
  @useResult
  $Res call({String categoryKey});
}

/// @nodoc
class _$CategoryProductsEventCopyWithImpl<
  $Res,
  $Val extends CategoryProductsEvent
>
    implements $CategoryProductsEventCopyWith<$Res> {
  _$CategoryProductsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categoryKey = null}) {
    return _then(
      _value.copyWith(
            categoryKey:
                null == categoryKey
                    ? _value.categoryKey
                    : categoryKey // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetProductsImplCopyWith<$Res>
    implements $CategoryProductsEventCopyWith<$Res> {
  factory _$$GetProductsImplCopyWith(
    _$GetProductsImpl value,
    $Res Function(_$GetProductsImpl) then,
  ) = __$$GetProductsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categoryKey});
}

/// @nodoc
class __$$GetProductsImplCopyWithImpl<$Res>
    extends _$CategoryProductsEventCopyWithImpl<$Res, _$GetProductsImpl>
    implements _$$GetProductsImplCopyWith<$Res> {
  __$$GetProductsImplCopyWithImpl(
    _$GetProductsImpl _value,
    $Res Function(_$GetProductsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categoryKey = null}) {
    return _then(
      _$GetProductsImpl(
        categoryKey:
            null == categoryKey
                ? _value.categoryKey
                : categoryKey // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$GetProductsImpl implements _GetProducts {
  const _$GetProductsImpl({required this.categoryKey});

  @override
  final String categoryKey;

  @override
  String toString() {
    return 'CategoryProductsEvent.getProducts(categoryKey: $categoryKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductsImpl &&
            (identical(other.categoryKey, categoryKey) ||
                other.categoryKey == categoryKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryKey);

  /// Create a copy of CategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductsImplCopyWith<_$GetProductsImpl> get copyWith =>
      __$$GetProductsImplCopyWithImpl<_$GetProductsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String categoryKey) getProducts,
    required TResult Function(String categoryKey) refresh,
    required TResult Function(
      String categoryKey,
      Map<String, List<String>> filters,
    )
    applyFilters,
    required TResult Function(String categoryKey, String sortValue) applySort,
  }) {
    return getProducts(categoryKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String categoryKey)? getProducts,
    TResult? Function(String categoryKey)? refresh,
    TResult? Function(String categoryKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult? Function(String categoryKey, String sortValue)? applySort,
  }) {
    return getProducts?.call(categoryKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String categoryKey)? getProducts,
    TResult Function(String categoryKey)? refresh,
    TResult Function(String categoryKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult Function(String categoryKey, String sortValue)? applySort,
    required TResult orElse(),
  }) {
    if (getProducts != null) {
      return getProducts(categoryKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProducts value) getProducts,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilters value) applyFilters,
    required TResult Function(_ApplySort value) applySort,
  }) {
    return getProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProducts value)? getProducts,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilters value)? applyFilters,
    TResult? Function(_ApplySort value)? applySort,
  }) {
    return getProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProducts value)? getProducts,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilters value)? applyFilters,
    TResult Function(_ApplySort value)? applySort,
    required TResult orElse(),
  }) {
    if (getProducts != null) {
      return getProducts(this);
    }
    return orElse();
  }
}

abstract class _GetProducts implements CategoryProductsEvent {
  const factory _GetProducts({required final String categoryKey}) =
      _$GetProductsImpl;

  @override
  String get categoryKey;

  /// Create a copy of CategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProductsImplCopyWith<_$GetProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res>
    implements $CategoryProductsEventCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
    _$RefreshImpl value,
    $Res Function(_$RefreshImpl) then,
  ) = __$$RefreshImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categoryKey});
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$CategoryProductsEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
    _$RefreshImpl _value,
    $Res Function(_$RefreshImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categoryKey = null}) {
    return _then(
      _$RefreshImpl(
        categoryKey:
            null == categoryKey
                ? _value.categoryKey
                : categoryKey // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl({required this.categoryKey});

  @override
  final String categoryKey;

  @override
  String toString() {
    return 'CategoryProductsEvent.refresh(categoryKey: $categoryKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshImpl &&
            (identical(other.categoryKey, categoryKey) ||
                other.categoryKey == categoryKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryKey);

  /// Create a copy of CategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshImplCopyWith<_$RefreshImpl> get copyWith =>
      __$$RefreshImplCopyWithImpl<_$RefreshImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String categoryKey) getProducts,
    required TResult Function(String categoryKey) refresh,
    required TResult Function(
      String categoryKey,
      Map<String, List<String>> filters,
    )
    applyFilters,
    required TResult Function(String categoryKey, String sortValue) applySort,
  }) {
    return refresh(categoryKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String categoryKey)? getProducts,
    TResult? Function(String categoryKey)? refresh,
    TResult? Function(String categoryKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult? Function(String categoryKey, String sortValue)? applySort,
  }) {
    return refresh?.call(categoryKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String categoryKey)? getProducts,
    TResult Function(String categoryKey)? refresh,
    TResult Function(String categoryKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult Function(String categoryKey, String sortValue)? applySort,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(categoryKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProducts value) getProducts,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilters value) applyFilters,
    required TResult Function(_ApplySort value) applySort,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProducts value)? getProducts,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilters value)? applyFilters,
    TResult? Function(_ApplySort value)? applySort,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProducts value)? getProducts,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilters value)? applyFilters,
    TResult Function(_ApplySort value)? applySort,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements CategoryProductsEvent {
  const factory _Refresh({required final String categoryKey}) = _$RefreshImpl;

  @override
  String get categoryKey;

  /// Create a copy of CategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshImplCopyWith<_$RefreshImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplyFiltersImplCopyWith<$Res>
    implements $CategoryProductsEventCopyWith<$Res> {
  factory _$$ApplyFiltersImplCopyWith(
    _$ApplyFiltersImpl value,
    $Res Function(_$ApplyFiltersImpl) then,
  ) = __$$ApplyFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categoryKey, Map<String, List<String>> filters});
}

/// @nodoc
class __$$ApplyFiltersImplCopyWithImpl<$Res>
    extends _$CategoryProductsEventCopyWithImpl<$Res, _$ApplyFiltersImpl>
    implements _$$ApplyFiltersImplCopyWith<$Res> {
  __$$ApplyFiltersImplCopyWithImpl(
    _$ApplyFiltersImpl _value,
    $Res Function(_$ApplyFiltersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categoryKey = null, Object? filters = null}) {
    return _then(
      _$ApplyFiltersImpl(
        categoryKey:
            null == categoryKey
                ? _value.categoryKey
                : categoryKey // ignore: cast_nullable_to_non_nullable
                    as String,
        filters:
            null == filters
                ? _value._filters
                : filters // ignore: cast_nullable_to_non_nullable
                    as Map<String, List<String>>,
      ),
    );
  }
}

/// @nodoc

class _$ApplyFiltersImpl implements _ApplyFilters {
  const _$ApplyFiltersImpl({
    required this.categoryKey,
    required final Map<String, List<String>> filters,
  }) : _filters = filters;

  @override
  final String categoryKey;
  final Map<String, List<String>> _filters;
  @override
  Map<String, List<String>> get filters {
    if (_filters is EqualUnmodifiableMapView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_filters);
  }

  @override
  String toString() {
    return 'CategoryProductsEvent.applyFilters(categoryKey: $categoryKey, filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyFiltersImpl &&
            (identical(other.categoryKey, categoryKey) ||
                other.categoryKey == categoryKey) &&
            const DeepCollectionEquality().equals(other._filters, _filters));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryKey,
    const DeepCollectionEquality().hash(_filters),
  );

  /// Create a copy of CategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplyFiltersImplCopyWith<_$ApplyFiltersImpl> get copyWith =>
      __$$ApplyFiltersImplCopyWithImpl<_$ApplyFiltersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String categoryKey) getProducts,
    required TResult Function(String categoryKey) refresh,
    required TResult Function(
      String categoryKey,
      Map<String, List<String>> filters,
    )
    applyFilters,
    required TResult Function(String categoryKey, String sortValue) applySort,
  }) {
    return applyFilters(categoryKey, filters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String categoryKey)? getProducts,
    TResult? Function(String categoryKey)? refresh,
    TResult? Function(String categoryKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult? Function(String categoryKey, String sortValue)? applySort,
  }) {
    return applyFilters?.call(categoryKey, filters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String categoryKey)? getProducts,
    TResult Function(String categoryKey)? refresh,
    TResult Function(String categoryKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult Function(String categoryKey, String sortValue)? applySort,
    required TResult orElse(),
  }) {
    if (applyFilters != null) {
      return applyFilters(categoryKey, filters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProducts value) getProducts,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilters value) applyFilters,
    required TResult Function(_ApplySort value) applySort,
  }) {
    return applyFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProducts value)? getProducts,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilters value)? applyFilters,
    TResult? Function(_ApplySort value)? applySort,
  }) {
    return applyFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProducts value)? getProducts,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilters value)? applyFilters,
    TResult Function(_ApplySort value)? applySort,
    required TResult orElse(),
  }) {
    if (applyFilters != null) {
      return applyFilters(this);
    }
    return orElse();
  }
}

abstract class _ApplyFilters implements CategoryProductsEvent {
  const factory _ApplyFilters({
    required final String categoryKey,
    required final Map<String, List<String>> filters,
  }) = _$ApplyFiltersImpl;

  @override
  String get categoryKey;
  Map<String, List<String>> get filters;

  /// Create a copy of CategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplyFiltersImplCopyWith<_$ApplyFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplySortImplCopyWith<$Res>
    implements $CategoryProductsEventCopyWith<$Res> {
  factory _$$ApplySortImplCopyWith(
    _$ApplySortImpl value,
    $Res Function(_$ApplySortImpl) then,
  ) = __$$ApplySortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categoryKey, String sortValue});
}

/// @nodoc
class __$$ApplySortImplCopyWithImpl<$Res>
    extends _$CategoryProductsEventCopyWithImpl<$Res, _$ApplySortImpl>
    implements _$$ApplySortImplCopyWith<$Res> {
  __$$ApplySortImplCopyWithImpl(
    _$ApplySortImpl _value,
    $Res Function(_$ApplySortImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categoryKey = null, Object? sortValue = null}) {
    return _then(
      _$ApplySortImpl(
        categoryKey:
            null == categoryKey
                ? _value.categoryKey
                : categoryKey // ignore: cast_nullable_to_non_nullable
                    as String,
        sortValue:
            null == sortValue
                ? _value.sortValue
                : sortValue // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$ApplySortImpl implements _ApplySort {
  const _$ApplySortImpl({required this.categoryKey, required this.sortValue});

  @override
  final String categoryKey;
  @override
  final String sortValue;

  @override
  String toString() {
    return 'CategoryProductsEvent.applySort(categoryKey: $categoryKey, sortValue: $sortValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplySortImpl &&
            (identical(other.categoryKey, categoryKey) ||
                other.categoryKey == categoryKey) &&
            (identical(other.sortValue, sortValue) ||
                other.sortValue == sortValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryKey, sortValue);

  /// Create a copy of CategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplySortImplCopyWith<_$ApplySortImpl> get copyWith =>
      __$$ApplySortImplCopyWithImpl<_$ApplySortImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String categoryKey) getProducts,
    required TResult Function(String categoryKey) refresh,
    required TResult Function(
      String categoryKey,
      Map<String, List<String>> filters,
    )
    applyFilters,
    required TResult Function(String categoryKey, String sortValue) applySort,
  }) {
    return applySort(categoryKey, sortValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String categoryKey)? getProducts,
    TResult? Function(String categoryKey)? refresh,
    TResult? Function(String categoryKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult? Function(String categoryKey, String sortValue)? applySort,
  }) {
    return applySort?.call(categoryKey, sortValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String categoryKey)? getProducts,
    TResult Function(String categoryKey)? refresh,
    TResult Function(String categoryKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult Function(String categoryKey, String sortValue)? applySort,
    required TResult orElse(),
  }) {
    if (applySort != null) {
      return applySort(categoryKey, sortValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProducts value) getProducts,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ApplyFilters value) applyFilters,
    required TResult Function(_ApplySort value) applySort,
  }) {
    return applySort(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProducts value)? getProducts,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ApplyFilters value)? applyFilters,
    TResult? Function(_ApplySort value)? applySort,
  }) {
    return applySort?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProducts value)? getProducts,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ApplyFilters value)? applyFilters,
    TResult Function(_ApplySort value)? applySort,
    required TResult orElse(),
  }) {
    if (applySort != null) {
      return applySort(this);
    }
    return orElse();
  }
}

abstract class _ApplySort implements CategoryProductsEvent {
  const factory _ApplySort({
    required final String categoryKey,
    required final String sortValue,
  }) = _$ApplySortImpl;

  @override
  String get categoryKey;
  String get sortValue;

  /// Create a copy of CategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplySortImplCopyWith<_$ApplySortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryProductsState {
  String get categoryKey => throw _privateConstructorUsedError;
  PagingState<int, ProductEntity> get pagingState =>
      throw _privateConstructorUsedError;
  CategoryProductsEntity? get categoryData =>
      throw _privateConstructorUsedError;
  Map<String, List<String>>? get currentFilters =>
      throw _privateConstructorUsedError;
  String? get currentSort => throw _privateConstructorUsedError;
  CategoryFacets? get cachedFacets => throw _privateConstructorUsedError;

  /// Create a copy of CategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryProductsStateCopyWith<CategoryProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryProductsStateCopyWith<$Res> {
  factory $CategoryProductsStateCopyWith(
    CategoryProductsState value,
    $Res Function(CategoryProductsState) then,
  ) = _$CategoryProductsStateCopyWithImpl<$Res, CategoryProductsState>;
  @useResult
  $Res call({
    String categoryKey,
    PagingState<int, ProductEntity> pagingState,
    CategoryProductsEntity? categoryData,
    Map<String, List<String>>? currentFilters,
    String? currentSort,
    CategoryFacets? cachedFacets,
  });
}

/// @nodoc
class _$CategoryProductsStateCopyWithImpl<
  $Res,
  $Val extends CategoryProductsState
>
    implements $CategoryProductsStateCopyWith<$Res> {
  _$CategoryProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryKey = null,
    Object? pagingState = null,
    Object? categoryData = freezed,
    Object? currentFilters = freezed,
    Object? currentSort = freezed,
    Object? cachedFacets = freezed,
  }) {
    return _then(
      _value.copyWith(
            categoryKey:
                null == categoryKey
                    ? _value.categoryKey
                    : categoryKey // ignore: cast_nullable_to_non_nullable
                        as String,
            pagingState:
                null == pagingState
                    ? _value.pagingState
                    : pagingState // ignore: cast_nullable_to_non_nullable
                        as PagingState<int, ProductEntity>,
            categoryData:
                freezed == categoryData
                    ? _value.categoryData
                    : categoryData // ignore: cast_nullable_to_non_nullable
                        as CategoryProductsEntity?,
            currentFilters:
                freezed == currentFilters
                    ? _value.currentFilters
                    : currentFilters // ignore: cast_nullable_to_non_nullable
                        as Map<String, List<String>>?,
            currentSort:
                freezed == currentSort
                    ? _value.currentSort
                    : currentSort // ignore: cast_nullable_to_non_nullable
                        as String?,
            cachedFacets:
                freezed == cachedFacets
                    ? _value.cachedFacets
                    : cachedFacets // ignore: cast_nullable_to_non_nullable
                        as CategoryFacets?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryProductsStateImplCopyWith<$Res>
    implements $CategoryProductsStateCopyWith<$Res> {
  factory _$$CategoryProductsStateImplCopyWith(
    _$CategoryProductsStateImpl value,
    $Res Function(_$CategoryProductsStateImpl) then,
  ) = __$$CategoryProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String categoryKey,
    PagingState<int, ProductEntity> pagingState,
    CategoryProductsEntity? categoryData,
    Map<String, List<String>>? currentFilters,
    String? currentSort,
    CategoryFacets? cachedFacets,
  });
}

/// @nodoc
class __$$CategoryProductsStateImplCopyWithImpl<$Res>
    extends
        _$CategoryProductsStateCopyWithImpl<$Res, _$CategoryProductsStateImpl>
    implements _$$CategoryProductsStateImplCopyWith<$Res> {
  __$$CategoryProductsStateImplCopyWithImpl(
    _$CategoryProductsStateImpl _value,
    $Res Function(_$CategoryProductsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryKey = null,
    Object? pagingState = null,
    Object? categoryData = freezed,
    Object? currentFilters = freezed,
    Object? currentSort = freezed,
    Object? cachedFacets = freezed,
  }) {
    return _then(
      _$CategoryProductsStateImpl(
        categoryKey:
            null == categoryKey
                ? _value.categoryKey
                : categoryKey // ignore: cast_nullable_to_non_nullable
                    as String,
        pagingState:
            null == pagingState
                ? _value.pagingState
                : pagingState // ignore: cast_nullable_to_non_nullable
                    as PagingState<int, ProductEntity>,
        categoryData:
            freezed == categoryData
                ? _value.categoryData
                : categoryData // ignore: cast_nullable_to_non_nullable
                    as CategoryProductsEntity?,
        currentFilters:
            freezed == currentFilters
                ? _value._currentFilters
                : currentFilters // ignore: cast_nullable_to_non_nullable
                    as Map<String, List<String>>?,
        currentSort:
            freezed == currentSort
                ? _value.currentSort
                : currentSort // ignore: cast_nullable_to_non_nullable
                    as String?,
        cachedFacets:
            freezed == cachedFacets
                ? _value.cachedFacets
                : cachedFacets // ignore: cast_nullable_to_non_nullable
                    as CategoryFacets?,
      ),
    );
  }
}

/// @nodoc

class _$CategoryProductsStateImpl extends _CategoryProductsState {
  const _$CategoryProductsStateImpl({
    this.categoryKey = '',
    required this.pagingState,
    this.categoryData,
    final Map<String, List<String>>? currentFilters,
    this.currentSort,
    this.cachedFacets,
  }) : _currentFilters = currentFilters,
       super._();

  @override
  @JsonKey()
  final String categoryKey;
  @override
  final PagingState<int, ProductEntity> pagingState;
  @override
  final CategoryProductsEntity? categoryData;
  final Map<String, List<String>>? _currentFilters;
  @override
  Map<String, List<String>>? get currentFilters {
    final value = _currentFilters;
    if (value == null) return null;
    if (_currentFilters is EqualUnmodifiableMapView) return _currentFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? currentSort;
  @override
  final CategoryFacets? cachedFacets;

  @override
  String toString() {
    return 'CategoryProductsState(categoryKey: $categoryKey, pagingState: $pagingState, categoryData: $categoryData, currentFilters: $currentFilters, currentSort: $currentSort, cachedFacets: $cachedFacets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryProductsStateImpl &&
            (identical(other.categoryKey, categoryKey) ||
                other.categoryKey == categoryKey) &&
            (identical(other.pagingState, pagingState) ||
                other.pagingState == pagingState) &&
            (identical(other.categoryData, categoryData) ||
                other.categoryData == categoryData) &&
            const DeepCollectionEquality().equals(
              other._currentFilters,
              _currentFilters,
            ) &&
            (identical(other.currentSort, currentSort) ||
                other.currentSort == currentSort) &&
            (identical(other.cachedFacets, cachedFacets) ||
                other.cachedFacets == cachedFacets));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryKey,
    pagingState,
    categoryData,
    const DeepCollectionEquality().hash(_currentFilters),
    currentSort,
    cachedFacets,
  );

  /// Create a copy of CategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryProductsStateImplCopyWith<_$CategoryProductsStateImpl>
  get copyWith =>
      __$$CategoryProductsStateImplCopyWithImpl<_$CategoryProductsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CategoryProductsState extends CategoryProductsState {
  const factory _CategoryProductsState({
    final String categoryKey,
    required final PagingState<int, ProductEntity> pagingState,
    final CategoryProductsEntity? categoryData,
    final Map<String, List<String>>? currentFilters,
    final String? currentSort,
    final CategoryFacets? cachedFacets,
  }) = _$CategoryProductsStateImpl;
  const _CategoryProductsState._() : super._();

  @override
  String get categoryKey;
  @override
  PagingState<int, ProductEntity> get pagingState;
  @override
  CategoryProductsEntity? get categoryData;
  @override
  Map<String, List<String>>? get currentFilters;
  @override
  String? get currentSort;
  @override
  CategoryFacets? get cachedFacets;

  /// Create a copy of CategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryProductsStateImplCopyWith<_$CategoryProductsStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
