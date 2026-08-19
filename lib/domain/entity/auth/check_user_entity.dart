class CheckUserEntity {
  final String status;
  final String message;
  final int httpCode;

  const CheckUserEntity({
    required this.status,
    required this.message,
    required this.httpCode,
  });
}
