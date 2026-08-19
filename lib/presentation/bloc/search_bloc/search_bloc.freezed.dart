// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String? categoryId) searchSubmitted,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function() searchLoadMore,
    required TResult Function(Map<String, String> filters) searchFilterApplied,
    required TResult Function(String sortBy, String sortOrder)
    searchSortApplied,
    required TResult Function() searchCleared,
    required TResult Function() searchRefresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String? categoryId)? searchSubmitted,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function()? searchLoadMore,
    TResult? Function(Map<String, String> filters)? searchFilterApplied,
    TResult? Function(String sortBy, String sortOrder)? searchSortApplied,
    TResult? Function()? searchCleared,
    TResult? Function()? searchRefresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String? categoryId)? searchSubmitted,
    TResult Function(String query)? searchQueryChanged,
    TResult Function()? searchLoadMore,
    TResult Function(Map<String, String> filters)? searchFilterApplied,
    TResult Function(String sortBy, String sortOrder)? searchSortApplied,
    TResult Function()? searchCleared,
    TResult Function()? searchRefresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchSubmitted value) searchSubmitted,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SearchLoadMore value) searchLoadMore,
    required TResult Function(_SearchFilterApplied value) searchFilterApplied,
    required TResult Function(_SearchSortApplied value) searchSortApplied,
    required TResult Function(_SearchCleared value) searchCleared,
    required TResult Function(_SearchRefresh value) searchRefresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSubmitted value)? searchSubmitted,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SearchLoadMore value)? searchLoadMore,
    TResult? Function(_SearchFilterApplied value)? searchFilterApplied,
    TResult? Function(_SearchSortApplied value)? searchSortApplied,
    TResult? Function(_SearchCleared value)? searchCleared,
    TResult? Function(_SearchRefresh value)? searchRefresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchSubmitted value)? searchSubmitted,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SearchLoadMore value)? searchLoadMore,
    TResult Function(_SearchFilterApplied value)? searchFilterApplied,
    TResult Function(_SearchSortApplied value)? searchSortApplied,
    TResult Function(_SearchCleared value)? searchCleared,
    TResult Function(_SearchRefresh value)? searchRefresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
    SearchEvent value,
    $Res Function(SearchEvent) then,
  ) = _$SearchEventCopyWithImpl<$Res, SearchEvent>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SearchSubmittedImplCopyWith<$Res> {
  factory _$$SearchSubmittedImplCopyWith(
    _$SearchSubmittedImpl value,
    $Res Function(_$SearchSubmittedImpl) then,
  ) = __$$SearchSubmittedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query, String? categoryId});
}

