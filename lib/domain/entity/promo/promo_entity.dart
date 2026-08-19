class PromoEntity {
  final bool isEligible;
  final String message;
  final String couponCode;

  const PromoEntity({
    required this.isEligible,
    required this.message,
    required this.couponCode,
  });
}
