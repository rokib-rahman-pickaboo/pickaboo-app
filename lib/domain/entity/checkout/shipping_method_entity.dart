class ShippingMethodEntity {
  final String carrierCode;
  final String methodCode;
  final String carrierTitle;
  final String methodTitle;
  final double amount;
  final double baseAmount;
  final bool available;
  final String errorMessage;
  final double priceExclTax;
  final double priceInclTax;

  const ShippingMethodEntity({
    required this.carrierCode,
    required this.methodCode,
    required this.carrierTitle,
    required this.methodTitle,
    required this.amount,
    required this.baseAmount,
    required this.available,
    required this.errorMessage,
    required this.priceExclTax,
    required this.priceInclTax,
  });
}