/// @nodoc
class __$$SearchSubmittedImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchSubmittedImpl>
    implements _$$SearchSubmittedImplCopyWith<$Res> {
  __$$SearchSubmittedImplCopyWithImpl(
    _$SearchSubmittedImpl _value,
    $Res Function(_$SearchSubmittedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? query = null, Object? categoryId = freezed}) {
    return _then(
      _$SearchSubmittedImpl(
        query:
            null == query
                ? _value.query
                : query // ignore: cast_nullable_to_non_nullable
                    as String,
        categoryId:
            freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$SearchSubmittedImpl
    with DiagnosticableTreeMixin
    implements _SearchSubmitted {
  const _$SearchSubmittedImpl({required this.query, this.categoryId});

  @override
  final String query;
  @override
  final String? categoryId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchEvent.searchSubmitted(query: $query, categoryId: $categoryId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchEvent.searchSubmitted'))
      ..add(DiagnosticsProperty('query', query))
      ..add(DiagnosticsProperty('categoryId', categoryId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSubmittedImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, categoryId);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSubmittedImplCopyWith<_$SearchSubmittedImpl> get copyWith =>
      __$$SearchSubmittedImplCopyWithImpl<_$SearchSubmittedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String? categoryId) searchSubmitted,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function() searchLoadMore,
    required TResult Function(Map<String, String> filters) searchFilterApplied,
    required TResult Function(String sortBy, String sortOrder)
    searchSortApplied,
    required TResult Function() searchCleared,
    required TResult Function() searchRefresh,
  }) {
    return searchSubmitted(query, categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String? categoryId)? searchSubmitted,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function()? searchLoadMore,
    TResult? Function(Map<String, String> filters)? searchFilterApplied,
    TResult? Function(String sortBy, String sortOrder)? searchSortApplied,
    TResult? Function()? searchCleared,
    TResult? Function()? searchRefresh,
  }) {
    return searchSubmitted?.call(query, categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String? categoryId)? searchSubmitted,
    TResult Function(String query)? searchQueryChanged,
    TResult Function()? searchLoadMore,
    TResult Function(Map<String, String> filters)? searchFilterApplied,
    TResult Function(String sortBy, String sortOrder)? searchSortApplied,
    TResult Function()? searchCleared,
    TResult Function()? searchRefresh,
    required TResult orElse(),
  }) {
    if (searchSubmitted != null) {
      return searchSubmitted(query, categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchSubmitted value) searchSubmitted,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SearchLoadMore value) searchLoadMore,
    required TResult Function(_SearchFilterApplied value) searchFilterApplied,
    required TResult Function(_SearchSortApplied value) searchSortApplied,
    required TResult Function(_SearchCleared value) searchCleared,
    required TResult Function(_SearchRefresh value) searchRefresh,
  }) {
    return searchSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSubmitted value)? searchSubmitted,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SearchLoadMore value)? searchLoadMore,
    TResult? Function(_SearchFilterApplied value)? searchFilterApplied,
    TResult? Function(_SearchSortApplied value)? searchSortApplied,
    TResult? Function(_SearchCleared value)? searchCleared,
    TResult? Function(_SearchRefresh value)? searchRefresh,
  }) {
    return searchSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchSubmitted value)? searchSubmitted,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SearchLoadMore value)? searchLoadMore,
    TResult Function(_SearchFilterApplied value)? searchFilterApplied,
    TResult Function(_SearchSortApplied value)? searchSortApplied,
    TResult Function(_SearchCleared value)? searchCleared,
    TResult Function(_SearchRefresh value)? searchRefresh,
    required TResult orElse(),
  }) {
    if (searchSubmitted != null) {
      return searchSubmitted(this);
    }
    return orElse();
  }
}

abstract class _SearchSubmitted implements SearchEvent {
  const factory _SearchSubmitted({
    required final String query,
    final String? categoryId,
  }) = _$SearchSubmittedImpl;

  String get query;
  String? get categoryId;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchSubmittedImplCopyWith<_$SearchSubmittedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchQueryChangedImplCopyWith<$Res> {
  factory _$$SearchQueryChangedImplCopyWith(
    _$SearchQueryChangedImpl value,
    $Res Function(_$SearchQueryChangedImpl) then,
  ) = __$$SearchQueryChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchQueryChangedImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchQueryChangedImpl>
    implements _$$SearchQueryChangedImplCopyWith<$Res> {
  __$$SearchQueryChangedImplCopyWithImpl(
    _$SearchQueryChangedImpl _value,
    $Res Function(_$SearchQueryChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? query = null}) {
    return _then(
      _$SearchQueryChangedImpl(
        query:
            null == query
                ? _value.query
                : query // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$SearchQueryChangedImpl
    with DiagnosticableTreeMixin
    implements _SearchQueryChanged {
  const _$SearchQueryChangedImpl({required this.query});

  @override
  final String query;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchEvent.searchQueryChanged(query: $query)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchEvent.searchQueryChanged'))
      ..add(DiagnosticsProperty('query', query));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchQueryChangedImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchQueryChangedImplCopyWith<_$SearchQueryChangedImpl> get copyWith =>
      __$$SearchQueryChangedImplCopyWithImpl<_$SearchQueryChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String? categoryId) searchSubmitted,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function() searchLoadMore,
    required TResult Function(Map<String, String> filters) searchFilterApplied,
    required TResult Function(String sortBy, String sortOrder)
    searchSortApplied,
    required TResult Function() searchCleared,
    required TResult Function() searchRefresh,
  }) {
    return searchQueryChanged(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String? categoryId)? searchSubmitted,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function()? searchLoadMore,
    TResult? Function(Map<String, String> filters)? searchFilterApplied,
    TResult? Function(String sortBy, String sortOrder)? searchSortApplied,
    TResult? Function()? searchCleared,
    TResult? Function()? searchRefresh,
  }) {
    return searchQueryChanged?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String? categoryId)? searchSubmitted,
    TResult Function(String query)? searchQueryChanged,
    TResult Function()? searchLoadMore,
    TResult Function(Map<String, String> filters)? searchFilterApplied,
    TResult Function(String sortBy, String sortOrder)? searchSortApplied,
    TResult Function()? searchCleared,
    TResult Function()? searchRefresh,
    required TResult orElse(),
  }) {
    if (searchQueryChanged != null) {
      return searchQueryChanged(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchSubmitted value) searchSubmitted,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SearchLoadMore value) searchLoadMore,
    required TResult Function(_SearchFilterApplied value) searchFilterApplied,
    required TResult Function(_SearchSortApplied value) searchSortApplied,
    required TResult Function(_SearchCleared value) searchCleared,
    required TResult Function(_SearchRefresh value) searchRefresh,
  }) {
    return searchQueryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSubmitted value)? searchSubmitted,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SearchLoadMore value)? searchLoadMore,
    TResult? Function(_SearchFilterApplied value)? searchFilterApplied,
    TResult? Function(_SearchSortApplied value)? searchSortApplied,
    TResult? Function(_SearchCleared value)? searchCleared,
    TResult? Function(_SearchRefresh value)? searchRefresh,
  }) {
    return searchQueryChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchSubmitted value)? searchSubmitted,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SearchLoadMore value)? searchLoadMore,
    TResult Function(_SearchFilterApplied value)? searchFilterApplied,
    TResult Function(_SearchSortApplied value)? searchSortApplied,
    TResult Function(_SearchCleared value)? searchCleared,
    TResult Function(_SearchRefresh value)? searchRefresh,
    required TResult orElse(),
  }) {
    if (searchQueryChanged != null) {
      return searchQueryChanged(this);
    }
    return orElse();
  }
}

