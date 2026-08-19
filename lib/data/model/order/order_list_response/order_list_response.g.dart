// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderListResponseImpl _$$OrderListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OrderListResponseImpl(
  customerId: (json['customer_id'] as num?)?.toInt(),
  totalOrdersCount: (json['total_orders_count'] as num?)?.toInt(),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  statusHistory: json['status_history'],
);

Map<String, dynamic> _$$OrderListResponseImplToJson(
  _$OrderListResponseImpl instance,
) => <String, dynamic>{
  'customer_id': instance.customerId,
  'total_orders_count': instance.totalOrdersCount,
  'items': instance.items,
  'status_history': instance.statusHistory,
};

_$OrderItemModelImpl _$$OrderItemModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemModelImpl(
      orderId: (json['order_id'] as num?)?.toInt(),
      orderNumber: json['order_number'] as String?,
      createdAt: json['created_at'] as String?,
      state: json['state'] as String?,
      status: json['status'] as String?,
      subtotal: (json['subtotal'] as num?)?.toDouble(),
      discountAmount: (json['discount_amount'] as num?)?.toDouble(),
      shipping: (json['shipping'] as num?)?.toDouble(),
      grandtotal: (json['grandtotal'] as num?)?.toDouble(),
      currencyCode: json['currency_code'] as String?,
      remoteIp: json['remote_ip'] as String?,
      paymentMode: json['payment_mode'] as String?,
      paymentMethod: json['payment_method'] as String?,
    );

Map<String, dynamic> _$$OrderItemModelImplToJson(
  _$OrderItemModelImpl instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'order_number': instance.orderNumber,
  'created_at': instance.createdAt,
  'state': instance.state,
  'status': instance.status,
  'subtotal': instance.subtotal,
  'discount_amount': instance.discountAmount,
  'shipping': instance.shipping,
  'grandtotal': instance.grandtotal,
  'currency_code': instance.currencyCode,
  'remote_ip': instance.remoteIp,
  'payment_mode': instance.paymentMode,
  'payment_method': instance.paymentMethod,
};
