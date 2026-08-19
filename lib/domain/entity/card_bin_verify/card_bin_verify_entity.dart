class CardBinVerifyEntity {
  final bool success;
  final String message;
  final String couponCode;
  final int discountAmount;
  final String ruleName;
  final bool isApplied;
  final String binNumber;
  final String cardType;
  final String bankName;
  final String paymentMethod;
  final int statusCode;

  const CardBinVerifyEntity({
    required this.success,
    required this.message,
    required this.couponCode,
    required this.discountAmount,
    required this.ruleName,
    required this.isApplied,
    required this.binNumber,
    required this.cardType,
    required this.bankName,
    required this.paymentMethod,
    required this.statusCode,
  });
}
