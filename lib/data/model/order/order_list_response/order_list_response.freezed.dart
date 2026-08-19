// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderListResponse _$OrderListResponseFromJson(Map<String, dynamic> json) {
  return _OrderListResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderListResponse {
  @JsonKey(name: 'customer_id')
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_orders_count')
  int? get totalOrdersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'items')
  List<OrderItemModel>? get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_history')
  dynamic get statusHistory => throw _privateConstructorUsedError;

  /// Serializes this OrderListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderListResponseCopyWith<OrderListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderListResponseCopyWith<$Res> {
  factory $OrderListResponseCopyWith(
    OrderListResponse value,
    $Res Function(OrderListResponse) then,
  ) = _$OrderListResponseCopyWithImpl<$Res, OrderListResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'customer_id') int? customerId,
    @JsonKey(name: 'total_orders_count') int? totalOrdersCount,
    @JsonKey(name: 'items') List<OrderItemModel>? items,
    @JsonKey(name: 'status_history') dynamic statusHistory,
  });
}

/// @nodoc
class _$OrderListResponseCopyWithImpl<$Res, $Val extends OrderListResponse>
    implements $OrderListResponseCopyWith<$Res> {
  _$OrderListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? totalOrdersCount = freezed,
    Object? items = freezed,
    Object? statusHistory = freezed,
  }) {
    return _then(
      _value.copyWith(
            customerId:
                freezed == customerId
                    ? _value.customerId
                    : customerId // ignore: cast_nullable_to_non_nullable
                        as int?,
            totalOrdersCount:
                freezed == totalOrdersCount
                    ? _value.totalOrdersCount
                    : totalOrdersCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            items:
                freezed == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<OrderItemModel>?,
            statusHistory:
                freezed == statusHistory
                    ? _value.statusHistory
                    : statusHistory // ignore: cast_nullable_to_non_nullable
                        as dynamic,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderListResponseImplCopyWith<$Res>
    implements $OrderListResponseCopyWith<$Res> {
  factory _$$OrderListResponseImplCopyWith(
    _$OrderListResponseImpl value,
    $Res Function(_$OrderListResponseImpl) then,
  ) = __$$OrderListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'customer_id') int? customerId,
    @JsonKey(name: 'total_orders_count') int? totalOrdersCount,
    @JsonKey(name: 'items') List<OrderItemModel>? items,
    @JsonKey(name: 'status_history') dynamic statusHistory,
  });
}

