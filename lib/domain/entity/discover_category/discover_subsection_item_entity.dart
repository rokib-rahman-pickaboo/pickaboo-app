class DiscoverSubsectionItemEntity {
  final int entityId;
  final String itemType;
  final int itemId;
  final String linkType;
  final String linkValue;
  final String link;
  final String name;
  final String imageUrl;
  final int sortOrder;

  const DiscoverSubsectionItemEntity({
    required this.entityId,
    required this.itemType,
    required this.itemId,
    required this.linkType,
    required this.linkValue,
    required this.link,
    required this.name,
    required this.imageUrl,
    required this.sortOrder,
  });
}
