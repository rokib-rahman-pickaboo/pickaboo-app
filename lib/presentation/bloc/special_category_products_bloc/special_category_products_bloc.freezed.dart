// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'special_category_products_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SpecialCategoryProductsEvent {
  String get categorySlug => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String categorySlug) getProducts,
    required TResult Function(String categorySlug) refresh,
    required TResult Function(
      String categorySlug,
      Map<String, List<String>> filters,
    )
    applyFilters,
    required TResult Function(String categorySlug, String sortValue) applySort,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String categorySlug)? getProducts,
    TResult? Function(String categorySlug)? refresh,
    TResult? Function(String categorySlug, Map<String, List<String>> filters)?
    applyFilters,
    TResult? Function(String categorySlug, String sortValue)? applySort,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String categorySlug)? getProducts,
    TResult Function(String categorySlug)? refresh,
    TResult Function(String categorySlug, Map<String, List<String>> filters)?
    applyFilters,
    TResult Function(String categorySlug, String sortValue)? applySort,
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

  /// Create a copy of SpecialCategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecialCategoryProductsEventCopyWith<SpecialCategoryProductsEvent>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialCategoryProductsEventCopyWith<$Res> {
  factory $SpecialCategoryProductsEventCopyWith(
    SpecialCategoryProductsEvent value,
    $Res Function(SpecialCategoryProductsEvent) then,
  ) =
      _$SpecialCategoryProductsEventCopyWithImpl<
        $Res,
        SpecialCategoryProductsEvent
      >;
  @useResult
  $Res call({String categorySlug});
}

/// @nodoc
class _$SpecialCategoryProductsEventCopyWithImpl<
  $Res,
  $Val extends SpecialCategoryProductsEvent
>
    implements $SpecialCategoryProductsEventCopyWith<$Res> {
  _$SpecialCategoryProductsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecialCategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categorySlug = null}) {
    return _then(
      _value.copyWith(
            categorySlug:
                null == categorySlug
                    ? _value.categorySlug
                    : categorySlug // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetProductsImplCopyWith<$Res>
    implements $SpecialCategoryProductsEventCopyWith<$Res> {
  factory _$$GetProductsImplCopyWith(
    _$GetProductsImpl value,
    $Res Function(_$GetProductsImpl) then,
  ) = __$$GetProductsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categorySlug});
}

/// @nodoc
class __$$GetProductsImplCopyWithImpl<$Res>
    extends _$SpecialCategoryProductsEventCopyWithImpl<$Res, _$GetProductsImpl>
    implements _$$GetProductsImplCopyWith<$Res> {
  __$$GetProductsImplCopyWithImpl(
    _$GetProductsImpl _value,
    $Res Function(_$GetProductsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpecialCategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categorySlug = null}) {
    return _then(
      _$GetProductsImpl(
        categorySlug:
            null == categorySlug
                ? _value.categorySlug
                : categorySlug // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$GetProductsImpl implements _GetProducts {
  const _$GetProductsImpl({required this.categorySlug});

  @override
  final String categorySlug;

  @override
  String toString() {
    return 'SpecialCategoryProductsEvent.getProducts(categorySlug: $categorySlug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductsImpl &&
            (identical(other.categorySlug, categorySlug) ||
                other.categorySlug == categorySlug));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categorySlug);

  /// Create a copy of SpecialCategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductsImplCopyWith<_$GetProductsImpl> get copyWith =>
      __$$GetProductsImplCopyWithImpl<_$GetProductsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String categorySlug) getProducts,
    required TResult Function(String categorySlug) refresh,
    required TResult Function(
      String categorySlug,
      Map<String, List<String>> filters,
    )
    applyFilters,
    required TResult Function(String categorySlug, String sortValue) applySort,
  }) {
    return getProducts(categorySlug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String categorySlug)? getProducts,
    TResult? Function(String categorySlug)? refresh,
    TResult? Function(String categorySlug, Map<String, List<String>> filters)?
    applyFilters,
    TResult? Function(String categorySlug, String sortValue)? applySort,
  }) {
    return getProducts?.call(categorySlug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String categorySlug)? getProducts,
    TResult Function(String categorySlug)? refresh,
    TResult Function(String categorySlug, Map<String, List<String>> filters)?
    applyFilters,
    TResult Function(String categorySlug, String sortValue)? applySort,
    required TResult orElse(),
  }) {
    if (getProducts != null) {
      return getProducts(categorySlug);
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

abstract class _GetProducts implements SpecialCategoryProductsEvent {
  const factory _GetProducts({required final String categorySlug}) =
      _$GetProductsImpl;

  @override
  String get categorySlug;

  /// Create a copy of SpecialCategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProductsImplCopyWith<_$GetProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res>
    implements $SpecialCategoryProductsEventCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
    _$RefreshImpl value,
    $Res Function(_$RefreshImpl) then,
  ) = __$$RefreshImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categorySlug});
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$SpecialCategoryProductsEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
    _$RefreshImpl _value,
    $Res Function(_$RefreshImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpecialCategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categorySlug = null}) {
    return _then(
      _$RefreshImpl(
        categorySlug:
            null == categorySlug
                ? _value.categorySlug
                : categorySlug // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl({required this.categorySlug});

  @override
  final String categorySlug;

  @override
  String toString() {
    return 'SpecialCategoryProductsEvent.refresh(categorySlug: $categorySlug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshImpl &&
            (identical(other.categorySlug, categorySlug) ||
                other.categorySlug == categorySlug));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categorySlug);

  /// Create a copy of SpecialCategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshImplCopyWith<_$RefreshImpl> get copyWith =>
      __$$RefreshImplCopyWithImpl<_$RefreshImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String categorySlug) getProducts,
    required TResult Function(String categorySlug) refresh,
    required TResult Function(
      String categorySlug,
      Map<String, List<String>> filters,
    )
    applyFilters,
    required TResult Function(String categorySlug, String sortValue) applySort,
  }) {
    return refresh(categorySlug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String categorySlug)? getProducts,
    TResult? Function(String categorySlug)? refresh,
    TResult? Function(String categorySlug, Map<String, List<String>> filters)?
    applyFilters,
    TResult? Function(String categorySlug, String sortValue)? applySort,
  }) {
    return refresh?.call(categorySlug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String categorySlug)? getProducts,
    TResult Function(String categorySlug)? refresh,
    TResult Function(String categorySlug, Map<String, List<String>> filters)?
    applyFilters,
    TResult Function(String categorySlug, String sortValue)? applySort,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(categorySlug);
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

abstract class _Refresh implements SpecialCategoryProductsEvent {
  const factory _Refresh({required final String categorySlug}) = _$RefreshImpl;

  @override
  String get categorySlug;

  /// Create a copy of SpecialCategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshImplCopyWith<_$RefreshImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplyFiltersImplCopyWith<$Res>
    implements $SpecialCategoryProductsEventCopyWith<$Res> {
  factory _$$ApplyFiltersImplCopyWith(
    _$ApplyFiltersImpl value,
    $Res Function(_$ApplyFiltersImpl) then,
  ) = __$$ApplyFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categorySlug, Map<String, List<String>> filters});
}

