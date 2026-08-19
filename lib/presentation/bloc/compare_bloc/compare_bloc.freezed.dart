// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compare_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CompareEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(ProductDetailEntity product) add,
    required TResult Function(String productId) remove,
    required TResult Function() clear,
    required TResult Function() compare,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(ProductDetailEntity product)? add,
    TResult? Function(String productId)? remove,
    TResult? Function()? clear,
    TResult? Function()? compare,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(ProductDetailEntity product)? add,
    TResult Function(String productId)? remove,
    TResult Function()? clear,
    TResult Function()? compare,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Add value) add,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
    required TResult Function(_Compare value) compare,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Add value)? add,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_Compare value)? compare,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    TResult Function(_Compare value)? compare,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompareEventCopyWith<$Res> {
  factory $CompareEventCopyWith(
    CompareEvent value,
    $Res Function(CompareEvent) then,
  ) = _$CompareEventCopyWithImpl<$Res, CompareEvent>;
}

/// @nodoc
class _$CompareEventCopyWithImpl<$Res, $Val extends CompareEvent>
    implements $CompareEventCopyWith<$Res> {
  _$CompareEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompareEvent
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
    extends _$CompareEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
    : super(_value, _then);

  /// Create a copy of CompareEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl();

  @override
  String toString() {
    return 'CompareEvent.load()';
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
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(ProductDetailEntity product) add,
    required TResult Function(String productId) remove,
    required TResult Function() clear,
    required TResult Function() compare,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(ProductDetailEntity product)? add,
    TResult? Function(String productId)? remove,
    TResult? Function()? clear,
    TResult? Function()? compare,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(ProductDetailEntity product)? add,
    TResult Function(String productId)? remove,
    TResult Function()? clear,
    TResult Function()? compare,
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
    required TResult Function(_Add value) add,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
    required TResult Function(_Compare value) compare,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Add value)? add,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_Compare value)? compare,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    TResult Function(_Compare value)? compare,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements CompareEvent {
  const factory _Load() = _$LoadImpl;
}

/// @nodoc
abstract class _$$AddImplCopyWith<$Res> {
  factory _$$AddImplCopyWith(_$AddImpl value, $Res Function(_$AddImpl) then) =
      __$$AddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductDetailEntity product});
}

/// @nodoc
class __$$AddImplCopyWithImpl<$Res>
    extends _$CompareEventCopyWithImpl<$Res, _$AddImpl>
    implements _$$AddImplCopyWith<$Res> {
  __$$AddImplCopyWithImpl(_$AddImpl _value, $Res Function(_$AddImpl) _then)
    : super(_value, _then);

  /// Create a copy of CompareEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? product = null}) {
    return _then(
      _$AddImpl(
        product:
            null == product
                ? _value.product
                : product // ignore: cast_nullable_to_non_nullable
                    as ProductDetailEntity,
      ),
    );
  }
}

/// @nodoc

class _$AddImpl implements _Add {
  const _$AddImpl({required this.product});

  @override
  final ProductDetailEntity product;

  @override
  String toString() {
    return 'CompareEvent.add(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  /// Create a copy of CompareEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      __$$AddImplCopyWithImpl<_$AddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(ProductDetailEntity product) add,
    required TResult Function(String productId) remove,
    required TResult Function() clear,
    required TResult Function() compare,
  }) {
    return add(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(ProductDetailEntity product)? add,
    TResult? Function(String productId)? remove,
    TResult? Function()? clear,
    TResult? Function()? compare,
  }) {
    return add?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(ProductDetailEntity product)? add,
    TResult Function(String productId)? remove,
    TResult Function()? clear,
    TResult Function()? compare,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Add value) add,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
    required TResult Function(_Compare value) compare,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Add value)? add,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_Compare value)? compare,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    TResult Function(_Compare value)? compare,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _Add implements CompareEvent {
  const factory _Add({required final ProductDetailEntity product}) = _$AddImpl;

  ProductDetailEntity get product;

  /// Create a copy of CompareEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveImplCopyWith<$Res> {
  factory _$$RemoveImplCopyWith(
    _$RemoveImpl value,
    $Res Function(_$RemoveImpl) then,
  ) = __$$RemoveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String productId});
}

