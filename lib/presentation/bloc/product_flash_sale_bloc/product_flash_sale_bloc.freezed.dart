// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_flash_sale_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProductFlashSaleEvent {
  String get slug => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String slug) fetch,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String slug)? fetch,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String slug)? fetch,
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

  /// Create a copy of ProductFlashSaleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductFlashSaleEventCopyWith<ProductFlashSaleEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFlashSaleEventCopyWith<$Res> {
  factory $ProductFlashSaleEventCopyWith(
    ProductFlashSaleEvent value,
    $Res Function(ProductFlashSaleEvent) then,
  ) = _$ProductFlashSaleEventCopyWithImpl<$Res, ProductFlashSaleEvent>;
  @useResult
  $Res call({String slug});
}

/// @nodoc
class _$ProductFlashSaleEventCopyWithImpl<
  $Res,
  $Val extends ProductFlashSaleEvent
>
    implements $ProductFlashSaleEventCopyWith<$Res> {
  _$ProductFlashSaleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductFlashSaleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? slug = null}) {
    return _then(
      _value.copyWith(
            slug:
                null == slug
                    ? _value.slug
                    : slug // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res>
    implements $ProductFlashSaleEventCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
    _$FetchImpl value,
    $Res Function(_$FetchImpl) then,
  ) = __$$FetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String slug});
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$ProductFlashSaleEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
    _$FetchImpl _value,
    $Res Function(_$FetchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductFlashSaleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? slug = null}) {
    return _then(
      _$FetchImpl(
        slug:
            null == slug
                ? _value.slug
                : slug // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({required this.slug});

  @override
  final String slug;

  @override
  String toString() {
    return 'ProductFlashSaleEvent.fetch(slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slug);

  /// Create a copy of ProductFlashSaleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String slug) fetch,
  }) {
    return fetch(slug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String slug)? fetch,
  }) {
    return fetch?.call(slug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String slug)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(slug);
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

abstract class _Fetch implements ProductFlashSaleEvent {
  const factory _Fetch({required final String slug}) = _$FetchImpl;

  @override
  String get slug;

  /// Create a copy of ProductFlashSaleEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductFlashSaleState {
  ProductFlashSaleStatus get status => throw _privateConstructorUsedError;
  AppErrorEntity? get error => throw _privateConstructorUsedError;
  ProductFlashSaleEntity? get flashSale => throw _privateConstructorUsedError;

  /// Create a copy of ProductFlashSaleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductFlashSaleStateCopyWith<ProductFlashSaleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFlashSaleStateCopyWith<$Res> {
  factory $ProductFlashSaleStateCopyWith(
    ProductFlashSaleState value,
    $Res Function(ProductFlashSaleState) then,
  ) = _$ProductFlashSaleStateCopyWithImpl<$Res, ProductFlashSaleState>;
  @useResult
  $Res call({
    ProductFlashSaleStatus status,
    AppErrorEntity? error,
    ProductFlashSaleEntity? flashSale,
  });
}

/// @nodoc
class _$ProductFlashSaleStateCopyWithImpl<
  $Res,
  $Val extends ProductFlashSaleState
>
    implements $ProductFlashSaleStateCopyWith<$Res> {
  _$ProductFlashSaleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductFlashSaleState
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
                        as ProductFlashSaleStatus,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as AppErrorEntity?,
            flashSale:
                freezed == flashSale
                    ? _value.flashSale
                    : flashSale // ignore: cast_nullable_to_non_nullable
                        as ProductFlashSaleEntity?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductFlashSaleStateImplCopyWith<$Res>
    implements $ProductFlashSaleStateCopyWith<$Res> {
  factory _$$ProductFlashSaleStateImplCopyWith(
    _$ProductFlashSaleStateImpl value,
    $Res Function(_$ProductFlashSaleStateImpl) then,
  ) = __$$ProductFlashSaleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ProductFlashSaleStatus status,
    AppErrorEntity? error,
    ProductFlashSaleEntity? flashSale,
  });
}

/// @nodoc
class __$$ProductFlashSaleStateImplCopyWithImpl<$Res>
    extends
        _$ProductFlashSaleStateCopyWithImpl<$Res, _$ProductFlashSaleStateImpl>
    implements _$$ProductFlashSaleStateImplCopyWith<$Res> {
  __$$ProductFlashSaleStateImplCopyWithImpl(
    _$ProductFlashSaleStateImpl _value,
    $Res Function(_$ProductFlashSaleStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductFlashSaleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? flashSale = freezed,
  }) {
    return _then(
      _$ProductFlashSaleStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as ProductFlashSaleStatus,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity?,
        flashSale:
            freezed == flashSale
                ? _value.flashSale
                : flashSale // ignore: cast_nullable_to_non_nullable
                    as ProductFlashSaleEntity?,
      ),
    );
  }
}

/// @nodoc

class _$ProductFlashSaleStateImpl implements _ProductFlashSaleState {
  const _$ProductFlashSaleStateImpl({
    this.status = ProductFlashSaleStatus.initial,
    this.error,
    this.flashSale,
  });

  @override
  @JsonKey()
  final ProductFlashSaleStatus status;
  @override
  final AppErrorEntity? error;
  @override
  final ProductFlashSaleEntity? flashSale;

  @override
  String toString() {
    return 'ProductFlashSaleState(status: $status, error: $error, flashSale: $flashSale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFlashSaleStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.flashSale, flashSale) ||
                other.flashSale == flashSale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error, flashSale);

  /// Create a copy of ProductFlashSaleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductFlashSaleStateImplCopyWith<_$ProductFlashSaleStateImpl>
  get copyWith =>
      __$$ProductFlashSaleStateImplCopyWithImpl<_$ProductFlashSaleStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ProductFlashSaleState implements ProductFlashSaleState {
  const factory _ProductFlashSaleState({
    final ProductFlashSaleStatus status,
    final AppErrorEntity? error,
    final ProductFlashSaleEntity? flashSale,
  }) = _$ProductFlashSaleStateImpl;

  @override
  ProductFlashSaleStatus get status;
  @override
  AppErrorEntity? get error;
  @override
  ProductFlashSaleEntity? get flashSale;

  /// Create a copy of ProductFlashSaleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductFlashSaleStateImplCopyWith<_$ProductFlashSaleStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
