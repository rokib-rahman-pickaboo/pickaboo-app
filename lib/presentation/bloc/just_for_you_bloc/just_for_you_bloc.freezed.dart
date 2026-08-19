// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'just_for_you_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$JustForYouEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getProducts,
    required TResult Function() refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getProducts,
    TResult? Function()? refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProducts,
    TResult Function()? refresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProduct value) getProducts,
    required TResult Function(_Refresh value) refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProduct value)? getProducts,
    TResult? Function(_Refresh value)? refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProduct value)? getProducts,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JustForYouEventCopyWith<$Res> {
  factory $JustForYouEventCopyWith(
    JustForYouEvent value,
    $Res Function(JustForYouEvent) then,
  ) = _$JustForYouEventCopyWithImpl<$Res, JustForYouEvent>;
}

/// @nodoc
class _$JustForYouEventCopyWithImpl<$Res, $Val extends JustForYouEvent>
    implements $JustForYouEventCopyWith<$Res> {
  _$JustForYouEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JustForYouEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetProductImplCopyWith<$Res> {
  factory _$$GetProductImplCopyWith(
    _$GetProductImpl value,
    $Res Function(_$GetProductImpl) then,
  ) = __$$GetProductImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetProductImplCopyWithImpl<$Res>
    extends _$JustForYouEventCopyWithImpl<$Res, _$GetProductImpl>
    implements _$$GetProductImplCopyWith<$Res> {
  __$$GetProductImplCopyWithImpl(
    _$GetProductImpl _value,
    $Res Function(_$GetProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JustForYouEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetProductImpl implements _GetProduct {
  const _$GetProductImpl();

  @override
  String toString() {
    return 'JustForYouEvent.getProducts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetProductImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getProducts,
    required TResult Function() refresh,
  }) {
    return getProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getProducts,
    TResult? Function()? refresh,
  }) {
    return getProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProducts,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (getProducts != null) {
      return getProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProduct value) getProducts,
    required TResult Function(_Refresh value) refresh,
  }) {
    return getProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProduct value)? getProducts,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return getProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProduct value)? getProducts,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (getProducts != null) {
      return getProducts(this);
    }
    return orElse();
  }
}

abstract class _GetProduct implements JustForYouEvent {
  const factory _GetProduct() = _$GetProductImpl;
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
    extends _$JustForYouEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
    _$RefreshImpl _value,
    $Res Function(_$RefreshImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JustForYouEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'JustForYouEvent.refresh()';
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
    required TResult Function() getProducts,
    required TResult Function() refresh,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getProducts,
    TResult? Function()? refresh,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProducts,
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
    required TResult Function(_GetProduct value) getProducts,
    required TResult Function(_Refresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProduct value)? getProducts,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProduct value)? getProducts,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements JustForYouEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
mixin _$JustForYouState {
  PagingState<int, ProductEntity> get pagingState =>
      throw _privateConstructorUsedError;

  /// Create a copy of JustForYouState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JustForYouStateCopyWith<JustForYouState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JustForYouStateCopyWith<$Res> {
  factory $JustForYouStateCopyWith(
    JustForYouState value,
    $Res Function(JustForYouState) then,
  ) = _$JustForYouStateCopyWithImpl<$Res, JustForYouState>;
  @useResult
  $Res call({PagingState<int, ProductEntity> pagingState});
}

/// @nodoc
class _$JustForYouStateCopyWithImpl<$Res, $Val extends JustForYouState>
    implements $JustForYouStateCopyWith<$Res> {
  _$JustForYouStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JustForYouState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pagingState = null}) {
    return _then(
      _value.copyWith(
            pagingState:
                null == pagingState
                    ? _value.pagingState
                    : pagingState // ignore: cast_nullable_to_non_nullable
                        as PagingState<int, ProductEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JustForYouStateImplCopyWith<$Res>
    implements $JustForYouStateCopyWith<$Res> {
  factory _$$JustForYouStateImplCopyWith(
    _$JustForYouStateImpl value,
    $Res Function(_$JustForYouStateImpl) then,
  ) = __$$JustForYouStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PagingState<int, ProductEntity> pagingState});
}

/// @nodoc
class __$$JustForYouStateImplCopyWithImpl<$Res>
    extends _$JustForYouStateCopyWithImpl<$Res, _$JustForYouStateImpl>
    implements _$$JustForYouStateImplCopyWith<$Res> {
  __$$JustForYouStateImplCopyWithImpl(
    _$JustForYouStateImpl _value,
    $Res Function(_$JustForYouStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JustForYouState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pagingState = null}) {
    return _then(
      _$JustForYouStateImpl(
        pagingState:
            null == pagingState
                ? _value.pagingState
                : pagingState // ignore: cast_nullable_to_non_nullable
                    as PagingState<int, ProductEntity>,
      ),
    );
  }
}

/// @nodoc

class _$JustForYouStateImpl implements _JustForYouState {
  const _$JustForYouStateImpl({required this.pagingState});

  @override
  final PagingState<int, ProductEntity> pagingState;

  @override
  String toString() {
    return 'JustForYouState(pagingState: $pagingState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JustForYouStateImpl &&
            (identical(other.pagingState, pagingState) ||
                other.pagingState == pagingState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pagingState);

  /// Create a copy of JustForYouState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JustForYouStateImplCopyWith<_$JustForYouStateImpl> get copyWith =>
      __$$JustForYouStateImplCopyWithImpl<_$JustForYouStateImpl>(
        this,
        _$identity,
      );
}

abstract class _JustForYouState implements JustForYouState {
  const factory _JustForYouState({
    required final PagingState<int, ProductEntity> pagingState,
  }) = _$JustForYouStateImpl;

  @override
  PagingState<int, ProductEntity> get pagingState;

  /// Create a copy of JustForYouState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JustForYouStateImplCopyWith<_$JustForYouStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
