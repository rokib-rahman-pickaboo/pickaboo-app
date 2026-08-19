// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'homepage_offers_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomepageOffersEvent {
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
abstract class $HomepageOffersEventCopyWith<$Res> {
  factory $HomepageOffersEventCopyWith(
    HomepageOffersEvent value,
    $Res Function(HomepageOffersEvent) then,
  ) = _$HomepageOffersEventCopyWithImpl<$Res, HomepageOffersEvent>;
}

/// @nodoc
class _$HomepageOffersEventCopyWithImpl<$Res, $Val extends HomepageOffersEvent>
    implements $HomepageOffersEventCopyWith<$Res> {
  _$HomepageOffersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomepageOffersEvent
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
    extends _$HomepageOffersEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
    : super(_value, _then);

  /// Create a copy of HomepageOffersEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl();

  @override
  String toString() {
    return 'HomepageOffersEvent.load()';
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

abstract class _Load implements HomepageOffersEvent {
  const factory _Load() = _$LoadImpl;
}

/// @nodoc
mixin _$HomepageOffersState {
  HomepageOffersStatus get status => throw _privateConstructorUsedError;
  AppErrorEntity? get error => throw _privateConstructorUsedError;
  HomepageOffersEntity? get offers => throw _privateConstructorUsedError;

  /// Create a copy of HomepageOffersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomepageOffersStateCopyWith<HomepageOffersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomepageOffersStateCopyWith<$Res> {
  factory $HomepageOffersStateCopyWith(
    HomepageOffersState value,
    $Res Function(HomepageOffersState) then,
  ) = _$HomepageOffersStateCopyWithImpl<$Res, HomepageOffersState>;
  @useResult
  $Res call({
    HomepageOffersStatus status,
    AppErrorEntity? error,
    HomepageOffersEntity? offers,
  });
}

/// @nodoc
class _$HomepageOffersStateCopyWithImpl<$Res, $Val extends HomepageOffersState>
    implements $HomepageOffersStateCopyWith<$Res> {
  _$HomepageOffersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomepageOffersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? offers = freezed,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as HomepageOffersStatus,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as AppErrorEntity?,
            offers:
                freezed == offers
                    ? _value.offers
                    : offers // ignore: cast_nullable_to_non_nullable
                        as HomepageOffersEntity?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomepageOffersStateImplCopyWith<$Res>
    implements $HomepageOffersStateCopyWith<$Res> {
  factory _$$HomepageOffersStateImplCopyWith(
    _$HomepageOffersStateImpl value,
    $Res Function(_$HomepageOffersStateImpl) then,
  ) = __$$HomepageOffersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    HomepageOffersStatus status,
    AppErrorEntity? error,
    HomepageOffersEntity? offers,
  });
}

/// @nodoc
class __$$HomepageOffersStateImplCopyWithImpl<$Res>
    extends _$HomepageOffersStateCopyWithImpl<$Res, _$HomepageOffersStateImpl>
    implements _$$HomepageOffersStateImplCopyWith<$Res> {
  __$$HomepageOffersStateImplCopyWithImpl(
    _$HomepageOffersStateImpl _value,
    $Res Function(_$HomepageOffersStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomepageOffersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? offers = freezed,
  }) {
    return _then(
      _$HomepageOffersStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as HomepageOffersStatus,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity?,
        offers:
            freezed == offers
                ? _value.offers
                : offers // ignore: cast_nullable_to_non_nullable
                    as HomepageOffersEntity?,
      ),
    );
  }
}

/// @nodoc

class _$HomepageOffersStateImpl implements _HomepageOffersState {
  const _$HomepageOffersStateImpl({
    this.status = HomepageOffersStatus.initial,
    this.error,
    this.offers,
  });

  @override
  @JsonKey()
  final HomepageOffersStatus status;
  @override
  final AppErrorEntity? error;
  @override
  final HomepageOffersEntity? offers;

  @override
  String toString() {
    return 'HomepageOffersState(status: $status, error: $error, offers: $offers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomepageOffersStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.offers, offers) || other.offers == offers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error, offers);

  /// Create a copy of HomepageOffersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomepageOffersStateImplCopyWith<_$HomepageOffersStateImpl> get copyWith =>
      __$$HomepageOffersStateImplCopyWithImpl<_$HomepageOffersStateImpl>(
        this,
        _$identity,
      );
}

abstract class _HomepageOffersState implements HomepageOffersState {
  const factory _HomepageOffersState({
    final HomepageOffersStatus status,
    final AppErrorEntity? error,
    final HomepageOffersEntity? offers,
  }) = _$HomepageOffersStateImpl;

  @override
  HomepageOffersStatus get status;
  @override
  AppErrorEntity? get error;
  @override
  HomepageOffersEntity? get offers;

  /// Create a copy of HomepageOffersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomepageOffersStateImplCopyWith<_$HomepageOffersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
