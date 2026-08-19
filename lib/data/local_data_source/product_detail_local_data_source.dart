import 'package:pickaboo/data/model/product_detail_response/product_detail_response.dart';

abstract class ProductDetailLocalDataSource {
  Future<List<ProductDetailResponse>?> getProductDetailsIfValid();
  Future<void> saveProductDetail(ProductDetailResponse productDetail);
  Future<void> removeProductDetail(String productId);
  Future<void> clearProductDetails();
}