abstract class _SearchQueryChanged implements SearchEvent {
  const factory _SearchQueryChanged({required final String query}) =
      _$SearchQueryChangedImpl;

  String get query;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchQueryChangedImplCopyWith<_$SearchQueryChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchLoadMoreImplCopyWith<$Res> {
  factory _$$SearchLoadMoreImplCopyWith(
    _$SearchLoadMoreImpl value,
    $Res Function(_$SearchLoadMoreImpl) then,
  ) = __$$SearchLoadMoreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchLoadMoreImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchLoadMoreImpl>
    implements _$$SearchLoadMoreImplCopyWith<$Res> {
  __$$SearchLoadMoreImplCopyWithImpl(
    _$SearchLoadMoreImpl _value,
    $Res Function(_$SearchLoadMoreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SearchLoadMoreImpl
    with DiagnosticableTreeMixin
    implements _SearchLoadMore {
  const _$SearchLoadMoreImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchEvent.searchLoadMore()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SearchEvent.searchLoadMore'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchLoadMoreImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String? categoryId) searchSubmitted,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function() searchLoadMore,
    required TResult Function(Map<String, String> filters) searchFilterApplied,
    required TResult Function(String sortBy, String sortOrder)
    searchSortApplied,
    required TResult Function() searchCleared,
    required TResult Function() searchRefresh,
  }) {
    return searchLoadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String? categoryId)? searchSubmitted,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function()? searchLoadMore,
    TResult? Function(Map<String, String> filters)? searchFilterApplied,
    TResult? Function(String sortBy, String sortOrder)? searchSortApplied,
    TResult? Function()? searchCleared,
    TResult? Function()? searchRefresh,
  }) {
    return searchLoadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String? categoryId)? searchSubmitted,
    TResult Function(String query)? searchQueryChanged,
    TResult Function()? searchLoadMore,
    TResult Function(Map<String, String> filters)? searchFilterApplied,
    TResult Function(String sortBy, String sortOrder)? searchSortApplied,
    TResult Function()? searchCleared,
    TResult Function()? searchRefresh,
    required TResult orElse(),
  }) {
    if (searchLoadMore != null) {
      return searchLoadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchSubmitted value) searchSubmitted,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SearchLoadMore value) searchLoadMore,
    required TResult Function(_SearchFilterApplied value) searchFilterApplied,
    required TResult Function(_SearchSortApplied value) searchSortApplied,
    required TResult Function(_SearchCleared value) searchCleared,
    required TResult Function(_SearchRefresh value) searchRefresh,
  }) {
    return searchLoadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSubmitted value)? searchSubmitted,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SearchLoadMore value)? searchLoadMore,
    TResult? Function(_SearchFilterApplied value)? searchFilterApplied,
    TResult? Function(_SearchSortApplied value)? searchSortApplied,
    TResult? Function(_SearchCleared value)? searchCleared,
    TResult? Function(_SearchRefresh value)? searchRefresh,
  }) {
    return searchLoadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchSubmitted value)? searchSubmitted,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SearchLoadMore value)? searchLoadMore,
    TResult Function(_SearchFilterApplied value)? searchFilterApplied,
    TResult Function(_SearchSortApplied value)? searchSortApplied,
    TResult Function(_SearchCleared value)? searchCleared,
    TResult Function(_SearchRefresh value)? searchRefresh,
    required TResult orElse(),
  }) {
    if (searchLoadMore != null) {
      return searchLoadMore(this);
    }
    return orElse();
  }
}

