class SavedPaymentEntity {
  final String network;
  final String phoneNumber;
  final String iconUrl;
  final String agreementId;

  const SavedPaymentEntity({
    required this.network,
    required this.phoneNumber,
    required this.iconUrl,
    required this.agreementId,
  });
}
