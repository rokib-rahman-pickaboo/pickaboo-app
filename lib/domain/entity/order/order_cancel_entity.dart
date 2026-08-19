import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';

class OrderCancelEntity {
  final int entityId;
  final String incrementId;
  final String state;
  final String status;
  final String createdAt;
  final double grandTotal;
  final List<OrderCancelItemEntity> items;
  final List<StatusHistoryEntity> statusHistories;

  const OrderCancelEntity({
    required this.entityId,
    required this.incrementId,
    required this.state,
    required this.status,
    required this.createdAt,
    required this.grandTotal,
    required this.items,
    required this.statusHistories,
  });
}

class OrderCancelItemEntity {
  final int itemId;
  final String name;
  final String sku;
  final int qtyOrdered;
  final double price;
  final String? image;
  final String? soldBy;

  const OrderCancelItemEntity({
    required this.itemId,
    required this.name,
    required this.sku,
    required this.qtyOrdered,
    required this.price,
    this.image,
    this.soldBy,
  });
}