/// @nodoc
class __$$RemoveImplCopyWithImpl<$Res>
    extends _$CompareEventCopyWithImpl<$Res, _$RemoveImpl>
    implements _$$RemoveImplCopyWith<$Res> {
  __$$RemoveImplCopyWithImpl(
    _$RemoveImpl _value,
    $Res Function(_$RemoveImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CompareEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? productId = null}) {
    return _then(
      _$RemoveImpl(
        productId:
            null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$RemoveImpl implements _Remove {
  const _$RemoveImpl({required this.productId});

  @override
  final String productId;

  @override
  String toString() {
    return 'CompareEvent.remove(productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  /// Create a copy of CompareEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      __$$RemoveImplCopyWithImpl<_$RemoveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(ProductDetailEntity product) add,
    required TResult Function(String productId) remove,
    required TResult Function() clear,
    required TResult Function() compare,
  }) {
    return remove(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(ProductDetailEntity product)? add,
    TResult? Function(String productId)? remove,
    TResult? Function()? clear,
    TResult? Function()? compare,
  }) {
    return remove?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(ProductDetailEntity product)? add,
    TResult Function(String productId)? remove,
    TResult Function()? clear,
    TResult Function()? compare,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Add value) add,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
    required TResult Function(_Compare value) compare,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Add value)? add,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_Compare value)? compare,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    TResult Function(_Compare value)? compare,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _Remove implements CompareEvent {
  const factory _Remove({required final String productId}) = _$RemoveImpl;

  String get productId;

  /// Create a copy of CompareEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearImplCopyWith<$Res> {
  factory _$$ClearImplCopyWith(
    _$ClearImpl value,
    $Res Function(_$ClearImpl) then,
  ) = __$$ClearImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearImplCopyWithImpl<$Res>
    extends _$CompareEventCopyWithImpl<$Res, _$ClearImpl>
    implements _$$ClearImplCopyWith<$Res> {
  __$$ClearImplCopyWithImpl(
    _$ClearImpl _value,
    $Res Function(_$ClearImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CompareEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearImpl implements _Clear {
  const _$ClearImpl();

  @override
  String toString() {
    return 'CompareEvent.clear()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(ProductDetailEntity product) add,
    required TResult Function(String productId) remove,
    required TResult Function() clear,
    required TResult Function() compare,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(ProductDetailEntity product)? add,
    TResult? Function(String productId)? remove,
    TResult? Function()? clear,
    TResult? Function()? compare,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(ProductDetailEntity product)? add,
    TResult Function(String productId)? remove,
    TResult Function()? clear,
    TResult Function()? compare,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Add value) add,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
    required TResult Function(_Compare value) compare,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Add value)? add,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_Compare value)? compare,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    TResult Function(_Compare value)? compare,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements CompareEvent {
  const factory _Clear() = _$ClearImpl;
}

/// @nodoc
abstract class _$$CompareImplCopyWith<$Res> {
  factory _$$CompareImplCopyWith(
    _$CompareImpl value,
    $Res Function(_$CompareImpl) then,
  ) = __$$CompareImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompareImplCopyWithImpl<$Res>
    extends _$CompareEventCopyWithImpl<$Res, _$CompareImpl>
    implements _$$CompareImplCopyWith<$Res> {
  __$$CompareImplCopyWithImpl(
    _$CompareImpl _value,
    $Res Function(_$CompareImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CompareEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CompareImpl implements _Compare {
  const _$CompareImpl();

  @override
  String toString() {
    return 'CompareEvent.compare()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CompareImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(ProductDetailEntity product) add,
    required TResult Function(String productId) remove,
    required TResult Function() clear,
    required TResult Function() compare,
  }) {
    return compare();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(ProductDetailEntity product)? add,
    TResult? Function(String productId)? remove,
    TResult? Function()? clear,
    TResult? Function()? compare,
  }) {
    return compare?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(ProductDetailEntity product)? add,
    TResult Function(String productId)? remove,
    TResult Function()? clear,
    TResult Function()? compare,
    required TResult orElse(),
  }) {
    if (compare != null) {
      return compare();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Add value) add,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
    required TResult Function(_Compare value) compare,
  }) {
    return compare(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Add value)? add,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_Compare value)? compare,
  }) {
    return compare?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    TResult Function(_Compare value)? compare,
    required TResult orElse(),
  }) {
    if (compare != null) {
      return compare(this);
    }
    return orElse();
  }
}

abstract class _Compare implements CompareEvent {
  const factory _Compare() = _$CompareImpl;
}

/// @nodoc
mixin _$CompareState {
  List<ProductDetailEntity> get products => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductDetailEntity> products) initial,
    required TResult Function(List<ProductDetailEntity> products) loading,
    required TResult Function(List<ProductDetailEntity> products) updated,
    required TResult Function(List<ProductDetailEntity> products) comparing,
    required TResult Function(
      AppErrorEntity error,
      List<ProductDetailEntity> products,
    )
    error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductDetailEntity> products)? initial,
    TResult? Function(List<ProductDetailEntity> products)? loading,
    TResult? Function(List<ProductDetailEntity> products)? updated,
    TResult? Function(List<ProductDetailEntity> products)? comparing,
    TResult? Function(AppErrorEntity error, List<ProductDetailEntity> products)?
    error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductDetailEntity> products)? initial,
    TResult Function(List<ProductDetailEntity> products)? loading,
    TResult Function(List<ProductDetailEntity> products)? updated,
    TResult Function(List<ProductDetailEntity> products)? comparing,
    TResult Function(AppErrorEntity error, List<ProductDetailEntity> products)?
    error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Comparing value) comparing,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Comparing value)? comparing,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Updated value)? updated,
    TResult Function(_Comparing value)? comparing,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of CompareState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompareStateCopyWith<CompareState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompareStateCopyWith<$Res> {
  factory $CompareStateCopyWith(
    CompareState value,
    $Res Function(CompareState) then,
  ) = _$CompareStateCopyWithImpl<$Res, CompareState>;
  @useResult
  $Res call({List<ProductDetailEntity> products});
}

