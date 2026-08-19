class WishlistEntity {
  final String id;
  final String productId;
  final String name;
  final String sku;
  final double price;
  final String thumbnail;
  final bool inStock;
  final String? soldBy;
  final double? regularPrice;
  final double? specialPrice;
  final int? discount;

  final String productType;

  const WishlistEntity({
    required this.id,
    required this.productId,
    required this.name,
    required this.sku,
    required this.price,
    required this.thumbnail,
    required this.inStock,
    this.soldBy,
    this.regularPrice,
    this.specialPrice,
    this.discount,
    this.productType = '',
  });

  bool get isConfigurable => productType == 'configurable';

  String get cartProductType => productType.isNotEmpty ? productType : 'simple';
}
