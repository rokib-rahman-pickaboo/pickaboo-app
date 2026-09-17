// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderDetailResponse _$OrderDetailResponseFromJson(Map<String, dynamic> json) {
  return _OrderDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailResponse {
  @JsonKey(name: "order_id")
  int? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: "order_number")
  String? get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_id")
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(
    name: "created_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "state")
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "items")
  List<OrderItemDetailModel>? get items => throw _privateConstructorUsedError;
  @JsonKey(name: "coupon_code")
  String? get couponCode => throw _privateConstructorUsedError;
  @JsonKey(name: "spent_reward_points")
  String? get spentRewardPoints => throw _privateConstructorUsedError;
  @JsonKey(name: "order_summary")
  OrderSummaryDetailModel? get orderSummary =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_address")
  List<ShippingAddressModel>? get shippingAddress =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "payment_address")
  List<PaymentAddressModel>? get paymentAddress =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_method")
  String? get shippingMethod => throw _privateConstructorUsedError;
  @JsonKey(name: "remote_ip")
  String? get remoteIp => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_method")
  String? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(
    name: "payment_information",
    fromJson: safePaymentInformationFromJson,
    toJson: safePaymentInformationToJson,
  )
  List<PaymentInfoModel>? get paymentInformation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "just_for_you")
  Object? get justForYou => throw _privateConstructorUsedError;
  @JsonKey(name: "status_history")
  List<StatusHistoryModel>? get statusHistory =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "status_label")
  List<StatusLabel>? get statusLabel => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_name")
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_email")
  String? get customerEmail => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_phone")
  String? get customerPhone => throw _privateConstructorUsedError;
  @JsonKey(name: "convenience_fee")
  num? get convenienceFee => throw _privateConstructorUsedError;
  @JsonKey(name: "convenience_fee_percent")
  String? get convenienceFeePercent => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_mode")
  String? get paymentMode => throw _privateConstructorUsedError;
  @JsonKey(name: "emi_tenure")
  dynamic get emiTenure => throw _privateConstructorUsedError;
  @JsonKey(name: "emi_bank")
  String? get emiBank => throw _privateConstructorUsedError;
  @JsonKey(name: "bank_name")
  String? get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: "tenure")
  dynamic get tenure => throw _privateConstructorUsedError;

  /// Serializes this OrderDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailResponseCopyWith<OrderDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailResponseCopyWith<$Res> {
  factory $OrderDetailResponseCopyWith(
    OrderDetailResponse value,
    $Res Function(OrderDetailResponse) then,
  ) = _$OrderDetailResponseCopyWithImpl<$Res, OrderDetailResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "order_id") int? orderId,
    @JsonKey(name: "order_number") String? orderNumber,
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    DateTime? createdAt,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "items") List<OrderItemDetailModel>? items,
    @JsonKey(name: "coupon_code") String? couponCode,
    @JsonKey(name: "spent_reward_points") String? spentRewardPoints,
    @JsonKey(name: "order_summary") OrderSummaryDetailModel? orderSummary,
    @JsonKey(name: "shipping_address")
    List<ShippingAddressModel>? shippingAddress,
    @JsonKey(name: "payment_address") List<PaymentAddressModel>? paymentAddress,
    @JsonKey(name: "shipping_method") String? shippingMethod,
    @JsonKey(name: "remote_ip") String? remoteIp,
    @JsonKey(name: "payment_method") String? paymentMethod,
    @JsonKey(
      name: "payment_information",
      fromJson: safePaymentInformationFromJson,
      toJson: safePaymentInformationToJson,
    )
    List<PaymentInfoModel>? paymentInformation,
    @JsonKey(name: "just_for_you") Object? justForYou,
    @JsonKey(name: "status_history") List<StatusHistoryModel>? statusHistory,
    @JsonKey(name: "status_label") List<StatusLabel>? statusLabel,
    @JsonKey(name: "customer_name") String? customerName,
    @JsonKey(name: "customer_email") String? customerEmail,
    @JsonKey(name: "customer_phone") String? customerPhone,
    @JsonKey(name: "convenience_fee") num? convenienceFee,
    @JsonKey(name: "convenience_fee_percent") String? convenienceFeePercent,
    @JsonKey(name: "payment_mode") String? paymentMode,
    @JsonKey(name: "emi_tenure") dynamic emiTenure,
    @JsonKey(name: "emi_bank") String? emiBank,
    @JsonKey(name: "bank_name") String? bankName,
    @JsonKey(name: "tenure") dynamic tenure,
  });

  $OrderSummaryDetailModelCopyWith<$Res>? get orderSummary;
}

/// @nodoc
class _$OrderDetailResponseCopyWithImpl<$Res, $Val extends OrderDetailResponse>
    implements $OrderDetailResponseCopyWith<$Res> {
  _$OrderDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? orderNumber = freezed,
    Object? customerId = freezed,
    Object? createdAt = freezed,
    Object? state = freezed,
    Object? status = freezed,
    Object? items = freezed,
    Object? couponCode = freezed,
    Object? spentRewardPoints = freezed,
    Object? orderSummary = freezed,
    Object? shippingAddress = freezed,
    Object? paymentAddress = freezed,
    Object? shippingMethod = freezed,
    Object? remoteIp = freezed,
    Object? paymentMethod = freezed,
    Object? paymentInformation = freezed,
    Object? justForYou = freezed,
    Object? statusHistory = freezed,
    Object? statusLabel = freezed,
    Object? customerName = freezed,
    Object? customerEmail = freezed,
    Object? customerPhone = freezed,
    Object? convenienceFee = freezed,
    Object? convenienceFeePercent = freezed,
    Object? paymentMode = freezed,
    Object? emiTenure = freezed,
    Object? emiBank = freezed,
    Object? bankName = freezed,
    Object? tenure = freezed,
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
            customerId:
                freezed == customerId
                    ? _value.customerId
                    : customerId // ignore: cast_nullable_to_non_nullable
                        as int?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
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
            items:
                freezed == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<OrderItemDetailModel>?,
            couponCode:
                freezed == couponCode
                    ? _value.couponCode
                    : couponCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            spentRewardPoints:
                freezed == spentRewardPoints
                    ? _value.spentRewardPoints
                    : spentRewardPoints // ignore: cast_nullable_to_non_nullable
                        as String?,
            orderSummary:
                freezed == orderSummary
                    ? _value.orderSummary
                    : orderSummary // ignore: cast_nullable_to_non_nullable
                        as OrderSummaryDetailModel?,
            shippingAddress:
                freezed == shippingAddress
                    ? _value.shippingAddress
                    : shippingAddress // ignore: cast_nullable_to_non_nullable
                        as List<ShippingAddressModel>?,
            paymentAddress:
                freezed == paymentAddress
                    ? _value.paymentAddress
                    : paymentAddress // ignore: cast_nullable_to_non_nullable
                        as List<PaymentAddressModel>?,
            shippingMethod:
                freezed == shippingMethod
                    ? _value.shippingMethod
                    : shippingMethod // ignore: cast_nullable_to_non_nullable
                        as String?,
            remoteIp:
                freezed == remoteIp
                    ? _value.remoteIp
                    : remoteIp // ignore: cast_nullable_to_non_nullable
                        as String?,
            paymentMethod:
                freezed == paymentMethod
                    ? _value.paymentMethod
                    : paymentMethod // ignore: cast_nullable_to_non_nullable
                        as String?,
            paymentInformation:
                freezed == paymentInformation
                    ? _value.paymentInformation
                    : paymentInformation // ignore: cast_nullable_to_non_nullable
                        as List<PaymentInfoModel>?,
            justForYou: freezed == justForYou ? _value.justForYou : justForYou,
            statusHistory:
                freezed == statusHistory
                    ? _value.statusHistory
                    : statusHistory // ignore: cast_nullable_to_non_nullable
                        as List<StatusHistoryModel>?,
            statusLabel:
                freezed == statusLabel
                    ? _value.statusLabel
                    : statusLabel // ignore: cast_nullable_to_non_nullable
                        as List<StatusLabel>?,
            customerName:
                freezed == customerName
                    ? _value.customerName
                    : customerName // ignore: cast_nullable_to_non_nullable
                        as String?,
            customerEmail:
                freezed == customerEmail
                    ? _value.customerEmail
                    : customerEmail // ignore: cast_nullable_to_non_nullable
                        as String?,
            customerPhone:
                freezed == customerPhone
                    ? _value.customerPhone
                    : customerPhone // ignore: cast_nullable_to_non_nullable
                        as String?,
            convenienceFee:
                freezed == convenienceFee
                    ? _value.convenienceFee
                    : convenienceFee // ignore: cast_nullable_to_non_nullable
                        as num?,
            convenienceFeePercent:
                freezed == convenienceFeePercent
                    ? _value.convenienceFeePercent
                    : convenienceFeePercent // ignore: cast_nullable_to_non_nullable
                        as String?,
            paymentMode:
                freezed == paymentMode
                    ? _value.paymentMode
                    : paymentMode // ignore: cast_nullable_to_non_nullable
                        as String?,
            emiTenure:
                freezed == emiTenure
                    ? _value.emiTenure
                    : emiTenure // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            emiBank:
                freezed == emiBank
                    ? _value.emiBank
                    : emiBank // ignore: cast_nullable_to_non_nullable
                        as String?,
            bankName:
                freezed == bankName
                    ? _value.bankName
                    : bankName // ignore: cast_nullable_to_non_nullable
                        as String?,
            tenure:
                freezed == tenure
                    ? _value.tenure
                    : tenure // ignore: cast_nullable_to_non_nullable
                        as dynamic,
          )
          as $Val,
    );
  }

  /// Create a copy of OrderDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderSummaryDetailModelCopyWith<$Res>? get orderSummary {
    if (_value.orderSummary == null) {
      return null;
    }

    return $OrderSummaryDetailModelCopyWith<$Res>(_value.orderSummary!, (
      value,
    ) {
      return _then(_value.copyWith(orderSummary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderDetailResponseImplCopyWith<$Res>
    implements $OrderDetailResponseCopyWith<$Res> {
  factory _$$OrderDetailResponseImplCopyWith(
    _$OrderDetailResponseImpl value,
    $Res Function(_$OrderDetailResponseImpl) then,
  ) = __$$OrderDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "order_id") int? orderId,
    @JsonKey(name: "order_number") String? orderNumber,
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    DateTime? createdAt,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "items") List<OrderItemDetailModel>? items,
    @JsonKey(name: "coupon_code") String? couponCode,
    @JsonKey(name: "spent_reward_points") String? spentRewardPoints,
    @JsonKey(name: "order_summary") OrderSummaryDetailModel? orderSummary,
    @JsonKey(name: "shipping_address")
    List<ShippingAddressModel>? shippingAddress,
    @JsonKey(name: "payment_address") List<PaymentAddressModel>? paymentAddress,
    @JsonKey(name: "shipping_method") String? shippingMethod,
    @JsonKey(name: "remote_ip") String? remoteIp,
    @JsonKey(name: "payment_method") String? paymentMethod,
    @JsonKey(
      name: "payment_information",
      fromJson: safePaymentInformationFromJson,
      toJson: safePaymentInformationToJson,
    )
    List<PaymentInfoModel>? paymentInformation,
    @JsonKey(name: "just_for_you") Object? justForYou,
    @JsonKey(name: "status_history") List<StatusHistoryModel>? statusHistory,
    @JsonKey(name: "status_label") List<StatusLabel>? statusLabel,
    @JsonKey(name: "customer_name") String? customerName,
    @JsonKey(name: "customer_email") String? customerEmail,
    @JsonKey(name: "customer_phone") String? customerPhone,
    @JsonKey(name: "convenience_fee") num? convenienceFee,
    @JsonKey(name: "convenience_fee_percent") String? convenienceFeePercent,
    @JsonKey(name: "payment_mode") String? paymentMode,
    @JsonKey(name: "emi_tenure") dynamic emiTenure,
    @JsonKey(name: "emi_bank") String? emiBank,
    @JsonKey(name: "bank_name") String? bankName,
    @JsonKey(name: "tenure") dynamic tenure,
  });

  @override
  $OrderSummaryDetailModelCopyWith<$Res>? get orderSummary;
}