abstract class _SearchLoadMore implements SearchEvent {
  const factory _SearchLoadMore() = _$SearchLoadMoreImpl;
}

/// @nodoc
abstract class _$$SearchFilterAppliedImplCopyWith<$Res> {
  factory _$$SearchFilterAppliedImplCopyWith(
    _$SearchFilterAppliedImpl value,
    $Res Function(_$SearchFilterAppliedImpl) then,
  ) = __$$SearchFilterAppliedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, String> filters});
}

/// @nodoc
class __$$SearchFilterAppliedImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchFilterAppliedImpl>
    implements _$$SearchFilterAppliedImplCopyWith<$Res> {
  __$$SearchFilterAppliedImplCopyWithImpl(
    _$SearchFilterAppliedImpl _value,
    $Res Function(_$SearchFilterAppliedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? filters = null}) {
    return _then(
      _$SearchFilterAppliedImpl(
        filters:
            null == filters
                ? _value._filters
                : filters // ignore: cast_nullable_to_non_nullable
                    as Map<String, String>,
      ),
    );
  }
}

/// @nodoc

class _$SearchFilterAppliedImpl
    with DiagnosticableTreeMixin
    implements _SearchFilterApplied {
  const _$SearchFilterAppliedImpl({required final Map<String, String> filters})
    : _filters = filters;

  final Map<String, String> _filters;
  @override
  Map<String, String> get filters {
    if (_filters is EqualUnmodifiableMapView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_filters);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchEvent.searchFilterApplied(filters: $filters)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchEvent.searchFilterApplied'))
      ..add(DiagnosticsProperty('filters', filters));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchFilterAppliedImpl &&
            const DeepCollectionEquality().equals(other._filters, _filters));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_filters));

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchFilterAppliedImplCopyWith<_$SearchFilterAppliedImpl> get copyWith =>
      __$$SearchFilterAppliedImplCopyWithImpl<_$SearchFilterAppliedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String? categoryId) searchSubmitted,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function() searchLoadMore,
    required TResult Function(Map<String, String> filters) searchFilterApplied,
    required TResult Function(String sortBy, String sortOrder)
    searchSortApplied,
    required TResult Function() searchCleared,
    required TResult Function() searchRefresh,
  }) {
    return searchFilterApplied(filters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String? categoryId)? searchSubmitted,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function()? searchLoadMore,
    TResult? Function(Map<String, String> filters)? searchFilterApplied,
    TResult? Function(String sortBy, String sortOrder)? searchSortApplied,
    TResult? Function()? searchCleared,
    TResult? Function()? searchRefresh,
  }) {
    return searchFilterApplied?.call(filters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String? categoryId)? searchSubmitted,
    TResult Function(String query)? searchQueryChanged,
    TResult Function()? searchLoadMore,
    TResult Function(Map<String, String> filters)? searchFilterApplied,
    TResult Function(String sortBy, String sortOrder)? searchSortApplied,
    TResult Function()? searchCleared,
    TResult Function()? searchRefresh,
    required TResult orElse(),
  }) {
    if (searchFilterApplied != null) {
      return searchFilterApplied(filters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchSubmitted value) searchSubmitted,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SearchLoadMore value) searchLoadMore,
    required TResult Function(_SearchFilterApplied value) searchFilterApplied,
    required TResult Function(_SearchSortApplied value) searchSortApplied,
    required TResult Function(_SearchCleared value) searchCleared,
    required TResult Function(_SearchRefresh value) searchRefresh,
  }) {
    return searchFilterApplied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSubmitted value)? searchSubmitted,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SearchLoadMore value)? searchLoadMore,
    TResult? Function(_SearchFilterApplied value)? searchFilterApplied,
    TResult? Function(_SearchSortApplied value)? searchSortApplied,
    TResult? Function(_SearchCleared value)? searchCleared,
    TResult? Function(_SearchRefresh value)? searchRefresh,
  }) {
    return searchFilterApplied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchSubmitted value)? searchSubmitted,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SearchLoadMore value)? searchLoadMore,
    TResult Function(_SearchFilterApplied value)? searchFilterApplied,
    TResult Function(_SearchSortApplied value)? searchSortApplied,
    TResult Function(_SearchCleared value)? searchCleared,
    TResult Function(_SearchRefresh value)? searchRefresh,
    required TResult orElse(),
  }) {
    if (searchFilterApplied != null) {
      return searchFilterApplied(this);
    }
    return orElse();
  }
}

