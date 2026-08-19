class CustomerStatusEntity {
  final bool exists;
  final String message;
  final int httpCode;

  const CustomerStatusEntity({
    required this.exists,
    required this.message,
    required this.httpCode,
  });
}
