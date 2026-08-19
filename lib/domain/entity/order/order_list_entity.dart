import 'package:pickaboo/domain/entity/order/order_item_entity.dart';

class OrderListEntity {
  final int customerId;
  final int totalOrdersCount;
  final List<OrderItemEntity> items;

  const OrderListEntity({
    required this.customerId,
    required this.totalOrdersCount,
    required this.items,
  });
}
