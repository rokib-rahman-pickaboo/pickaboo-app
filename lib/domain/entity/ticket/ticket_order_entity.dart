class TicketOrderEntity {
  final String orderId;
  final String incrementId;
  final String createdAt;
  final String status;
  final double grandTotal;

  const TicketOrderEntity({
    required this.orderId,
    required this.incrementId,
    required this.createdAt,
    required this.status,
    required this.grandTotal,
  });
}
