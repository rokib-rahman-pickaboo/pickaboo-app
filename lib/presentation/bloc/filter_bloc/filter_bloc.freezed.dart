// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<FilterCategory> categories) loadRequested,
    required TResult Function(String filterCode, FilterOption option)
    optionToggled,
    required TResult Function(String filterCode) categoryChanged,
    required TResult Function() cleared,
    required TResult Function() applied,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<FilterCategory> categories)? loadRequested,
    TResult? Function(String filterCode, FilterOption option)? optionToggled,
    TResult? Function(String filterCode)? categoryChanged,
    TResult? Function()? cleared,
    TResult? Function()? applied,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<FilterCategory> categories)? loadRequested,
    TResult Function(String filterCode, FilterOption option)? optionToggled,
    TResult Function(String filterCode)? categoryChanged,
    TResult Function()? cleared,
    TResult Function()? applied,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilterLoadRequested value) loadRequested,
    required TResult Function(_FilterOptionToggled value) optionToggled,
    required TResult Function(_FilterCategoryChanged value) categoryChanged,
    required TResult Function(_FiltersClearedEvent value) cleared,
    required TResult Function(_FiltersAppliedEvent value) applied,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilterLoadRequested value)? loadRequested,
    TResult? Function(_FilterOptionToggled value)? optionToggled,
    TResult? Function(_FilterCategoryChanged value)? categoryChanged,
    TResult? Function(_FiltersClearedEvent value)? cleared,
    TResult? Function(_FiltersAppliedEvent value)? applied,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilterLoadRequested value)? loadRequested,
    TResult Function(_FilterOptionToggled value)? optionToggled,
    TResult Function(_FilterCategoryChanged value)? categoryChanged,
    TResult Function(_FiltersClearedEvent value)? cleared,
    TResult Function(_FiltersAppliedEvent value)? applied,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterEventCopyWith<$Res> {
  factory $FilterEventCopyWith(
    FilterEvent value,
    $Res Function(FilterEvent) then,
  ) = _$FilterEventCopyWithImpl<$Res, FilterEvent>;
}

/// @nodoc
class _$FilterEventCopyWithImpl<$Res, $Val extends FilterEvent>
    implements $FilterEventCopyWith<$Res> {
  _$FilterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FilterLoadRequestedImplCopyWith<$Res> {
  factory _$$FilterLoadRequestedImplCopyWith(
    _$FilterLoadRequestedImpl value,
    $Res Function(_$FilterLoadRequestedImpl) then,
  ) = __$$FilterLoadRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FilterCategory> categories});
}

/// @nodoc
class __$$FilterLoadRequestedImplCopyWithImpl<$Res>
    extends _$FilterEventCopyWithImpl<$Res, _$FilterLoadRequestedImpl>
    implements _$$FilterLoadRequestedImplCopyWith<$Res> {
  __$$FilterLoadRequestedImplCopyWithImpl(
    _$FilterLoadRequestedImpl _value,
    $Res Function(_$FilterLoadRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categories = null}) {
    return _then(
      _$FilterLoadRequestedImpl(
        categories:
            null == categories
                ? _value._categories
                : categories // ignore: cast_nullable_to_non_nullable
                    as List<FilterCategory>,
      ),
    );
  }
}

/// @nodoc

class _$FilterLoadRequestedImpl implements _FilterLoadRequested {
  const _$FilterLoadRequestedImpl({
    required final List<FilterCategory> categories,
  }) : _categories = categories;

