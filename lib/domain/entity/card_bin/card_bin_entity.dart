class CardBinEntity {
  final bool success;
  final String message;
  final String couponCode;
  final int discountAmount;
  final String ruleName;
  final int statusCode;

  const CardBinEntity({
    required this.success,
    required this.message,
    required this.couponCode,
    required this.discountAmount,
    required this.ruleName,
    required this.statusCode,
  });
}