abstract class _SearchFilterApplied implements SearchEvent {
  const factory _SearchFilterApplied({
    required final Map<String, String> filters,
  }) = _$SearchFilterAppliedImpl;

  Map<String, String> get filters;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchFilterAppliedImplCopyWith<_$SearchFilterAppliedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchSortAppliedImplCopyWith<$Res> {
  factory _$$SearchSortAppliedImplCopyWith(
    _$SearchSortAppliedImpl value,
    $Res Function(_$SearchSortAppliedImpl) then,
  ) = __$$SearchSortAppliedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sortBy, String sortOrder});
}

/// @nodoc
class __$$SearchSortAppliedImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchSortAppliedImpl>
    implements _$$SearchSortAppliedImplCopyWith<$Res> {
  __$$SearchSortAppliedImplCopyWithImpl(
    _$SearchSortAppliedImpl _value,
    $Res Function(_$SearchSortAppliedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sortBy = null, Object? sortOrder = null}) {
    return _then(
      _$SearchSortAppliedImpl(
        sortBy:
            null == sortBy
                ? _value.sortBy
                : sortBy // ignore: cast_nullable_to_non_nullable
                    as String,
        sortOrder:
            null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$SearchSortAppliedImpl
    with DiagnosticableTreeMixin
    implements _SearchSortApplied {
  const _$SearchSortAppliedImpl({
    required this.sortBy,
    required this.sortOrder,
  });

  @override
  final String sortBy;
  @override
  final String sortOrder;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchEvent.searchSortApplied(sortBy: $sortBy, sortOrder: $sortOrder)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchEvent.searchSortApplied'))
      ..add(DiagnosticsProperty('sortBy', sortBy))
      ..add(DiagnosticsProperty('sortOrder', sortOrder));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSortAppliedImpl &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortBy, sortOrder);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSortAppliedImplCopyWith<_$SearchSortAppliedImpl> get copyWith =>
      __$$SearchSortAppliedImplCopyWithImpl<_$SearchSortAppliedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String? categoryId) searchSubmitted,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function() searchLoadMore,
    required TResult Function(Map<String, String> filters) searchFilterApplied,
    required TResult Function(String sortBy, String sortOrder)
    searchSortApplied,
    required TResult Function() searchCleared,
    required TResult Function() searchRefresh,
  }) {
    return searchSortApplied(sortBy, sortOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String? categoryId)? searchSubmitted,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function()? searchLoadMore,
    TResult? Function(Map<String, String> filters)? searchFilterApplied,
    TResult? Function(String sortBy, String sortOrder)? searchSortApplied,
    TResult? Function()? searchCleared,
    TResult? Function()? searchRefresh,
  }) {
    return searchSortApplied?.call(sortBy, sortOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String? categoryId)? searchSubmitted,
    TResult Function(String query)? searchQueryChanged,
    TResult Function()? searchLoadMore,
    TResult Function(Map<String, String> filters)? searchFilterApplied,
    TResult Function(String sortBy, String sortOrder)? searchSortApplied,
    TResult Function()? searchCleared,
    TResult Function()? searchRefresh,
    required TResult orElse(),
  }) {
    if (searchSortApplied != null) {
      return searchSortApplied(sortBy, sortOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchSubmitted value) searchSubmitted,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SearchLoadMore value) searchLoadMore,
    required TResult Function(_SearchFilterApplied value) searchFilterApplied,
    required TResult Function(_SearchSortApplied value) searchSortApplied,
    required TResult Function(_SearchCleared value) searchCleared,
    required TResult Function(_SearchRefresh value) searchRefresh,
  }) {
    return searchSortApplied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSubmitted value)? searchSubmitted,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SearchLoadMore value)? searchLoadMore,
    TResult? Function(_SearchFilterApplied value)? searchFilterApplied,
    TResult? Function(_SearchSortApplied value)? searchSortApplied,
    TResult? Function(_SearchCleared value)? searchCleared,
    TResult? Function(_SearchRefresh value)? searchRefresh,
  }) {
    return searchSortApplied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchSubmitted value)? searchSubmitted,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SearchLoadMore value)? searchLoadMore,
    TResult Function(_SearchFilterApplied value)? searchFilterApplied,
    TResult Function(_SearchSortApplied value)? searchSortApplied,
    TResult Function(_SearchCleared value)? searchCleared,
    TResult Function(_SearchRefresh value)? searchRefresh,
    required TResult orElse(),
  }) {
    if (searchSortApplied != null) {
      return searchSortApplied(this);
    }
    return orElse();
  }
}

