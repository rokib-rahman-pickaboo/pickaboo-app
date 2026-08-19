// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_banner_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeBannerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function() load}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function()? load}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeBannerEventCopyWith<$Res> {
  factory $HomeBannerEventCopyWith(
    HomeBannerEvent value,
    $Res Function(HomeBannerEvent) then,
  ) = _$HomeBannerEventCopyWithImpl<$Res, HomeBannerEvent>;
}

/// @nodoc
class _$HomeBannerEventCopyWithImpl<$Res, $Val extends HomeBannerEvent>
    implements $HomeBannerEventCopyWith<$Res> {
  _$HomeBannerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeBannerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
    _$LoadImpl value,
    $Res Function(_$LoadImpl) then,
  ) = __$$LoadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$HomeBannerEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
    : super(_value, _then);

  /// Create a copy of HomeBannerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl();

  @override
  String toString() {
    return 'HomeBannerEvent.load()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function() load}) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function()? load}) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements HomeBannerEvent {
  const factory _Load() = _$LoadImpl;
}

/// @nodoc
mixin _$HomeBannerState {
  HomeBannerStatus get status => throw _privateConstructorUsedError;
  List<HomeBannerEntity> get banners => throw _privateConstructorUsedError;
  AppErrorEntity? get error => throw _privateConstructorUsedError;

  /// Create a copy of HomeBannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeBannerStateCopyWith<HomeBannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeBannerStateCopyWith<$Res> {
  factory $HomeBannerStateCopyWith(
    HomeBannerState value,
    $Res Function(HomeBannerState) then,
  ) = _$HomeBannerStateCopyWithImpl<$Res, HomeBannerState>;
  @useResult
  $Res call({
    HomeBannerStatus status,
    List<HomeBannerEntity> banners,
    AppErrorEntity? error,
  });
}

/// @nodoc
class _$HomeBannerStateCopyWithImpl<$Res, $Val extends HomeBannerState>
    implements $HomeBannerStateCopyWith<$Res> {
  _$HomeBannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeBannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? banners = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as HomeBannerStatus,
            banners:
                null == banners
                    ? _value.banners
                    : banners // ignore: cast_nullable_to_non_nullable
                        as List<HomeBannerEntity>,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as AppErrorEntity?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeBannerStateImplCopyWith<$Res>
    implements $HomeBannerStateCopyWith<$Res> {
  factory _$$HomeBannerStateImplCopyWith(
    _$HomeBannerStateImpl value,
    $Res Function(_$HomeBannerStateImpl) then,
  ) = __$$HomeBannerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    HomeBannerStatus status,
    List<HomeBannerEntity> banners,
    AppErrorEntity? error,
  });
}

/// @nodoc
class __$$HomeBannerStateImplCopyWithImpl<$Res>
    extends _$HomeBannerStateCopyWithImpl<$Res, _$HomeBannerStateImpl>
    implements _$$HomeBannerStateImplCopyWith<$Res> {
  __$$HomeBannerStateImplCopyWithImpl(
    _$HomeBannerStateImpl _value,
    $Res Function(_$HomeBannerStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeBannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? banners = null,
    Object? error = freezed,
  }) {
    return _then(
      _$HomeBannerStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as HomeBannerStatus,
        banners:
            null == banners
                ? _value._banners
                : banners // ignore: cast_nullable_to_non_nullable
                    as List<HomeBannerEntity>,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity?,
      ),
    );
  }
}

/// @nodoc

class _$HomeBannerStateImpl implements _HomeBannerState {
  const _$HomeBannerStateImpl({
    this.status = HomeBannerStatus.initial,
    final List<HomeBannerEntity> banners = const <HomeBannerEntity>[],
    this.error,
  }) : _banners = banners;

  @override
  @JsonKey()
  final HomeBannerStatus status;
  final List<HomeBannerEntity> _banners;
  @override
  @JsonKey()
  List<HomeBannerEntity> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  @override
  final AppErrorEntity? error;

  @override
  String toString() {
    return 'HomeBannerState(status: $status, banners: $banners, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeBannerStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_banners),
    error,
  );

  /// Create a copy of HomeBannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeBannerStateImplCopyWith<_$HomeBannerStateImpl> get copyWith =>
      __$$HomeBannerStateImplCopyWithImpl<_$HomeBannerStateImpl>(
        this,
        _$identity,
      );
}

abstract class _HomeBannerState implements HomeBannerState {
  const factory _HomeBannerState({
    final HomeBannerStatus status,
    final List<HomeBannerEntity> banners,
    final AppErrorEntity? error,
  }) = _$HomeBannerStateImpl;

  @override
  HomeBannerStatus get status;
  @override
  List<HomeBannerEntity> get banners;
  @override
  AppErrorEntity? get error;

  /// Create a copy of HomeBannerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeBannerStateImplCopyWith<_$HomeBannerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