/// @nodoc
class __$$OrderDetailResponseImplCopyWithImpl<$Res>
    extends _$OrderDetailResponseCopyWithImpl<$Res, _$OrderDetailResponseImpl>
    implements _$$OrderDetailResponseImplCopyWith<$Res> {
  __$$OrderDetailResponseImplCopyWithImpl(
    _$OrderDetailResponseImpl _value,
    $Res Function(_$OrderDetailResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? orderNumber = freezed,
    Object? customerId = freezed,
    Object? createdAt = freezed,
    Object? state = freezed,
    Object? status = freezed,
    Object? items = freezed,
    Object? couponCode = freezed,
    Object? spentRewardPoints = freezed,
    Object? orderSummary = freezed,
    Object? shippingAddress = freezed,
    Object? paymentAddress = freezed,
    Object? shippingMethod = freezed,
    Object? remoteIp = freezed,
    Object? paymentMethod = freezed,
    Object? paymentInformation = freezed,
    Object? justForYou = freezed,
    Object? statusHistory = freezed,
    Object? statusLabel = freezed,
    Object? customerName = freezed,
    Object? customerEmail = freezed,
    Object? customerPhone = freezed,
    Object? convenienceFee = freezed,
    Object? convenienceFeePercent = freezed,
    Object? paymentMode = freezed,
    Object? emiTenure = freezed,
    Object? emiBank = freezed,
    Object? bankName = freezed,
    Object? tenure = freezed,
  }) {
    return _then(
      _$OrderDetailResponseImpl(
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
        customerId:
            freezed == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                    as int?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
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
        items:
            freezed == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<OrderItemDetailModel>?,
        couponCode:
            freezed == couponCode
                ? _value.couponCode
                : couponCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        spentRewardPoints:
            freezed == spentRewardPoints
                ? _value.spentRewardPoints
                : spentRewardPoints // ignore: cast_nullable_to_non_nullable
                    as String?,
        orderSummary:
            freezed == orderSummary
                ? _value.orderSummary
                : orderSummary // ignore: cast_nullable_to_non_nullable
                    as OrderSummaryDetailModel?,
        shippingAddress:
            freezed == shippingAddress
                ? _value._shippingAddress
                : shippingAddress // ignore: cast_nullable_to_non_nullable
                    as List<ShippingAddressModel>?,
        paymentAddress:
            freezed == paymentAddress
                ? _value._paymentAddress
                : paymentAddress // ignore: cast_nullable_to_non_nullable
                    as List<PaymentAddressModel>?,
        shippingMethod:
            freezed == shippingMethod
                ? _value.shippingMethod
                : shippingMethod // ignore: cast_nullable_to_non_nullable
                    as String?,
        remoteIp:
            freezed == remoteIp
                ? _value.remoteIp
                : remoteIp // ignore: cast_nullable_to_non_nullable
                    as String?,
        paymentMethod:
            freezed == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                    as String?,
        paymentInformation:
            freezed == paymentInformation
                ? _value._paymentInformation
                : paymentInformation // ignore: cast_nullable_to_non_nullable
                    as List<PaymentInfoModel>?,
        justForYou: freezed == justForYou ? _value.justForYou : justForYou,
        statusHistory:
            freezed == statusHistory
                ? _value._statusHistory
                : statusHistory // ignore: cast_nullable_to_non_nullable
                    as List<StatusHistoryModel>?,
        statusLabel:
            freezed == statusLabel
                ? _value._statusLabel
                : statusLabel // ignore: cast_nullable_to_non_nullable
                    as List<StatusLabel>?,
        customerName:
            freezed == customerName
                ? _value.customerName
                : customerName // ignore: cast_nullable_to_non_nullable
                    as String?,
        customerEmail:
            freezed == customerEmail
                ? _value.customerEmail
                : customerEmail // ignore: cast_nullable_to_non_nullable
                    as String?,
        customerPhone:
            freezed == customerPhone
                ? _value.customerPhone
                : customerPhone // ignore: cast_nullable_to_non_nullable
                    as String?,
        convenienceFee:
            freezed == convenienceFee
                ? _value.convenienceFee
                : convenienceFee // ignore: cast_nullable_to_non_nullable
                    as num?,
        convenienceFeePercent:
            freezed == convenienceFeePercent
                ? _value.convenienceFeePercent
                : convenienceFeePercent // ignore: cast_nullable_to_non_nullable
                    as String?,
        paymentMode:
            freezed == paymentMode
                ? _value.paymentMode
                : paymentMode // ignore: cast_nullable_to_non_nullable
                    as String?,
        emiTenure:
            freezed == emiTenure
                ? _value.emiTenure
                : emiTenure // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        emiBank:
            freezed == emiBank
                ? _value.emiBank
                : emiBank // ignore: cast_nullable_to_non_nullable
                    as String?,
        bankName:
            freezed == bankName
                ? _value.bankName
                : bankName // ignore: cast_nullable_to_non_nullable
                    as String?,
        tenure:
            freezed == tenure
                ? _value.tenure
                : tenure // ignore: cast_nullable_to_non_nullable
                    as dynamic,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDetailResponseImpl implements _OrderDetailResponse {
  const _$OrderDetailResponseImpl({
    @JsonKey(name: "order_id") this.orderId,
    @JsonKey(name: "order_number") this.orderNumber,
    @JsonKey(name: "customer_id") this.customerId,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    this.createdAt,
    @JsonKey(name: "state") this.state,
    @JsonKey(name: "status") this.status,
    @JsonKey(name: "items") final List<OrderItemDetailModel>? items,
    @JsonKey(name: "coupon_code") this.couponCode,
    @JsonKey(name: "spent_reward_points") this.spentRewardPoints,
    @JsonKey(name: "order_summary") this.orderSummary,
    @JsonKey(name: "shipping_address")
    final List<ShippingAddressModel>? shippingAddress,
    @JsonKey(name: "payment_address")
    final List<PaymentAddressModel>? paymentAddress,
    @JsonKey(name: "shipping_method") this.shippingMethod,
    @JsonKey(name: "remote_ip") this.remoteIp,
    @JsonKey(name: "payment_method") this.paymentMethod,
    @JsonKey(
      name: "payment_information",
      fromJson: safePaymentInformationFromJson,
      toJson: safePaymentInformationToJson,
    )
    final List<PaymentInfoModel>? paymentInformation,
    @JsonKey(name: "just_for_you") this.justForYou,
    @JsonKey(name: "status_history")
    final List<StatusHistoryModel>? statusHistory,
    @JsonKey(name: "status_label") final List<StatusLabel>? statusLabel,
    @JsonKey(name: "customer_name") this.customerName,
    @JsonKey(name: "customer_email") this.customerEmail,
    @JsonKey(name: "customer_phone") this.customerPhone,
    @JsonKey(name: "convenience_fee") this.convenienceFee,
    @JsonKey(name: "convenience_fee_percent") this.convenienceFeePercent,
    @JsonKey(name: "payment_mode") this.paymentMode,
    @JsonKey(name: "emi_tenure") this.emiTenure,
    @JsonKey(name: "emi_bank") this.emiBank,
    @JsonKey(name: "bank_name") this.bankName,
    @JsonKey(name: "tenure") this.tenure,
  }) : _items = items,
       _shippingAddress = shippingAddress,
       _paymentAddress = paymentAddress,
       _paymentInformation = paymentInformation,
       _statusHistory = statusHistory,
       _statusLabel = statusLabel;

  factory _$OrderDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailResponseImplFromJson(json);

  @override
  @JsonKey(name: "order_id")
  final int? orderId;
  @override
  @JsonKey(name: "order_number")
  final String? orderNumber;
  @override
  @JsonKey(name: "customer_id")
  final int? customerId;
  @override
  @JsonKey(
    name: "created_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  final DateTime? createdAt;
  @override
  @JsonKey(name: "state")
  final String? state;
  @override
  @JsonKey(name: "status")
  final String? status;
  final List<OrderItemDetailModel>? _items;
  @override
  @JsonKey(name: "items")
  List<OrderItemDetailModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "coupon_code")
  final String? couponCode;
  @override
  @JsonKey(name: "spent_reward_points")
  final String? spentRewardPoints;
  @override
  @JsonKey(name: "order_summary")
  final OrderSummaryDetailModel? orderSummary;
  final List<ShippingAddressModel>? _shippingAddress;
  @override
  @JsonKey(name: "shipping_address")
  List<ShippingAddressModel>? get shippingAddress {
    final value = _shippingAddress;
    if (value == null) return null;
    if (_shippingAddress is EqualUnmodifiableListView) return _shippingAddress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PaymentAddressModel>? _paymentAddress;
  @override
  @JsonKey(name: "payment_address")
  List<PaymentAddressModel>? get paymentAddress {
    final value = _paymentAddress;
    if (value == null) return null;
    if (_paymentAddress is EqualUnmodifiableListView) return _paymentAddress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "shipping_method")
  final String? shippingMethod;
  @override
  @JsonKey(name: "remote_ip")
  final String? remoteIp;
  @override
  @JsonKey(name: "payment_method")
  final String? paymentMethod;
  final List<PaymentInfoModel>? _paymentInformation;
  @override
  @JsonKey(
    name: "payment_information",
    fromJson: safePaymentInformationFromJson,
    toJson: safePaymentInformationToJson,
  )
  List<PaymentInfoModel>? get paymentInformation {
    final value = _paymentInformation;
    if (value == null) return null;
    if (_paymentInformation is EqualUnmodifiableListView)
      return _paymentInformation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "just_for_you")
  final Object? justForYou;
  final List<StatusHistoryModel>? _statusHistory;
  @override
  @JsonKey(name: "status_history")
  List<StatusHistoryModel>? get statusHistory {
    final value = _statusHistory;
    if (value == null) return null;
    if (_statusHistory is EqualUnmodifiableListView) return _statusHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<StatusLabel>? _statusLabel;
  @override
  @JsonKey(name: "status_label")
  List<StatusLabel>? get statusLabel {
    final value = _statusLabel;
    if (value == null) return null;
    if (_statusLabel is EqualUnmodifiableListView) return _statusLabel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "customer_name")
  final String? customerName;
  @override
  @JsonKey(name: "customer_email")
  final String? customerEmail;
  @override
  @JsonKey(name: "customer_phone")
  final String? customerPhone;
  @override
  @JsonKey(name: "convenience_fee")
  final num? convenienceFee;
  @override
  @JsonKey(name: "convenience_fee_percent")
  final String? convenienceFeePercent;
  @override
  @JsonKey(name: "payment_mode")
  final String? paymentMode;
  @override
  @JsonKey(name: "emi_tenure")
  final dynamic emiTenure;
  @override
  @JsonKey(name: "emi_bank")
  final String? emiBank;
  @override
  @JsonKey(name: "bank_name")
  final String? bankName;
  @override
  @JsonKey(name: "tenure")
  final dynamic tenure;

  @override
  String toString() {
    return 'OrderDetailResponse(orderId: $orderId, orderNumber: $orderNumber, customerId: $customerId, createdAt: $createdAt, state: $state, status: $status, items: $items, couponCode: $couponCode, spentRewardPoints: $spentRewardPoints, orderSummary: $orderSummary, shippingAddress: $shippingAddress, paymentAddress: $paymentAddress, shippingMethod: $shippingMethod, remoteIp: $remoteIp, paymentMethod: $paymentMethod, paymentInformation: $paymentInformation, justForYou: $justForYou, statusHistory: $statusHistory, statusLabel: $statusLabel, customerName: $customerName, customerEmail: $customerEmail, customerPhone: $customerPhone, convenienceFee: $convenienceFee, convenienceFeePercent: $convenienceFeePercent, paymentMode: $paymentMode, emiTenure: $emiTenure, emiBank: $emiBank, bankName: $bankName, tenure: $tenure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailResponseImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.spentRewardPoints, spentRewardPoints) ||
                other.spentRewardPoints == spentRewardPoints) &&
            (identical(other.orderSummary, orderSummary) ||
                other.orderSummary == orderSummary) &&
            const DeepCollectionEquality().equals(
              other._shippingAddress,
              _shippingAddress,
            ) &&
            const DeepCollectionEquality().equals(
              other._paymentAddress,
              _paymentAddress,
            ) &&
            (identical(other.shippingMethod, shippingMethod) ||
                other.shippingMethod == shippingMethod) &&
            (identical(other.remoteIp, remoteIp) ||
                other.remoteIp == remoteIp) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            const DeepCollectionEquality().equals(
              other._paymentInformation,
              _paymentInformation,
            ) &&
            const DeepCollectionEquality().equals(
              other.justForYou,
              justForYou,
            ) &&
            const DeepCollectionEquality().equals(
              other._statusHistory,
              _statusHistory,
            ) &&
            const DeepCollectionEquality().equals(
              other._statusLabel,
              _statusLabel,
            ) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerEmail, customerEmail) ||
                other.customerEmail == customerEmail) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.convenienceFee, convenienceFee) ||
                other.convenienceFee == convenienceFee) &&
            (identical(other.convenienceFeePercent, convenienceFeePercent) ||
                other.convenienceFeePercent == convenienceFeePercent) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            const DeepCollectionEquality().equals(other.emiTenure, emiTenure) &&
            (identical(other.emiBank, emiBank) || other.emiBank == emiBank) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            const DeepCollectionEquality().equals(other.tenure, tenure));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    orderId,
    orderNumber,
    customerId,
    createdAt,
    state,
    status,
    const DeepCollectionEquality().hash(_items),
    couponCode,
    spentRewardPoints,
    orderSummary,
    const DeepCollectionEquality().hash(_shippingAddress),
    const DeepCollectionEquality().hash(_paymentAddress),
    shippingMethod,
    remoteIp,
    paymentMethod,
    const DeepCollectionEquality().hash(_paymentInformation),
    const DeepCollectionEquality().hash(justForYou),
    const DeepCollectionEquality().hash(_statusHistory),
    const DeepCollectionEquality().hash(_statusLabel),
    customerName,
    customerEmail,
    customerPhone,
    convenienceFee,
    convenienceFeePercent,
    paymentMode,
    const DeepCollectionEquality().hash(emiTenure),
    emiBank,
    bankName,
    const DeepCollectionEquality().hash(tenure),
  ]);

  /// Create a copy of OrderDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailResponseImplCopyWith<_$OrderDetailResponseImpl> get copyWith =>
      __$$OrderDetailResponseImplCopyWithImpl<_$OrderDetailResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailResponseImplToJson(this);
  }
}