abstract class _SearchSortApplied implements SearchEvent {
  const factory _SearchSortApplied({
    required final String sortBy,
    required final String sortOrder,
  }) = _$SearchSortAppliedImpl;

  String get sortBy;
  String get sortOrder;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchSortAppliedImplCopyWith<_$SearchSortAppliedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchClearedImplCopyWith<$Res> {
  factory _$$SearchClearedImplCopyWith(
    _$SearchClearedImpl value,
    $Res Function(_$SearchClearedImpl) then,
  ) = __$$SearchClearedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchClearedImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchClearedImpl>
    implements _$$SearchClearedImplCopyWith<$Res> {
  __$$SearchClearedImplCopyWithImpl(
    _$SearchClearedImpl _value,
    $Res Function(_$SearchClearedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SearchClearedImpl
    with DiagnosticableTreeMixin
    implements _SearchCleared {
  const _$SearchClearedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchEvent.searchCleared()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SearchEvent.searchCleared'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchClearedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String? categoryId) searchSubmitted,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function() searchLoadMore,
    required TResult Function(Map<String, String> filters) searchFilterApplied,
    required TResult Function(String sortBy, String sortOrder)
    searchSortApplied,
    required TResult Function() searchCleared,
    required TResult Function() searchRefresh,
  }) {
    return searchCleared();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String? categoryId)? searchSubmitted,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function()? searchLoadMore,
    TResult? Function(Map<String, String> filters)? searchFilterApplied,
    TResult? Function(String sortBy, String sortOrder)? searchSortApplied,
    TResult? Function()? searchCleared,
    TResult? Function()? searchRefresh,
  }) {
    return searchCleared?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String? categoryId)? searchSubmitted,
    TResult Function(String query)? searchQueryChanged,
    TResult Function()? searchLoadMore,
    TResult Function(Map<String, String> filters)? searchFilterApplied,
    TResult Function(String sortBy, String sortOrder)? searchSortApplied,
    TResult Function()? searchCleared,
    TResult Function()? searchRefresh,
    required TResult orElse(),
  }) {
    if (searchCleared != null) {
      return searchCleared();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchSubmitted value) searchSubmitted,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SearchLoadMore value) searchLoadMore,
    required TResult Function(_SearchFilterApplied value) searchFilterApplied,
    required TResult Function(_SearchSortApplied value) searchSortApplied,
    required TResult Function(_SearchCleared value) searchCleared,
    required TResult Function(_SearchRefresh value) searchRefresh,
  }) {
    return searchCleared(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSubmitted value)? searchSubmitted,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SearchLoadMore value)? searchLoadMore,
    TResult? Function(_SearchFilterApplied value)? searchFilterApplied,
    TResult? Function(_SearchSortApplied value)? searchSortApplied,
    TResult? Function(_SearchCleared value)? searchCleared,
    TResult? Function(_SearchRefresh value)? searchRefresh,
  }) {
    return searchCleared?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchSubmitted value)? searchSubmitted,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SearchLoadMore value)? searchLoadMore,
    TResult Function(_SearchFilterApplied value)? searchFilterApplied,
    TResult Function(_SearchSortApplied value)? searchSortApplied,
    TResult Function(_SearchCleared value)? searchCleared,
    TResult Function(_SearchRefresh value)? searchRefresh,
    required TResult orElse(),
  }) {
    if (searchCleared != null) {
      return searchCleared(this);
    }
    return orElse();
  }
}

abstract class _SearchCleared implements SearchEvent {
  const factory _SearchCleared() = _$SearchClearedImpl;
}

