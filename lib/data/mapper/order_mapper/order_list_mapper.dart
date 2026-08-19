import 'package:pickaboo/data/model/order/order_list_response/order_list_response.dart';
import 'package:pickaboo/domain/entity/order/order_list_entity.dart' as entity;
import 'package:pickaboo/domain/entity/order/order_item_entity.dart' as entity;

extension OrderListResponseMapper on OrderListResponse {
  entity.OrderListEntity toDomain() {
    return entity.OrderListEntity(
      customerId: customerId ?? 0,
      totalOrdersCount: totalOrdersCount ?? 0,
      items: items?.map((e) => e.toDomain()).toList() ?? const [],
    );
  }
}

extension OrderItemModelMapper on OrderItemModel {
  entity.OrderItemEntity toDomain() {
    return entity.OrderItemEntity(
      orderId: orderId ?? 0,
      orderNumber: orderNumber ?? '',
      createdAt: createdAt ?? '',
      state: state ?? '',
      status: status ?? '',
      subtotal: subtotal ?? 0.0,
      discountAmount: discountAmount ?? 0.0,
      shipping: shipping ?? 0.0,
      grandtotal: grandtotal ?? 0.0,
      currencyCode: currencyCode ?? '',
      remoteIp: remoteIp ?? '',
      paymentMode: paymentMode ?? '',
      paymentMethod: paymentMethod ?? '',
    );
  }
}