abstract class _OrderDetailResponse implements OrderDetailResponse {
  const factory _OrderDetailResponse({
    @JsonKey(name: "order_id") final int? orderId,
    @JsonKey(name: "order_number") final String? orderNumber,
    @JsonKey(name: "customer_id") final int? customerId,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    final DateTime? createdAt,
    @JsonKey(name: "state") final String? state,
    @JsonKey(name: "status") final String? status,
    @JsonKey(name: "items") final List<OrderItemDetailModel>? items,
    @JsonKey(name: "coupon_code") final String? couponCode,
    @JsonKey(name: "spent_reward_points") final String? spentRewardPoints,
    @JsonKey(name: "order_summary") final OrderSummaryDetailModel? orderSummary,
    @JsonKey(name: "shipping_address")
    final List<ShippingAddressModel>? shippingAddress,
    @JsonKey(name: "payment_address")
    final List<PaymentAddressModel>? paymentAddress,
    @JsonKey(name: "shipping_method") final String? shippingMethod,
    @JsonKey(name: "remote_ip") final String? remoteIp,
    @JsonKey(name: "payment_method") final String? paymentMethod,
    @JsonKey(
      name: "payment_information",
      fromJson: safePaymentInformationFromJson,
      toJson: safePaymentInformationToJson,
    )
    final List<PaymentInfoModel>? paymentInformation,
    @JsonKey(name: "just_for_you") final Object? justForYou,
    @JsonKey(name: "status_history")
    final List<StatusHistoryModel>? statusHistory,
    @JsonKey(name: "status_label") final List<StatusLabel>? statusLabel,
    @JsonKey(name: "customer_name") final String? customerName,
    @JsonKey(name: "customer_email") final String? customerEmail,
    @JsonKey(name: "customer_phone") final String? customerPhone,
    @JsonKey(name: "convenience_fee") final num? convenienceFee,
    @JsonKey(name: "convenience_fee_percent")
    final String? convenienceFeePercent,
    @JsonKey(name: "payment_mode") final String? paymentMode,
    @JsonKey(name: "emi_tenure") final dynamic emiTenure,
    @JsonKey(name: "emi_bank") final String? emiBank,
    @JsonKey(name: "bank_name") final String? bankName,
    @JsonKey(name: "tenure") final dynamic tenure,
  }) = _$OrderDetailResponseImpl;

  factory _OrderDetailResponse.fromJson(Map<String, dynamic> json) =
      _$OrderDetailResponseImpl.fromJson;

  @override
  @JsonKey(name: "order_id")
  int? get orderId;
  @override
  @JsonKey(name: "order_number")
  String? get orderNumber;
  @override
  @JsonKey(name: "customer_id")
  int? get customerId;
  @override
  @JsonKey(
    name: "created_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  DateTime? get createdAt;
  @override
  @JsonKey(name: "state")
  String? get state;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "items")
  List<OrderItemDetailModel>? get items;
  @override
  @JsonKey(name: "coupon_code")
  String? get couponCode;
  @override
  @JsonKey(name: "spent_reward_points")
  String? get spentRewardPoints;
  @override
  @JsonKey(name: "order_summary")
  OrderSummaryDetailModel? get orderSummary;
  @override
  @JsonKey(name: "shipping_address")
  List<ShippingAddressModel>? get shippingAddress;
  @override
  @JsonKey(name: "payment_address")
  List<PaymentAddressModel>? get paymentAddress;
  @override
  @JsonKey(name: "shipping_method")
  String? get shippingMethod;
  @override
  @JsonKey(name: "remote_ip")
  String? get remoteIp;
  @override
  @JsonKey(name: "payment_method")
  String? get paymentMethod;
  @override
  @JsonKey(
    name: "payment_information",
    fromJson: safePaymentInformationFromJson,
    toJson: safePaymentInformationToJson,
  )
  List<PaymentInfoModel>? get paymentInformation;
  @override
  @JsonKey(name: "just_for_you")
  Object? get justForYou;
  @override
  @JsonKey(name: "status_history")
  List<StatusHistoryModel>? get statusHistory;
  @override
  @JsonKey(name: "status_label")
  List<StatusLabel>? get statusLabel;
  @override
  @JsonKey(name: "customer_name")
  String? get customerName;
  @override
  @JsonKey(name: "customer_email")
  String? get customerEmail;
  @override
  @JsonKey(name: "customer_phone")
  String? get customerPhone;
  @override
  @JsonKey(name: "convenience_fee")
  num? get convenienceFee;
  @override
  @JsonKey(name: "convenience_fee_percent")
  String? get convenienceFeePercent;
  @override
  @JsonKey(name: "payment_mode")
  String? get paymentMode;
  @override
  @JsonKey(name: "emi_tenure")
  dynamic get emiTenure;
  @override
  @JsonKey(name: "emi_bank")
  String? get emiBank;
  @override
  @JsonKey(name: "bank_name")
  String? get bankName;
  @override
  @JsonKey(name: "tenure")
  dynamic get tenure;

  /// Create a copy of OrderDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailResponseImplCopyWith<_$OrderDetailResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemDetailModel _$OrderItemDetailModelFromJson(Map<String, dynamic> json) {
  return _OrderItemDetailModel.fromJson(json);
}

/// @nodoc
mixin _$OrderItemDetailModel {
  @JsonKey(name: "item_id")
  String? get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: "item_name")
  String? get itemName => throw _privateConstructorUsedError;
  @JsonKey(name: "product_id")
  String? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: "product_slug")
  String? get productSlug => throw _privateConstructorUsedError;
  @JsonKey(name: "product_category_ids")
  List<String>? get productCategoryIds => throw _privateConstructorUsedError;
  @JsonKey(name: "product_category_names")
  List<String>? get productCategoryNames => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "varient")
  List<Object>? get varient => throw _privateConstructorUsedError;
  @JsonKey(name: "exta_options")
  List<Object>? get extaOptions => throw _privateConstructorUsedError;
  @JsonKey(name: "sold_by")
  String? get soldBy => throw _privateConstructorUsedError;
  @JsonKey(name: "qty")
  int? get qty => throw _privateConstructorUsedError;
  @JsonKey(name: "regular_price")
  int? get regularPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "final_price")
  int? get finalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "discount")
  int? get discount => throw _privateConstructorUsedError;

  /// Serializes this OrderItemDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemDetailModelCopyWith<OrderItemDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemDetailModelCopyWith<$Res> {
  factory $OrderItemDetailModelCopyWith(
    OrderItemDetailModel value,
    $Res Function(OrderItemDetailModel) then,
  ) = _$OrderItemDetailModelCopyWithImpl<$Res, OrderItemDetailModel>;
  @useResult
  $Res call({
    @JsonKey(name: "item_id") String? itemId,
    @JsonKey(name: "item_name") String? itemName,
    @JsonKey(name: "product_id") String? productId,
    @JsonKey(name: "product_slug") String? productSlug,
    @JsonKey(name: "product_category_ids") List<String>? productCategoryIds,
    @JsonKey(name: "product_category_names") List<String>? productCategoryNames,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "varient") List<Object>? varient,
    @JsonKey(name: "exta_options") List<Object>? extaOptions,
    @JsonKey(name: "sold_by") String? soldBy,
    @JsonKey(name: "qty") int? qty,
    @JsonKey(name: "regular_price") int? regularPrice,
    @JsonKey(name: "final_price") int? finalPrice,
    @JsonKey(name: "discount") int? discount,
  });
}

/// @nodoc
class _$OrderItemDetailModelCopyWithImpl<
  $Res,
  $Val extends OrderItemDetailModel
>
    implements $OrderItemDetailModelCopyWith<$Res> {
  _$OrderItemDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = freezed,
    Object? itemName = freezed,
    Object? productId = freezed,
    Object? productSlug = freezed,
    Object? productCategoryIds = freezed,
    Object? productCategoryNames = freezed,
    Object? image = freezed,
    Object? varient = freezed,
    Object? extaOptions = freezed,
    Object? soldBy = freezed,
    Object? qty = freezed,
    Object? regularPrice = freezed,
    Object? finalPrice = freezed,
    Object? discount = freezed,
  }) {
    return _then(
      _value.copyWith(
            itemId:
                freezed == itemId
                    ? _value.itemId
                    : itemId // ignore: cast_nullable_to_non_nullable
                        as String?,
            itemName:
                freezed == itemName
                    ? _value.itemName
                    : itemName // ignore: cast_nullable_to_non_nullable
                        as String?,
            productId:
                freezed == productId
                    ? _value.productId
                    : productId // ignore: cast_nullable_to_non_nullable
                        as String?,
            productSlug:
                freezed == productSlug
                    ? _value.productSlug
                    : productSlug // ignore: cast_nullable_to_non_nullable
                        as String?,
            productCategoryIds:
                freezed == productCategoryIds
                    ? _value.productCategoryIds
                    : productCategoryIds // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            productCategoryNames:
                freezed == productCategoryNames
                    ? _value.productCategoryNames
                    : productCategoryNames // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            image:
                freezed == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String?,
            varient:
                freezed == varient
                    ? _value.varient
                    : varient // ignore: cast_nullable_to_non_nullable
                        as List<Object>?,
            extaOptions:
                freezed == extaOptions
                    ? _value.extaOptions
                    : extaOptions // ignore: cast_nullable_to_non_nullable
                        as List<Object>?,
            soldBy:
                freezed == soldBy
                    ? _value.soldBy
                    : soldBy // ignore: cast_nullable_to_non_nullable
                        as String?,
            qty:
                freezed == qty
                    ? _value.qty
                    : qty // ignore: cast_nullable_to_non_nullable
                        as int?,
            regularPrice:
                freezed == regularPrice
                    ? _value.regularPrice
                    : regularPrice // ignore: cast_nullable_to_non_nullable
                        as int?,
            finalPrice:
                freezed == finalPrice
                    ? _value.finalPrice
                    : finalPrice // ignore: cast_nullable_to_non_nullable
                        as int?,
            discount:
                freezed == discount
                    ? _value.discount
                    : discount // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderItemDetailModelImplCopyWith<$Res>
    implements $OrderItemDetailModelCopyWith<$Res> {
  factory _$$OrderItemDetailModelImplCopyWith(
    _$OrderItemDetailModelImpl value,
    $Res Function(_$OrderItemDetailModelImpl) then,
  ) = __$$OrderItemDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "item_id") String? itemId,
    @JsonKey(name: "item_name") String? itemName,
    @JsonKey(name: "product_id") String? productId,
    @JsonKey(name: "product_slug") String? productSlug,
    @JsonKey(name: "product_category_ids") List<String>? productCategoryIds,
    @JsonKey(name: "product_category_names") List<String>? productCategoryNames,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "varient") List<Object>? varient,
    @JsonKey(name: "exta_options") List<Object>? extaOptions,
    @JsonKey(name: "sold_by") String? soldBy,
    @JsonKey(name: "qty") int? qty,
    @JsonKey(name: "regular_price") int? regularPrice,
    @JsonKey(name: "final_price") int? finalPrice,
    @JsonKey(name: "discount") int? discount,
  });
}