/// @nodoc
class __$$OrderListResponseImplCopyWithImpl<$Res>
    extends _$OrderListResponseCopyWithImpl<$Res, _$OrderListResponseImpl>
    implements _$$OrderListResponseImplCopyWith<$Res> {
  __$$OrderListResponseImplCopyWithImpl(
    _$OrderListResponseImpl _value,
    $Res Function(_$OrderListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? totalOrdersCount = freezed,
    Object? items = freezed,
    Object? statusHistory = freezed,
  }) {
    return _then(
      _$OrderListResponseImpl(
        customerId:
            freezed == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                    as int?,
        totalOrdersCount:
            freezed == totalOrdersCount
                ? _value.totalOrdersCount
                : totalOrdersCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        items:
            freezed == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<OrderItemModel>?,
        statusHistory:
            freezed == statusHistory
                ? _value.statusHistory
                : statusHistory // ignore: cast_nullable_to_non_nullable
                    as dynamic,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderListResponseImpl implements _OrderListResponse {
  const _$OrderListResponseImpl({
    @JsonKey(name: 'customer_id') this.customerId,
    @JsonKey(name: 'total_orders_count') this.totalOrdersCount,
    @JsonKey(name: 'items') final List<OrderItemModel>? items,
    @JsonKey(name: 'status_history') this.statusHistory,
  }) : _items = items;

  factory _$OrderListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderListResponseImplFromJson(json);

  @override
  @JsonKey(name: 'customer_id')
  final int? customerId;
  @override
  @JsonKey(name: 'total_orders_count')
  final int? totalOrdersCount;
  final List<OrderItemModel>? _items;
  @override
  @JsonKey(name: 'items')
  List<OrderItemModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'status_history')
  final dynamic statusHistory;

  @override
  String toString() {
    return 'OrderListResponse(customerId: $customerId, totalOrdersCount: $totalOrdersCount, items: $items, statusHistory: $statusHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderListResponseImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.totalOrdersCount, totalOrdersCount) ||
                other.totalOrdersCount == totalOrdersCount) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(
              other.statusHistory,
              statusHistory,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    customerId,
    totalOrdersCount,
    const DeepCollectionEquality().hash(_items),
    const DeepCollectionEquality().hash(statusHistory),
  );

  /// Create a copy of OrderListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderListResponseImplCopyWith<_$OrderListResponseImpl> get copyWith =>
      __$$OrderListResponseImplCopyWithImpl<_$OrderListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderListResponseImplToJson(this);
  }
}

abstract class _OrderListResponse implements OrderListResponse {
  const factory _OrderListResponse({
    @JsonKey(name: 'customer_id') final int? customerId,
    @JsonKey(name: 'total_orders_count') final int? totalOrdersCount,
    @JsonKey(name: 'items') final List<OrderItemModel>? items,
    @JsonKey(name: 'status_history') final dynamic statusHistory,
  }) = _$OrderListResponseImpl;

  factory _OrderListResponse.fromJson(Map<String, dynamic> json) =
      _$OrderListResponseImpl.fromJson;

  @override
  @JsonKey(name: 'customer_id')
  int? get customerId;
  @override
  @JsonKey(name: 'total_orders_count')
  int? get totalOrdersCount;
  @override
  @JsonKey(name: 'items')
  List<OrderItemModel>? get items;
  @override
  @JsonKey(name: 'status_history')
  dynamic get statusHistory;

  /// Create a copy of OrderListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderListResponseImplCopyWith<_$OrderListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) {
  return _OrderItemModel.fromJson(json);
}

/// @nodoc
mixin _$OrderItemModel {
  @JsonKey(name: 'order_id')
  int? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  String? get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal')
  double? get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_amount')
  double? get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping')
  double? get shipping => throw _privateConstructorUsedError;
  @JsonKey(name: 'grandtotal')
  double? get grandtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_code')
  String? get currencyCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'remote_ip')
  String? get remoteIp => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_mode')
  String? get paymentMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String? get paymentMethod => throw _privateConstructorUsedError;

  /// Serializes this OrderItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemModelCopyWith<OrderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemModelCopyWith<$Res> {
  factory $OrderItemModelCopyWith(
    OrderItemModel value,
    $Res Function(OrderItemModel) then,
  ) = _$OrderItemModelCopyWithImpl<$Res, OrderItemModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'order_id') int? orderId,
    @JsonKey(name: 'order_number') String? orderNumber,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'state') String? state,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'subtotal') double? subtotal,
    @JsonKey(name: 'discount_amount') double? discountAmount,
    @JsonKey(name: 'shipping') double? shipping,
    @JsonKey(name: 'grandtotal') double? grandtotal,
    @JsonKey(name: 'currency_code') String? currencyCode,
    @JsonKey(name: 'remote_ip') String? remoteIp,
    @JsonKey(name: 'payment_mode') String? paymentMode,
    @JsonKey(name: 'payment_method') String? paymentMethod,
  });
}

