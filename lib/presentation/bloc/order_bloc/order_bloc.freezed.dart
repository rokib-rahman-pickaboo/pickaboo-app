// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getOrders,
    required TResult Function() refresh,
    required TResult Function(String orderId) loadOrderDetails,
    required TResult Function(String orderId, String note, String reason)
    cancelOrder,
    required TResult Function(String orderId) reorder,
    required TResult Function() clearCancellation,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getOrders,
    TResult? Function()? refresh,
    TResult? Function(String orderId)? loadOrderDetails,
    TResult? Function(String orderId, String note, String reason)? cancelOrder,
    TResult? Function(String orderId)? reorder,
    TResult? Function()? clearCancellation,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getOrders,
    TResult Function()? refresh,
    TResult Function(String orderId)? loadOrderDetails,
    TResult Function(String orderId, String note, String reason)? cancelOrder,
    TResult Function(String orderId)? reorder,
    TResult Function()? clearCancellation,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOrders value) getOrders,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadOrderDetails value) loadOrderDetails,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_Reorder value) reorder,
    required TResult Function(_ClearCancellation value) clearCancellation,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOrders value)? getOrders,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadOrderDetails value)? loadOrderDetails,
    TResult? Function(_CancelOrder value)? cancelOrder,
    TResult? Function(_Reorder value)? reorder,
    TResult? Function(_ClearCancellation value)? clearCancellation,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOrders value)? getOrders,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadOrderDetails value)? loadOrderDetails,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_Reorder value)? reorder,
    TResult Function(_ClearCancellation value)? clearCancellation,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEventCopyWith<$Res> {
  factory $OrderEventCopyWith(
    OrderEvent value,
    $Res Function(OrderEvent) then,
  ) = _$OrderEventCopyWithImpl<$Res, OrderEvent>;
}

/// @nodoc
class _$OrderEventCopyWithImpl<$Res, $Val extends OrderEvent>
    implements $OrderEventCopyWith<$Res> {
  _$OrderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetOrdersImplCopyWith<$Res> {
  factory _$$GetOrdersImplCopyWith(
    _$GetOrdersImpl value,
    $Res Function(_$GetOrdersImpl) then,
  ) = __$$GetOrdersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetOrdersImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$GetOrdersImpl>
    implements _$$GetOrdersImplCopyWith<$Res> {
  __$$GetOrdersImplCopyWithImpl(
    _$GetOrdersImpl _value,
    $Res Function(_$GetOrdersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetOrdersImpl implements _GetOrders {
  const _$GetOrdersImpl();

  @override
  String toString() {
    return 'OrderEvent.getOrders()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetOrdersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getOrders,
    required TResult Function() refresh,
    required TResult Function(String orderId) loadOrderDetails,
    required TResult Function(String orderId, String note, String reason)
    cancelOrder,
    required TResult Function(String orderId) reorder,
    required TResult Function() clearCancellation,
  }) {
    return getOrders();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getOrders,
    TResult? Function()? refresh,
    TResult? Function(String orderId)? loadOrderDetails,
    TResult? Function(String orderId, String note, String reason)? cancelOrder,
    TResult? Function(String orderId)? reorder,
    TResult? Function()? clearCancellation,
  }) {
    return getOrders?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getOrders,
    TResult Function()? refresh,
    TResult Function(String orderId)? loadOrderDetails,
    TResult Function(String orderId, String note, String reason)? cancelOrder,
    TResult Function(String orderId)? reorder,
    TResult Function()? clearCancellation,
    required TResult orElse(),
  }) {
    if (getOrders != null) {
      return getOrders();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOrders value) getOrders,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadOrderDetails value) loadOrderDetails,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_Reorder value) reorder,
    required TResult Function(_ClearCancellation value) clearCancellation,
  }) {
    return getOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOrders value)? getOrders,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadOrderDetails value)? loadOrderDetails,
    TResult? Function(_CancelOrder value)? cancelOrder,
    TResult? Function(_Reorder value)? reorder,
    TResult? Function(_ClearCancellation value)? clearCancellation,
  }) {
    return getOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOrders value)? getOrders,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadOrderDetails value)? loadOrderDetails,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_Reorder value)? reorder,
    TResult Function(_ClearCancellation value)? clearCancellation,
    required TResult orElse(),
  }) {
    if (getOrders != null) {
      return getOrders(this);
    }
    return orElse();
  }
}