/// @nodoc
class __$$OrderItemDetailModelImplCopyWithImpl<$Res>
    extends _$OrderItemDetailModelCopyWithImpl<$Res, _$OrderItemDetailModelImpl>
    implements _$$OrderItemDetailModelImplCopyWith<$Res> {
  __$$OrderItemDetailModelImplCopyWithImpl(
    _$OrderItemDetailModelImpl _value,
    $Res Function(_$OrderItemDetailModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderItemDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = freezed,
    Object? itemName = freezed,
    Object? productId = freezed,
    Object? productSlug = freezed,
    Object? productCategoryIds = freezed,
    Object? productCategoryNames = freezed,
    Object? image = freezed,
    Object? varient = freezed,
    Object? extaOptions = freezed,
    Object? soldBy = freezed,
    Object? qty = freezed,
    Object? regularPrice = freezed,
    Object? finalPrice = freezed,
    Object? discount = freezed,
  }) {
    return _then(
      _$OrderItemDetailModelImpl(
        itemId:
            freezed == itemId
                ? _value.itemId
                : itemId // ignore: cast_nullable_to_non_nullable
                    as String?,
        itemName:
            freezed == itemName
                ? _value.itemName
                : itemName // ignore: cast_nullable_to_non_nullable
                    as String?,
        productId:
            freezed == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                    as String?,
        productSlug:
            freezed == productSlug
                ? _value.productSlug
                : productSlug // ignore: cast_nullable_to_non_nullable
                    as String?,
        productCategoryIds:
            freezed == productCategoryIds
                ? _value._productCategoryIds
                : productCategoryIds // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        productCategoryNames:
            freezed == productCategoryNames
                ? _value._productCategoryNames
                : productCategoryNames // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        image:
            freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String?,
        varient:
            freezed == varient
                ? _value._varient
                : varient // ignore: cast_nullable_to_non_nullable
                    as List<Object>?,
        extaOptions:
            freezed == extaOptions
                ? _value._extaOptions
                : extaOptions // ignore: cast_nullable_to_non_nullable
                    as List<Object>?,
        soldBy:
            freezed == soldBy
                ? _value.soldBy
                : soldBy // ignore: cast_nullable_to_non_nullable
                    as String?,
        qty:
            freezed == qty
                ? _value.qty
                : qty // ignore: cast_nullable_to_non_nullable
                    as int?,
        regularPrice:
            freezed == regularPrice
                ? _value.regularPrice
                : regularPrice // ignore: cast_nullable_to_non_nullable
                    as int?,
        finalPrice:
            freezed == finalPrice
                ? _value.finalPrice
                : finalPrice // ignore: cast_nullable_to_non_nullable
                    as int?,
        discount:
            freezed == discount
                ? _value.discount
                : discount // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemDetailModelImpl implements _OrderItemDetailModel {
  const _$OrderItemDetailModelImpl({
    @JsonKey(name: "item_id") this.itemId,
    @JsonKey(name: "item_name") this.itemName,
    @JsonKey(name: "product_id") this.productId,
    @JsonKey(name: "product_slug") this.productSlug,
    @JsonKey(name: "product_category_ids")
    final List<String>? productCategoryIds,
    @JsonKey(name: "product_category_names")
    final List<String>? productCategoryNames,
    @JsonKey(name: "image") this.image,
    @JsonKey(name: "varient") final List<Object>? varient,
    @JsonKey(name: "exta_options") final List<Object>? extaOptions,
    @JsonKey(name: "sold_by") this.soldBy,
    @JsonKey(name: "qty") this.qty,
    @JsonKey(name: "regular_price") this.regularPrice,
    @JsonKey(name: "final_price") this.finalPrice,
    @JsonKey(name: "discount") this.discount,
  }) : _productCategoryIds = productCategoryIds,
       _productCategoryNames = productCategoryNames,
       _varient = varient,
       _extaOptions = extaOptions;

  factory _$OrderItemDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemDetailModelImplFromJson(json);

  @override
  @JsonKey(name: "item_id")
  final String? itemId;
  @override
  @JsonKey(name: "item_name")
  final String? itemName;
  @override
  @JsonKey(name: "product_id")
  final String? productId;
  @override
  @JsonKey(name: "product_slug")
  final String? productSlug;
  final List<String>? _productCategoryIds;
  @override
  @JsonKey(name: "product_category_ids")
  List<String>? get productCategoryIds {
    final value = _productCategoryIds;
    if (value == null) return null;
    if (_productCategoryIds is EqualUnmodifiableListView)
      return _productCategoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _productCategoryNames;
  @override
  @JsonKey(name: "product_category_names")
  List<String>? get productCategoryNames {
    final value = _productCategoryNames;
    if (value == null) return null;
    if (_productCategoryNames is EqualUnmodifiableListView)
      return _productCategoryNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "image")
  final String? image;
  final List<Object>? _varient;
  @override
  @JsonKey(name: "varient")
  List<Object>? get varient {
    final value = _varient;
    if (value == null) return null;
    if (_varient is EqualUnmodifiableListView) return _varient;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Object>? _extaOptions;
  @override
  @JsonKey(name: "exta_options")
  List<Object>? get extaOptions {
    final value = _extaOptions;
    if (value == null) return null;
    if (_extaOptions is EqualUnmodifiableListView) return _extaOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "sold_by")
  final String? soldBy;
  @override
  @JsonKey(name: "qty")
  final int? qty;
  @override
  @JsonKey(name: "regular_price")
  final int? regularPrice;
  @override
  @JsonKey(name: "final_price")
  final int? finalPrice;
  @override
  @JsonKey(name: "discount")
  final int? discount;

  @override
  String toString() {
    return 'OrderItemDetailModel(itemId: $itemId, itemName: $itemName, productId: $productId, productSlug: $productSlug, productCategoryIds: $productCategoryIds, productCategoryNames: $productCategoryNames, image: $image, varient: $varient, extaOptions: $extaOptions, soldBy: $soldBy, qty: $qty, regularPrice: $regularPrice, finalPrice: $finalPrice, discount: $discount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemDetailModelImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productSlug, productSlug) ||
                other.productSlug == productSlug) &&
            const DeepCollectionEquality().equals(
              other._productCategoryIds,
              _productCategoryIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._productCategoryNames,
              _productCategoryNames,
            ) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._varient, _varient) &&
            const DeepCollectionEquality().equals(
              other._extaOptions,
              _extaOptions,
            ) &&
            (identical(other.soldBy, soldBy) || other.soldBy == soldBy) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.regularPrice, regularPrice) ||
                other.regularPrice == regularPrice) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.discount, discount) ||
                other.discount == discount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    itemId,
    itemName,
    productId,
    productSlug,
    const DeepCollectionEquality().hash(_productCategoryIds),
    const DeepCollectionEquality().hash(_productCategoryNames),
    image,
    const DeepCollectionEquality().hash(_varient),
    const DeepCollectionEquality().hash(_extaOptions),
    soldBy,
    qty,
    regularPrice,
    finalPrice,
    discount,
  );

  /// Create a copy of OrderItemDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemDetailModelImplCopyWith<_$OrderItemDetailModelImpl>
  get copyWith =>
      __$$OrderItemDetailModelImplCopyWithImpl<_$OrderItemDetailModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemDetailModelImplToJson(this);
  }
}

abstract class _OrderItemDetailModel implements OrderItemDetailModel {
  const factory _OrderItemDetailModel({
    @JsonKey(name: "item_id") final String? itemId,
    @JsonKey(name: "item_name") final String? itemName,
    @JsonKey(name: "product_id") final String? productId,
    @JsonKey(name: "product_slug") final String? productSlug,
    @JsonKey(name: "product_category_ids")
    final List<String>? productCategoryIds,
    @JsonKey(name: "product_category_names")
    final List<String>? productCategoryNames,
    @JsonKey(name: "image") final String? image,
    @JsonKey(name: "varient") final List<Object>? varient,
    @JsonKey(name: "exta_options") final List<Object>? extaOptions,
    @JsonKey(name: "sold_by") final String? soldBy,
    @JsonKey(name: "qty") final int? qty,
    @JsonKey(name: "regular_price") final int? regularPrice,
    @JsonKey(name: "final_price") final int? finalPrice,
    @JsonKey(name: "discount") final int? discount,
  }) = _$OrderItemDetailModelImpl;

  factory _OrderItemDetailModel.fromJson(Map<String, dynamic> json) =
      _$OrderItemDetailModelImpl.fromJson;

  @override
  @JsonKey(name: "item_id")
  String? get itemId;
  @override
  @JsonKey(name: "item_name")
  String? get itemName;
  @override
  @JsonKey(name: "product_id")
  String? get productId;
  @override
  @JsonKey(name: "product_slug")
  String? get productSlug;
  @override
  @JsonKey(name: "product_category_ids")
  List<String>? get productCategoryIds;
  @override
  @JsonKey(name: "product_category_names")
  List<String>? get productCategoryNames;
  @override
  @JsonKey(name: "image")
  String? get image;
  @override
  @JsonKey(name: "varient")
  List<Object>? get varient;
  @override
  @JsonKey(name: "exta_options")
  List<Object>? get extaOptions;
  @override
  @JsonKey(name: "sold_by")
  String? get soldBy;
  @override
  @JsonKey(name: "qty")
  int? get qty;
  @override
  @JsonKey(name: "regular_price")
  int? get regularPrice;
  @override
  @JsonKey(name: "final_price")
  int? get finalPrice;
  @override
  @JsonKey(name: "discount")
  int? get discount;

  /// Create a copy of OrderItemDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemDetailModelImplCopyWith<_$OrderItemDetailModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

OrderSummaryDetailModel _$OrderSummaryDetailModelFromJson(
  Map<String, dynamic> json,
) {
  return _OrderSummaryDetailModel.fromJson(json);
}

/// @nodoc
mixin _$OrderSummaryDetailModel {
  @JsonKey(name: "subtotal")
  num? get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: "total_order_qty")
  int? get totalOrderQty => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_amount")
  num? get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "rewards_discount")
  num? get rewardsDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_fee")
  num? get shippingFee => throw _privateConstructorUsedError;
  @JsonKey(name: "grand_total")
  num? get grandTotal => throw _privateConstructorUsedError;
  @JsonKey(name: "reward_earned")
  int? get rewardEarned => throw _privateConstructorUsedError;
  @JsonKey(name: "convenience_fee")
  num? get convenienceFee => throw _privateConstructorUsedError;
  @JsonKey(name: "convenience_fee_percent")
  String? get convenienceFeePercent => throw _privateConstructorUsedError;
  @JsonKey(name: "convenience_amount")
  num? get convenienceAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "convenience_price")
  num? get conveniencePrice => throw _privateConstructorUsedError;
  @JsonKey(name: "fee")
  num? get fee => throw _privateConstructorUsedError;

  /// Serializes this OrderSummaryDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderSummaryDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderSummaryDetailModelCopyWith<OrderSummaryDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSummaryDetailModelCopyWith<$Res> {
  factory $OrderSummaryDetailModelCopyWith(
    OrderSummaryDetailModel value,
    $Res Function(OrderSummaryDetailModel) then,
  ) = _$OrderSummaryDetailModelCopyWithImpl<$Res, OrderSummaryDetailModel>;
  @useResult
  $Res call({
    @JsonKey(name: "subtotal") num? subtotal,
    @JsonKey(name: "total_order_qty") int? totalOrderQty,
    @JsonKey(name: "discount_amount") num? discountAmount,
    @JsonKey(name: "rewards_discount") num? rewardsDiscount,
    @JsonKey(name: "shipping_fee") num? shippingFee,
    @JsonKey(name: "grand_total") num? grandTotal,
    @JsonKey(name: "reward_earned") int? rewardEarned,
    @JsonKey(name: "convenience_fee") num? convenienceFee,
    @JsonKey(name: "convenience_fee_percent") String? convenienceFeePercent,
    @JsonKey(name: "convenience_amount") num? convenienceAmount,
    @JsonKey(name: "convenience_price") num? conveniencePrice,
    @JsonKey(name: "fee") num? fee,
  });
}

