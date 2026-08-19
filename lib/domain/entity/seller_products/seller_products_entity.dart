import 'package:pickaboo/domain/entity/common/product/product_entity.dart';

class SellerProductsEntity {
  final String vendorName;
  final int totalCount;
  final List<ProductEntity> products;

  const SellerProductsEntity({
    required this.vendorName,
    required this.totalCount,
    required this.products,
  });
}
