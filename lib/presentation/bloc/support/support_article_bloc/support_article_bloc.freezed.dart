// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_article_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SupportArticleEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String categoryId) getSupportArticle,
    required TResult Function(String query) searchSupportArticle,
    required TResult Function(String? categoryId, String? query) refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String categoryId)? getSupportArticle,
    TResult? Function(String query)? searchSupportArticle,
    TResult? Function(String? categoryId, String? query)? refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String categoryId)? getSupportArticle,
    TResult Function(String query)? searchSupportArticle,
    TResult Function(String? categoryId, String? query)? refresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSupportAtricle value) getSupportArticle,
    required TResult Function(_SearchSupportAtricle value) searchSupportArticle,
    required TResult Function(_Refresh value) refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSupportAtricle value)? getSupportArticle,
    TResult? Function(_SearchSupportAtricle value)? searchSupportArticle,
    TResult? Function(_Refresh value)? refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSupportAtricle value)? getSupportArticle,
    TResult Function(_SearchSupportAtricle value)? searchSupportArticle,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportArticleEventCopyWith<$Res> {
  factory $SupportArticleEventCopyWith(
    SupportArticleEvent value,
    $Res Function(SupportArticleEvent) then,
  ) = _$SupportArticleEventCopyWithImpl<$Res, SupportArticleEvent>;
}

/// @nodoc
class _$SupportArticleEventCopyWithImpl<$Res, $Val extends SupportArticleEvent>
    implements $SupportArticleEventCopyWith<$Res> {
  _$SupportArticleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupportArticleEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetSupportAtricleImplCopyWith<$Res> {
  factory _$$GetSupportAtricleImplCopyWith(
    _$GetSupportAtricleImpl value,
    $Res Function(_$GetSupportAtricleImpl) then,
  ) = __$$GetSupportAtricleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String categoryId});
}

/// @nodoc
class __$$GetSupportAtricleImplCopyWithImpl<$Res>
    extends _$SupportArticleEventCopyWithImpl<$Res, _$GetSupportAtricleImpl>
    implements _$$GetSupportAtricleImplCopyWith<$Res> {
  __$$GetSupportAtricleImplCopyWithImpl(
    _$GetSupportAtricleImpl _value,
    $Res Function(_$GetSupportAtricleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SupportArticleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categoryId = null}) {
    return _then(
      _$GetSupportAtricleImpl(
        categoryId:
            null == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$GetSupportAtricleImpl implements _GetSupportAtricle {
  const _$GetSupportAtricleImpl({required this.categoryId});

  @override
  final String categoryId;

  @override
  String toString() {
    return 'SupportArticleEvent.getSupportArticle(categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSupportAtricleImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  /// Create a copy of SupportArticleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSupportAtricleImplCopyWith<_$GetSupportAtricleImpl> get copyWith =>
      __$$GetSupportAtricleImplCopyWithImpl<_$GetSupportAtricleImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String categoryId) getSupportArticle,
    required TResult Function(String query) searchSupportArticle,
    required TResult Function(String? categoryId, String? query) refresh,
  }) {
    return getSupportArticle(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String categoryId)? getSupportArticle,
    TResult? Function(String query)? searchSupportArticle,
    TResult? Function(String? categoryId, String? query)? refresh,
  }) {
    return getSupportArticle?.call(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String categoryId)? getSupportArticle,
    TResult Function(String query)? searchSupportArticle,
    TResult Function(String? categoryId, String? query)? refresh,
    required TResult orElse(),
  }) {
    if (getSupportArticle != null) {
      return getSupportArticle(categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSupportAtricle value) getSupportArticle,
    required TResult Function(_SearchSupportAtricle value) searchSupportArticle,
    required TResult Function(_Refresh value) refresh,
  }) {
    return getSupportArticle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSupportAtricle value)? getSupportArticle,
    TResult? Function(_SearchSupportAtricle value)? searchSupportArticle,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return getSupportArticle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSupportAtricle value)? getSupportArticle,
    TResult Function(_SearchSupportAtricle value)? searchSupportArticle,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (getSupportArticle != null) {
      return getSupportArticle(this);
    }
    return orElse();
  }
}

abstract class _GetSupportAtricle implements SupportArticleEvent {
  const factory _GetSupportAtricle({required final String categoryId}) =
      _$GetSupportAtricleImpl;

  String get categoryId;

