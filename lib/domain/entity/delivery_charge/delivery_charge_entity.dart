class DeliveryChargeEntity {
  final int? productId;
  final String? sku;
  final String? slug;
  final String? name;
  final int? qty;
  final int insideCharge;
  final int outsideCharge;

  const DeliveryChargeEntity({
    this.productId,
    this.sku,
    this.slug,
    this.name,
    this.qty,
    required this.insideCharge,
    required this.outsideCharge,
  });

  String get formattedInsideCharge => '৳ $insideCharge';

  String get formattedOutsideCharge => '৳ $outsideCharge';
}
