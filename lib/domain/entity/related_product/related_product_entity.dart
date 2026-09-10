import 'package:pickaboo/domain/entity/common/product/product_entity.dart';

class RelatedProductEntity {
  final int productId;
  final String productName;
  final List<ProductEntity> relatedProducts;

  const RelatedProductEntity({
    required this.productId,
    required this.productName,
    required this.relatedProducts,
  });

  RelatedProductEntity copyWith({
    int? productId,
    String? productName,
    List<ProductEntity>? relatedProducts,
  }) {
    return RelatedProductEntity(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      relatedProducts: relatedProducts ?? this.relatedProducts,
    );
  }
}