abstract class _GetOrders implements OrderEvent {
  const factory _GetOrders() = _$GetOrdersImpl;
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
    extends _$OrderEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
    _$RefreshImpl _value,
    $Res Function(_$RefreshImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'OrderEvent.refresh()';
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
    required TResult Function() getOrders,
    required TResult Function() refresh,
    required TResult Function(String orderId) loadOrderDetails,
    required TResult Function(String orderId, String note, String reason)
    cancelOrder,
    required TResult Function(String orderId) reorder,
    required TResult Function() clearCancellation,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getOrders,
    TResult? Function()? refresh,
    TResult? Function(String orderId)? loadOrderDetails,
    TResult? Function(String orderId, String note, String reason)? cancelOrder,
    TResult? Function(String orderId)? reorder,
    TResult? Function()? clearCancellation,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getOrders,
    TResult Function()? refresh,
    TResult Function(String orderId)? loadOrderDetails,
    TResult Function(String orderId, String note, String reason)? cancelOrder,
    TResult Function(String orderId)? reorder,
    TResult Function()? clearCancellation,
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
    required TResult Function(_GetOrders value) getOrders,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadOrderDetails value) loadOrderDetails,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_Reorder value) reorder,
    required TResult Function(_ClearCancellation value) clearCancellation,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOrders value)? getOrders,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadOrderDetails value)? loadOrderDetails,
    TResult? Function(_CancelOrder value)? cancelOrder,
    TResult? Function(_Reorder value)? reorder,
    TResult? Function(_ClearCancellation value)? clearCancellation,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOrders value)? getOrders,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadOrderDetails value)? loadOrderDetails,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_Reorder value)? reorder,
    TResult Function(_ClearCancellation value)? clearCancellation,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements OrderEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
abstract class _$$LoadOrderDetailsImplCopyWith<$Res> {
  factory _$$LoadOrderDetailsImplCopyWith(
    _$LoadOrderDetailsImpl value,
    $Res Function(_$LoadOrderDetailsImpl) then,
  ) = __$$LoadOrderDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId});
}

/// @nodoc
class __$$LoadOrderDetailsImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$LoadOrderDetailsImpl>
    implements _$$LoadOrderDetailsImplCopyWith<$Res> {
  __$$LoadOrderDetailsImplCopyWithImpl(
    _$LoadOrderDetailsImpl _value,
    $Res Function(_$LoadOrderDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null}) {
    return _then(
      _$LoadOrderDetailsImpl(
        null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadOrderDetailsImpl implements _LoadOrderDetails {
  const _$LoadOrderDetailsImpl(this.orderId);

  @override
  final String orderId;

  @override
  String toString() {
    return 'OrderEvent.loadOrderDetails(orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadOrderDetailsImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadOrderDetailsImplCopyWith<_$LoadOrderDetailsImpl> get copyWith =>
      __$$LoadOrderDetailsImplCopyWithImpl<_$LoadOrderDetailsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getOrders,
    required TResult Function() refresh,
    required TResult Function(String orderId) loadOrderDetails,
    required TResult Function(String orderId, String note, String reason)
    cancelOrder,
    required TResult Function(String orderId) reorder,
    required TResult Function() clearCancellation,
  }) {
    return loadOrderDetails(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getOrders,
    TResult? Function()? refresh,
    TResult? Function(String orderId)? loadOrderDetails,
    TResult? Function(String orderId, String note, String reason)? cancelOrder,
    TResult? Function(String orderId)? reorder,
    TResult? Function()? clearCancellation,
  }) {
    return loadOrderDetails?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getOrders,
    TResult Function()? refresh,
    TResult Function(String orderId)? loadOrderDetails,
    TResult Function(String orderId, String note, String reason)? cancelOrder,
    TResult Function(String orderId)? reorder,
    TResult Function()? clearCancellation,
    required TResult orElse(),
  }) {
    if (loadOrderDetails != null) {
      return loadOrderDetails(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOrders value) getOrders,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadOrderDetails value) loadOrderDetails,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_Reorder value) reorder,
    required TResult Function(_ClearCancellation value) clearCancellation,
  }) {
    return loadOrderDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOrders value)? getOrders,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadOrderDetails value)? loadOrderDetails,
    TResult? Function(_CancelOrder value)? cancelOrder,
    TResult? Function(_Reorder value)? reorder,
    TResult? Function(_ClearCancellation value)? clearCancellation,
  }) {
    return loadOrderDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOrders value)? getOrders,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadOrderDetails value)? loadOrderDetails,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_Reorder value)? reorder,
    TResult Function(_ClearCancellation value)? clearCancellation,
    required TResult orElse(),
  }) {
    if (loadOrderDetails != null) {
      return loadOrderDetails(this);
    }
    return orElse();
  }
}

abstract class _LoadOrderDetails implements OrderEvent {
  const factory _LoadOrderDetails(final String orderId) =
      _$LoadOrderDetailsImpl;