  /// Create a copy of SupportArticleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSupportAtricleImplCopyWith<_$GetSupportAtricleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchSupportAtricleImplCopyWith<$Res> {
  factory _$$SearchSupportAtricleImplCopyWith(
    _$SearchSupportAtricleImpl value,
    $Res Function(_$SearchSupportAtricleImpl) then,
  ) = __$$SearchSupportAtricleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchSupportAtricleImplCopyWithImpl<$Res>
    extends _$SupportArticleEventCopyWithImpl<$Res, _$SearchSupportAtricleImpl>
    implements _$$SearchSupportAtricleImplCopyWith<$Res> {
  __$$SearchSupportAtricleImplCopyWithImpl(
    _$SearchSupportAtricleImpl _value,
    $Res Function(_$SearchSupportAtricleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SupportArticleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? query = null}) {
    return _then(
      _$SearchSupportAtricleImpl(
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

class _$SearchSupportAtricleImpl implements _SearchSupportAtricle {
  const _$SearchSupportAtricleImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'SupportArticleEvent.searchSupportArticle(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSupportAtricleImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of SupportArticleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSupportAtricleImplCopyWith<_$SearchSupportAtricleImpl>
  get copyWith =>
      __$$SearchSupportAtricleImplCopyWithImpl<_$SearchSupportAtricleImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String categoryId) getSupportArticle,
    required TResult Function(String query) searchSupportArticle,
    required TResult Function(String? categoryId, String? query) refresh,
  }) {
    return searchSupportArticle(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String categoryId)? getSupportArticle,
    TResult? Function(String query)? searchSupportArticle,
    TResult? Function(String? categoryId, String? query)? refresh,
  }) {
    return searchSupportArticle?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String categoryId)? getSupportArticle,
    TResult Function(String query)? searchSupportArticle,
    TResult Function(String? categoryId, String? query)? refresh,
    required TResult orElse(),
  }) {
    if (searchSupportArticle != null) {
      return searchSupportArticle(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSupportAtricle value) getSupportArticle,
    required TResult Function(_SearchSupportAtricle value) searchSupportArticle,
    required TResult Function(_Refresh value) refresh,
  }) {
    return searchSupportArticle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSupportAtricle value)? getSupportArticle,
    TResult? Function(_SearchSupportAtricle value)? searchSupportArticle,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return searchSupportArticle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSupportAtricle value)? getSupportArticle,
    TResult Function(_SearchSupportAtricle value)? searchSupportArticle,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (searchSupportArticle != null) {
      return searchSupportArticle(this);
    }
    return orElse();
  }
}

abstract class _SearchSupportAtricle implements SupportArticleEvent {
  const factory _SearchSupportAtricle({required final String query}) =
      _$SearchSupportAtricleImpl;

  String get query;

  /// Create a copy of SupportArticleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchSupportAtricleImplCopyWith<_$SearchSupportAtricleImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
    _$RefreshImpl value,
    $Res Function(_$RefreshImpl) then,
  ) = __$$RefreshImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? categoryId, String? query});
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$SupportArticleEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
    _$RefreshImpl _value,
    $Res Function(_$RefreshImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SupportArticleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categoryId = freezed, Object? query = freezed}) {
    return _then(
      _$RefreshImpl(
        categoryId:
            freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                    as String?,
        query:
            freezed == query
                ? _value.query
                : query // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl({required this.categoryId, required this.query});

  @override
  final String? categoryId;
  @override
  final String? query;

  @override
  String toString() {
    return 'SupportArticleEvent.refresh(categoryId: $categoryId, query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId, query);

  /// Create a copy of SupportArticleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshImplCopyWith<_$RefreshImpl> get copyWith =>
      __$$RefreshImplCopyWithImpl<_$RefreshImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String categoryId) getSupportArticle,
    required TResult Function(String query) searchSupportArticle,
    required TResult Function(String? categoryId, String? query) refresh,
  }) {
    return refresh(categoryId, query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String categoryId)? getSupportArticle,
    TResult? Function(String query)? searchSupportArticle,
    TResult? Function(String? categoryId, String? query)? refresh,
  }) {
    return refresh?.call(categoryId, query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String categoryId)? getSupportArticle,
    TResult Function(String query)? searchSupportArticle,
    TResult Function(String? categoryId, String? query)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(categoryId, query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSupportAtricle value) getSupportArticle,
    required TResult Function(_SearchSupportAtricle value) searchSupportArticle,
    required TResult Function(_Refresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSupportAtricle value)? getSupportArticle,
    TResult? Function(_SearchSupportAtricle value)? searchSupportArticle,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSupportAtricle value)? getSupportArticle,
    TResult Function(_SearchSupportAtricle value)? searchSupportArticle,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements SupportArticleEvent {
  const factory _Refresh({
    required final String? categoryId,
    required final String? query,
  }) = _$RefreshImpl;

  String? get categoryId;
  String? get query;

  /// Create a copy of SupportArticleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshImplCopyWith<_$RefreshImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SupportArticleState {
  SupportArticleStatus get status => throw _privateConstructorUsedError;
  AppErrorEntity? get error => throw _privateConstructorUsedError;
  List<SupportArticleEntity>? get articles =>
      throw _privateConstructorUsedError;

  /// Create a copy of SupportArticleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupportArticleStateCopyWith<SupportArticleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportArticleStateCopyWith<$Res> {
  factory $SupportArticleStateCopyWith(
    SupportArticleState value,
    $Res Function(SupportArticleState) then,
  ) = _$SupportArticleStateCopyWithImpl<$Res, SupportArticleState>;
  @useResult
  $Res call({
    SupportArticleStatus status,
    AppErrorEntity? error,
    List<SupportArticleEntity>? articles,
  });
}