/// @nodoc
class _$CompareStateCopyWithImpl<$Res, $Val extends CompareState>
    implements $CompareStateCopyWith<$Res> {
  _$CompareStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompareState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? products = null}) {
    return _then(
      _value.copyWith(
            products:
                null == products
                    ? _value.products
                    : products // ignore: cast_nullable_to_non_nullable
                        as List<ProductDetailEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $CompareStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductDetailEntity> products});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CompareStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CompareState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? products = null}) {
    return _then(
      _$InitialImpl(
        products:
            null == products
                ? _value._products
                : products // ignore: cast_nullable_to_non_nullable
                    as List<ProductDetailEntity>,
      ),
    );
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({final List<ProductDetailEntity> products = const []})
    : _products = products;

  final List<ProductDetailEntity> _products;
  @override
  @JsonKey()
  List<ProductDetailEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'CompareState.initial(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  /// Create a copy of CompareState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductDetailEntity> products) initial,
    required TResult Function(List<ProductDetailEntity> products) loading,
    required TResult Function(List<ProductDetailEntity> products) updated,
    required TResult Function(List<ProductDetailEntity> products) comparing,
    required TResult Function(
      AppErrorEntity error,
      List<ProductDetailEntity> products,
    )
    error,
  }) {
    return initial(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductDetailEntity> products)? initial,
    TResult? Function(List<ProductDetailEntity> products)? loading,
    TResult? Function(List<ProductDetailEntity> products)? updated,
    TResult? Function(List<ProductDetailEntity> products)? comparing,
    TResult? Function(AppErrorEntity error, List<ProductDetailEntity> products)?
    error,
  }) {
    return initial?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductDetailEntity> products)? initial,
    TResult Function(List<ProductDetailEntity> products)? loading,
    TResult Function(List<ProductDetailEntity> products)? updated,
    TResult Function(List<ProductDetailEntity> products)? comparing,
    TResult Function(AppErrorEntity error, List<ProductDetailEntity> products)?
    error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Comparing value) comparing,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Comparing value)? comparing,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Updated value)? updated,
    TResult Function(_Comparing value)? comparing,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CompareState {
  const factory _Initial({final List<ProductDetailEntity> products}) =
      _$InitialImpl;

  @override
  List<ProductDetailEntity> get products;

  /// Create a copy of CompareState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $CompareStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductDetailEntity> products});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CompareStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CompareState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? products = null}) {
    return _then(
      _$LoadingImpl(
        products:
            null == products
                ? _value._products
                : products // ignore: cast_nullable_to_non_nullable
                    as List<ProductDetailEntity>,
      ),
    );
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl({final List<ProductDetailEntity> products = const []})
    : _products = products;

  final List<ProductDetailEntity> _products;
  @override
  @JsonKey()
  List<ProductDetailEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'CompareState.loading(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  /// Create a copy of CompareState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductDetailEntity> products) initial,
    required TResult Function(List<ProductDetailEntity> products) loading,
    required TResult Function(List<ProductDetailEntity> products) updated,
    required TResult Function(List<ProductDetailEntity> products) comparing,
    required TResult Function(
      AppErrorEntity error,
      List<ProductDetailEntity> products,
    )
    error,
  }) {
    return loading(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductDetailEntity> products)? initial,
    TResult? Function(List<ProductDetailEntity> products)? loading,
    TResult? Function(List<ProductDetailEntity> products)? updated,
    TResult? Function(List<ProductDetailEntity> products)? comparing,
    TResult? Function(AppErrorEntity error, List<ProductDetailEntity> products)?
    error,
  }) {
    return loading?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductDetailEntity> products)? initial,
    TResult Function(List<ProductDetailEntity> products)? loading,
    TResult Function(List<ProductDetailEntity> products)? updated,
    TResult Function(List<ProductDetailEntity> products)? comparing,
    TResult Function(AppErrorEntity error, List<ProductDetailEntity> products)?
    error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Comparing value) comparing,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Comparing value)? comparing,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Updated value)? updated,
    TResult Function(_Comparing value)? comparing,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CompareState {
  const factory _Loading({final List<ProductDetailEntity> products}) =
      _$LoadingImpl;

  @override
  List<ProductDetailEntity> get products;

  /// Create a copy of CompareState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatedImplCopyWith<$Res>
    implements $CompareStateCopyWith<$Res> {
  factory _$$UpdatedImplCopyWith(
    _$UpdatedImpl value,
    $Res Function(_$UpdatedImpl) then,
  ) = __$$UpdatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductDetailEntity> products});
}