/// @nodoc
abstract class _$$SearchRefreshImplCopyWith<$Res> {
  factory _$$SearchRefreshImplCopyWith(
    _$SearchRefreshImpl value,
    $Res Function(_$SearchRefreshImpl) then,
  ) = __$$SearchRefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchRefreshImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchRefreshImpl>
    implements _$$SearchRefreshImplCopyWith<$Res> {
  __$$SearchRefreshImplCopyWithImpl(
    _$SearchRefreshImpl _value,
    $Res Function(_$SearchRefreshImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SearchRefreshImpl
    with DiagnosticableTreeMixin
    implements _SearchRefresh {
  const _$SearchRefreshImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchEvent.searchRefresh()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SearchEvent.searchRefresh'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchRefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String? categoryId) searchSubmitted,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function() searchLoadMore,
    required TResult Function(Map<String, String> filters) searchFilterApplied,
    required TResult Function(String sortBy, String sortOrder)
    searchSortApplied,
    required TResult Function() searchCleared,
    required TResult Function() searchRefresh,
  }) {
    return searchRefresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String? categoryId)? searchSubmitted,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function()? searchLoadMore,
    TResult? Function(Map<String, String> filters)? searchFilterApplied,
    TResult? Function(String sortBy, String sortOrder)? searchSortApplied,
    TResult? Function()? searchCleared,
    TResult? Function()? searchRefresh,
  }) {
    return searchRefresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String? categoryId)? searchSubmitted,
    TResult Function(String query)? searchQueryChanged,
    TResult Function()? searchLoadMore,
    TResult Function(Map<String, String> filters)? searchFilterApplied,
    TResult Function(String sortBy, String sortOrder)? searchSortApplied,
    TResult Function()? searchCleared,
    TResult Function()? searchRefresh,
    required TResult orElse(),
  }) {
    if (searchRefresh != null) {
      return searchRefresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchSubmitted value) searchSubmitted,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SearchLoadMore value) searchLoadMore,
    required TResult Function(_SearchFilterApplied value) searchFilterApplied,
    required TResult Function(_SearchSortApplied value) searchSortApplied,
    required TResult Function(_SearchCleared value) searchCleared,
    required TResult Function(_SearchRefresh value) searchRefresh,
  }) {
    return searchRefresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSubmitted value)? searchSubmitted,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SearchLoadMore value)? searchLoadMore,
    TResult? Function(_SearchFilterApplied value)? searchFilterApplied,
    TResult? Function(_SearchSortApplied value)? searchSortApplied,
    TResult? Function(_SearchCleared value)? searchCleared,
    TResult? Function(_SearchRefresh value)? searchRefresh,
  }) {
    return searchRefresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchSubmitted value)? searchSubmitted,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SearchLoadMore value)? searchLoadMore,
    TResult Function(_SearchFilterApplied value)? searchFilterApplied,
    TResult Function(_SearchSortApplied value)? searchSortApplied,
    TResult Function(_SearchCleared value)? searchCleared,
    TResult Function(_SearchRefresh value)? searchRefresh,
    required TResult orElse(),
  }) {
    if (searchRefresh != null) {
      return searchRefresh(this);
    }
    return orElse();
  }
}

abstract class _SearchRefresh implements SearchEvent {
  const factory _SearchRefresh() = _$SearchRefreshImpl;
}

