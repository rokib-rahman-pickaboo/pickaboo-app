import 'package:pickaboo/data/model/order/order_cancel_response/order_cancel_response.dart';
import 'package:pickaboo/domain/entity/order/order_cancel_entity.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';

extension OrderCancelResponseMapper on OrderCancelResponse {
  OrderCancelEntity toEntity() {
    return OrderCancelEntity(
      entityId: entityId ?? 0,
      incrementId: incrementId ?? '',
      state: state ?? '',
      status: status ?? '',
      createdAt: createdAt?.toIso8601String() ?? '',
      grandTotal: (grandTotal ?? 0).toDouble(),
      items: items?.map((item) => item.toEntity()).toList() ?? [],
      statusHistories:
          statusHistories?.map((history) => history.toEntity()).toList() ?? [],
    );
  }
}

extension OrderCancelItemMapper on Item {
  OrderCancelItemEntity toEntity() {
    return OrderCancelItemEntity(
      itemId: itemId ?? 0,
      name: name ?? '',
      sku: sku ?? '',
      qtyOrdered: qtyOrdered ?? 0,
      price: (price ?? 0).toDouble(),
      image: null,
      soldBy: null,
    );
  }
}

extension OrderCancelStatusHistoryMapper on StatusHistory {
  StatusHistoryEntity toEntity() {
    return StatusHistoryEntity(
      entityId: entityId ?? 0,
      comment: comment,
      status: status ?? '',
      createdAt: createdAt?.toIso8601String() ?? '',
    );
  }
}
