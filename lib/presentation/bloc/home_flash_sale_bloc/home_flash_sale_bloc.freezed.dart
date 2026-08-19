// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_flash_sale_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeFlashSaleEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function() fetch}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function()? fetch}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeFlashSaleEventCopyWith<$Res> {
  factory $HomeFlashSaleEventCopyWith(
    HomeFlashSaleEvent value,
    $Res Function(HomeFlashSaleEvent) then,
  ) = _$HomeFlashSaleEventCopyWithImpl<$Res, HomeFlashSaleEvent>;
}

/// @nodoc
class _$HomeFlashSaleEventCopyWithImpl<$Res, $Val extends HomeFlashSaleEvent>
    implements $HomeFlashSaleEventCopyWith<$Res> {
  _$HomeFlashSaleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeFlashSaleEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
    _$FetchImpl value,
    $Res Function(_$FetchImpl) then,
  ) = __$$FetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$HomeFlashSaleEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
    _$FetchImpl _value,
    $Res Function(_$FetchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeFlashSaleEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl();

  @override
  String toString() {
    return 'HomeFlashSaleEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function() fetch}) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function()? fetch}) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements HomeFlashSaleEvent {
  const factory _Fetch() = _$FetchImpl;
}

/// @nodoc
mixin _$HomeFlashSaleState {
  HomeFlashSaleStatus get status => throw _privateConstructorUsedError;
  AppErrorEntity? get error => throw _privateConstructorUsedError;
  HomeFlashSaleEntity? get flashSale => throw _privateConstructorUsedError;

  /// Create a copy of HomeFlashSaleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeFlashSaleStateCopyWith<HomeFlashSaleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeFlashSaleStateCopyWith<$Res> {
  factory $HomeFlashSaleStateCopyWith(
    HomeFlashSaleState value,
    $Res Function(HomeFlashSaleState) then,
  ) = _$HomeFlashSaleStateCopyWithImpl<$Res, HomeFlashSaleState>;
  @useResult
  $Res call({
    HomeFlashSaleStatus status,
    AppErrorEntity? error,
    HomeFlashSaleEntity? flashSale,
  });
}

/// @nodoc
class _$HomeFlashSaleStateCopyWithImpl<$Res, $Val extends HomeFlashSaleState>
    implements $HomeFlashSaleStateCopyWith<$Res> {
  _$HomeFlashSaleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeFlashSaleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? flashSale = freezed,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as HomeFlashSaleStatus,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as AppErrorEntity?,
            flashSale:
                freezed == flashSale
                    ? _value.flashSale
                    : flashSale // ignore: cast_nullable_to_non_nullable
                        as HomeFlashSaleEntity?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeFlashSaleStateImplCopyWith<$Res>
    implements $HomeFlashSaleStateCopyWith<$Res> {
  factory _$$HomeFlashSaleStateImplCopyWith(
    _$HomeFlashSaleStateImpl value,
    $Res Function(_$HomeFlashSaleStateImpl) then,
  ) = __$$HomeFlashSaleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    HomeFlashSaleStatus status,
    AppErrorEntity? error,
    HomeFlashSaleEntity? flashSale,
  });
}

/// @nodoc
class __$$HomeFlashSaleStateImplCopyWithImpl<$Res>
    extends _$HomeFlashSaleStateCopyWithImpl<$Res, _$HomeFlashSaleStateImpl>
    implements _$$HomeFlashSaleStateImplCopyWith<$Res> {
  __$$HomeFlashSaleStateImplCopyWithImpl(
    _$HomeFlashSaleStateImpl _value,
    $Res Function(_$HomeFlashSaleStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeFlashSaleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? flashSale = freezed,
  }) {
    return _then(
      _$HomeFlashSaleStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as HomeFlashSaleStatus,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity?,
        flashSale:
            freezed == flashSale
                ? _value.flashSale
                : flashSale // ignore: cast_nullable_to_non_nullable
                    as HomeFlashSaleEntity?,
      ),
    );
  }
}

/// @nodoc

class _$HomeFlashSaleStateImpl implements _HomeFlashSaleState {
  const _$HomeFlashSaleStateImpl({
    this.status = HomeFlashSaleStatus.initial,
    this.error,
    this.flashSale,
  });

  @override
  @JsonKey()
  final HomeFlashSaleStatus status;
  @override
  final AppErrorEntity? error;
  @override
  final HomeFlashSaleEntity? flashSale;

  @override
  String toString() {
    return 'HomeFlashSaleState(status: $status, error: $error, flashSale: $flashSale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeFlashSaleStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.flashSale, flashSale) ||
                other.flashSale == flashSale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error, flashSale);

  /// Create a copy of HomeFlashSaleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeFlashSaleStateImplCopyWith<_$HomeFlashSaleStateImpl> get copyWith =>
      __$$HomeFlashSaleStateImplCopyWithImpl<_$HomeFlashSaleStateImpl>(
        this,
        _$identity,
      );
}

abstract class _HomeFlashSaleState implements HomeFlashSaleState {
  const factory _HomeFlashSaleState({
    final HomeFlashSaleStatus status,
    final AppErrorEntity? error,
    final HomeFlashSaleEntity? flashSale,
  }) = _$HomeFlashSaleStateImpl;

  @override
  HomeFlashSaleStatus get status;
  @override
  AppErrorEntity? get error;
  @override
  HomeFlashSaleEntity? get flashSale;

  /// Create a copy of HomeFlashSaleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeFlashSaleStateImplCopyWith<_$HomeFlashSaleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