  String get orderId;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadOrderDetailsImplCopyWith<_$LoadOrderDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelOrderImplCopyWith<$Res> {
  factory _$$CancelOrderImplCopyWith(
    _$CancelOrderImpl value,
    $Res Function(_$CancelOrderImpl) then,
  ) = __$$CancelOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId, String note, String reason});
}

/// @nodoc
class __$$CancelOrderImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$CancelOrderImpl>
    implements _$$CancelOrderImplCopyWith<$Res> {
  __$$CancelOrderImplCopyWithImpl(
    _$CancelOrderImpl _value,
    $Res Function(_$CancelOrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? note = null,
    Object? reason = null,
  }) {
    return _then(
      _$CancelOrderImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
        note:
            null == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                    as String,
        reason:
            null == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$CancelOrderImpl implements _CancelOrder {
  const _$CancelOrderImpl({
    required this.orderId,
    required this.note,
    required this.reason,
  });

  @override
  final String orderId;
  @override
  final String note;
  @override
  final String reason;

  @override
  String toString() {
    return 'OrderEvent.cancelOrder(orderId: $orderId, note: $note, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelOrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, note, reason);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelOrderImplCopyWith<_$CancelOrderImpl> get copyWith =>
      __$$CancelOrderImplCopyWithImpl<_$CancelOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getOrders,
    required TResult Function() refresh,
    required TResult Function(String orderId) loadOrderDetails,
    required TResult Function(String orderId, String note, String reason)
    cancelOrder,
    required TResult Function(String orderId) reorder,
    required TResult Function() clearCancellation,
  }) {
    return cancelOrder(orderId, note, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getOrders,
    TResult? Function()? refresh,
    TResult? Function(String orderId)? loadOrderDetails,
    TResult? Function(String orderId, String note, String reason)? cancelOrder,
    TResult? Function(String orderId)? reorder,
    TResult? Function()? clearCancellation,
  }) {
    return cancelOrder?.call(orderId, note, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getOrders,
    TResult Function()? refresh,
    TResult Function(String orderId)? loadOrderDetails,
    TResult Function(String orderId, String note, String reason)? cancelOrder,
    TResult Function(String orderId)? reorder,
    TResult Function()? clearCancellation,
    required TResult orElse(),
  }) {
    if (cancelOrder != null) {
      return cancelOrder(orderId, note, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOrders value) getOrders,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadOrderDetails value) loadOrderDetails,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_Reorder value) reorder,
    required TResult Function(_ClearCancellation value) clearCancellation,
  }) {
    return cancelOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOrders value)? getOrders,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadOrderDetails value)? loadOrderDetails,
    TResult? Function(_CancelOrder value)? cancelOrder,
    TResult? Function(_Reorder value)? reorder,
    TResult? Function(_ClearCancellation value)? clearCancellation,
  }) {
    return cancelOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOrders value)? getOrders,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadOrderDetails value)? loadOrderDetails,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_Reorder value)? reorder,
    TResult Function(_ClearCancellation value)? clearCancellation,
    required TResult orElse(),
  }) {
    if (cancelOrder != null) {
      return cancelOrder(this);
    }
    return orElse();
  }
}

abstract class _CancelOrder implements OrderEvent {
  const factory _CancelOrder({
    required final String orderId,
    required final String note,
    required final String reason,
  }) = _$CancelOrderImpl;

  String get orderId;
  String get note;
  String get reason;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelOrderImplCopyWith<_$CancelOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReorderImplCopyWith<$Res> {
  factory _$$ReorderImplCopyWith(
    _$ReorderImpl value,
    $Res Function(_$ReorderImpl) then,
  ) = __$$ReorderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId});
}