  final List<FilterCategory> _categories;
  @override
  List<FilterCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'FilterEvent.loadRequested(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterLoadRequestedImpl &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_categories),
  );

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterLoadRequestedImplCopyWith<_$FilterLoadRequestedImpl> get copyWith =>
      __$$FilterLoadRequestedImplCopyWithImpl<_$FilterLoadRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<FilterCategory> categories) loadRequested,
    required TResult Function(String filterCode, FilterOption option)
    optionToggled,
    required TResult Function(String filterCode) categoryChanged,
    required TResult Function() cleared,
    required TResult Function() applied,
  }) {
    return loadRequested(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<FilterCategory> categories)? loadRequested,
    TResult? Function(String filterCode, FilterOption option)? optionToggled,
    TResult? Function(String filterCode)? categoryChanged,
    TResult? Function()? cleared,
    TResult? Function()? applied,
  }) {
    return loadRequested?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<FilterCategory> categories)? loadRequested,
    TResult Function(String filterCode, FilterOption option)? optionToggled,
    TResult Function(String filterCode)? categoryChanged,
    TResult Function()? cleared,
    TResult Function()? applied,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilterLoadRequested value) loadRequested,
    required TResult Function(_FilterOptionToggled value) optionToggled,
    required TResult Function(_FilterCategoryChanged value) categoryChanged,
    required TResult Function(_FiltersClearedEvent value) cleared,
    required TResult Function(_FiltersAppliedEvent value) applied,
  }) {
    return loadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilterLoadRequested value)? loadRequested,
    TResult? Function(_FilterOptionToggled value)? optionToggled,
    TResult? Function(_FilterCategoryChanged value)? categoryChanged,
    TResult? Function(_FiltersClearedEvent value)? cleared,
    TResult? Function(_FiltersAppliedEvent value)? applied,
  }) {
    return loadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilterLoadRequested value)? loadRequested,
    TResult Function(_FilterOptionToggled value)? optionToggled,
    TResult Function(_FilterCategoryChanged value)? categoryChanged,
    TResult Function(_FiltersClearedEvent value)? cleared,
    TResult Function(_FiltersAppliedEvent value)? applied,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(this);
    }
    return orElse();
  }
}

abstract class _FilterLoadRequested implements FilterEvent {
  const factory _FilterLoadRequested({
    required final List<FilterCategory> categories,
  }) = _$FilterLoadRequestedImpl;

  List<FilterCategory> get categories;

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterLoadRequestedImplCopyWith<_$FilterLoadRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterOptionToggledImplCopyWith<$Res> {
  factory _$$FilterOptionToggledImplCopyWith(
    _$FilterOptionToggledImpl value,
    $Res Function(_$FilterOptionToggledImpl) then,
  ) = __$$FilterOptionToggledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String filterCode, FilterOption option});

  $FilterOptionCopyWith<$Res> get option;
}

/// @nodoc
class __$$FilterOptionToggledImplCopyWithImpl<$Res>
    extends _$FilterEventCopyWithImpl<$Res, _$FilterOptionToggledImpl>
    implements _$$FilterOptionToggledImplCopyWith<$Res> {
  __$$FilterOptionToggledImplCopyWithImpl(
    _$FilterOptionToggledImpl _value,
    $Res Function(_$FilterOptionToggledImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? filterCode = null, Object? option = null}) {
    return _then(
      _$FilterOptionToggledImpl(
        filterCode:
            null == filterCode
                ? _value.filterCode
                : filterCode // ignore: cast_nullable_to_non_nullable
                    as String,
        option:
            null == option
                ? _value.option
                : option // ignore: cast_nullable_to_non_nullable
                    as FilterOption,
      ),
    );
  }

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FilterOptionCopyWith<$Res> get option {
    return $FilterOptionCopyWith<$Res>(_value.option, (value) {
      return _then(_value.copyWith(option: value));
    });
  }
}

/// @nodoc

class _$FilterOptionToggledImpl implements _FilterOptionToggled {
  const _$FilterOptionToggledImpl({
    required this.filterCode,
    required this.option,
  });

  @override
  final String filterCode;
  @override
  final FilterOption option;

