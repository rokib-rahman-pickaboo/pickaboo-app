class EmiEntity {
  final String bankName;
  final String bankIcon;
  final List<EmiTenureEntity> tenureOptions;

  const EmiEntity({
    required this.bankName,
    required this.bankIcon,
    required this.tenureOptions,
  });
}

class EmiTenureEntity {
  final int tenure;
  final String price;
  final String convenienceFee;
  final String conveniencePrice;
  final String monthlyPayable;
  final String total;

  const EmiTenureEntity({
    required this.tenure,
    required this.price,
    required this.convenienceFee,
    required this.conveniencePrice,
    required this.monthlyPayable,
    required this.total,
  });
}