/// @nodoc
class __$$ReorderImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$ReorderImpl>
    implements _$$ReorderImplCopyWith<$Res> {
  __$$ReorderImplCopyWithImpl(
    _$ReorderImpl _value,
    $Res Function(_$ReorderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null}) {
    return _then(
      _$ReorderImpl(
        null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ReorderImpl implements _Reorder {
  const _$ReorderImpl(this.orderId);

  @override
  final String orderId;

  @override
  String toString() {
    return 'OrderEvent.reorder(orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReorderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReorderImplCopyWith<_$ReorderImpl> get copyWith =>
      __$$ReorderImplCopyWithImpl<_$ReorderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getOrders,
    required TResult Function() refresh,
    required TResult Function(String orderId) loadOrderDetails,
    required TResult Function(String orderId, String note, String reason)
    cancelOrder,
    required TResult Function(String orderId) reorder,
    required TResult Function() clearCancellation,
  }) {
    return reorder(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getOrders,
    TResult? Function()? refresh,
    TResult? Function(String orderId)? loadOrderDetails,
    TResult? Function(String orderId, String note, String reason)? cancelOrder,
    TResult? Function(String orderId)? reorder,
    TResult? Function()? clearCancellation,
  }) {
    return reorder?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getOrders,
    TResult Function()? refresh,
    TResult Function(String orderId)? loadOrderDetails,
    TResult Function(String orderId, String note, String reason)? cancelOrder,
    TResult Function(String orderId)? reorder,
    TResult Function()? clearCancellation,
    required TResult orElse(),
  }) {
    if (reorder != null) {
      return reorder(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOrders value) getOrders,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadOrderDetails value) loadOrderDetails,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_Reorder value) reorder,
    required TResult Function(_ClearCancellation value) clearCancellation,
  }) {
    return reorder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOrders value)? getOrders,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadOrderDetails value)? loadOrderDetails,
    TResult? Function(_CancelOrder value)? cancelOrder,
    TResult? Function(_Reorder value)? reorder,
    TResult? Function(_ClearCancellation value)? clearCancellation,
  }) {
    return reorder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOrders value)? getOrders,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadOrderDetails value)? loadOrderDetails,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_Reorder value)? reorder,
    TResult Function(_ClearCancellation value)? clearCancellation,
    required TResult orElse(),
  }) {
    if (reorder != null) {
      return reorder(this);
    }
    return orElse();
  }
}

abstract class _Reorder implements OrderEvent {
  const factory _Reorder(final String orderId) = _$ReorderImpl;

  String get orderId;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReorderImplCopyWith<_$ReorderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearCancellationImplCopyWith<$Res> {
  factory _$$ClearCancellationImplCopyWith(
    _$ClearCancellationImpl value,
    $Res Function(_$ClearCancellationImpl) then,
  ) = __$$ClearCancellationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearCancellationImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$ClearCancellationImpl>
    implements _$$ClearCancellationImplCopyWith<$Res> {
  __$$ClearCancellationImplCopyWithImpl(
    _$ClearCancellationImpl _value,
    $Res Function(_$ClearCancellationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearCancellationImpl implements _ClearCancellation {
  const _$ClearCancellationImpl();

  @override
  String toString() {
    return 'OrderEvent.clearCancellation()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearCancellationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getOrders,
    required TResult Function() refresh,
    required TResult Function(String orderId) loadOrderDetails,
    required TResult Function(String orderId, String note, String reason)
    cancelOrder,
    required TResult Function(String orderId) reorder,
    required TResult Function() clearCancellation,
  }) {
    return clearCancellation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getOrders,
    TResult? Function()? refresh,
    TResult? Function(String orderId)? loadOrderDetails,
    TResult? Function(String orderId, String note, String reason)? cancelOrder,
    TResult? Function(String orderId)? reorder,
    TResult? Function()? clearCancellation,
  }) {
    return clearCancellation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getOrders,
    TResult Function()? refresh,
    TResult Function(String orderId)? loadOrderDetails,
    TResult Function(String orderId, String note, String reason)? cancelOrder,
    TResult Function(String orderId)? reorder,
    TResult Function()? clearCancellation,
    required TResult orElse(),
  }) {
    if (clearCancellation != null) {
      return clearCancellation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOrders value) getOrders,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_LoadOrderDetails value) loadOrderDetails,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_Reorder value) reorder,
    required TResult Function(_ClearCancellation value) clearCancellation,
  }) {
    return clearCancellation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOrders value)? getOrders,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_LoadOrderDetails value)? loadOrderDetails,
    TResult? Function(_CancelOrder value)? cancelOrder,
    TResult? Function(_Reorder value)? reorder,
    TResult? Function(_ClearCancellation value)? clearCancellation,
  }) {
    return clearCancellation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOrders value)? getOrders,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_LoadOrderDetails value)? loadOrderDetails,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_Reorder value)? reorder,
    TResult Function(_ClearCancellation value)? clearCancellation,
    required TResult orElse(),
  }) {
    if (clearCancellation != null) {
      return clearCancellation(this);
    }
    return orElse();
  }
}

abstract class _ClearCancellation implements OrderEvent {
  const factory _ClearCancellation() = _$ClearCancellationImpl;
}