/// @nodoc
class _$SupportArticleStateCopyWithImpl<$Res, $Val extends SupportArticleState>
    implements $SupportArticleStateCopyWith<$Res> {
  _$SupportArticleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupportArticleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? articles = freezed,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as SupportArticleStatus,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as AppErrorEntity?,
            articles:
                freezed == articles
                    ? _value.articles
                    : articles // ignore: cast_nullable_to_non_nullable
                        as List<SupportArticleEntity>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SupportArticleStateImplCopyWith<$Res>
    implements $SupportArticleStateCopyWith<$Res> {
  factory _$$SupportArticleStateImplCopyWith(
    _$SupportArticleStateImpl value,
    $Res Function(_$SupportArticleStateImpl) then,
  ) = __$$SupportArticleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    SupportArticleStatus status,
    AppErrorEntity? error,
    List<SupportArticleEntity>? articles,
  });
}

/// @nodoc
class __$$SupportArticleStateImplCopyWithImpl<$Res>
    extends _$SupportArticleStateCopyWithImpl<$Res, _$SupportArticleStateImpl>
    implements _$$SupportArticleStateImplCopyWith<$Res> {
  __$$SupportArticleStateImplCopyWithImpl(
    _$SupportArticleStateImpl _value,
    $Res Function(_$SupportArticleStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SupportArticleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? articles = freezed,
  }) {
    return _then(
      _$SupportArticleStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as SupportArticleStatus,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity?,
        articles:
            freezed == articles
                ? _value._articles
                : articles // ignore: cast_nullable_to_non_nullable
                    as List<SupportArticleEntity>?,
      ),
    );
  }
}

/// @nodoc

class _$SupportArticleStateImpl implements _SupportArticleState {
  const _$SupportArticleStateImpl({
    this.status = SupportArticleStatus.initial,
    this.error,
    final List<SupportArticleEntity>? articles,
  }) : _articles = articles;

  @override
  @JsonKey()
  final SupportArticleStatus status;
  @override
  final AppErrorEntity? error;
  final List<SupportArticleEntity>? _articles;
  @override
  List<SupportArticleEntity>? get articles {
    final value = _articles;
    if (value == null) return null;
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SupportArticleState(status: $status, error: $error, articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportArticleStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    error,
    const DeepCollectionEquality().hash(_articles),
  );

  /// Create a copy of SupportArticleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupportArticleStateImplCopyWith<_$SupportArticleStateImpl> get copyWith =>
      __$$SupportArticleStateImplCopyWithImpl<_$SupportArticleStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SupportArticleState implements SupportArticleState {
  const factory _SupportArticleState({
    final SupportArticleStatus status,
    final AppErrorEntity? error,
    final List<SupportArticleEntity>? articles,
  }) = _$SupportArticleStateImpl;

  @override
  SupportArticleStatus get status;
  @override
  AppErrorEntity? get error;
  @override
  List<SupportArticleEntity>? get articles;

  /// Create a copy of SupportArticleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupportArticleStateImplCopyWith<_$SupportArticleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