/// @nodoc
class __$$UpdatedImplCopyWithImpl<$Res>
    extends _$CompareStateCopyWithImpl<$Res, _$UpdatedImpl>
    implements _$$UpdatedImplCopyWith<$Res> {
  __$$UpdatedImplCopyWithImpl(
    _$UpdatedImpl _value,
    $Res Function(_$UpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CompareState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? products = null}) {
    return _then(
      _$UpdatedImpl(
        products:
            null == products
                ? _value._products
                : products // ignore: cast_nullable_to_non_nullable
                    as List<ProductDetailEntity>,
      ),
    );
  }
}

/// @nodoc

class _$UpdatedImpl implements _Updated {
  const _$UpdatedImpl({required final List<ProductDetailEntity> products})
    : _products = products;

  final List<ProductDetailEntity> _products;
  @override
  List<ProductDetailEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'CompareState.updated(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatedImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  /// Create a copy of CompareState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatedImplCopyWith<_$UpdatedImpl> get copyWith =>
      __$$UpdatedImplCopyWithImpl<_$UpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductDetailEntity> products) initial,
    required TResult Function(List<ProductDetailEntity> products) loading,
    required TResult Function(List<ProductDetailEntity> products) updated,
    required TResult Function(List<ProductDetailEntity> products) comparing,
    required TResult Function(
      AppErrorEntity error,
      List<ProductDetailEntity> products,
    )
    error,
  }) {
    return updated(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductDetailEntity> products)? initial,
    TResult? Function(List<ProductDetailEntity> products)? loading,
    TResult? Function(List<ProductDetailEntity> products)? updated,
    TResult? Function(List<ProductDetailEntity> products)? comparing,
    TResult? Function(AppErrorEntity error, List<ProductDetailEntity> products)?
    error,
  }) {
    return updated?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductDetailEntity> products)? initial,
    TResult Function(List<ProductDetailEntity> products)? loading,
    TResult Function(List<ProductDetailEntity> products)? updated,
    TResult Function(List<ProductDetailEntity> products)? comparing,
    TResult Function(AppErrorEntity error, List<ProductDetailEntity> products)?
    error,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Comparing value) comparing,
    required TResult Function(_Error value) error,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Comparing value)? comparing,
    TResult? Function(_Error value)? error,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Updated value)? updated,
    TResult Function(_Comparing value)? comparing,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class _Updated implements CompareState {
  const factory _Updated({required final List<ProductDetailEntity> products}) =
      _$UpdatedImpl;

  @override
  List<ProductDetailEntity> get products;

  /// Create a copy of CompareState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatedImplCopyWith<_$UpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ComparingImplCopyWith<$Res>
    implements $CompareStateCopyWith<$Res> {
  factory _$$ComparingImplCopyWith(
    _$ComparingImpl value,
    $Res Function(_$ComparingImpl) then,
  ) = __$$ComparingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductDetailEntity> products});
}

/// @nodoc
class __$$ComparingImplCopyWithImpl<$Res>
    extends _$CompareStateCopyWithImpl<$Res, _$ComparingImpl>
    implements _$$ComparingImplCopyWith<$Res> {
  __$$ComparingImplCopyWithImpl(
    _$ComparingImpl _value,
    $Res Function(_$ComparingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CompareState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? products = null}) {
    return _then(
      _$ComparingImpl(
        products:
            null == products
                ? _value._products
                : products // ignore: cast_nullable_to_non_nullable
                    as List<ProductDetailEntity>,
      ),
    );
  }
}