/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res, $Val extends OrderItemModel>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? orderNumber = freezed,
    Object? createdAt = freezed,
    Object? state = freezed,
    Object? status = freezed,
    Object? subtotal = freezed,
    Object? discountAmount = freezed,
    Object? shipping = freezed,
    Object? grandtotal = freezed,
    Object? currencyCode = freezed,
    Object? remoteIp = freezed,
    Object? paymentMode = freezed,
    Object? paymentMethod = freezed,
  }) {
    return _then(
      _value.copyWith(
            orderId:
                freezed == orderId
                    ? _value.orderId
                    : orderId // ignore: cast_nullable_to_non_nullable
                        as int?,
            orderNumber:
                freezed == orderNumber
                    ? _value.orderNumber
                    : orderNumber // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            state:
                freezed == state
                    ? _value.state
                    : state // ignore: cast_nullable_to_non_nullable
                        as String?,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String?,
            subtotal:
                freezed == subtotal
                    ? _value.subtotal
                    : subtotal // ignore: cast_nullable_to_non_nullable
                        as double?,
            discountAmount:
                freezed == discountAmount
                    ? _value.discountAmount
                    : discountAmount // ignore: cast_nullable_to_non_nullable
                        as double?,
            shipping:
                freezed == shipping
                    ? _value.shipping
                    : shipping // ignore: cast_nullable_to_non_nullable
                        as double?,
            grandtotal:
                freezed == grandtotal
                    ? _value.grandtotal
                    : grandtotal // ignore: cast_nullable_to_non_nullable
                        as double?,
            currencyCode:
                freezed == currencyCode
                    ? _value.currencyCode
                    : currencyCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            remoteIp:
                freezed == remoteIp
                    ? _value.remoteIp
                    : remoteIp // ignore: cast_nullable_to_non_nullable
                        as String?,
            paymentMode:
                freezed == paymentMode
                    ? _value.paymentMode
                    : paymentMode // ignore: cast_nullable_to_non_nullable
                        as String?,
            paymentMethod:
                freezed == paymentMethod
                    ? _value.paymentMethod
                    : paymentMethod // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderItemModelImplCopyWith<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  factory _$$OrderItemModelImplCopyWith(
    _$OrderItemModelImpl value,
    $Res Function(_$OrderItemModelImpl) then,
  ) = __$$OrderItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'order_id') int? orderId,
    @JsonKey(name: 'order_number') String? orderNumber,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'state') String? state,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'subtotal') double? subtotal,
    @JsonKey(name: 'discount_amount') double? discountAmount,
    @JsonKey(name: 'shipping') double? shipping,
    @JsonKey(name: 'grandtotal') double? grandtotal,
    @JsonKey(name: 'currency_code') String? currencyCode,
    @JsonKey(name: 'remote_ip') String? remoteIp,
    @JsonKey(name: 'payment_mode') String? paymentMode,
    @JsonKey(name: 'payment_method') String? paymentMethod,
  });
}