  @override
  String toString() {
    return 'FilterEvent.optionToggled(filterCode: $filterCode, option: $option)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterOptionToggledImpl &&
            (identical(other.filterCode, filterCode) ||
                other.filterCode == filterCode) &&
            (identical(other.option, option) || other.option == option));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filterCode, option);

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterOptionToggledImplCopyWith<_$FilterOptionToggledImpl> get copyWith =>
      __$$FilterOptionToggledImplCopyWithImpl<_$FilterOptionToggledImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<FilterCategory> categories) loadRequested,
    required TResult Function(String filterCode, FilterOption option)
    optionToggled,
    required TResult Function(String filterCode) categoryChanged,
    required TResult Function() cleared,
    required TResult Function() applied,
  }) {
    return optionToggled(filterCode, option);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<FilterCategory> categories)? loadRequested,
    TResult? Function(String filterCode, FilterOption option)? optionToggled,
    TResult? Function(String filterCode)? categoryChanged,
    TResult? Function()? cleared,
    TResult? Function()? applied,
  }) {
    return optionToggled?.call(filterCode, option);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<FilterCategory> categories)? loadRequested,
    TResult Function(String filterCode, FilterOption option)? optionToggled,
    TResult Function(String filterCode)? categoryChanged,
    TResult Function()? cleared,
    TResult Function()? applied,
    required TResult orElse(),
  }) {
    if (optionToggled != null) {
      return optionToggled(filterCode, option);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilterLoadRequested value) loadRequested,
    required TResult Function(_FilterOptionToggled value) optionToggled,
    required TResult Function(_FilterCategoryChanged value) categoryChanged,
    required TResult Function(_FiltersClearedEvent value) cleared,
    required TResult Function(_FiltersAppliedEvent value) applied,
  }) {
    return optionToggled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilterLoadRequested value)? loadRequested,
    TResult? Function(_FilterOptionToggled value)? optionToggled,
    TResult? Function(_FilterCategoryChanged value)? categoryChanged,
    TResult? Function(_FiltersClearedEvent value)? cleared,
    TResult? Function(_FiltersAppliedEvent value)? applied,
  }) {
    return optionToggled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilterLoadRequested value)? loadRequested,
    TResult Function(_FilterOptionToggled value)? optionToggled,
    TResult Function(_FilterCategoryChanged value)? categoryChanged,
    TResult Function(_FiltersClearedEvent value)? cleared,
    TResult Function(_FiltersAppliedEvent value)? applied,
    required TResult orElse(),
  }) {
    if (optionToggled != null) {
      return optionToggled(this);
    }
    return orElse();
  }
}

abstract class _FilterOptionToggled implements FilterEvent {
  const factory _FilterOptionToggled({
    required final String filterCode,
    required final FilterOption option,
  }) = _$FilterOptionToggledImpl;

  String get filterCode;
  FilterOption get option;

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterOptionToggledImplCopyWith<_$FilterOptionToggledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterCategoryChangedImplCopyWith<$Res> {
  factory _$$FilterCategoryChangedImplCopyWith(
    _$FilterCategoryChangedImpl value,
    $Res Function(_$FilterCategoryChangedImpl) then,
  ) = __$$FilterCategoryChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String filterCode});
}

/// @nodoc
class __$$FilterCategoryChangedImplCopyWithImpl<$Res>
    extends _$FilterEventCopyWithImpl<$Res, _$FilterCategoryChangedImpl>
    implements _$$FilterCategoryChangedImplCopyWith<$Res> {
  __$$FilterCategoryChangedImplCopyWithImpl(
    _$FilterCategoryChangedImpl _value,
    $Res Function(_$FilterCategoryChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? filterCode = null}) {
    return _then(
      _$FilterCategoryChangedImpl(
        filterCode:
            null == filterCode
                ? _value.filterCode
                : filterCode // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$FilterCategoryChangedImpl implements _FilterCategoryChanged {
  const _$FilterCategoryChangedImpl({required this.filterCode});

  @override
  final String filterCode;

  @override
  String toString() {
    return 'FilterEvent.categoryChanged(filterCode: $filterCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterCategoryChangedImpl &&
            (identical(other.filterCode, filterCode) ||
                other.filterCode == filterCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filterCode);

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterCategoryChangedImplCopyWith<_$FilterCategoryChangedImpl>
  get copyWith =>
      __$$FilterCategoryChangedImplCopyWithImpl<_$FilterCategoryChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<FilterCategory> categories) loadRequested,
    required TResult Function(String filterCode, FilterOption option)
    optionToggled,
    required TResult Function(String filterCode) categoryChanged,
    required TResult Function() cleared,
    required TResult Function() applied,
  }) {
    return categoryChanged(filterCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<FilterCategory> categories)? loadRequested,
    TResult? Function(String filterCode, FilterOption option)? optionToggled,
    TResult? Function(String filterCode)? categoryChanged,
    TResult? Function()? cleared,
    TResult? Function()? applied,
  }) {
    return categoryChanged?.call(filterCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<FilterCategory> categories)? loadRequested,
    TResult Function(String filterCode, FilterOption option)? optionToggled,
    TResult Function(String filterCode)? categoryChanged,
    TResult Function()? cleared,
    TResult Function()? applied,
    required TResult orElse(),
  }) {
    if (categoryChanged != null) {
      return categoryChanged(filterCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilterLoadRequested value) loadRequested,
    required TResult Function(_FilterOptionToggled value) optionToggled,
    required TResult Function(_FilterCategoryChanged value) categoryChanged,
    required TResult Function(_FiltersClearedEvent value) cleared,
    required TResult Function(_FiltersAppliedEvent value) applied,
  }) {
    return categoryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilterLoadRequested value)? loadRequested,
    TResult? Function(_FilterOptionToggled value)? optionToggled,
    TResult? Function(_FilterCategoryChanged value)? categoryChanged,
    TResult? Function(_FiltersClearedEvent value)? cleared,
    TResult? Function(_FiltersAppliedEvent value)? applied,
  }) {
    return categoryChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilterLoadRequested value)? loadRequested,
    TResult Function(_FilterOptionToggled value)? optionToggled,
    TResult Function(_FilterCategoryChanged value)? categoryChanged,
    TResult Function(_FiltersClearedEvent value)? cleared,
    TResult Function(_FiltersAppliedEvent value)? applied,
    required TResult orElse(),
  }) {
    if (categoryChanged != null) {
      return categoryChanged(this);
    }
    return orElse();
  }
}