/// @nodoc
class _$OrderSummaryDetailModelCopyWithImpl<
  $Res,
  $Val extends OrderSummaryDetailModel
>
    implements $OrderSummaryDetailModelCopyWith<$Res> {
  _$OrderSummaryDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderSummaryDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtotal = freezed,
    Object? totalOrderQty = freezed,
    Object? discountAmount = freezed,
    Object? rewardsDiscount = freezed,
    Object? shippingFee = freezed,
    Object? grandTotal = freezed,
    Object? rewardEarned = freezed,
    Object? convenienceFee = freezed,
    Object? convenienceFeePercent = freezed,
    Object? convenienceAmount = freezed,
    Object? conveniencePrice = freezed,
    Object? fee = freezed,
  }) {
    return _then(
      _value.copyWith(
            subtotal:
                freezed == subtotal
                    ? _value.subtotal
                    : subtotal // ignore: cast_nullable_to_non_nullable
                        as num?,
            totalOrderQty:
                freezed == totalOrderQty
                    ? _value.totalOrderQty
                    : totalOrderQty // ignore: cast_nullable_to_non_nullable
                        as int?,
            discountAmount:
                freezed == discountAmount
                    ? _value.discountAmount
                    : discountAmount // ignore: cast_nullable_to_non_nullable
                        as num?,
            rewardsDiscount:
                freezed == rewardsDiscount
                    ? _value.rewardsDiscount
                    : rewardsDiscount // ignore: cast_nullable_to_non_nullable
                        as num?,
            shippingFee:
                freezed == shippingFee
                    ? _value.shippingFee
                    : shippingFee // ignore: cast_nullable_to_non_nullable
                        as num?,
            grandTotal:
                freezed == grandTotal
                    ? _value.grandTotal
                    : grandTotal // ignore: cast_nullable_to_non_nullable
                        as num?,
            rewardEarned:
                freezed == rewardEarned
                    ? _value.rewardEarned
                    : rewardEarned // ignore: cast_nullable_to_non_nullable
                        as int?,
            convenienceFee:
                freezed == convenienceFee
                    ? _value.convenienceFee
                    : convenienceFee // ignore: cast_nullable_to_non_nullable
                        as num?,
            convenienceFeePercent:
                freezed == convenienceFeePercent
                    ? _value.convenienceFeePercent
                    : convenienceFeePercent // ignore: cast_nullable_to_non_nullable
                        as String?,
            convenienceAmount:
                freezed == convenienceAmount
                    ? _value.convenienceAmount
                    : convenienceAmount // ignore: cast_nullable_to_non_nullable
                        as num?,
            conveniencePrice:
                freezed == conveniencePrice
                    ? _value.conveniencePrice
                    : conveniencePrice // ignore: cast_nullable_to_non_nullable
                        as num?,
            fee:
                freezed == fee
                    ? _value.fee
                    : fee // ignore: cast_nullable_to_non_nullable
                        as num?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderSummaryDetailModelImplCopyWith<$Res>
    implements $OrderSummaryDetailModelCopyWith<$Res> {
  factory _$$OrderSummaryDetailModelImplCopyWith(
    _$OrderSummaryDetailModelImpl value,
    $Res Function(_$OrderSummaryDetailModelImpl) then,
  ) = __$$OrderSummaryDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "subtotal") num? subtotal,
    @JsonKey(name: "total_order_qty") int? totalOrderQty,
    @JsonKey(name: "discount_amount") num? discountAmount,
    @JsonKey(name: "rewards_discount") num? rewardsDiscount,
    @JsonKey(name: "shipping_fee") num? shippingFee,
    @JsonKey(name: "grand_total") num? grandTotal,
    @JsonKey(name: "reward_earned") int? rewardEarned,
    @JsonKey(name: "convenience_fee") num? convenienceFee,
    @JsonKey(name: "convenience_fee_percent") String? convenienceFeePercent,
    @JsonKey(name: "convenience_amount") num? convenienceAmount,
    @JsonKey(name: "convenience_price") num? conveniencePrice,
    @JsonKey(name: "fee") num? fee,
  });
}

/// @nodoc
class __$$OrderSummaryDetailModelImplCopyWithImpl<$Res>
    extends
        _$OrderSummaryDetailModelCopyWithImpl<
          $Res,
          _$OrderSummaryDetailModelImpl
        >
    implements _$$OrderSummaryDetailModelImplCopyWith<$Res> {
  __$$OrderSummaryDetailModelImplCopyWithImpl(
    _$OrderSummaryDetailModelImpl _value,
    $Res Function(_$OrderSummaryDetailModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderSummaryDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtotal = freezed,
    Object? totalOrderQty = freezed,
    Object? discountAmount = freezed,
    Object? rewardsDiscount = freezed,
    Object? shippingFee = freezed,
    Object? grandTotal = freezed,
    Object? rewardEarned = freezed,
    Object? convenienceFee = freezed,
    Object? convenienceFeePercent = freezed,
    Object? convenienceAmount = freezed,
    Object? conveniencePrice = freezed,
    Object? fee = freezed,
  }) {
    return _then(
      _$OrderSummaryDetailModelImpl(
        subtotal:
            freezed == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                    as num?,
        totalOrderQty:
            freezed == totalOrderQty
                ? _value.totalOrderQty
                : totalOrderQty // ignore: cast_nullable_to_non_nullable
                    as int?,
        discountAmount:
            freezed == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                    as num?,
        rewardsDiscount:
            freezed == rewardsDiscount
                ? _value.rewardsDiscount
                : rewardsDiscount // ignore: cast_nullable_to_non_nullable
                    as num?,
        shippingFee:
            freezed == shippingFee
                ? _value.shippingFee
                : shippingFee // ignore: cast_nullable_to_non_nullable
                    as num?,
        grandTotal:
            freezed == grandTotal
                ? _value.grandTotal
                : grandTotal // ignore: cast_nullable_to_non_nullable
                    as num?,
        rewardEarned:
            freezed == rewardEarned
                ? _value.rewardEarned
                : rewardEarned // ignore: cast_nullable_to_non_nullable
                    as int?,
        convenienceFee:
            freezed == convenienceFee
                ? _value.convenienceFee
                : convenienceFee // ignore: cast_nullable_to_non_nullable
                    as num?,
        convenienceFeePercent:
            freezed == convenienceFeePercent
                ? _value.convenienceFeePercent
                : convenienceFeePercent // ignore: cast_nullable_to_non_nullable
                    as String?,
        convenienceAmount:
            freezed == convenienceAmount
                ? _value.convenienceAmount
                : convenienceAmount // ignore: cast_nullable_to_non_nullable
                    as num?,
        conveniencePrice:
            freezed == conveniencePrice
                ? _value.conveniencePrice
                : conveniencePrice // ignore: cast_nullable_to_non_nullable
                    as num?,
        fee:
            freezed == fee
                ? _value.fee
                : fee // ignore: cast_nullable_to_non_nullable
                    as num?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderSummaryDetailModelImpl implements _OrderSummaryDetailModel {
  const _$OrderSummaryDetailModelImpl({
    @JsonKey(name: "subtotal") this.subtotal,
    @JsonKey(name: "total_order_qty") this.totalOrderQty,
    @JsonKey(name: "discount_amount") this.discountAmount,
    @JsonKey(name: "rewards_discount") this.rewardsDiscount,
    @JsonKey(name: "shipping_fee") this.shippingFee,
    @JsonKey(name: "grand_total") this.grandTotal,
    @JsonKey(name: "reward_earned") this.rewardEarned,
    @JsonKey(name: "convenience_fee") this.convenienceFee,
    @JsonKey(name: "convenience_fee_percent") this.convenienceFeePercent,
    @JsonKey(name: "convenience_amount") this.convenienceAmount,
    @JsonKey(name: "convenience_price") this.conveniencePrice,
    @JsonKey(name: "fee") this.fee,
  });

  factory _$OrderSummaryDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderSummaryDetailModelImplFromJson(json);

  @override
  @JsonKey(name: "subtotal")
  final num? subtotal;
  @override
  @JsonKey(name: "total_order_qty")
  final int? totalOrderQty;
  @override
  @JsonKey(name: "discount_amount")
  final num? discountAmount;
  @override
  @JsonKey(name: "rewards_discount")
  final num? rewardsDiscount;
  @override
  @JsonKey(name: "shipping_fee")
  final num? shippingFee;
  @override
  @JsonKey(name: "grand_total")
  final num? grandTotal;
  @override
  @JsonKey(name: "reward_earned")
  final int? rewardEarned;
  @override
  @JsonKey(name: "convenience_fee")
  final num? convenienceFee;
  @override
  @JsonKey(name: "convenience_fee_percent")
  final String? convenienceFeePercent;
  @override
  @JsonKey(name: "convenience_amount")
  final num? convenienceAmount;
  @override
  @JsonKey(name: "convenience_price")
  final num? conveniencePrice;
  @override
  @JsonKey(name: "fee")
  final num? fee;

  @override
  String toString() {
    return 'OrderSummaryDetailModel(subtotal: $subtotal, totalOrderQty: $totalOrderQty, discountAmount: $discountAmount, rewardsDiscount: $rewardsDiscount, shippingFee: $shippingFee, grandTotal: $grandTotal, rewardEarned: $rewardEarned, convenienceFee: $convenienceFee, convenienceFeePercent: $convenienceFeePercent, convenienceAmount: $convenienceAmount, conveniencePrice: $conveniencePrice, fee: $fee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSummaryDetailModelImpl &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.totalOrderQty, totalOrderQty) ||
                other.totalOrderQty == totalOrderQty) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.rewardsDiscount, rewardsDiscount) ||
                other.rewardsDiscount == rewardsDiscount) &&
            (identical(other.shippingFee, shippingFee) ||
                other.shippingFee == shippingFee) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.rewardEarned, rewardEarned) ||
                other.rewardEarned == rewardEarned) &&
            (identical(other.convenienceFee, convenienceFee) ||
                other.convenienceFee == convenienceFee) &&
            (identical(other.convenienceFeePercent, convenienceFeePercent) ||
                other.convenienceFeePercent == convenienceFeePercent) &&
            (identical(other.convenienceAmount, convenienceAmount) ||
                other.convenienceAmount == convenienceAmount) &&
            (identical(other.conveniencePrice, conveniencePrice) ||
                other.conveniencePrice == conveniencePrice) &&
            (identical(other.fee, fee) || other.fee == fee));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    subtotal,
    totalOrderQty,
    discountAmount,
    rewardsDiscount,
    shippingFee,
    grandTotal,
    rewardEarned,
    convenienceFee,
    convenienceFeePercent,
    convenienceAmount,
    conveniencePrice,
    fee,
  );

  /// Create a copy of OrderSummaryDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSummaryDetailModelImplCopyWith<_$OrderSummaryDetailModelImpl>
  get copyWith => __$$OrderSummaryDetailModelImplCopyWithImpl<
    _$OrderSummaryDetailModelImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderSummaryDetailModelImplToJson(this);
  }
}

abstract class _OrderSummaryDetailModel implements OrderSummaryDetailModel {
  const factory _OrderSummaryDetailModel({
    @JsonKey(name: "subtotal") final num? subtotal,
    @JsonKey(name: "total_order_qty") final int? totalOrderQty,
    @JsonKey(name: "discount_amount") final num? discountAmount,
    @JsonKey(name: "rewards_discount") final num? rewardsDiscount,
    @JsonKey(name: "shipping_fee") final num? shippingFee,
    @JsonKey(name: "grand_total") final num? grandTotal,
    @JsonKey(name: "reward_earned") final int? rewardEarned,
    @JsonKey(name: "convenience_fee") final num? convenienceFee,
    @JsonKey(name: "convenience_fee_percent")
    final String? convenienceFeePercent,
    @JsonKey(name: "convenience_amount") final num? convenienceAmount,
    @JsonKey(name: "convenience_price") final num? conveniencePrice,
    @JsonKey(name: "fee") final num? fee,
  }) = _$OrderSummaryDetailModelImpl;

  factory _OrderSummaryDetailModel.fromJson(Map<String, dynamic> json) =
      _$OrderSummaryDetailModelImpl.fromJson;

