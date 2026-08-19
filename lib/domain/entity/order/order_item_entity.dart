class OrderItemEntity {
  final int orderId;
  final String orderNumber;
  final String createdAt;
  final String state;
  final String status;
  final double subtotal;
  final double discountAmount;
  final double shipping;
  final double grandtotal;
  final String currencyCode;
  final String remoteIp;
  final String paymentMode;
  final String paymentMethod;

  const OrderItemEntity({
    required this.orderId,
    required this.orderNumber,
    required this.createdAt,
    required this.state,
    required this.status,
    required this.subtotal,
    required this.discountAmount,
    required this.shipping,
    required this.grandtotal,
    required this.currencyCode,
    required this.remoteIp,
    required this.paymentMode,
    required this.paymentMethod,
  });
}
