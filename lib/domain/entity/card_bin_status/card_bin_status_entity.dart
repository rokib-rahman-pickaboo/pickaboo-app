class CardBinStatusEntity {
  final bool success;
  final String message;
  final bool isActive;
  final int statusCode;

  const CardBinStatusEntity({
    required this.success,
    required this.message,
    required this.isActive,
    required this.statusCode,
  });
}
