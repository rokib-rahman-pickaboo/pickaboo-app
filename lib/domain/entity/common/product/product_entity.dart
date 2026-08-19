export 'package:pickaboo/domain/entity/common/product/product_attribute_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_attribute_entity.dart';

class ProductEntity {
  final String id;
  final bool expressDelivery;
  final String productName;
  final String sku;
  final String slug;
  final String typeId;
  final bool stockAvailable;
  final bool freeDelivery;
  final int productPrice;
  final int productSpecialPrice;
  final int productDiscount;
  final String offers;
  final double rating;
  final double clubPoint;
  final int ratingCount;
  final String productImg;
  final bool emiAvailable;
  final bool comingSoon;
  final bool isAd;
  final List<ProductAttributeEntity> attributes;

  const ProductEntity({
    required this.id,
    required this.expressDelivery,
    required this.productName,
    required this.sku,
    required this.slug,
    required this.typeId,
    required this.stockAvailable,
    required this.freeDelivery,
    required this.productPrice,
    required this.productSpecialPrice,
    required this.productDiscount,
    required this.offers,
    required this.rating,
    required this.clubPoint,
    required this.ratingCount,
    required this.productImg,
    required this.emiAvailable,
    required this.comingSoon,
    this.isAd = false,
    this.attributes = const [],
  });
}
