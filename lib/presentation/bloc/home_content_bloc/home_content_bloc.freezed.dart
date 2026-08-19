// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_content_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeContentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool forceRefresh) getFeedContent,
    required TResult Function() refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool forceRefresh)? getFeedContent,
    TResult? Function()? refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool forceRefresh)? getFeedContent,
    TResult Function()? refresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFeedContent value) getFeedContent,
    required TResult Function(_Refresh value) refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetFeedContent value)? getFeedContent,
    TResult? Function(_Refresh value)? refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFeedContent value)? getFeedContent,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeContentEventCopyWith<$Res> {
  factory $HomeContentEventCopyWith(
    HomeContentEvent value,
    $Res Function(HomeContentEvent) then,
  ) = _$HomeContentEventCopyWithImpl<$Res, HomeContentEvent>;
}

/// @nodoc
class _$HomeContentEventCopyWithImpl<$Res, $Val extends HomeContentEvent>
    implements $HomeContentEventCopyWith<$Res> {
  _$HomeContentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeContentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetFeedContentImplCopyWith<$Res> {
  factory _$$GetFeedContentImplCopyWith(
    _$GetFeedContentImpl value,
    $Res Function(_$GetFeedContentImpl) then,
  ) = __$$GetFeedContentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool forceRefresh});
}

/// @nodoc
class __$$GetFeedContentImplCopyWithImpl<$Res>
    extends _$HomeContentEventCopyWithImpl<$Res, _$GetFeedContentImpl>
    implements _$$GetFeedContentImplCopyWith<$Res> {
  __$$GetFeedContentImplCopyWithImpl(
    _$GetFeedContentImpl _value,
    $Res Function(_$GetFeedContentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? forceRefresh = null}) {
    return _then(
      _$GetFeedContentImpl(
        forceRefresh:
            null == forceRefresh
                ? _value.forceRefresh
                : forceRefresh // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$GetFeedContentImpl implements _GetFeedContent {
  const _$GetFeedContentImpl({this.forceRefresh = false});

  @override
  @JsonKey()
  final bool forceRefresh;

  @override
  String toString() {
    return 'HomeContentEvent.getFeedContent(forceRefresh: $forceRefresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFeedContentImpl &&
            (identical(other.forceRefresh, forceRefresh) ||
                other.forceRefresh == forceRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forceRefresh);

  /// Create a copy of HomeContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFeedContentImplCopyWith<_$GetFeedContentImpl> get copyWith =>
      __$$GetFeedContentImplCopyWithImpl<_$GetFeedContentImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool forceRefresh) getFeedContent,
    required TResult Function() refresh,
  }) {
    return getFeedContent(forceRefresh);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool forceRefresh)? getFeedContent,
    TResult? Function()? refresh,
  }) {
    return getFeedContent?.call(forceRefresh);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool forceRefresh)? getFeedContent,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (getFeedContent != null) {
      return getFeedContent(forceRefresh);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFeedContent value) getFeedContent,
    required TResult Function(_Refresh value) refresh,
  }) {
    return getFeedContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetFeedContent value)? getFeedContent,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return getFeedContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFeedContent value)? getFeedContent,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (getFeedContent != null) {
      return getFeedContent(this);
    }
    return orElse();
  }
}

abstract class _GetFeedContent implements HomeContentEvent {
  const factory _GetFeedContent({final bool forceRefresh}) =
      _$GetFeedContentImpl;

  bool get forceRefresh;

  /// Create a copy of HomeContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetFeedContentImplCopyWith<_$GetFeedContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
    _$RefreshImpl value,
    $Res Function(_$RefreshImpl) then,
  ) = __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$HomeContentEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
    _$RefreshImpl _value,
    $Res Function(_$RefreshImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeContentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'HomeContentEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool forceRefresh) getFeedContent,
    required TResult Function() refresh,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool forceRefresh)? getFeedContent,
    TResult? Function()? refresh,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool forceRefresh)? getFeedContent,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFeedContent value) getFeedContent,
    required TResult Function(_Refresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetFeedContent value)? getFeedContent,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFeedContent value)? getFeedContent,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements HomeContentEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
