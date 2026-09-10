class TicketOrderEntity {
  final String orderId;
  final String incrementId;
  final String? orderNumber;
  final String createdAt;
  final String status;
  final double grandTotal;

  const TicketOrderEntity({
    required this.orderId,
    required this.incrementId,
    this.orderNumber,
    required this.createdAt,
    required this.status,
    required this.grandTotal,
  });

  String get displayName {
    if (orderNumber != null && orderNumber!.isNotEmpty) {
      return orderNumber!;
    }
    if (incrementId.isNotEmpty) {
      return incrementId;
    }
    return orderId;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TicketOrderEntity &&
          runtimeType == other.runtimeType &&
          orderId == other.orderId;

  @override
  int get hashCode => orderId.hashCode;
}