abstract class _FilterCategoryChanged implements FilterEvent {
  const factory _FilterCategoryChanged({required final String filterCode}) =
      _$FilterCategoryChangedImpl;

  String get filterCode;

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterCategoryChangedImplCopyWith<_$FilterCategoryChangedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FiltersClearedEventImplCopyWith<$Res> {
  factory _$$FiltersClearedEventImplCopyWith(
    _$FiltersClearedEventImpl value,
    $Res Function(_$FiltersClearedEventImpl) then,
  ) = __$$FiltersClearedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FiltersClearedEventImplCopyWithImpl<$Res>
    extends _$FilterEventCopyWithImpl<$Res, _$FiltersClearedEventImpl>
    implements _$$FiltersClearedEventImplCopyWith<$Res> {
  __$$FiltersClearedEventImplCopyWithImpl(
    _$FiltersClearedEventImpl _value,
    $Res Function(_$FiltersClearedEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FiltersClearedEventImpl implements _FiltersClearedEvent {
  const _$FiltersClearedEventImpl();

  @override
  String toString() {
    return 'FilterEvent.cleared()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FiltersClearedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<FilterCategory> categories) loadRequested,
    required TResult Function(String filterCode, FilterOption option)
    optionToggled,
    required TResult Function(String filterCode) categoryChanged,
    required TResult Function() cleared,
    required TResult Function() applied,
  }) {
    return cleared();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<FilterCategory> categories)? loadRequested,
    TResult? Function(String filterCode, FilterOption option)? optionToggled,
    TResult? Function(String filterCode)? categoryChanged,
    TResult? Function()? cleared,
    TResult? Function()? applied,
  }) {
    return cleared?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<FilterCategory> categories)? loadRequested,
    TResult Function(String filterCode, FilterOption option)? optionToggled,
    TResult Function(String filterCode)? categoryChanged,
    TResult Function()? cleared,
    TResult Function()? applied,
    required TResult orElse(),
  }) {
    if (cleared != null) {
      return cleared();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilterLoadRequested value) loadRequested,
    required TResult Function(_FilterOptionToggled value) optionToggled,
    required TResult Function(_FilterCategoryChanged value) categoryChanged,
    required TResult Function(_FiltersClearedEvent value) cleared,
    required TResult Function(_FiltersAppliedEvent value) applied,
  }) {
    return cleared(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilterLoadRequested value)? loadRequested,
    TResult? Function(_FilterOptionToggled value)? optionToggled,
    TResult? Function(_FilterCategoryChanged value)? categoryChanged,
    TResult? Function(_FiltersClearedEvent value)? cleared,
    TResult? Function(_FiltersAppliedEvent value)? applied,
  }) {
    return cleared?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilterLoadRequested value)? loadRequested,
    TResult Function(_FilterOptionToggled value)? optionToggled,
    TResult Function(_FilterCategoryChanged value)? categoryChanged,
    TResult Function(_FiltersClearedEvent value)? cleared,
    TResult Function(_FiltersAppliedEvent value)? applied,
    required TResult orElse(),
  }) {
    if (cleared != null) {
      return cleared(this);
    }
    return orElse();
  }
}

