class CmsBlockEntity {
  final int id;
  final String identifier;
  final String title;
  final String content;
  final bool active;
  final String creationTime;
  final String updateTime;

  const CmsBlockEntity({
    required this.id,
    required this.identifier,
    required this.title,
    required this.content,
    required this.active,
    required this.creationTime,
    required this.updateTime,
  });
}

enum CmsBlockType {
  productOffer,
  priceGuarantee,
  priceGuaranteeTc,
  pickabooVerified,
  expressDelivery,
}
