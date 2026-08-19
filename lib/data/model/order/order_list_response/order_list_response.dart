import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_list_response.freezed.dart';
part 'order_list_response.g.dart';

@freezed
class OrderListResponse with _$OrderListResponse {
  const factory OrderListResponse({
    @JsonKey(name: 'customer_id') int? customerId,
    @JsonKey(name: 'total_orders_count') int? totalOrdersCount,
    @JsonKey(name: 'items') List<OrderItemModel>? items,
    @JsonKey(name: 'status_history') dynamic statusHistory,
  }) = _OrderListResponse;

  factory OrderListResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderListResponseFromJson(json);
}

@freezed
class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
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
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);
}