mixin _$HomeContentState {
  HomeContentStatus get status => throw _privateConstructorUsedError;
  AppErrorEntity? get error => throw _privateConstructorUsedError;
  HomeContentEntity? get homeFeed => throw _privateConstructorUsedError;

  /// Create a copy of HomeContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeContentStateCopyWith<HomeContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeContentStateCopyWith<$Res> {
  factory $HomeContentStateCopyWith(
    HomeContentState value,
    $Res Function(HomeContentState) then,
  ) = _$HomeContentStateCopyWithImpl<$Res, HomeContentState>;
  @useResult
  $Res call({
    HomeContentStatus status,
    AppErrorEntity? error,
    HomeContentEntity? homeFeed,
  });
}

/// @nodoc
class _$HomeContentStateCopyWithImpl<$Res, $Val extends HomeContentState>
    implements $HomeContentStateCopyWith<$Res> {
  _$HomeContentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeContentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? homeFeed = freezed,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as HomeContentStatus,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as AppErrorEntity?,
            homeFeed:
                freezed == homeFeed
                    ? _value.homeFeed
                    : homeFeed // ignore: cast_nullable_to_non_nullable
                        as HomeContentEntity?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeContentStateImplCopyWith<$Res>
    implements $HomeContentStateCopyWith<$Res> {
  factory _$$HomeContentStateImplCopyWith(
    _$HomeContentStateImpl value,
    $Res Function(_$HomeContentStateImpl) then,
  ) = __$$HomeContentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    HomeContentStatus status,
    AppErrorEntity? error,
    HomeContentEntity? homeFeed,
  });
}

/// @nodoc
class __$$HomeContentStateImplCopyWithImpl<$Res>
    extends _$HomeContentStateCopyWithImpl<$Res, _$HomeContentStateImpl>
    implements _$$HomeContentStateImplCopyWith<$Res> {
  __$$HomeContentStateImplCopyWithImpl(
    _$HomeContentStateImpl _value,
    $Res Function(_$HomeContentStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeContentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? homeFeed = freezed,
  }) {
    return _then(
      _$HomeContentStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as HomeContentStatus,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity?,
        homeFeed:
            freezed == homeFeed
                ? _value.homeFeed
                : homeFeed // ignore: cast_nullable_to_non_nullable
                    as HomeContentEntity?,
      ),
    );
  }
}

/// @nodoc

class _$HomeContentStateImpl implements _HomeContentState {
  const _$HomeContentStateImpl({
    this.status = HomeContentStatus.initial,
    this.error,
    this.homeFeed,
  });

  @override
  @JsonKey()
  final HomeContentStatus status;
  @override
  final AppErrorEntity? error;
  @override
  final HomeContentEntity? homeFeed;

  @override
  String toString() {
    return 'HomeContentState(status: $status, error: $error, homeFeed: $homeFeed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeContentStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.homeFeed, homeFeed) ||
                other.homeFeed == homeFeed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error, homeFeed);

  /// Create a copy of HomeContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeContentStateImplCopyWith<_$HomeContentStateImpl> get copyWith =>
      __$$HomeContentStateImplCopyWithImpl<_$HomeContentStateImpl>(
        this,
        _$identity,
      );
}

abstract class _HomeContentState implements HomeContentState {
  const factory _HomeContentState({
    final HomeContentStatus status,
    final AppErrorEntity? error,
    final HomeContentEntity? homeFeed,
  }) = _$HomeContentStateImpl;

  @override
  HomeContentStatus get status;
  @override
  AppErrorEntity? get error;
  @override
  HomeContentEntity? get homeFeed;

  /// Create a copy of HomeContentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeContentStateImplCopyWith<_$HomeContentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