/// @nodoc

class _$ComparingImpl implements _Comparing {
  const _$ComparingImpl({required final List<ProductDetailEntity> products})
    : _products = products;

  final List<ProductDetailEntity> _products;
  @override
  List<ProductDetailEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'CompareState.comparing(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComparingImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  /// Create a copy of CompareState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComparingImplCopyWith<_$ComparingImpl> get copyWith =>
      __$$ComparingImplCopyWithImpl<_$ComparingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductDetailEntity> products) initial,
    required TResult Function(List<ProductDetailEntity> products) loading,
    required TResult Function(List<ProductDetailEntity> products) updated,
    required TResult Function(List<ProductDetailEntity> products) comparing,
    required TResult Function(
      AppErrorEntity error,
      List<ProductDetailEntity> products,
    )
    error,
  }) {
    return comparing(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductDetailEntity> products)? initial,
    TResult? Function(List<ProductDetailEntity> products)? loading,
    TResult? Function(List<ProductDetailEntity> products)? updated,
    TResult? Function(List<ProductDetailEntity> products)? comparing,
    TResult? Function(AppErrorEntity error, List<ProductDetailEntity> products)?
    error,
  }) {
    return comparing?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductDetailEntity> products)? initial,
    TResult Function(List<ProductDetailEntity> products)? loading,
    TResult Function(List<ProductDetailEntity> products)? updated,
    TResult Function(List<ProductDetailEntity> products)? comparing,
    TResult Function(AppErrorEntity error, List<ProductDetailEntity> products)?
    error,
    required TResult orElse(),
  }) {
    if (comparing != null) {
      return comparing(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Comparing value) comparing,
    required TResult Function(_Error value) error,
  }) {
    return comparing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Comparing value)? comparing,
    TResult? Function(_Error value)? error,
  }) {
    return comparing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Updated value)? updated,
    TResult Function(_Comparing value)? comparing,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (comparing != null) {
      return comparing(this);
    }
    return orElse();
  }
}

abstract class _Comparing implements CompareState {
  const factory _Comparing({
    required final List<ProductDetailEntity> products,
  }) = _$ComparingImpl;

  @override
  List<ProductDetailEntity> get products;

  /// Create a copy of CompareState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComparingImplCopyWith<_$ComparingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $CompareStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppErrorEntity error, List<ProductDetailEntity> products});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$CompareStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CompareState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null, Object? products = null}) {
    return _then(
      _$ErrorImpl(
        error:
            null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity,
        products:
            null == products
                ? _value._products
                : products // ignore: cast_nullable_to_non_nullable
                    as List<ProductDetailEntity>,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({
    required this.error,
    required final List<ProductDetailEntity> products,
  }) : _products = products;

  @override
  final AppErrorEntity error;
  final List<ProductDetailEntity> _products;
  @override
  List<ProductDetailEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'CompareState.error(error: $error, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    error,
    const DeepCollectionEquality().hash(_products),
  );

  /// Create a copy of CompareState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductDetailEntity> products) initial,
    required TResult Function(List<ProductDetailEntity> products) loading,
    required TResult Function(List<ProductDetailEntity> products) updated,
    required TResult Function(List<ProductDetailEntity> products) comparing,
    required TResult Function(
      AppErrorEntity error,
      List<ProductDetailEntity> products,
    )
    error,
  }) {
    return error(this.error, products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductDetailEntity> products)? initial,
    TResult? Function(List<ProductDetailEntity> products)? loading,
    TResult? Function(List<ProductDetailEntity> products)? updated,
    TResult? Function(List<ProductDetailEntity> products)? comparing,
    TResult? Function(AppErrorEntity error, List<ProductDetailEntity> products)?
    error,
  }) {
    return error?.call(this.error, products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductDetailEntity> products)? initial,
    TResult Function(List<ProductDetailEntity> products)? loading,
    TResult Function(List<ProductDetailEntity> products)? updated,
    TResult Function(List<ProductDetailEntity> products)? comparing,
    TResult Function(AppErrorEntity error, List<ProductDetailEntity> products)?
    error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Comparing value) comparing,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Comparing value)? comparing,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Updated value)? updated,
    TResult Function(_Comparing value)? comparing,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CompareState {
  const factory _Error({
    required final AppErrorEntity error,
    required final List<ProductDetailEntity> products,
  }) = _$ErrorImpl;

  AppErrorEntity get error;
  @override
  List<ProductDetailEntity> get products;

  /// Create a copy of CompareState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
