class DiscoverCategoryBannerEntity {
  final int entityId;
  final String imageUrl;
  final String linkType;
  final String linkValue;
  final String link;
  final int sortOrder;

  const DiscoverCategoryBannerEntity({
    required this.entityId,
    required this.imageUrl,
    required this.linkType,
    required this.linkValue,
    required this.link,
    required this.sortOrder,
  });
}