abstract class _FiltersClearedEvent implements FilterEvent {
  const factory _FiltersClearedEvent() = _$FiltersClearedEventImpl;
}

/// @nodoc
abstract class _$$FiltersAppliedEventImplCopyWith<$Res> {
  factory _$$FiltersAppliedEventImplCopyWith(
    _$FiltersAppliedEventImpl value,
    $Res Function(_$FiltersAppliedEventImpl) then,
  ) = __$$FiltersAppliedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FiltersAppliedEventImplCopyWithImpl<$Res>
    extends _$FilterEventCopyWithImpl<$Res, _$FiltersAppliedEventImpl>
    implements _$$FiltersAppliedEventImplCopyWith<$Res> {
  __$$FiltersAppliedEventImplCopyWithImpl(
    _$FiltersAppliedEventImpl _value,
    $Res Function(_$FiltersAppliedEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FiltersAppliedEventImpl implements _FiltersAppliedEvent {
  const _$FiltersAppliedEventImpl();

  @override
  String toString() {
    return 'FilterEvent.applied()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FiltersAppliedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<FilterCategory> categories) loadRequested,
    required TResult Function(String filterCode, FilterOption option)
    optionToggled,
    required TResult Function(String filterCode) categoryChanged,
    required TResult Function() cleared,
    required TResult Function() applied,
  }) {
    return applied();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<FilterCategory> categories)? loadRequested,
    TResult? Function(String filterCode, FilterOption option)? optionToggled,
    TResult? Function(String filterCode)? categoryChanged,
    TResult? Function()? cleared,
    TResult? Function()? applied,
  }) {
    return applied?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<FilterCategory> categories)? loadRequested,
    TResult Function(String filterCode, FilterOption option)? optionToggled,
    TResult Function(String filterCode)? categoryChanged,
    TResult Function()? cleared,
    TResult Function()? applied,
    required TResult orElse(),
  }) {
    if (applied != null) {
      return applied();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilterLoadRequested value) loadRequested,
    required TResult Function(_FilterOptionToggled value) optionToggled,
    required TResult Function(_FilterCategoryChanged value) categoryChanged,
    required TResult Function(_FiltersClearedEvent value) cleared,
    required TResult Function(_FiltersAppliedEvent value) applied,
  }) {
    return applied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilterLoadRequested value)? loadRequested,
    TResult? Function(_FilterOptionToggled value)? optionToggled,
    TResult? Function(_FilterCategoryChanged value)? categoryChanged,
    TResult? Function(_FiltersClearedEvent value)? cleared,
    TResult? Function(_FiltersAppliedEvent value)? applied,
  }) {
    return applied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilterLoadRequested value)? loadRequested,
    TResult Function(_FilterOptionToggled value)? optionToggled,
    TResult Function(_FilterCategoryChanged value)? categoryChanged,
    TResult Function(_FiltersClearedEvent value)? cleared,
    TResult Function(_FiltersAppliedEvent value)? applied,
    required TResult orElse(),
  }) {
    if (applied != null) {
      return applied(this);
    }
    return orElse();
  }
}

abstract class _FiltersAppliedEvent implements FilterEvent {
  const factory _FiltersAppliedEvent() = _$FiltersAppliedEventImpl;
}

/// @nodoc
mixin _$FilterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      List<FilterCategory> categories,
      String selectedCategoryCode,
      Map<String, int> selectionCounts,
    )
    loaded,
    required TResult Function() applying,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      List<FilterCategory> categories,
      String selectedCategoryCode,
      Map<String, int> selectionCounts,
    )?
    loaded,
    TResult? Function()? applying,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      List<FilterCategory> categories,
      String selectedCategoryCode,
      Map<String, int> selectionCounts,
    )?
    loaded,
    TResult Function()? applying,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilterInitial value) initial,
    required TResult Function(_FilterLoaded value) loaded,
    required TResult Function(_FilterApplying value) applying,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilterInitial value)? initial,
    TResult? Function(_FilterLoaded value)? loaded,
    TResult? Function(_FilterApplying value)? applying,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilterInitial value)? initial,
    TResult Function(_FilterLoaded value)? loaded,
    TResult Function(_FilterApplying value)? applying,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterStateCopyWith<$Res> {
  factory $FilterStateCopyWith(
    FilterState value,
    $Res Function(FilterState) then,
  ) = _$FilterStateCopyWithImpl<$Res, FilterState>;
}