/// @nodoc
class __$$ApplyFiltersImplCopyWithImpl<$Res>
    extends _$SpecialCategoryProductsEventCopyWithImpl<$Res, _$ApplyFiltersImpl>
    implements _$$ApplyFiltersImplCopyWith<$Res> {
  __$$ApplyFiltersImplCopyWithImpl(
    _$ApplyFiltersImpl _value,
    $Res Function(_$ApplyFiltersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpecialCategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categorySlug = null, Object? filters = null}) {
    return _then(
      _$ApplyFiltersImpl(
        categorySlug:
            null == categorySlug
                ? _value.categorySlug
                : categorySlug // ignore: cast_nullable_to_non_nullable
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
    required this.categorySlug,
    required final Map<String, List<String>> filters,
  }) : _filters = filters;

  @override
  final String categorySlug;
  final Map<String, List<String>> _filters;
  @override
  Map<String, List<String>> get filters {
    if (_filters is EqualUnmodifiableMapView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_filters);
  }

  @override
  String toString() {
    return 'SpecialCategoryProductsEvent.applyFilters(categorySlug: $categorySlug, filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyFiltersImpl &&
            (identical(other.categorySlug, categorySlug) ||
                other.categorySlug == categorySlug) &&
            const DeepCollectionEquality().equals(other._filters, _filters));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    categorySlug,
    const DeepCollectionEquality().hash(_filters),
  );

  /// Create a copy of SpecialCategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplyFiltersImplCopyWith<_$ApplyFiltersImpl> get copyWith =>
      __$$ApplyFiltersImplCopyWithImpl<_$ApplyFiltersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String categorySlug) getProducts,
    required TResult Function(String categorySlug) refresh,
    required TResult Function(
      String categorySlug,
      Map<String, List<String>> filters,
    )
    applyFilters,
    required TResult Function(String categorySlug, String sortValue) applySort,
  }) {
    return applyFilters(categorySlug, filters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String categorySlug)? getProducts,
    TResult? Function(String categorySlug)? refresh,
    TResult? Function(String categorySlug, Map<String, List<String>> filters)?
    applyFilters,
    TResult? Function(String categorySlug, String sortValue)? applySort,
  }) {
    return applyFilters?.call(categorySlug, filters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String categorySlug)? getProducts,
    TResult Function(String categorySlug)? refresh,
    TResult Function(String categorySlug, Map<String, List<String>> filters)?
    applyFilters,
    TResult Function(String categorySlug, String sortValue)? applySort,
    required TResult orElse(),
  }) {
    if (applyFilters != null) {
      return applyFilters(categorySlug, filters);
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

abstract class _ApplyFilters implements SpecialCategoryProductsEvent {
  const factory _ApplyFilters({
    required final String categorySlug,
    required final Map<String, List<String>> filters,
  }) = _$ApplyFiltersImpl;

  @override
  String get categorySlug;
  Map<String, List<String>> get filters;

  /// Create a copy of SpecialCategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplyFiltersImplCopyWith<_$ApplyFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplySortImplCopyWith<$Res>
    implements $SpecialCategoryProductsEventCopyWith<$Res> {
  factory _$$ApplySortImplCopyWith(
    _$ApplySortImpl value,
    $Res Function(_$ApplySortImpl) then,
  ) = __$$ApplySortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categorySlug, String sortValue});
}

/// @nodoc
class __$$ApplySortImplCopyWithImpl<$Res>
    extends _$SpecialCategoryProductsEventCopyWithImpl<$Res, _$ApplySortImpl>
    implements _$$ApplySortImplCopyWith<$Res> {
  __$$ApplySortImplCopyWithImpl(
    _$ApplySortImpl _value,
    $Res Function(_$ApplySortImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpecialCategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categorySlug = null, Object? sortValue = null}) {
    return _then(
      _$ApplySortImpl(
        categorySlug:
            null == categorySlug
                ? _value.categorySlug
                : categorySlug // ignore: cast_nullable_to_non_nullable
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
  const _$ApplySortImpl({required this.categorySlug, required this.sortValue});

  @override
  final String categorySlug;
  @override
  final String sortValue;

  @override
  String toString() {
    return 'SpecialCategoryProductsEvent.applySort(categorySlug: $categorySlug, sortValue: $sortValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplySortImpl &&
            (identical(other.categorySlug, categorySlug) ||
                other.categorySlug == categorySlug) &&
            (identical(other.sortValue, sortValue) ||
                other.sortValue == sortValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categorySlug, sortValue);

  /// Create a copy of SpecialCategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplySortImplCopyWith<_$ApplySortImpl> get copyWith =>
      __$$ApplySortImplCopyWithImpl<_$ApplySortImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String categorySlug) getProducts,
    required TResult Function(String categorySlug) refresh,
    required TResult Function(
      String categorySlug,
      Map<String, List<String>> filters,
    )
    applyFilters,
    required TResult Function(String categorySlug, String sortValue) applySort,
  }) {
    return applySort(categorySlug, sortValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String categorySlug)? getProducts,
    TResult? Function(String categorySlug)? refresh,
    TResult? Function(String categorySlug, Map<String, List<String>> filters)?
    applyFilters,
    TResult? Function(String categorySlug, String sortValue)? applySort,
  }) {
    return applySort?.call(categorySlug, sortValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String categorySlug)? getProducts,
    TResult Function(String categorySlug)? refresh,
    TResult Function(String categorySlug, Map<String, List<String>> filters)?
    applyFilters,
    TResult Function(String categorySlug, String sortValue)? applySort,
    required TResult orElse(),
  }) {
    if (applySort != null) {
      return applySort(categorySlug, sortValue);
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

abstract class _ApplySort implements SpecialCategoryProductsEvent {
  const factory _ApplySort({
    required final String categorySlug,
    required final String sortValue,
  }) = _$ApplySortImpl;

  @override
  String get categorySlug;
  String get sortValue;

  /// Create a copy of SpecialCategoryProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplySortImplCopyWith<_$ApplySortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SpecialCategoryProductsState {
  String get categorySlug => throw _privateConstructorUsedError;
  PagingState<int, ProductEntity> get pagingState =>
      throw _privateConstructorUsedError;
  CategoryProductsEntity? get categoryData =>
      throw _privateConstructorUsedError;
  Map<String, List<String>>? get currentFilters =>
      throw _privateConstructorUsedError;
  String? get currentSort => throw _privateConstructorUsedError;
  CategoryFacets? get cachedFacets => throw _privateConstructorUsedError;

  /// Create a copy of SpecialCategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecialCategoryProductsStateCopyWith<SpecialCategoryProductsState>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialCategoryProductsStateCopyWith<$Res> {
  factory $SpecialCategoryProductsStateCopyWith(
    SpecialCategoryProductsState value,
    $Res Function(SpecialCategoryProductsState) then,
  ) =
      _$SpecialCategoryProductsStateCopyWithImpl<
        $Res,
        SpecialCategoryProductsState
      >;
  @useResult
  $Res call({
    String categorySlug,
    PagingState<int, ProductEntity> pagingState,
    CategoryProductsEntity? categoryData,
    Map<String, List<String>>? currentFilters,
    String? currentSort,
    CategoryFacets? cachedFacets,
  });
}

/// @nodoc
class _$SpecialCategoryProductsStateCopyWithImpl<
  $Res,
  $Val extends SpecialCategoryProductsState
>
    implements $SpecialCategoryProductsStateCopyWith<$Res> {
  _$SpecialCategoryProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecialCategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categorySlug = null,
    Object? pagingState = null,
    Object? categoryData = freezed,
    Object? currentFilters = freezed,
    Object? currentSort = freezed,
    Object? cachedFacets = freezed,
  }) {
    return _then(
      _value.copyWith(
            categorySlug:
                null == categorySlug
                    ? _value.categorySlug
                    : categorySlug // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SpecialCategoryProductsStateImplCopyWith<$Res>
    implements $SpecialCategoryProductsStateCopyWith<$Res> {
  factory _$$SpecialCategoryProductsStateImplCopyWith(
    _$SpecialCategoryProductsStateImpl value,
    $Res Function(_$SpecialCategoryProductsStateImpl) then,
  ) = __$$SpecialCategoryProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String categorySlug,
    PagingState<int, ProductEntity> pagingState,
    CategoryProductsEntity? categoryData,
    Map<String, List<String>>? currentFilters,
    String? currentSort,
    CategoryFacets? cachedFacets,
  });
}

/// @nodoc
class __$$SpecialCategoryProductsStateImplCopyWithImpl<$Res>
    extends
        _$SpecialCategoryProductsStateCopyWithImpl<
          $Res,
          _$SpecialCategoryProductsStateImpl
        >
    implements _$$SpecialCategoryProductsStateImplCopyWith<$Res> {
  __$$SpecialCategoryProductsStateImplCopyWithImpl(
    _$SpecialCategoryProductsStateImpl _value,
    $Res Function(_$SpecialCategoryProductsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpecialCategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categorySlug = null,
    Object? pagingState = null,
    Object? categoryData = freezed,
    Object? currentFilters = freezed,
    Object? currentSort = freezed,
    Object? cachedFacets = freezed,
  }) {
    return _then(
      _$SpecialCategoryProductsStateImpl(
        categorySlug:
            null == categorySlug
                ? _value.categorySlug
                : categorySlug // ignore: cast_nullable_to_non_nullable
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

class _$SpecialCategoryProductsStateImpl extends _SpecialCategoryProductsState {
  const _$SpecialCategoryProductsStateImpl({
    required this.categorySlug,
    required this.pagingState,
    this.categoryData,
    final Map<String, List<String>>? currentFilters,
    this.currentSort,
    this.cachedFacets,
  }) : _currentFilters = currentFilters,
       super._();

  @override
  final String categorySlug;
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
    return 'SpecialCategoryProductsState(categorySlug: $categorySlug, pagingState: $pagingState, categoryData: $categoryData, currentFilters: $currentFilters, currentSort: $currentSort, cachedFacets: $cachedFacets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialCategoryProductsStateImpl &&
            (identical(other.categorySlug, categorySlug) ||
                other.categorySlug == categorySlug) &&
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
    categorySlug,
    pagingState,
    categoryData,
    const DeepCollectionEquality().hash(_currentFilters),
    currentSort,
    cachedFacets,
  );

  /// Create a copy of SpecialCategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecialCategoryProductsStateImplCopyWith<
    _$SpecialCategoryProductsStateImpl
  >
  get copyWith => __$$SpecialCategoryProductsStateImplCopyWithImpl<
    _$SpecialCategoryProductsStateImpl
  >(this, _$identity);
}

abstract class _SpecialCategoryProductsState
    extends SpecialCategoryProductsState {
  const factory _SpecialCategoryProductsState({
    required final String categorySlug,
    required final PagingState<int, ProductEntity> pagingState,
    final CategoryProductsEntity? categoryData,
    final Map<String, List<String>>? currentFilters,
    final String? currentSort,
    final CategoryFacets? cachedFacets,
  }) = _$SpecialCategoryProductsStateImpl;
  const _SpecialCategoryProductsState._() : super._();

  @override
  String get categorySlug;
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

  /// Create a copy of SpecialCategoryProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecialCategoryProductsStateImplCopyWith<
    _$SpecialCategoryProductsStateImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
