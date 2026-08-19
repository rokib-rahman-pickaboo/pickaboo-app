class CheckoutEmiEntity {
  final List<BankEmiDataEntity> bankEmiData;

  final String quoteShippingCost;

  final String quoteBillingCity;

  const CheckoutEmiEntity({
    required this.bankEmiData,
    required this.quoteShippingCost,
    required this.quoteBillingCity,
  });

  bool get isCardOnDeliveryAvailable =>
      quoteBillingCity.toLowerCase() == 'dhaka';

  double get shippingCost => double.tryParse(quoteShippingCost.trim()) ?? 0;
}

class BankEmiDataEntity {
  final String name;

  final String paymentGateway;

  final List<EmiTenureDetailEntity> emiTenures;
  final List<CemiTenureDetailEntity> cemiTenures;

  const BankEmiDataEntity({
    required this.name,
    required this.paymentGateway,
    required this.emiTenures,
    required this.cemiTenures,
  });
}

class EmiTenureDetailEntity {
  final int tenure;
  final String price;
  final String convenienceFee;
  final String conveniencePrice;
  final String cConvenienceFee;
  final String cConveniencePrice;
  final String monthlyPayable;
  final String total;
  final bool isSelected;

  const EmiTenureDetailEntity({
    required this.tenure,
    required this.price,
    required this.convenienceFee,
    required this.conveniencePrice,
    required this.cConvenienceFee,
    required this.cConveniencePrice,
    required this.monthlyPayable,
    required this.total,
    this.isSelected = false,
  });

  double get convenienceFeePercent =>
      double.tryParse(convenienceFee.trim()) ?? 0;

  double get priceAmount => double.tryParse(price.trim()) ?? 0;

  double productPrice(double shippingCost) {
    final net = priceAmount - shippingCost;
    return net > 0 ? net : priceAmount;
  }

  double convenienceFeeOn(double base) {
    final percent = convenienceFeePercent;
    if (percent <= 0 || base <= 0) return 0;
    return base * percent / 100;
  }

  double get convenienceFeeAmount => convenienceFeeOn(priceAmount);

  String get tenureLabel =>
      '৳${priceAmount.toStringAsFixed(2)} * $tenure Months '
      'Convenience fee $convenienceFee%';
}

class CemiTenureDetailEntity {
  final int tenure;
  final String price;
  final String cConvenienceFee;
  final String cConveniencePrice;
  final String monthlyPayable;
  final String total;
  final bool isSelected;

  const CemiTenureDetailEntity({
    required this.tenure,
    required this.price,
    required this.cConvenienceFee,
    required this.cConveniencePrice,
    required this.monthlyPayable,
    required this.total,
    this.isSelected = false,
  });
}