  @override
  @JsonKey(name: "subtotal")
  num? get subtotal;
  @override
  @JsonKey(name: "total_order_qty")
  int? get totalOrderQty;
  @override
  @JsonKey(name: "discount_amount")
  num? get discountAmount;
  @override
  @JsonKey(name: "rewards_discount")
  num? get rewardsDiscount;
  @override
  @JsonKey(name: "shipping_fee")
  num? get shippingFee;
  @override
  @JsonKey(name: "grand_total")
  num? get grandTotal;
  @override
  @JsonKey(name: "reward_earned")
  int? get rewardEarned;
  @override
  @JsonKey(name: "convenience_fee")
  num? get convenienceFee;
  @override
  @JsonKey(name: "convenience_fee_percent")
  String? get convenienceFeePercent;
  @override
  @JsonKey(name: "convenience_amount")
  num? get convenienceAmount;
  @override
  @JsonKey(name: "convenience_price")
  num? get conveniencePrice;
  @override
  @JsonKey(name: "fee")
  num? get fee;

  /// Create a copy of OrderSummaryDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderSummaryDetailModelImplCopyWith<_$OrderSummaryDetailModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ShippingAddressModel _$ShippingAddressModelFromJson(Map<String, dynamic> json) {
  return _ShippingAddressModel.fromJson(json);
}

/// @nodoc
mixin _$ShippingAddressModel {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "mobile")
  String? get mobile => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String? get address => throw _privateConstructorUsedError;

  /// Serializes this ShippingAddressModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShippingAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShippingAddressModelCopyWith<ShippingAddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShippingAddressModelCopyWith<$Res> {
  factory $ShippingAddressModelCopyWith(
    ShippingAddressModel value,
    $Res Function(ShippingAddressModel) then,
  ) = _$ShippingAddressModelCopyWithImpl<$Res, ShippingAddressModel>;
  @useResult
  $Res call({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "mobile") String? mobile,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "address") String? address,
  });
}

/// @nodoc
class _$ShippingAddressModelCopyWithImpl<
  $Res,
  $Val extends ShippingAddressModel
>
    implements $ShippingAddressModelCopyWith<$Res> {
  _$ShippingAddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShippingAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? address = freezed,
  }) {
    return _then(
      _value.copyWith(
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            mobile:
                freezed == mobile
                    ? _value.mobile
                    : mobile // ignore: cast_nullable_to_non_nullable
                        as String?,
            email:
                freezed == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String?,
            address:
                freezed == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShippingAddressModelImplCopyWith<$Res>
    implements $ShippingAddressModelCopyWith<$Res> {
  factory _$$ShippingAddressModelImplCopyWith(
    _$ShippingAddressModelImpl value,
    $Res Function(_$ShippingAddressModelImpl) then,
  ) = __$$ShippingAddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "mobile") String? mobile,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "address") String? address,
  });
}

/// @nodoc
class __$$ShippingAddressModelImplCopyWithImpl<$Res>
    extends _$ShippingAddressModelCopyWithImpl<$Res, _$ShippingAddressModelImpl>
    implements _$$ShippingAddressModelImplCopyWith<$Res> {
  __$$ShippingAddressModelImplCopyWithImpl(
    _$ShippingAddressModelImpl _value,
    $Res Function(_$ShippingAddressModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShippingAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? address = freezed,
  }) {
    return _then(
      _$ShippingAddressModelImpl(
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        mobile:
            freezed == mobile
                ? _value.mobile
                : mobile // ignore: cast_nullable_to_non_nullable
                    as String?,
        email:
            freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String?,
        address:
            freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShippingAddressModelImpl implements _ShippingAddressModel {
  const _$ShippingAddressModelImpl({
    @JsonKey(name: "name") this.name,
    @JsonKey(name: "mobile") this.mobile,
    @JsonKey(name: "email") this.email,
    @JsonKey(name: "address") this.address,
  });

  factory _$ShippingAddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShippingAddressModelImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "mobile")
  final String? mobile;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "address")
  final String? address;

  @override
  String toString() {
    return 'ShippingAddressModel(name: $name, mobile: $mobile, email: $email, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShippingAddressModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, mobile, email, address);

  /// Create a copy of ShippingAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShippingAddressModelImplCopyWith<_$ShippingAddressModelImpl>
  get copyWith =>
      __$$ShippingAddressModelImplCopyWithImpl<_$ShippingAddressModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ShippingAddressModelImplToJson(this);
  }
}

abstract class _ShippingAddressModel implements ShippingAddressModel {
  const factory _ShippingAddressModel({
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "mobile") final String? mobile,
    @JsonKey(name: "email") final String? email,
    @JsonKey(name: "address") final String? address,
  }) = _$ShippingAddressModelImpl;

  factory _ShippingAddressModel.fromJson(Map<String, dynamic> json) =
      _$ShippingAddressModelImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "mobile")
  String? get mobile;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "address")
  String? get address;

  /// Create a copy of ShippingAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShippingAddressModelImplCopyWith<_$ShippingAddressModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PaymentAddressModel _$PaymentAddressModelFromJson(Map<String, dynamic> json) {
  return _PaymentAddressModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentAddressModel {
  @JsonKey(name: "region_id")
  String? get regionId => throw _privateConstructorUsedError;
  @JsonKey(name: "region_code")
  String? get regionCode => throw _privateConstructorUsedError;
  @JsonKey(name: "country_id")
  String? get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: "region")
  String? get region => throw _privateConstructorUsedError;
  @JsonKey(name: "street")
  List<String>? get street => throw _privateConstructorUsedError;
  @JsonKey(name: "postcode")
  String? get postcode => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: "firstname")
  String? get firstname => throw _privateConstructorUsedError;
  @JsonKey(name: "lastname")
  String? get lastname => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_id")
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "telephone")
  String? get telephone => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_carrier_code")
  String? get shippingCarrierCode => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_method_code")
  String? get shippingMethodCode => throw _privateConstructorUsedError;
  @JsonKey(name: "quoteId")
  String? get quoteId => throw _privateConstructorUsedError;

  /// Serializes this PaymentAddressModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentAddressModelCopyWith<PaymentAddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentAddressModelCopyWith<$Res> {
  factory $PaymentAddressModelCopyWith(
    PaymentAddressModel value,
    $Res Function(PaymentAddressModel) then,
  ) = _$PaymentAddressModelCopyWithImpl<$Res, PaymentAddressModel>;
  @useResult
  $Res call({
    @JsonKey(name: "region_id") String? regionId,
    @JsonKey(name: "region_code") String? regionCode,
    @JsonKey(name: "country_id") String? countryId,
    @JsonKey(name: "region") String? region,
    @JsonKey(name: "street") List<String>? street,
    @JsonKey(name: "postcode") String? postcode,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "firstname") String? firstname,
    @JsonKey(name: "lastname") String? lastname,
    @JsonKey(name: "customer_id") String? customerId,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "telephone") String? telephone,
    @JsonKey(name: "shipping_carrier_code") String? shippingCarrierCode,
    @JsonKey(name: "shipping_method_code") String? shippingMethodCode,
    @JsonKey(name: "quoteId") String? quoteId,
  });
}

/// @nodoc
class _$PaymentAddressModelCopyWithImpl<$Res, $Val extends PaymentAddressModel>
    implements $PaymentAddressModelCopyWith<$Res> {
  _$PaymentAddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionId = freezed,
    Object? regionCode = freezed,
    Object? countryId = freezed,
    Object? region = freezed,
    Object? street = freezed,
    Object? postcode = freezed,
    Object? city = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? customerId = freezed,
    Object? email = freezed,
    Object? telephone = freezed,
    Object? shippingCarrierCode = freezed,
    Object? shippingMethodCode = freezed,
    Object? quoteId = freezed,
  }) {
    return _then(
      _value.copyWith(
            regionId:
                freezed == regionId
                    ? _value.regionId
                    : regionId // ignore: cast_nullable_to_non_nullable
                        as String?,
            regionCode:
                freezed == regionCode
                    ? _value.regionCode
                    : regionCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            countryId:
                freezed == countryId
                    ? _value.countryId
                    : countryId // ignore: cast_nullable_to_non_nullable
                        as String?,
            region:
                freezed == region
                    ? _value.region
                    : region // ignore: cast_nullable_to_non_nullable
                        as String?,
            street:
                freezed == street
                    ? _value.street
                    : street // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            postcode:
                freezed == postcode
                    ? _value.postcode
                    : postcode // ignore: cast_nullable_to_non_nullable
                        as String?,
            city:
                freezed == city
                    ? _value.city
                    : city // ignore: cast_nullable_to_non_nullable
                        as String?,
            firstname:
                freezed == firstname
                    ? _value.firstname
                    : firstname // ignore: cast_nullable_to_non_nullable
                        as String?,
            lastname:
                freezed == lastname
                    ? _value.lastname
                    : lastname // ignore: cast_nullable_to_non_nullable
                        as String?,
            customerId:
                freezed == customerId
                    ? _value.customerId
                    : customerId // ignore: cast_nullable_to_non_nullable
                        as String?,
            email:
                freezed == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String?,
            telephone:
                freezed == telephone
                    ? _value.telephone
                    : telephone // ignore: cast_nullable_to_non_nullable
                        as String?,
            shippingCarrierCode:
                freezed == shippingCarrierCode
                    ? _value.shippingCarrierCode
                    : shippingCarrierCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            shippingMethodCode:
                freezed == shippingMethodCode
                    ? _value.shippingMethodCode
                    : shippingMethodCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            quoteId:
                freezed == quoteId
                    ? _value.quoteId
                    : quoteId // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentAddressModelImplCopyWith<$Res>
    implements $PaymentAddressModelCopyWith<$Res> {
  factory _$$PaymentAddressModelImplCopyWith(
    _$PaymentAddressModelImpl value,
    $Res Function(_$PaymentAddressModelImpl) then,
  ) = __$$PaymentAddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "region_id") String? regionId,
    @JsonKey(name: "region_code") String? regionCode,
    @JsonKey(name: "country_id") String? countryId,
    @JsonKey(name: "region") String? region,
    @JsonKey(name: "street") List<String>? street,
    @JsonKey(name: "postcode") String? postcode,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "firstname") String? firstname,
    @JsonKey(name: "lastname") String? lastname,
    @JsonKey(name: "customer_id") String? customerId,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "telephone") String? telephone,
    @JsonKey(name: "shipping_carrier_code") String? shippingCarrierCode,
    @JsonKey(name: "shipping_method_code") String? shippingMethodCode,
    @JsonKey(name: "quoteId") String? quoteId,
  });
}