/// @nodoc
class _$FilterStateCopyWithImpl<$Res, $Val extends FilterState>
    implements $FilterStateCopyWith<$Res> {
  _$FilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FilterInitialImplCopyWith<$Res> {
  factory _$$FilterInitialImplCopyWith(
    _$FilterInitialImpl value,
    $Res Function(_$FilterInitialImpl) then,
  ) = __$$FilterInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FilterInitialImplCopyWithImpl<$Res>
    extends _$FilterStateCopyWithImpl<$Res, _$FilterInitialImpl>
    implements _$$FilterInitialImplCopyWith<$Res> {
  __$$FilterInitialImplCopyWithImpl(
    _$FilterInitialImpl _value,
    $Res Function(_$FilterInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FilterInitialImpl extends _FilterInitial {
  const _$FilterInitialImpl() : super._();

  @override
  String toString() {
    return 'FilterState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FilterInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      List<FilterCategory> categories,
      String selectedCategoryCode,
      Map<String, int> selectionCounts,
    )
    loaded,
    required TResult Function() applying,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      List<FilterCategory> categories,
      String selectedCategoryCode,
      Map<String, int> selectionCounts,
    )?
    loaded,
    TResult? Function()? applying,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      List<FilterCategory> categories,
      String selectedCategoryCode,
      Map<String, int> selectionCounts,
    )?
    loaded,
    TResult Function()? applying,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilterInitial value) initial,
    required TResult Function(_FilterLoaded value) loaded,
    required TResult Function(_FilterApplying value) applying,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilterInitial value)? initial,
    TResult? Function(_FilterLoaded value)? loaded,
    TResult? Function(_FilterApplying value)? applying,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilterInitial value)? initial,
    TResult Function(_FilterLoaded value)? loaded,
    TResult Function(_FilterApplying value)? applying,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _FilterInitial extends FilterState {
  const factory _FilterInitial() = _$FilterInitialImpl;
  const _FilterInitial._() : super._();
}

/// @nodoc
abstract class _$$FilterLoadedImplCopyWith<$Res> {
  factory _$$FilterLoadedImplCopyWith(
    _$FilterLoadedImpl value,
    $Res Function(_$FilterLoadedImpl) then,
  ) = __$$FilterLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    List<FilterCategory> categories,
    String selectedCategoryCode,
    Map<String, int> selectionCounts,
  });
}

/// @nodoc
class __$$FilterLoadedImplCopyWithImpl<$Res>
    extends _$FilterStateCopyWithImpl<$Res, _$FilterLoadedImpl>
    implements _$$FilterLoadedImplCopyWith<$Res> {
  __$$FilterLoadedImplCopyWithImpl(
    _$FilterLoadedImpl _value,
    $Res Function(_$FilterLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? selectedCategoryCode = null,
    Object? selectionCounts = null,
  }) {
    return _then(
      _$FilterLoadedImpl(
        categories:
            null == categories
                ? _value._categories
                : categories // ignore: cast_nullable_to_non_nullable
                    as List<FilterCategory>,
        selectedCategoryCode:
            null == selectedCategoryCode
                ? _value.selectedCategoryCode
                : selectedCategoryCode // ignore: cast_nullable_to_non_nullable
                    as String,
        selectionCounts:
            null == selectionCounts
                ? _value._selectionCounts
                : selectionCounts // ignore: cast_nullable_to_non_nullable
                    as Map<String, int>,
      ),
    );
  }
}

/// @nodoc

class _$FilterLoadedImpl extends _FilterLoaded {
  const _$FilterLoadedImpl({
    required final List<FilterCategory> categories,
    required this.selectedCategoryCode,
    final Map<String, int> selectionCounts = const {},
  }) : _categories = categories,
       _selectionCounts = selectionCounts,
       super._();

