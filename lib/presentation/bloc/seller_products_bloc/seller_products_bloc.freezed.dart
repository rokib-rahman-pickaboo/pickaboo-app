// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_products_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SellerProductsEvent {
  String get shopUrl => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String shopUrl) getProducts,
    required TResult Function(String shopUrl) refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String shopUrl)? getProducts,
    TResult? Function(String shopUrl)? refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String shopUrl)? getProducts,
    TResult Function(String shopUrl)? refresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProducts value) getProducts,
    required TResult Function(_Refresh value) refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProducts value)? getProducts,
    TResult? Function(_Refresh value)? refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProducts value)? getProducts,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of SellerProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellerProductsEventCopyWith<SellerProductsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerProductsEventCopyWith<$Res> {
  factory $SellerProductsEventCopyWith(
    SellerProductsEvent value,
    $Res Function(SellerProductsEvent) then,
  ) = _$SellerProductsEventCopyWithImpl<$Res, SellerProductsEvent>;
  @useResult
  $Res call({String shopUrl});
}

/// @nodoc
class _$SellerProductsEventCopyWithImpl<$Res, $Val extends SellerProductsEvent>
    implements $SellerProductsEventCopyWith<$Res> {
  _$SellerProductsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellerProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? shopUrl = null}) {
    return _then(
      _value.copyWith(
            shopUrl:
                null == shopUrl
                    ? _value.shopUrl
                    : shopUrl // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetProductsImplCopyWith<$Res>
    implements $SellerProductsEventCopyWith<$Res> {
  factory _$$GetProductsImplCopyWith(
    _$GetProductsImpl value,
    $Res Function(_$GetProductsImpl) then,
  ) = __$$GetProductsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String shopUrl});
}

/// @nodoc
class __$$GetProductsImplCopyWithImpl<$Res>
    extends _$SellerProductsEventCopyWithImpl<$Res, _$GetProductsImpl>
    implements _$$GetProductsImplCopyWith<$Res> {
  __$$GetProductsImplCopyWithImpl(
    _$GetProductsImpl _value,
    $Res Function(_$GetProductsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SellerProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? shopUrl = null}) {
    return _then(
      _$GetProductsImpl(
        shopUrl:
            null == shopUrl
                ? _value.shopUrl
                : shopUrl // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$GetProductsImpl implements _GetProducts {
  const _$GetProductsImpl({required this.shopUrl});

  @override
  final String shopUrl;

  @override
  String toString() {
    return 'SellerProductsEvent.getProducts(shopUrl: $shopUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductsImpl &&
            (identical(other.shopUrl, shopUrl) || other.shopUrl == shopUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shopUrl);

  /// Create a copy of SellerProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductsImplCopyWith<_$GetProductsImpl> get copyWith =>
      __$$GetProductsImplCopyWithImpl<_$GetProductsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String shopUrl) getProducts,
    required TResult Function(String shopUrl) refresh,
  }) {
    return getProducts(shopUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String shopUrl)? getProducts,
    TResult? Function(String shopUrl)? refresh,
  }) {
    return getProducts?.call(shopUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String shopUrl)? getProducts,
    TResult Function(String shopUrl)? refresh,
    required TResult orElse(),
  }) {
    if (getProducts != null) {
      return getProducts(shopUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProducts value) getProducts,
    required TResult Function(_Refresh value) refresh,
  }) {
    return getProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProducts value)? getProducts,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return getProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProducts value)? getProducts,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (getProducts != null) {
      return getProducts(this);
    }
    return orElse();
  }
}

abstract class _GetProducts implements SellerProductsEvent {
  const factory _GetProducts({required final String shopUrl}) =
      _$GetProductsImpl;

  @override
  String get shopUrl;