/// @nodoc
class __$$PaymentAddressModelImplCopyWithImpl<$Res>
    extends _$PaymentAddressModelCopyWithImpl<$Res, _$PaymentAddressModelImpl>
    implements _$$PaymentAddressModelImplCopyWith<$Res> {
  __$$PaymentAddressModelImplCopyWithImpl(
    _$PaymentAddressModelImpl _value,
    $Res Function(_$PaymentAddressModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionId = freezed,
    Object? regionCode = freezed,
    Object? countryId = freezed,
    Object? region = freezed,
    Object? street = freezed,
    Object? postcode = freezed,
    Object? city = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? customerId = freezed,
    Object? email = freezed,
    Object? telephone = freezed,
    Object? shippingCarrierCode = freezed,
    Object? shippingMethodCode = freezed,
    Object? quoteId = freezed,
  }) {
    return _then(
      _$PaymentAddressModelImpl(
        regionId:
            freezed == regionId
                ? _value.regionId
                : regionId // ignore: cast_nullable_to_non_nullable
                    as String?,
        regionCode:
            freezed == regionCode
                ? _value.regionCode
                : regionCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        countryId:
            freezed == countryId
                ? _value.countryId
                : countryId // ignore: cast_nullable_to_non_nullable
                    as String?,
        region:
            freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                    as String?,
        street:
            freezed == street
                ? _value._street
                : street // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        postcode:
            freezed == postcode
                ? _value.postcode
                : postcode // ignore: cast_nullable_to_non_nullable
                    as String?,
        city:
            freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as String?,
        firstname:
            freezed == firstname
                ? _value.firstname
                : firstname // ignore: cast_nullable_to_non_nullable
                    as String?,
        lastname:
            freezed == lastname
                ? _value.lastname
                : lastname // ignore: cast_nullable_to_non_nullable
                    as String?,
        customerId:
            freezed == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                    as String?,
        email:
            freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String?,
        telephone:
            freezed == telephone
                ? _value.telephone
                : telephone // ignore: cast_nullable_to_non_nullable
                    as String?,
        shippingCarrierCode:
            freezed == shippingCarrierCode
                ? _value.shippingCarrierCode
                : shippingCarrierCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        shippingMethodCode:
            freezed == shippingMethodCode
                ? _value.shippingMethodCode
                : shippingMethodCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        quoteId:
            freezed == quoteId
                ? _value.quoteId
                : quoteId // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentAddressModelImpl implements _PaymentAddressModel {
  const _$PaymentAddressModelImpl({
    @JsonKey(name: "region_id") this.regionId,
    @JsonKey(name: "region_code") this.regionCode,
    @JsonKey(name: "country_id") this.countryId,
    @JsonKey(name: "region") this.region,
    @JsonKey(name: "street") final List<String>? street,
    @JsonKey(name: "postcode") this.postcode,
    @JsonKey(name: "city") this.city,
    @JsonKey(name: "firstname") this.firstname,
    @JsonKey(name: "lastname") this.lastname,
    @JsonKey(name: "customer_id") this.customerId,
    @JsonKey(name: "email") this.email,
    @JsonKey(name: "telephone") this.telephone,
    @JsonKey(name: "shipping_carrier_code") this.shippingCarrierCode,
    @JsonKey(name: "shipping_method_code") this.shippingMethodCode,
    @JsonKey(name: "quoteId") this.quoteId,
  }) : _street = street;

  factory _$PaymentAddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentAddressModelImplFromJson(json);

  @override
  @JsonKey(name: "region_id")
  final String? regionId;
  @override
  @JsonKey(name: "region_code")
  final String? regionCode;
  @override
  @JsonKey(name: "country_id")
  final String? countryId;
  @override
  @JsonKey(name: "region")
  final String? region;
  final List<String>? _street;
  @override
  @JsonKey(name: "street")
  List<String>? get street {
    final value = _street;
    if (value == null) return null;
    if (_street is EqualUnmodifiableListView) return _street;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "postcode")
  final String? postcode;
  @override
  @JsonKey(name: "city")
  final String? city;
  @override
  @JsonKey(name: "firstname")
  final String? firstname;
  @override
  @JsonKey(name: "lastname")
  final String? lastname;
  @override
  @JsonKey(name: "customer_id")
  final String? customerId;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "telephone")
  final String? telephone;
  @override
  @JsonKey(name: "shipping_carrier_code")
  final String? shippingCarrierCode;
  @override
  @JsonKey(name: "shipping_method_code")
  final String? shippingMethodCode;
  @override
  @JsonKey(name: "quoteId")
  final String? quoteId;

  @override
  String toString() {
    return 'PaymentAddressModel(regionId: $regionId, regionCode: $regionCode, countryId: $countryId, region: $region, street: $street, postcode: $postcode, city: $city, firstname: $firstname, lastname: $lastname, customerId: $customerId, email: $email, telephone: $telephone, shippingCarrierCode: $shippingCarrierCode, shippingMethodCode: $shippingMethodCode, quoteId: $quoteId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentAddressModelImpl &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.regionCode, regionCode) ||
                other.regionCode == regionCode) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.region, region) || other.region == region) &&
            const DeepCollectionEquality().equals(other._street, _street) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.shippingCarrierCode, shippingCarrierCode) ||
                other.shippingCarrierCode == shippingCarrierCode) &&
            (identical(other.shippingMethodCode, shippingMethodCode) ||
                other.shippingMethodCode == shippingMethodCode) &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    regionId,
    regionCode,
    countryId,
    region,
    const DeepCollectionEquality().hash(_street),
    postcode,
    city,
    firstname,
    lastname,
    customerId,
    email,
    telephone,
    shippingCarrierCode,
    shippingMethodCode,
    quoteId,
  );

  /// Create a copy of PaymentAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentAddressModelImplCopyWith<_$PaymentAddressModelImpl> get copyWith =>
      __$$PaymentAddressModelImplCopyWithImpl<_$PaymentAddressModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentAddressModelImplToJson(this);
  }
}

abstract class _PaymentAddressModel implements PaymentAddressModel {
  const factory _PaymentAddressModel({
    @JsonKey(name: "region_id") final String? regionId,
    @JsonKey(name: "region_code") final String? regionCode,
    @JsonKey(name: "country_id") final String? countryId,
    @JsonKey(name: "region") final String? region,
    @JsonKey(name: "street") final List<String>? street,
    @JsonKey(name: "postcode") final String? postcode,
    @JsonKey(name: "city") final String? city,
    @JsonKey(name: "firstname") final String? firstname,
    @JsonKey(name: "lastname") final String? lastname,
    @JsonKey(name: "customer_id") final String? customerId,
    @JsonKey(name: "email") final String? email,
    @JsonKey(name: "telephone") final String? telephone,
    @JsonKey(name: "shipping_carrier_code") final String? shippingCarrierCode,
    @JsonKey(name: "shipping_method_code") final String? shippingMethodCode,
    @JsonKey(name: "quoteId") final String? quoteId,
  }) = _$PaymentAddressModelImpl;

  factory _PaymentAddressModel.fromJson(Map<String, dynamic> json) =
      _$PaymentAddressModelImpl.fromJson;

  @override
  @JsonKey(name: "region_id")
  String? get regionId;
  @override
  @JsonKey(name: "region_code")
  String? get regionCode;
  @override
  @JsonKey(name: "country_id")
  String? get countryId;
  @override
  @JsonKey(name: "region")
  String? get region;
  @override
  @JsonKey(name: "street")
  List<String>? get street;
  @override
  @JsonKey(name: "postcode")
  String? get postcode;
  @override
  @JsonKey(name: "city")
  String? get city;
  @override
  @JsonKey(name: "firstname")
  String? get firstname;
  @override
  @JsonKey(name: "lastname")
  String? get lastname;
  @override
  @JsonKey(name: "customer_id")
  String? get customerId;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "telephone")
  String? get telephone;
  @override
  @JsonKey(name: "shipping_carrier_code")
  String? get shippingCarrierCode;
  @override
  @JsonKey(name: "shipping_method_code")
  String? get shippingMethodCode;
  @override
  @JsonKey(name: "quoteId")
  String? get quoteId;

  /// Create a copy of PaymentAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentAddressModelImplCopyWith<_$PaymentAddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentInfoModel _$PaymentInfoModelFromJson(Map<String, dynamic> json) {
  return _PaymentInfoModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentInfoModel {
  @JsonKey(name: "code")
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "value")
  Object? get value => throw _privateConstructorUsedError;

  /// Serializes this PaymentInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentInfoModelCopyWith<PaymentInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInfoModelCopyWith<$Res> {
  factory $PaymentInfoModelCopyWith(
    PaymentInfoModel value,
    $Res Function(PaymentInfoModel) then,
  ) = _$PaymentInfoModelCopyWithImpl<$Res, PaymentInfoModel>;
  @useResult
  $Res call({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "value") Object? value,
  });
}

/// @nodoc
class _$PaymentInfoModelCopyWithImpl<$Res, $Val extends PaymentInfoModel>
    implements $PaymentInfoModelCopyWith<$Res> {
  _$PaymentInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? title = freezed,
    Object? value = freezed,
  }) {
    return _then(
      _value.copyWith(
            code:
                freezed == code
                    ? _value.code
                    : code // ignore: cast_nullable_to_non_nullable
                        as String?,
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            value: freezed == value ? _value.value : value,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentInfoModelImplCopyWith<$Res>
    implements $PaymentInfoModelCopyWith<$Res> {
  factory _$$PaymentInfoModelImplCopyWith(
    _$PaymentInfoModelImpl value,
    $Res Function(_$PaymentInfoModelImpl) then,
  ) = __$$PaymentInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "value") Object? value,
  });
}

/// @nodoc
class __$$PaymentInfoModelImplCopyWithImpl<$Res>
    extends _$PaymentInfoModelCopyWithImpl<$Res, _$PaymentInfoModelImpl>
    implements _$$PaymentInfoModelImplCopyWith<$Res> {
  __$$PaymentInfoModelImplCopyWithImpl(
    _$PaymentInfoModelImpl _value,
    $Res Function(_$PaymentInfoModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? title = freezed,
    Object? value = freezed,
  }) {
    return _then(
      _$PaymentInfoModelImpl(
        code:
            freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                    as String?,
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        value: freezed == value ? _value.value : value,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentInfoModelImpl implements _PaymentInfoModel {
  const _$PaymentInfoModelImpl({
    @JsonKey(name: "code") this.code,
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "value") this.value,
  });

  factory _$PaymentInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentInfoModelImplFromJson(json);

  @override
  @JsonKey(name: "code")
  final String? code;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "value")
  final Object? value;

  @override
  String toString() {
    return 'PaymentInfoModel(code: $code, title: $title, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentInfoModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    title,
    const DeepCollectionEquality().hash(value),
  );

  /// Create a copy of PaymentInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentInfoModelImplCopyWith<_$PaymentInfoModelImpl> get copyWith =>
      __$$PaymentInfoModelImplCopyWithImpl<_$PaymentInfoModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentInfoModelImplToJson(this);
  }
}

abstract class _PaymentInfoModel implements PaymentInfoModel {
  const factory _PaymentInfoModel({
    @JsonKey(name: "code") final String? code,
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "value") final Object? value,
  }) = _$PaymentInfoModelImpl;

  factory _PaymentInfoModel.fromJson(Map<String, dynamic> json) =
      _$PaymentInfoModelImpl.fromJson;

  @override
  @JsonKey(name: "code")
  String? get code;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "value")
  Object? get value;

  /// Create a copy of PaymentInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentInfoModelImplCopyWith<_$PaymentInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatusHistoryModel _$StatusHistoryModelFromJson(Map<String, dynamic> json) {
  return _StatusHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$StatusHistoryModel {
  @JsonKey(name: "entity_id")
  String? get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: "parent_id")
  String? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: "is_customer_notified")
  String? get isCustomerNotified => throw _privateConstructorUsedError;
  @JsonKey(name: "is_visible_on_front")
  String? get isVisibleOnFront => throw _privateConstructorUsedError;
  @JsonKey(name: "comment")
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(
    name: "created_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(
    name: "entity_name",
    fromJson: safeEntityNameFromJson,
    toJson: safeEntityNameToJson,
  )
  EntityName? get entityName => throw _privateConstructorUsedError;
  @JsonKey(name: "seller_order_id")
  dynamic get sellerOrderId => throw _privateConstructorUsedError;

  /// Serializes this StatusHistoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatusHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusHistoryModelCopyWith<StatusHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusHistoryModelCopyWith<$Res> {
  factory $StatusHistoryModelCopyWith(
    StatusHistoryModel value,
    $Res Function(StatusHistoryModel) then,
  ) = _$StatusHistoryModelCopyWithImpl<$Res, StatusHistoryModel>;
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") String? entityId,
    @JsonKey(name: "parent_id") String? parentId,
    @JsonKey(name: "is_customer_notified") String? isCustomerNotified,
    @JsonKey(name: "is_visible_on_front") String? isVisibleOnFront,
    @JsonKey(name: "comment") String? comment,
    @JsonKey(name: "status") String? status,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    DateTime? createdAt,
    @JsonKey(
      name: "entity_name",
      fromJson: safeEntityNameFromJson,
      toJson: safeEntityNameToJson,
    )
    EntityName? entityName,
    @JsonKey(name: "seller_order_id") dynamic sellerOrderId,
  });
}