  final List<FilterCategory> _categories;
  @override
  List<FilterCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String selectedCategoryCode;
  final Map<String, int> _selectionCounts;
  @override
  @JsonKey()
  Map<String, int> get selectionCounts {
    if (_selectionCounts is EqualUnmodifiableMapView) return _selectionCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectionCounts);
  }

  @override
  String toString() {
    return 'FilterState.loaded(categories: $categories, selectedCategoryCode: $selectedCategoryCode, selectionCounts: $selectionCounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterLoadedImpl &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.selectedCategoryCode, selectedCategoryCode) ||
                other.selectedCategoryCode == selectedCategoryCode) &&
            const DeepCollectionEquality().equals(
              other._selectionCounts,
              _selectionCounts,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_categories),
    selectedCategoryCode,
    const DeepCollectionEquality().hash(_selectionCounts),
  );

  /// Create a copy of FilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterLoadedImplCopyWith<_$FilterLoadedImpl> get copyWith =>
      __$$FilterLoadedImplCopyWithImpl<_$FilterLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      List<FilterCategory> categories,
      String selectedCategoryCode,
      Map<String, int> selectionCounts,
    )
    loaded,
    required TResult Function() applying,
  }) {
    return loaded(categories, selectedCategoryCode, selectionCounts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      List<FilterCategory> categories,
      String selectedCategoryCode,
      Map<String, int> selectionCounts,
    )?
    loaded,
    TResult? Function()? applying,
  }) {
    return loaded?.call(categories, selectedCategoryCode, selectionCounts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      List<FilterCategory> categories,
      String selectedCategoryCode,
      Map<String, int> selectionCounts,
    )?
    loaded,
    TResult Function()? applying,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(categories, selectedCategoryCode, selectionCounts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilterInitial value) initial,
    required TResult Function(_FilterLoaded value) loaded,
    required TResult Function(_FilterApplying value) applying,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilterInitial value)? initial,
    TResult? Function(_FilterLoaded value)? loaded,
    TResult? Function(_FilterApplying value)? applying,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilterInitial value)? initial,
    TResult Function(_FilterLoaded value)? loaded,
    TResult Function(_FilterApplying value)? applying,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _FilterLoaded extends FilterState {
  const factory _FilterLoaded({
    required final List<FilterCategory> categories,
    required final String selectedCategoryCode,
    final Map<String, int> selectionCounts,
  }) = _$FilterLoadedImpl;
  const _FilterLoaded._() : super._();

  List<FilterCategory> get categories;
  String get selectedCategoryCode;
  Map<String, int> get selectionCounts;

  /// Create a copy of FilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterLoadedImplCopyWith<_$FilterLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterApplyingImplCopyWith<$Res> {
  factory _$$FilterApplyingImplCopyWith(
    _$FilterApplyingImpl value,
    $Res Function(_$FilterApplyingImpl) then,
  ) = __$$FilterApplyingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FilterApplyingImplCopyWithImpl<$Res>
    extends _$FilterStateCopyWithImpl<$Res, _$FilterApplyingImpl>
    implements _$$FilterApplyingImplCopyWith<$Res> {
  __$$FilterApplyingImplCopyWithImpl(
    _$FilterApplyingImpl _value,
    $Res Function(_$FilterApplyingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FilterApplyingImpl extends _FilterApplying {
  const _$FilterApplyingImpl() : super._();

  @override
  String toString() {
    return 'FilterState.applying()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FilterApplyingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      List<FilterCategory> categories,
      String selectedCategoryCode,
      Map<String, int> selectionCounts,
    )
    loaded,
    required TResult Function() applying,
  }) {
    return applying();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      List<FilterCategory> categories,
      String selectedCategoryCode,
      Map<String, int> selectionCounts,
    )?
    loaded,
    TResult? Function()? applying,
  }) {
    return applying?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      List<FilterCategory> categories,
      String selectedCategoryCode,
      Map<String, int> selectionCounts,
    )?
    loaded,
    TResult Function()? applying,
    required TResult orElse(),
  }) {
    if (applying != null) {
      return applying();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilterInitial value) initial,
    required TResult Function(_FilterLoaded value) loaded,
    required TResult Function(_FilterApplying value) applying,
  }) {
    return applying(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilterInitial value)? initial,
    TResult? Function(_FilterLoaded value)? loaded,
    TResult? Function(_FilterApplying value)? applying,
  }) {
    return applying?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilterInitial value)? initial,
    TResult Function(_FilterLoaded value)? loaded,
    TResult Function(_FilterApplying value)? applying,
    required TResult orElse(),
  }) {
    if (applying != null) {
      return applying(this);
    }
    return orElse();
  }
}

abstract class _FilterApplying extends FilterState {
  const factory _FilterApplying() = _$FilterApplyingImpl;
  const _FilterApplying._() : super._();
}
