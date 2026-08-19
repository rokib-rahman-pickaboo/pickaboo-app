class ProductBannerEntity {
  final int id;
  final String title;
  final String image;
  final String link;
  final int sortOrder;

  const ProductBannerEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.link,
    required this.sortOrder,
  });
}