/// @nodoc
mixin _$OrderState {
  PagingState<int, OrderItemEntity> get pagingState =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  OrderDetailEntity? get orderDetails => throw _privateConstructorUsedError;
  OrderCancelEntity? get cancelledOrder => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderStateCopyWith<OrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
    OrderState value,
    $Res Function(OrderState) then,
  ) = _$OrderStateCopyWithImpl<$Res, OrderState>;
  @useResult
  $Res call({
    PagingState<int, OrderItemEntity> pagingState,
    bool isLoading,
    OrderDetailEntity? orderDetails,
    OrderCancelEntity? cancelledOrder,
    String? successMessage,
    String? errorMessage,
  });
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagingState = null,
    Object? isLoading = null,
    Object? orderDetails = freezed,
    Object? cancelledOrder = freezed,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            pagingState:
                null == pagingState
                    ? _value.pagingState
                    : pagingState // ignore: cast_nullable_to_non_nullable
                        as PagingState<int, OrderItemEntity>,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            orderDetails:
                freezed == orderDetails
                    ? _value.orderDetails
                    : orderDetails // ignore: cast_nullable_to_non_nullable
                        as OrderDetailEntity?,
            cancelledOrder:
                freezed == cancelledOrder
                    ? _value.cancelledOrder
                    : cancelledOrder // ignore: cast_nullable_to_non_nullable
                        as OrderCancelEntity?,
            successMessage:
                freezed == successMessage
                    ? _value.successMessage
                    : successMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
            errorMessage:
                freezed == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderStateImplCopyWith<$Res>
    implements $OrderStateCopyWith<$Res> {
  factory _$$OrderStateImplCopyWith(
    _$OrderStateImpl value,
    $Res Function(_$OrderStateImpl) then,
  ) = __$$OrderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PagingState<int, OrderItemEntity> pagingState,
    bool isLoading,
    OrderDetailEntity? orderDetails,
    OrderCancelEntity? cancelledOrder,
    String? successMessage,
    String? errorMessage,
  });
}

/// @nodoc
class __$$OrderStateImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateImpl>
    implements _$$OrderStateImplCopyWith<$Res> {
  __$$OrderStateImplCopyWithImpl(
    _$OrderStateImpl _value,
    $Res Function(_$OrderStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagingState = null,
    Object? isLoading = null,
    Object? orderDetails = freezed,
    Object? cancelledOrder = freezed,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$OrderStateImpl(
        pagingState:
            null == pagingState
                ? _value.pagingState
                : pagingState // ignore: cast_nullable_to_non_nullable
                    as PagingState<int, OrderItemEntity>,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        orderDetails:
            freezed == orderDetails
                ? _value.orderDetails
                : orderDetails // ignore: cast_nullable_to_non_nullable
                    as OrderDetailEntity?,
        cancelledOrder:
            freezed == cancelledOrder
                ? _value.cancelledOrder
                : cancelledOrder // ignore: cast_nullable_to_non_nullable
                    as OrderCancelEntity?,
        successMessage:
            freezed == successMessage
                ? _value.successMessage
                : successMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
        errorMessage:
            freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$OrderStateImpl implements _OrderState {
  const _$OrderStateImpl({
    required this.pagingState,
    this.isLoading = false,
    this.orderDetails,
    this.cancelledOrder,
    this.successMessage,
    this.errorMessage,
  });

  @override
  final PagingState<int, OrderItemEntity> pagingState;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final OrderDetailEntity? orderDetails;
  @override
  final OrderCancelEntity? cancelledOrder;
  @override
  final String? successMessage;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'OrderState(pagingState: $pagingState, isLoading: $isLoading, orderDetails: $orderDetails, cancelledOrder: $cancelledOrder, successMessage: $successMessage, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateImpl &&
            (identical(other.pagingState, pagingState) ||
                other.pagingState == pagingState) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.orderDetails, orderDetails) ||
                other.orderDetails == orderDetails) &&
            (identical(other.cancelledOrder, cancelledOrder) ||
                other.cancelledOrder == cancelledOrder) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    pagingState,
    isLoading,
    orderDetails,
    cancelledOrder,
    successMessage,
    errorMessage,
  );

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      __$$OrderStateImplCopyWithImpl<_$OrderStateImpl>(this, _$identity);
}

abstract class _OrderState implements OrderState {
  const factory _OrderState({
    required final PagingState<int, OrderItemEntity> pagingState,
    final bool isLoading,
    final OrderDetailEntity? orderDetails,
    final OrderCancelEntity? cancelledOrder,
    final String? successMessage,
    final String? errorMessage,
  }) = _$OrderStateImpl;

  @override
  PagingState<int, OrderItemEntity> get pagingState;
  @override
  bool get isLoading;
  @override
  OrderDetailEntity? get orderDetails;
  @override
  OrderCancelEntity? get cancelledOrder;
  @override
  String? get successMessage;
  @override
  String? get errorMessage;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
