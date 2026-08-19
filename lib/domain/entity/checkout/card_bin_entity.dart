class CardBinVerifyEntity {
  final bool isApplied;

  const CardBinVerifyEntity({required this.isApplied});
}

class CardBinResultEntity {
  final bool success;
  final String message;

  const CardBinResultEntity({required this.success, required this.message});
}
