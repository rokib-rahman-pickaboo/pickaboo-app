// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_products_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BrandProductsEvent {
  String get brandKey => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String brandKey) getProducts,
    required TResult Function(String brandKey) refresh,
    required TResult Function(
      String brandKey,
      Map<String, List<String>> filters,
    )
    applyFilters,
    required TResult Function(String brandKey, String sortValue) applySort,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String brandKey)? getProducts,
    TResult? Function(String brandKey)? refresh,
    TResult? Function(String brandKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult? Function(String brandKey, String sortValue)? applySort,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String brandKey)? getProducts,
    TResult Function(String brandKey)? refresh,
    TResult Function(String brandKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult Function(String brandKey, String sortValue)? applySort,
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

  /// Create a copy of BrandProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandProductsEventCopyWith<BrandProductsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandProductsEventCopyWith<$Res> {
  factory $BrandProductsEventCopyWith(
    BrandProductsEvent value,
    $Res Function(BrandProductsEvent) then,
  ) = _$BrandProductsEventCopyWithImpl<$Res, BrandProductsEvent>;
  @useResult
  $Res call({String brandKey});
}

/// @nodoc
class _$BrandProductsEventCopyWithImpl<$Res, $Val extends BrandProductsEvent>
    implements $BrandProductsEventCopyWith<$Res> {
  _$BrandProductsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? brandKey = null}) {
    return _then(
      _value.copyWith(
            brandKey:
                null == brandKey
                    ? _value.brandKey
                    : brandKey // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetProductsImplCopyWith<$Res>
    implements $BrandProductsEventCopyWith<$Res> {
  factory _$$GetProductsImplCopyWith(
    _$GetProductsImpl value,
    $Res Function(_$GetProductsImpl) then,
  ) = __$$GetProductsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String brandKey});
}

/// @nodoc
class __$$GetProductsImplCopyWithImpl<$Res>
    extends _$BrandProductsEventCopyWithImpl<$Res, _$GetProductsImpl>
    implements _$$GetProductsImplCopyWith<$Res> {
  __$$GetProductsImplCopyWithImpl(
    _$GetProductsImpl _value,
    $Res Function(_$GetProductsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BrandProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? brandKey = null}) {
    return _then(
      _$GetProductsImpl(
        brandKey:
            null == brandKey
                ? _value.brandKey
                : brandKey // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$GetProductsImpl implements _GetProducts {
  const _$GetProductsImpl({required this.brandKey});

  @override
  final String brandKey;

  @override
  String toString() {
    return 'BrandProductsEvent.getProducts(brandKey: $brandKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductsImpl &&
            (identical(other.brandKey, brandKey) ||
                other.brandKey == brandKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, brandKey);

  /// Create a copy of BrandProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductsImplCopyWith<_$GetProductsImpl> get copyWith =>
      __$$GetProductsImplCopyWithImpl<_$GetProductsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String brandKey) getProducts,
    required TResult Function(String brandKey) refresh,
    required TResult Function(
      String brandKey,
      Map<String, List<String>> filters,
    )
    applyFilters,
    required TResult Function(String brandKey, String sortValue) applySort,
  }) {
    return getProducts(brandKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String brandKey)? getProducts,
    TResult? Function(String brandKey)? refresh,
    TResult? Function(String brandKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult? Function(String brandKey, String sortValue)? applySort,
  }) {
    return getProducts?.call(brandKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String brandKey)? getProducts,
    TResult Function(String brandKey)? refresh,
    TResult Function(String brandKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult Function(String brandKey, String sortValue)? applySort,
    required TResult orElse(),
  }) {
    if (getProducts != null) {
      return getProducts(brandKey);
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

abstract class _GetProducts implements BrandProductsEvent {
  const factory _GetProducts({required final String brandKey}) =
      _$GetProductsImpl;

  @override
  String get brandKey;

  /// Create a copy of BrandProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProductsImplCopyWith<_$GetProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res>
    implements $BrandProductsEventCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
    _$RefreshImpl value,
    $Res Function(_$RefreshImpl) then,
  ) = __$$RefreshImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String brandKey});
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$BrandProductsEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
    _$RefreshImpl _value,
    $Res Function(_$RefreshImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BrandProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? brandKey = null}) {
    return _then(
      _$RefreshImpl(
        brandKey:
            null == brandKey
                ? _value.brandKey
                : brandKey // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl({required this.brandKey});

  @override
  final String brandKey;

  @override
  String toString() {
    return 'BrandProductsEvent.refresh(brandKey: $brandKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshImpl &&
            (identical(other.brandKey, brandKey) ||
                other.brandKey == brandKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, brandKey);

  /// Create a copy of BrandProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshImplCopyWith<_$RefreshImpl> get copyWith =>
      __$$RefreshImplCopyWithImpl<_$RefreshImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String brandKey) getProducts,
    required TResult Function(String brandKey) refresh,
    required TResult Function(
      String brandKey,
      Map<String, List<String>> filters,
    )
    applyFilters,
    required TResult Function(String brandKey, String sortValue) applySort,
  }) {
    return refresh(brandKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String brandKey)? getProducts,
    TResult? Function(String brandKey)? refresh,
    TResult? Function(String brandKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult? Function(String brandKey, String sortValue)? applySort,
  }) {
    return refresh?.call(brandKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String brandKey)? getProducts,
    TResult Function(String brandKey)? refresh,
    TResult Function(String brandKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult Function(String brandKey, String sortValue)? applySort,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(brandKey);
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

abstract class _Refresh implements BrandProductsEvent {
  const factory _Refresh({required final String brandKey}) = _$RefreshImpl;

  @override
  String get brandKey;

  /// Create a copy of BrandProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshImplCopyWith<_$RefreshImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplyFiltersImplCopyWith<$Res>
    implements $BrandProductsEventCopyWith<$Res> {
  factory _$$ApplyFiltersImplCopyWith(
    _$ApplyFiltersImpl value,
    $Res Function(_$ApplyFiltersImpl) then,
  ) = __$$ApplyFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String brandKey, Map<String, List<String>> filters});
}

/// @nodoc
class __$$ApplyFiltersImplCopyWithImpl<$Res>
    extends _$BrandProductsEventCopyWithImpl<$Res, _$ApplyFiltersImpl>
    implements _$$ApplyFiltersImplCopyWith<$Res> {
  __$$ApplyFiltersImplCopyWithImpl(
    _$ApplyFiltersImpl _value,
    $Res Function(_$ApplyFiltersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BrandProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? brandKey = null, Object? filters = null}) {
    return _then(
      _$ApplyFiltersImpl(
        brandKey:
            null == brandKey
                ? _value.brandKey
                : brandKey // ignore: cast_nullable_to_non_nullable
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
    required this.brandKey,
    required final Map<String, List<String>> filters,
  }) : _filters = filters;

  @override
  final String brandKey;
  final Map<String, List<String>> _filters;
  @override
  Map<String, List<String>> get filters {
    if (_filters is EqualUnmodifiableMapView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_filters);
  }

  @override
  String toString() {
    return 'BrandProductsEvent.applyFilters(brandKey: $brandKey, filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyFiltersImpl &&
            (identical(other.brandKey, brandKey) ||
                other.brandKey == brandKey) &&
            const DeepCollectionEquality().equals(other._filters, _filters));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    brandKey,
    const DeepCollectionEquality().hash(_filters),
  );

  /// Create a copy of BrandProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplyFiltersImplCopyWith<_$ApplyFiltersImpl> get copyWith =>
      __$$ApplyFiltersImplCopyWithImpl<_$ApplyFiltersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String brandKey) getProducts,
    required TResult Function(String brandKey) refresh,
    required TResult Function(
      String brandKey,
      Map<String, List<String>> filters,
    )
    applyFilters,
    required TResult Function(String brandKey, String sortValue) applySort,
  }) {
    return applyFilters(brandKey, filters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String brandKey)? getProducts,
    TResult? Function(String brandKey)? refresh,
    TResult? Function(String brandKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult? Function(String brandKey, String sortValue)? applySort,
  }) {
    return applyFilters?.call(brandKey, filters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String brandKey)? getProducts,
    TResult Function(String brandKey)? refresh,
    TResult Function(String brandKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult Function(String brandKey, String sortValue)? applySort,
    required TResult orElse(),
  }) {
    if (applyFilters != null) {
      return applyFilters(brandKey, filters);
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

abstract class _ApplyFilters implements BrandProductsEvent {
  const factory _ApplyFilters({
    required final String brandKey,
    required final Map<String, List<String>> filters,
  }) = _$ApplyFiltersImpl;

  @override
  String get brandKey;
  Map<String, List<String>> get filters;

  /// Create a copy of BrandProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplyFiltersImplCopyWith<_$ApplyFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplySortImplCopyWith<$Res>
    implements $BrandProductsEventCopyWith<$Res> {
  factory _$$ApplySortImplCopyWith(
    _$ApplySortImpl value,
    $Res Function(_$ApplySortImpl) then,
  ) = __$$ApplySortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String brandKey, String sortValue});
}

/// @nodoc
class __$$ApplySortImplCopyWithImpl<$Res>
    extends _$BrandProductsEventCopyWithImpl<$Res, _$ApplySortImpl>
    implements _$$ApplySortImplCopyWith<$Res> {
  __$$ApplySortImplCopyWithImpl(
    _$ApplySortImpl _value,
    $Res Function(_$ApplySortImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BrandProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? brandKey = null, Object? sortValue = null}) {
    return _then(
      _$ApplySortImpl(
        brandKey:
            null == brandKey
                ? _value.brandKey
                : brandKey // ignore: cast_nullable_to_non_nullable
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
  const _$ApplySortImpl({required this.brandKey, required this.sortValue});

  @override
  final String brandKey;
  @override
  final String sortValue;

  @override
  String toString() {
    return 'BrandProductsEvent.applySort(brandKey: $brandKey, sortValue: $sortValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplySortImpl &&
            (identical(other.brandKey, brandKey) ||
                other.brandKey == brandKey) &&
            (identical(other.sortValue, sortValue) ||
                other.sortValue == sortValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, brandKey, sortValue);

  /// Create a copy of BrandProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplySortImplCopyWith<_$ApplySortImpl> get copyWith =>
      __$$ApplySortImplCopyWithImpl<_$ApplySortImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String brandKey) getProducts,
    required TResult Function(String brandKey) refresh,
    required TResult Function(
      String brandKey,
      Map<String, List<String>> filters,
    )
    applyFilters,
    required TResult Function(String brandKey, String sortValue) applySort,
  }) {
    return applySort(brandKey, sortValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String brandKey)? getProducts,
    TResult? Function(String brandKey)? refresh,
    TResult? Function(String brandKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult? Function(String brandKey, String sortValue)? applySort,
  }) {
    return applySort?.call(brandKey, sortValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String brandKey)? getProducts,
    TResult Function(String brandKey)? refresh,
    TResult Function(String brandKey, Map<String, List<String>> filters)?
    applyFilters,
    TResult Function(String brandKey, String sortValue)? applySort,
    required TResult orElse(),
  }) {
    if (applySort != null) {
      return applySort(brandKey, sortValue);
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

abstract class _ApplySort implements BrandProductsEvent {
  const factory _ApplySort({
    required final String brandKey,
    required final String sortValue,
  }) = _$ApplySortImpl;

  @override
  String get brandKey;
  String get sortValue;

  /// Create a copy of BrandProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplySortImplCopyWith<_$ApplySortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BrandProductsState {
  String get brandKey => throw _privateConstructorUsedError;
  PagingState<int, ProductEntity> get pagingState =>
      throw _privateConstructorUsedError;
  BrandProductsEntity? get brandData => throw _privateConstructorUsedError;
  Map<String, List<String>>? get currentFilters =>
      throw _privateConstructorUsedError;
  String? get currentSort => throw _privateConstructorUsedError;
  CategoryFacets? get cachedFacets => throw _privateConstructorUsedError;

  /// Create a copy of BrandProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandProductsStateCopyWith<BrandProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandProductsStateCopyWith<$Res> {
  factory $BrandProductsStateCopyWith(
    BrandProductsState value,
    $Res Function(BrandProductsState) then,
  ) = _$BrandProductsStateCopyWithImpl<$Res, BrandProductsState>;
  @useResult
  $Res call({
    String brandKey,
    PagingState<int, ProductEntity> pagingState,
    BrandProductsEntity? brandData,
    Map<String, List<String>>? currentFilters,
    String? currentSort,
    CategoryFacets? cachedFacets,
  });
}

/// @nodoc
class _$BrandProductsStateCopyWithImpl<$Res, $Val extends BrandProductsState>
    implements $BrandProductsStateCopyWith<$Res> {
  _$BrandProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandKey = null,
    Object? pagingState = null,
    Object? brandData = freezed,
    Object? currentFilters = freezed,
    Object? currentSort = freezed,
    Object? cachedFacets = freezed,
  }) {
    return _then(
      _value.copyWith(
            brandKey:
                null == brandKey
                    ? _value.brandKey
                    : brandKey // ignore: cast_nullable_to_non_nullable
                        as String,
            pagingState:
                null == pagingState
                    ? _value.pagingState
                    : pagingState // ignore: cast_nullable_to_non_nullable
                        as PagingState<int, ProductEntity>,
            brandData:
                freezed == brandData
                    ? _value.brandData
                    : brandData // ignore: cast_nullable_to_non_nullable
                        as BrandProductsEntity?,
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
abstract class _$$BrandProductsStateImplCopyWith<$Res>
    implements $BrandProductsStateCopyWith<$Res> {
  factory _$$BrandProductsStateImplCopyWith(
    _$BrandProductsStateImpl value,
    $Res Function(_$BrandProductsStateImpl) then,
  ) = __$$BrandProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String brandKey,
    PagingState<int, ProductEntity> pagingState,
    BrandProductsEntity? brandData,
    Map<String, List<String>>? currentFilters,
    String? currentSort,
    CategoryFacets? cachedFacets,
  });
}

/// @nodoc
class __$$BrandProductsStateImplCopyWithImpl<$Res>
    extends _$BrandProductsStateCopyWithImpl<$Res, _$BrandProductsStateImpl>
    implements _$$BrandProductsStateImplCopyWith<$Res> {
  __$$BrandProductsStateImplCopyWithImpl(
    _$BrandProductsStateImpl _value,
    $Res Function(_$BrandProductsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BrandProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandKey = null,
    Object? pagingState = null,
    Object? brandData = freezed,
    Object? currentFilters = freezed,
    Object? currentSort = freezed,
    Object? cachedFacets = freezed,
  }) {
    return _then(
      _$BrandProductsStateImpl(
        brandKey:
            null == brandKey
                ? _value.brandKey
                : brandKey // ignore: cast_nullable_to_non_nullable
                    as String,
        pagingState:
            null == pagingState
                ? _value.pagingState
                : pagingState // ignore: cast_nullable_to_non_nullable
                    as PagingState<int, ProductEntity>,
        brandData:
            freezed == brandData
                ? _value.brandData
                : brandData // ignore: cast_nullable_to_non_nullable
                    as BrandProductsEntity?,
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

class _$BrandProductsStateImpl extends _BrandProductsState {
  const _$BrandProductsStateImpl({
    this.brandKey = '',
    required this.pagingState,
    this.brandData,
    final Map<String, List<String>>? currentFilters,
    this.currentSort,
    this.cachedFacets,
  }) : _currentFilters = currentFilters,
       super._();

  @override
  @JsonKey()
  final String brandKey;
  @override
  final PagingState<int, ProductEntity> pagingState;
  @override
  final BrandProductsEntity? brandData;
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
    return 'BrandProductsState(brandKey: $brandKey, pagingState: $pagingState, brandData: $brandData, currentFilters: $currentFilters, currentSort: $currentSort, cachedFacets: $cachedFacets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandProductsStateImpl &&
            (identical(other.brandKey, brandKey) ||
                other.brandKey == brandKey) &&
            (identical(other.pagingState, pagingState) ||
                other.pagingState == pagingState) &&
            (identical(other.brandData, brandData) ||
                other.brandData == brandData) &&
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
    brandKey,
    pagingState,
    brandData,
    const DeepCollectionEquality().hash(_currentFilters),
    currentSort,
    cachedFacets,
  );

  /// Create a copy of BrandProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandProductsStateImplCopyWith<_$BrandProductsStateImpl> get copyWith =>
      __$$BrandProductsStateImplCopyWithImpl<_$BrandProductsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _BrandProductsState extends BrandProductsState {
  const factory _BrandProductsState({
    final String brandKey,
    required final PagingState<int, ProductEntity> pagingState,
    final BrandProductsEntity? brandData,
    final Map<String, List<String>>? currentFilters,
    final String? currentSort,
    final CategoryFacets? cachedFacets,
  }) = _$BrandProductsStateImpl;
  const _BrandProductsState._() : super._();

  @override
  String get brandKey;
  @override
  PagingState<int, ProductEntity> get pagingState;
  @override
  BrandProductsEntity? get brandData;
  @override
  Map<String, List<String>>? get currentFilters;
  @override
  String? get currentSort;
  @override
  CategoryFacets? get cachedFacets;

  /// Create a copy of BrandProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandProductsStateImplCopyWith<_$BrandProductsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
