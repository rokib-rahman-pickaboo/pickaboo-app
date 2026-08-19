// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FilterCategory _$FilterCategoryFromJson(Map<String, dynamic> json) {
  return _FilterCategory.fromJson(json);
}

/// @nodoc
mixin _$FilterCategory {
  String get filterCode => throw _privateConstructorUsedError;
  String get filterName => throw _privateConstructorUsedError;
  List<FilterOption> get items => throw _privateConstructorUsedError;

  /// Serializes this FilterCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilterCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterCategoryCopyWith<FilterCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterCategoryCopyWith<$Res> {
  factory $FilterCategoryCopyWith(
    FilterCategory value,
    $Res Function(FilterCategory) then,
  ) = _$FilterCategoryCopyWithImpl<$Res, FilterCategory>;
  @useResult
  $Res call({String filterCode, String filterName, List<FilterOption> items});
}

/// @nodoc
class _$FilterCategoryCopyWithImpl<$Res, $Val extends FilterCategory>
    implements $FilterCategoryCopyWith<$Res> {
  _$FilterCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterCode = null,
    Object? filterName = null,
    Object? items = null,
  }) {
    return _then(
      _value.copyWith(
            filterCode:
                null == filterCode
                    ? _value.filterCode
                    : filterCode // ignore: cast_nullable_to_non_nullable
                        as String,
            filterName:
                null == filterName
                    ? _value.filterName
                    : filterName // ignore: cast_nullable_to_non_nullable
                        as String,
            items:
                null == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<FilterOption>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FilterCategoryImplCopyWith<$Res>
    implements $FilterCategoryCopyWith<$Res> {
  factory _$$FilterCategoryImplCopyWith(
    _$FilterCategoryImpl value,
    $Res Function(_$FilterCategoryImpl) then,
  ) = __$$FilterCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String filterCode, String filterName, List<FilterOption> items});
}

/// @nodoc
class __$$FilterCategoryImplCopyWithImpl<$Res>
    extends _$FilterCategoryCopyWithImpl<$Res, _$FilterCategoryImpl>
    implements _$$FilterCategoryImplCopyWith<$Res> {
  __$$FilterCategoryImplCopyWithImpl(
    _$FilterCategoryImpl _value,
    $Res Function(_$FilterCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterCode = null,
    Object? filterName = null,
    Object? items = null,
  }) {
    return _then(
      _$FilterCategoryImpl(
        filterCode:
            null == filterCode
                ? _value.filterCode
                : filterCode // ignore: cast_nullable_to_non_nullable
                    as String,
        filterName:
            null == filterName
                ? _value.filterName
                : filterName // ignore: cast_nullable_to_non_nullable
                    as String,
        items:
            null == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<FilterOption>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterCategoryImpl implements _FilterCategory {
  const _$FilterCategoryImpl({
    required this.filterCode,
    required this.filterName,
    required final List<FilterOption> items,
  }) : _items = items;

  factory _$FilterCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterCategoryImplFromJson(json);

  @override
  final String filterCode;
  @override
  final String filterName;
  final List<FilterOption> _items;
  @override
  List<FilterOption> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'FilterCategory(filterCode: $filterCode, filterName: $filterName, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterCategoryImpl &&
            (identical(other.filterCode, filterCode) ||
                other.filterCode == filterCode) &&
            (identical(other.filterName, filterName) ||
                other.filterName == filterName) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    filterCode,
    filterName,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of FilterCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterCategoryImplCopyWith<_$FilterCategoryImpl> get copyWith =>
      __$$FilterCategoryImplCopyWithImpl<_$FilterCategoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterCategoryImplToJson(this);
  }
}

abstract class _FilterCategory implements FilterCategory {
  const factory _FilterCategory({
    required final String filterCode,
    required final String filterName,
    required final List<FilterOption> items,
  }) = _$FilterCategoryImpl;

  factory _FilterCategory.fromJson(Map<String, dynamic> json) =
      _$FilterCategoryImpl.fromJson;

  @override
  String get filterCode;
  @override
  String get filterName;
  @override
  List<FilterOption> get items;

  /// Create a copy of FilterCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterCategoryImplCopyWith<_$FilterCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FilterOption _$FilterOptionFromJson(Map<String, dynamic> json) {
  return _FilterOption.fromJson(json);
}

/// @nodoc
mixin _$FilterOption {
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  /// Serializes this FilterOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilterOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterOptionCopyWith<FilterOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterOptionCopyWith<$Res> {
  factory $FilterOptionCopyWith(
    FilterOption value,
    $Res Function(FilterOption) then,
  ) = _$FilterOptionCopyWithImpl<$Res, FilterOption>;
  @useResult
  $Res call({
    String value,
    String label,
    bool isSelected,
    String? icon,
    int? count,
  });
}

/// @nodoc
class _$FilterOptionCopyWithImpl<$Res, $Val extends FilterOption>
    implements $FilterOptionCopyWith<$Res> {
  _$FilterOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? isSelected = null,
    Object? icon = freezed,
    Object? count = freezed,
  }) {
    return _then(
      _value.copyWith(
            value:
                null == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as String,
            label:
                null == label
                    ? _value.label
                    : label // ignore: cast_nullable_to_non_nullable
                        as String,
            isSelected:
                null == isSelected
                    ? _value.isSelected
                    : isSelected // ignore: cast_nullable_to_non_nullable
                        as bool,
            icon:
                freezed == icon
                    ? _value.icon
                    : icon // ignore: cast_nullable_to_non_nullable
                        as String?,
            count:
                freezed == count
                    ? _value.count
                    : count // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FilterOptionImplCopyWith<$Res>
    implements $FilterOptionCopyWith<$Res> {
  factory _$$FilterOptionImplCopyWith(
    _$FilterOptionImpl value,
    $Res Function(_$FilterOptionImpl) then,
  ) = __$$FilterOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String value,
    String label,
    bool isSelected,
    String? icon,
    int? count,
  });
}

/// @nodoc
class __$$FilterOptionImplCopyWithImpl<$Res>
    extends _$FilterOptionCopyWithImpl<$Res, _$FilterOptionImpl>
    implements _$$FilterOptionImplCopyWith<$Res> {
  __$$FilterOptionImplCopyWithImpl(
    _$FilterOptionImpl _value,
    $Res Function(_$FilterOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? isSelected = null,
    Object? icon = freezed,
    Object? count = freezed,
  }) {
    return _then(
      _$FilterOptionImpl(
        value:
            null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as String,
        label:
            null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                    as String,
        isSelected:
            null == isSelected
                ? _value.isSelected
                : isSelected // ignore: cast_nullable_to_non_nullable
                    as bool,
        icon:
            freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                    as String?,
        count:
            freezed == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterOptionImpl implements _FilterOption {
  const _$FilterOptionImpl({
    required this.value,
    required this.label,
    this.isSelected = false,
    this.icon,
    this.count,
  });

  factory _$FilterOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterOptionImplFromJson(json);

  @override
  final String value;
  @override
  final String label;
  @override
  @JsonKey()
  final bool isSelected;
  @override
  final String? icon;
  @override
  final int? count;

  @override
  String toString() {
    return 'FilterOption(value: $value, label: $label, isSelected: $isSelected, icon: $icon, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterOptionImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, value, label, isSelected, icon, count);

  /// Create a copy of FilterOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterOptionImplCopyWith<_$FilterOptionImpl> get copyWith =>
      __$$FilterOptionImplCopyWithImpl<_$FilterOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterOptionImplToJson(this);
  }
}

abstract class _FilterOption implements FilterOption {
  const factory _FilterOption({
    required final String value,
    required final String label,
    final bool isSelected,
    final String? icon,
    final int? count,
  }) = _$FilterOptionImpl;

  factory _FilterOption.fromJson(Map<String, dynamic> json) =
      _$FilterOptionImpl.fromJson;

  @override
  String get value;
  @override
  String get label;
  @override
  bool get isSelected;
  @override
  String? get icon;
  @override
  int? get count;

  /// Create a copy of FilterOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterOptionImplCopyWith<_$FilterOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppliedFilters _$AppliedFiltersFromJson(Map<String, dynamic> json) {
  return _AppliedFilters.fromJson(json);
}

/// @nodoc
mixin _$AppliedFilters {
  Map<String, List<String>> get filters => throw _privateConstructorUsedError;

  /// Serializes this AppliedFilters to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppliedFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppliedFiltersCopyWith<AppliedFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppliedFiltersCopyWith<$Res> {
  factory $AppliedFiltersCopyWith(
    AppliedFilters value,
    $Res Function(AppliedFilters) then,
  ) = _$AppliedFiltersCopyWithImpl<$Res, AppliedFilters>;
  @useResult
  $Res call({Map<String, List<String>> filters});
}

/// @nodoc
class _$AppliedFiltersCopyWithImpl<$Res, $Val extends AppliedFilters>
    implements $AppliedFiltersCopyWith<$Res> {
  _$AppliedFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppliedFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? filters = null}) {
    return _then(
      _value.copyWith(
            filters:
                null == filters
                    ? _value.filters
                    : filters // ignore: cast_nullable_to_non_nullable
                        as Map<String, List<String>>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppliedFiltersImplCopyWith<$Res>
    implements $AppliedFiltersCopyWith<$Res> {
  factory _$$AppliedFiltersImplCopyWith(
    _$AppliedFiltersImpl value,
    $Res Function(_$AppliedFiltersImpl) then,
  ) = __$$AppliedFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, List<String>> filters});
}

/// @nodoc
class __$$AppliedFiltersImplCopyWithImpl<$Res>
    extends _$AppliedFiltersCopyWithImpl<$Res, _$AppliedFiltersImpl>
    implements _$$AppliedFiltersImplCopyWith<$Res> {
  __$$AppliedFiltersImplCopyWithImpl(
    _$AppliedFiltersImpl _value,
    $Res Function(_$AppliedFiltersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppliedFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? filters = null}) {
    return _then(
      _$AppliedFiltersImpl(
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
@JsonSerializable()
class _$AppliedFiltersImpl implements _AppliedFilters {
  const _$AppliedFiltersImpl({
    final Map<String, List<String>> filters = const {},
  }) : _filters = filters;

  factory _$AppliedFiltersImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppliedFiltersImplFromJson(json);

  final Map<String, List<String>> _filters;
  @override
  @JsonKey()
  Map<String, List<String>> get filters {
    if (_filters is EqualUnmodifiableMapView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_filters);
  }

  @override
  String toString() {
    return 'AppliedFilters(filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppliedFiltersImpl &&
            const DeepCollectionEquality().equals(other._filters, _filters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_filters));

  /// Create a copy of AppliedFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppliedFiltersImplCopyWith<_$AppliedFiltersImpl> get copyWith =>
      __$$AppliedFiltersImplCopyWithImpl<_$AppliedFiltersImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppliedFiltersImplToJson(this);
  }
}

abstract class _AppliedFilters implements AppliedFilters {
  const factory _AppliedFilters({final Map<String, List<String>> filters}) =
      _$AppliedFiltersImpl;

  factory _AppliedFilters.fromJson(Map<String, dynamic> json) =
      _$AppliedFiltersImpl.fromJson;

  @override
  Map<String, List<String>> get filters;

  /// Create a copy of AppliedFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppliedFiltersImplCopyWith<_$AppliedFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