/// @nodoc
mixin _$SearchState {
  PagingState<int, ProductEntity> get pagingState =>
      throw _privateConstructorUsedError;
  String? get correctedQuery => throw _privateConstructorUsedError;
  List<SearchFacetEntity> get facets => throw _privateConstructorUsedError;
  List<String> get suggestions => throw _privateConstructorUsedError;
  List<SearchCategoryEntity> get categories =>
      throw _privateConstructorUsedError;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
    SearchState value,
    $Res Function(SearchState) then,
  ) = _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call({
    PagingState<int, ProductEntity> pagingState,
    String? correctedQuery,
    List<SearchFacetEntity> facets,
    List<String> suggestions,
    List<SearchCategoryEntity> categories,
  });
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagingState = null,
    Object? correctedQuery = freezed,
    Object? facets = null,
    Object? suggestions = null,
    Object? categories = null,
  }) {
    return _then(
      _value.copyWith(
            pagingState:
                null == pagingState
                    ? _value.pagingState
                    : pagingState // ignore: cast_nullable_to_non_nullable
                        as PagingState<int, ProductEntity>,
            correctedQuery:
                freezed == correctedQuery
                    ? _value.correctedQuery
                    : correctedQuery // ignore: cast_nullable_to_non_nullable
                        as String?,
            facets:
                null == facets
                    ? _value.facets
                    : facets // ignore: cast_nullable_to_non_nullable
                        as List<SearchFacetEntity>,
            suggestions:
                null == suggestions
                    ? _value.suggestions
                    : suggestions // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            categories:
                null == categories
                    ? _value.categories
                    : categories // ignore: cast_nullable_to_non_nullable
                        as List<SearchCategoryEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
    _$SearchStateImpl value,
    $Res Function(_$SearchStateImpl) then,
  ) = __$$SearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PagingState<int, ProductEntity> pagingState,
    String? correctedQuery,
    List<SearchFacetEntity> facets,
    List<String> suggestions,
    List<SearchCategoryEntity> categories,
  });
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
    _$SearchStateImpl _value,
    $Res Function(_$SearchStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagingState = null,
    Object? correctedQuery = freezed,
    Object? facets = null,
    Object? suggestions = null,
    Object? categories = null,
  }) {
    return _then(
      _$SearchStateImpl(
        pagingState:
            null == pagingState
                ? _value.pagingState
                : pagingState // ignore: cast_nullable_to_non_nullable
                    as PagingState<int, ProductEntity>,
        correctedQuery:
            freezed == correctedQuery
                ? _value.correctedQuery
                : correctedQuery // ignore: cast_nullable_to_non_nullable
                    as String?,
        facets:
            null == facets
                ? _value._facets
                : facets // ignore: cast_nullable_to_non_nullable
                    as List<SearchFacetEntity>,
        suggestions:
            null == suggestions
                ? _value._suggestions
                : suggestions // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        categories:
            null == categories
                ? _value._categories
                : categories // ignore: cast_nullable_to_non_nullable
                    as List<SearchCategoryEntity>,
      ),
    );
  }
}

/// @nodoc

class _$SearchStateImpl with DiagnosticableTreeMixin implements _SearchState {
  const _$SearchStateImpl({
    required this.pagingState,
    this.correctedQuery,
    final List<SearchFacetEntity> facets = const [],
    final List<String> suggestions = const [],
    final List<SearchCategoryEntity> categories = const [],
  }) : _facets = facets,
       _suggestions = suggestions,
       _categories = categories;

  @override
  final PagingState<int, ProductEntity> pagingState;
  @override
  final String? correctedQuery;
  final List<SearchFacetEntity> _facets;
  @override
  @JsonKey()
  List<SearchFacetEntity> get facets {
    if (_facets is EqualUnmodifiableListView) return _facets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facets);
  }

  final List<String> _suggestions;
  @override
  @JsonKey()
  List<String> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  final List<SearchCategoryEntity> _categories;
  @override
  @JsonKey()
  List<SearchCategoryEntity> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchState(pagingState: $pagingState, correctedQuery: $correctedQuery, facets: $facets, suggestions: $suggestions, categories: $categories)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchState'))
      ..add(DiagnosticsProperty('pagingState', pagingState))
      ..add(DiagnosticsProperty('correctedQuery', correctedQuery))
      ..add(DiagnosticsProperty('facets', facets))
      ..add(DiagnosticsProperty('suggestions', suggestions))
      ..add(DiagnosticsProperty('categories', categories));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            (identical(other.pagingState, pagingState) ||
                other.pagingState == pagingState) &&
            (identical(other.correctedQuery, correctedQuery) ||
                other.correctedQuery == correctedQuery) &&
            const DeepCollectionEquality().equals(other._facets, _facets) &&
            const DeepCollectionEquality().equals(
              other._suggestions,
              _suggestions,
            ) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    pagingState,
    correctedQuery,
    const DeepCollectionEquality().hash(_facets),
    const DeepCollectionEquality().hash(_suggestions),
    const DeepCollectionEquality().hash(_categories),
  );

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState({
    required final PagingState<int, ProductEntity> pagingState,
    final String? correctedQuery,
    final List<SearchFacetEntity> facets,
    final List<String> suggestions,
    final List<SearchCategoryEntity> categories,
  }) = _$SearchStateImpl;

  @override
  PagingState<int, ProductEntity> get pagingState;
  @override
  String? get correctedQuery;
  @override
  List<SearchFacetEntity> get facets;
  @override
  List<String> get suggestions;
  @override
  List<SearchCategoryEntity> get categories;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