/// @nodoc
class _$StatusHistoryModelCopyWithImpl<$Res, $Val extends StatusHistoryModel>
    implements $StatusHistoryModelCopyWith<$Res> {
  _$StatusHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? parentId = freezed,
    Object? isCustomerNotified = freezed,
    Object? isVisibleOnFront = freezed,
    Object? comment = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? entityName = freezed,
    Object? sellerOrderId = freezed,
  }) {
    return _then(
      _value.copyWith(
            entityId:
                freezed == entityId
                    ? _value.entityId
                    : entityId // ignore: cast_nullable_to_non_nullable
                        as String?,
            parentId:
                freezed == parentId
                    ? _value.parentId
                    : parentId // ignore: cast_nullable_to_non_nullable
                        as String?,
            isCustomerNotified:
                freezed == isCustomerNotified
                    ? _value.isCustomerNotified
                    : isCustomerNotified // ignore: cast_nullable_to_non_nullable
                        as String?,
            isVisibleOnFront:
                freezed == isVisibleOnFront
                    ? _value.isVisibleOnFront
                    : isVisibleOnFront // ignore: cast_nullable_to_non_nullable
                        as String?,
            comment:
                freezed == comment
                    ? _value.comment
                    : comment // ignore: cast_nullable_to_non_nullable
                        as String?,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            entityName:
                freezed == entityName
                    ? _value.entityName
                    : entityName // ignore: cast_nullable_to_non_nullable
                        as EntityName?,
            sellerOrderId:
                freezed == sellerOrderId
                    ? _value.sellerOrderId
                    : sellerOrderId // ignore: cast_nullable_to_non_nullable
                        as dynamic,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StatusHistoryModelImplCopyWith<$Res>
    implements $StatusHistoryModelCopyWith<$Res> {
  factory _$$StatusHistoryModelImplCopyWith(
    _$StatusHistoryModelImpl value,
    $Res Function(_$StatusHistoryModelImpl) then,
  ) = __$$StatusHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") String? entityId,
    @JsonKey(name: "parent_id") String? parentId,
    @JsonKey(name: "is_customer_notified") String? isCustomerNotified,
    @JsonKey(name: "is_visible_on_front") String? isVisibleOnFront,
    @JsonKey(name: "comment") String? comment,
    @JsonKey(name: "status") String? status,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    DateTime? createdAt,
    @JsonKey(
      name: "entity_name",
      fromJson: safeEntityNameFromJson,
      toJson: safeEntityNameToJson,
    )
    EntityName? entityName,
    @JsonKey(name: "seller_order_id") dynamic sellerOrderId,
  });
}

/// @nodoc
class __$$StatusHistoryModelImplCopyWithImpl<$Res>
    extends _$StatusHistoryModelCopyWithImpl<$Res, _$StatusHistoryModelImpl>
    implements _$$StatusHistoryModelImplCopyWith<$Res> {
  __$$StatusHistoryModelImplCopyWithImpl(
    _$StatusHistoryModelImpl _value,
    $Res Function(_$StatusHistoryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatusHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? parentId = freezed,
    Object? isCustomerNotified = freezed,
    Object? isVisibleOnFront = freezed,
    Object? comment = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? entityName = freezed,
    Object? sellerOrderId = freezed,
  }) {
    return _then(
      _$StatusHistoryModelImpl(
        entityId:
            freezed == entityId
                ? _value.entityId
                : entityId // ignore: cast_nullable_to_non_nullable
                    as String?,
        parentId:
            freezed == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                    as String?,
        isCustomerNotified:
            freezed == isCustomerNotified
                ? _value.isCustomerNotified
                : isCustomerNotified // ignore: cast_nullable_to_non_nullable
                    as String?,
        isVisibleOnFront:
            freezed == isVisibleOnFront
                ? _value.isVisibleOnFront
                : isVisibleOnFront // ignore: cast_nullable_to_non_nullable
                    as String?,
        comment:
            freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                    as String?,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        entityName:
            freezed == entityName
                ? _value.entityName
                : entityName // ignore: cast_nullable_to_non_nullable
                    as EntityName?,
        sellerOrderId:
            freezed == sellerOrderId
                ? _value.sellerOrderId
                : sellerOrderId // ignore: cast_nullable_to_non_nullable
                    as dynamic,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusHistoryModelImpl implements _StatusHistoryModel {
  const _$StatusHistoryModelImpl({
    @JsonKey(name: "entity_id") this.entityId,
    @JsonKey(name: "parent_id") this.parentId,
    @JsonKey(name: "is_customer_notified") this.isCustomerNotified,
    @JsonKey(name: "is_visible_on_front") this.isVisibleOnFront,
    @JsonKey(name: "comment") this.comment,
    @JsonKey(name: "status") this.status,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    this.createdAt,
    @JsonKey(
      name: "entity_name",
      fromJson: safeEntityNameFromJson,
      toJson: safeEntityNameToJson,
    )
    this.entityName,
    @JsonKey(name: "seller_order_id") this.sellerOrderId,
  });

  factory _$StatusHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusHistoryModelImplFromJson(json);

  @override
  @JsonKey(name: "entity_id")
  final String? entityId;
  @override
  @JsonKey(name: "parent_id")
  final String? parentId;
  @override
  @JsonKey(name: "is_customer_notified")
  final String? isCustomerNotified;
  @override
  @JsonKey(name: "is_visible_on_front")
  final String? isVisibleOnFront;
  @override
  @JsonKey(name: "comment")
  final String? comment;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(
    name: "created_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  final DateTime? createdAt;
  @override
  @JsonKey(
    name: "entity_name",
    fromJson: safeEntityNameFromJson,
    toJson: safeEntityNameToJson,
  )
  final EntityName? entityName;
  @override
  @JsonKey(name: "seller_order_id")
  final dynamic sellerOrderId;

  @override
  String toString() {
    return 'StatusHistoryModel(entityId: $entityId, parentId: $parentId, isCustomerNotified: $isCustomerNotified, isVisibleOnFront: $isVisibleOnFront, comment: $comment, status: $status, createdAt: $createdAt, entityName: $entityName, sellerOrderId: $sellerOrderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusHistoryModelImpl &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.isCustomerNotified, isCustomerNotified) ||
                other.isCustomerNotified == isCustomerNotified) &&
            (identical(other.isVisibleOnFront, isVisibleOnFront) ||
                other.isVisibleOnFront == isVisibleOnFront) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.entityName, entityName) ||
                other.entityName == entityName) &&
            const DeepCollectionEquality().equals(
              other.sellerOrderId,
              sellerOrderId,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    entityId,
    parentId,
    isCustomerNotified,
    isVisibleOnFront,
    comment,
    status,
    createdAt,
    entityName,
    const DeepCollectionEquality().hash(sellerOrderId),
  );

  /// Create a copy of StatusHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusHistoryModelImplCopyWith<_$StatusHistoryModelImpl> get copyWith =>
      __$$StatusHistoryModelImplCopyWithImpl<_$StatusHistoryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusHistoryModelImplToJson(this);
  }
}

abstract class _StatusHistoryModel implements StatusHistoryModel {
  const factory _StatusHistoryModel({
    @JsonKey(name: "entity_id") final String? entityId,
    @JsonKey(name: "parent_id") final String? parentId,
    @JsonKey(name: "is_customer_notified") final String? isCustomerNotified,
    @JsonKey(name: "is_visible_on_front") final String? isVisibleOnFront,
    @JsonKey(name: "comment") final String? comment,
    @JsonKey(name: "status") final String? status,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    final DateTime? createdAt,
    @JsonKey(
      name: "entity_name",
      fromJson: safeEntityNameFromJson,
      toJson: safeEntityNameToJson,
    )
    final EntityName? entityName,
    @JsonKey(name: "seller_order_id") final dynamic sellerOrderId,
  }) = _$StatusHistoryModelImpl;

  factory _StatusHistoryModel.fromJson(Map<String, dynamic> json) =
      _$StatusHistoryModelImpl.fromJson;

  @override
  @JsonKey(name: "entity_id")
  String? get entityId;
  @override
  @JsonKey(name: "parent_id")
  String? get parentId;
  @override
  @JsonKey(name: "is_customer_notified")
  String? get isCustomerNotified;
  @override
  @JsonKey(name: "is_visible_on_front")
  String? get isVisibleOnFront;
  @override
  @JsonKey(name: "comment")
  String? get comment;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(
    name: "created_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  DateTime? get createdAt;
  @override
  @JsonKey(
    name: "entity_name",
    fromJson: safeEntityNameFromJson,
    toJson: safeEntityNameToJson,
  )
  EntityName? get entityName;
  @override
  @JsonKey(name: "seller_order_id")
  dynamic get sellerOrderId;

  /// Create a copy of StatusHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusHistoryModelImplCopyWith<_$StatusHistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatusLabel _$StatusLabelFromJson(Map<String, dynamic> json) {
  return _StatusLabel.fromJson(json);
}

/// @nodoc
mixin _$StatusLabel {
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "state")
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: "is_default")
  String? get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: "visible_on_front")
  String? get visibleOnFront => throw _privateConstructorUsedError;

  /// Serializes this StatusLabel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatusLabel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusLabelCopyWith<StatusLabel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusLabelCopyWith<$Res> {
  factory $StatusLabelCopyWith(
    StatusLabel value,
    $Res Function(StatusLabel) then,
  ) = _$StatusLabelCopyWithImpl<$Res, StatusLabel>;
  @useResult
  $Res call({
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "is_default") String? isDefault,
    @JsonKey(name: "visible_on_front") String? visibleOnFront,
  });
}

/// @nodoc
class _$StatusLabelCopyWithImpl<$Res, $Val extends StatusLabel>
    implements $StatusLabelCopyWith<$Res> {
  _$StatusLabelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusLabel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? state = freezed,
    Object? isDefault = freezed,
    Object? visibleOnFront = freezed,
  }) {
    return _then(
      _value.copyWith(
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String?,
            state:
                freezed == state
                    ? _value.state
                    : state // ignore: cast_nullable_to_non_nullable
                        as String?,
            isDefault:
                freezed == isDefault
                    ? _value.isDefault
                    : isDefault // ignore: cast_nullable_to_non_nullable
                        as String?,
            visibleOnFront:
                freezed == visibleOnFront
                    ? _value.visibleOnFront
                    : visibleOnFront // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StatusLabelImplCopyWith<$Res>
    implements $StatusLabelCopyWith<$Res> {
  factory _$$StatusLabelImplCopyWith(
    _$StatusLabelImpl value,
    $Res Function(_$StatusLabelImpl) then,
  ) = __$$StatusLabelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "is_default") String? isDefault,
    @JsonKey(name: "visible_on_front") String? visibleOnFront,
  });
}

/// @nodoc
class __$$StatusLabelImplCopyWithImpl<$Res>
    extends _$StatusLabelCopyWithImpl<$Res, _$StatusLabelImpl>
    implements _$$StatusLabelImplCopyWith<$Res> {
  __$$StatusLabelImplCopyWithImpl(
    _$StatusLabelImpl _value,
    $Res Function(_$StatusLabelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatusLabel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? state = freezed,
    Object? isDefault = freezed,
    Object? visibleOnFront = freezed,
  }) {
    return _then(
      _$StatusLabelImpl(
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String?,
        state:
            freezed == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                    as String?,
        isDefault:
            freezed == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                    as String?,
        visibleOnFront:
            freezed == visibleOnFront
                ? _value.visibleOnFront
                : visibleOnFront // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusLabelImpl implements _StatusLabel {
  const _$StatusLabelImpl({
    @JsonKey(name: "status") this.status,
    @JsonKey(name: "state") this.state,
    @JsonKey(name: "is_default") this.isDefault,
    @JsonKey(name: "visible_on_front") this.visibleOnFront,
  });

  factory _$StatusLabelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusLabelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "state")
  final String? state;
  @override
  @JsonKey(name: "is_default")
  final String? isDefault;
  @override
  @JsonKey(name: "visible_on_front")
  final String? visibleOnFront;

  @override
  String toString() {
    return 'StatusLabel(status: $status, state: $state, isDefault: $isDefault, visibleOnFront: $visibleOnFront)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusLabelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.visibleOnFront, visibleOnFront) ||
                other.visibleOnFront == visibleOnFront));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, state, isDefault, visibleOnFront);

  /// Create a copy of StatusLabel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusLabelImplCopyWith<_$StatusLabelImpl> get copyWith =>
      __$$StatusLabelImplCopyWithImpl<_$StatusLabelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusLabelImplToJson(this);
  }
}

abstract class _StatusLabel implements StatusLabel {
  const factory _StatusLabel({
    @JsonKey(name: "status") final String? status,
    @JsonKey(name: "state") final String? state,
    @JsonKey(name: "is_default") final String? isDefault,
    @JsonKey(name: "visible_on_front") final String? visibleOnFront,
  }) = _$StatusLabelImpl;

  factory _StatusLabel.fromJson(Map<String, dynamic> json) =
      _$StatusLabelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "state")
  String? get state;
  @override
  @JsonKey(name: "is_default")
  String? get isDefault;
  @override
  @JsonKey(name: "visible_on_front")
  String? get visibleOnFront;

  /// Create a copy of StatusLabel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusLabelImplCopyWith<_$StatusLabelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