/// @nodoc
class __$$OrderItemModelImplCopyWithImpl<$Res>
    extends _$OrderItemModelCopyWithImpl<$Res, _$OrderItemModelImpl>
    implements _$$OrderItemModelImplCopyWith<$Res> {
  __$$OrderItemModelImplCopyWithImpl(
    _$OrderItemModelImpl _value,
    $Res Function(_$OrderItemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? orderNumber = freezed,
    Object? createdAt = freezed,
    Object? state = freezed,
    Object? status = freezed,
    Object? subtotal = freezed,
    Object? discountAmount = freezed,
    Object? shipping = freezed,
    Object? grandtotal = freezed,
    Object? currencyCode = freezed,
    Object? remoteIp = freezed,
    Object? paymentMode = freezed,
    Object? paymentMethod = freezed,
  }) {
    return _then(
      _$OrderItemModelImpl(
        orderId:
            freezed == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as int?,
        orderNumber:
            freezed == orderNumber
                ? _value.orderNumber
                : orderNumber // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        state:
            freezed == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                    as String?,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String?,
        subtotal:
            freezed == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                    as double?,
        discountAmount:
            freezed == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                    as double?,
        shipping:
            freezed == shipping
                ? _value.shipping
                : shipping // ignore: cast_nullable_to_non_nullable
                    as double?,
        grandtotal:
            freezed == grandtotal
                ? _value.grandtotal
                : grandtotal // ignore: cast_nullable_to_non_nullable
                    as double?,
        currencyCode:
            freezed == currencyCode
                ? _value.currencyCode
                : currencyCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        remoteIp:
            freezed == remoteIp
                ? _value.remoteIp
                : remoteIp // ignore: cast_nullable_to_non_nullable
                    as String?,
        paymentMode:
            freezed == paymentMode
                ? _value.paymentMode
                : paymentMode // ignore: cast_nullable_to_non_nullable
                    as String?,
        paymentMethod:
            freezed == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemModelImpl implements _OrderItemModel {
  const _$OrderItemModelImpl({
    @JsonKey(name: 'order_id') this.orderId,
    @JsonKey(name: 'order_number') this.orderNumber,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'state') this.state,
    @JsonKey(name: 'status') this.status,
    @JsonKey(name: 'subtotal') this.subtotal,
    @JsonKey(name: 'discount_amount') this.discountAmount,
    @JsonKey(name: 'shipping') this.shipping,
    @JsonKey(name: 'grandtotal') this.grandtotal,
    @JsonKey(name: 'currency_code') this.currencyCode,
    @JsonKey(name: 'remote_ip') this.remoteIp,
    @JsonKey(name: 'payment_mode') this.paymentMode,
    @JsonKey(name: 'payment_method') this.paymentMethod,
  });

  factory _$OrderItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemModelImplFromJson(json);

  @override
  @JsonKey(name: 'order_id')
  final int? orderId;
  @override
  @JsonKey(name: 'order_number')
  final String? orderNumber;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'state')
  final String? state;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'subtotal')
  final double? subtotal;
  @override
  @JsonKey(name: 'discount_amount')
  final double? discountAmount;
  @override
  @JsonKey(name: 'shipping')
  final double? shipping;
  @override
  @JsonKey(name: 'grandtotal')
  final double? grandtotal;
  @override
  @JsonKey(name: 'currency_code')
  final String? currencyCode;
  @override
  @JsonKey(name: 'remote_ip')
  final String? remoteIp;
  @override
  @JsonKey(name: 'payment_mode')
  final String? paymentMode;
  @override
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;

  @override
  String toString() {
    return 'OrderItemModel(orderId: $orderId, orderNumber: $orderNumber, createdAt: $createdAt, state: $state, status: $status, subtotal: $subtotal, discountAmount: $discountAmount, shipping: $shipping, grandtotal: $grandtotal, currencyCode: $currencyCode, remoteIp: $remoteIp, paymentMode: $paymentMode, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemModelImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            (identical(other.grandtotal, grandtotal) ||
                other.grandtotal == grandtotal) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.remoteIp, remoteIp) ||
                other.remoteIp == remoteIp) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    orderId,
    orderNumber,
    createdAt,
    state,
    status,
    subtotal,
    discountAmount,
    shipping,
    grandtotal,
    currencyCode,
    remoteIp,
    paymentMode,
    paymentMethod,
  );

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      __$$OrderItemModelImplCopyWithImpl<_$OrderItemModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemModelImplToJson(this);
  }
}

abstract class _OrderItemModel implements OrderItemModel {
  const factory _OrderItemModel({
    @JsonKey(name: 'order_id') final int? orderId,
    @JsonKey(name: 'order_number') final String? orderNumber,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'state') final String? state,
    @JsonKey(name: 'status') final String? status,
    @JsonKey(name: 'subtotal') final double? subtotal,
    @JsonKey(name: 'discount_amount') final double? discountAmount,
    @JsonKey(name: 'shipping') final double? shipping,
    @JsonKey(name: 'grandtotal') final double? grandtotal,
    @JsonKey(name: 'currency_code') final String? currencyCode,
    @JsonKey(name: 'remote_ip') final String? remoteIp,
    @JsonKey(name: 'payment_mode') final String? paymentMode,
    @JsonKey(name: 'payment_method') final String? paymentMethod,
  }) = _$OrderItemModelImpl;

  factory _OrderItemModel.fromJson(Map<String, dynamic> json) =
      _$OrderItemModelImpl.fromJson;

  @override
  @JsonKey(name: 'order_id')
  int? get orderId;
  @override
  @JsonKey(name: 'order_number')
  String? get orderNumber;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'state')
  String? get state;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'subtotal')
  double? get subtotal;
  @override
  @JsonKey(name: 'discount_amount')
  double? get discountAmount;
  @override
  @JsonKey(name: 'shipping')
  double? get shipping;
  @override
  @JsonKey(name: 'grandtotal')
  double? get grandtotal;
  @override
  @JsonKey(name: 'currency_code')
  String? get currencyCode;
  @override
  @JsonKey(name: 'remote_ip')
  String? get remoteIp;
  @override
  @JsonKey(name: 'payment_mode')
  String? get paymentMode;
  @override
  @JsonKey(name: 'payment_method')
  String? get paymentMethod;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