  /// Create a copy of SellerProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProductsImplCopyWith<_$GetProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res>
    implements $SellerProductsEventCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
    _$RefreshImpl value,
    $Res Function(_$RefreshImpl) then,
  ) = __$$RefreshImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String shopUrl});
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$SellerProductsEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
    _$RefreshImpl _value,
    $Res Function(_$RefreshImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SellerProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? shopUrl = null}) {
    return _then(
      _$RefreshImpl(
        shopUrl:
            null == shopUrl
                ? _value.shopUrl
                : shopUrl // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl({required this.shopUrl});

  @override
  final String shopUrl;

  @override
  String toString() {
    return 'SellerProductsEvent.refresh(shopUrl: $shopUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshImpl &&
            (identical(other.shopUrl, shopUrl) || other.shopUrl == shopUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shopUrl);

  /// Create a copy of SellerProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshImplCopyWith<_$RefreshImpl> get copyWith =>
      __$$RefreshImplCopyWithImpl<_$RefreshImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String shopUrl) getProducts,
    required TResult Function(String shopUrl) refresh,
  }) {
    return refresh(shopUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String shopUrl)? getProducts,
    TResult? Function(String shopUrl)? refresh,
  }) {
    return refresh?.call(shopUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String shopUrl)? getProducts,
    TResult Function(String shopUrl)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(shopUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProducts value) getProducts,
    required TResult Function(_Refresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProducts value)? getProducts,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProducts value)? getProducts,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements SellerProductsEvent {
  const factory _Refresh({required final String shopUrl}) = _$RefreshImpl;

  @override
  String get shopUrl;

  /// Create a copy of SellerProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshImplCopyWith<_$RefreshImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SellerProductsState {
  PagingState<int, ProductEntity> get pagingState =>
      throw _privateConstructorUsedError;
  SellerProductsEntity? get sellerData => throw _privateConstructorUsedError;

  /// Create a copy of SellerProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellerProductsStateCopyWith<SellerProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerProductsStateCopyWith<$Res> {
  factory $SellerProductsStateCopyWith(
    SellerProductsState value,
    $Res Function(SellerProductsState) then,
  ) = _$SellerProductsStateCopyWithImpl<$Res, SellerProductsState>;
  @useResult
  $Res call({
    PagingState<int, ProductEntity> pagingState,
    SellerProductsEntity? sellerData,
  });
}

/// @nodoc
class _$SellerProductsStateCopyWithImpl<$Res, $Val extends SellerProductsState>
    implements $SellerProductsStateCopyWith<$Res> {
  _$SellerProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellerProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pagingState = null, Object? sellerData = freezed}) {
    return _then(
      _value.copyWith(
            pagingState:
                null == pagingState
                    ? _value.pagingState
                    : pagingState // ignore: cast_nullable_to_non_nullable
                        as PagingState<int, ProductEntity>,
            sellerData:
                freezed == sellerData
                    ? _value.sellerData
                    : sellerData // ignore: cast_nullable_to_non_nullable
                        as SellerProductsEntity?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SellerProductsStateImplCopyWith<$Res>
    implements $SellerProductsStateCopyWith<$Res> {
  factory _$$SellerProductsStateImplCopyWith(
    _$SellerProductsStateImpl value,
    $Res Function(_$SellerProductsStateImpl) then,
  ) = __$$SellerProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PagingState<int, ProductEntity> pagingState,
    SellerProductsEntity? sellerData,
  });
}

/// @nodoc
class __$$SellerProductsStateImplCopyWithImpl<$Res>
    extends _$SellerProductsStateCopyWithImpl<$Res, _$SellerProductsStateImpl>
    implements _$$SellerProductsStateImplCopyWith<$Res> {
  __$$SellerProductsStateImplCopyWithImpl(
    _$SellerProductsStateImpl _value,
    $Res Function(_$SellerProductsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SellerProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pagingState = null, Object? sellerData = freezed}) {
    return _then(
      _$SellerProductsStateImpl(
        pagingState:
            null == pagingState
                ? _value.pagingState
                : pagingState // ignore: cast_nullable_to_non_nullable
                    as PagingState<int, ProductEntity>,
        sellerData:
            freezed == sellerData
                ? _value.sellerData
                : sellerData // ignore: cast_nullable_to_non_nullable
                    as SellerProductsEntity?,
      ),
    );
  }
}

/// @nodoc

class _$SellerProductsStateImpl implements _SellerProductsState {
  const _$SellerProductsStateImpl({required this.pagingState, this.sellerData});

  @override
  final PagingState<int, ProductEntity> pagingState;
  @override
  final SellerProductsEntity? sellerData;

  @override
  String toString() {
    return 'SellerProductsState(pagingState: $pagingState, sellerData: $sellerData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerProductsStateImpl &&
            (identical(other.pagingState, pagingState) ||
                other.pagingState == pagingState) &&
            (identical(other.sellerData, sellerData) ||
                other.sellerData == sellerData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pagingState, sellerData);

  /// Create a copy of SellerProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerProductsStateImplCopyWith<_$SellerProductsStateImpl> get copyWith =>
      __$$SellerProductsStateImplCopyWithImpl<_$SellerProductsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SellerProductsState implements SellerProductsState {
  const factory _SellerProductsState({
    required final PagingState<int, ProductEntity> pagingState,
    final SellerProductsEntity? sellerData,
  }) = _$SellerProductsStateImpl;

  @override
  PagingState<int, ProductEntity> get pagingState;
  @override
  SellerProductsEntity? get sellerData;

  /// Create a copy of SellerProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellerProductsStateImplCopyWith<_$SellerProductsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
