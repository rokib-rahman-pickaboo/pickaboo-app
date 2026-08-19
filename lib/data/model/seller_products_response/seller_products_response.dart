import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/data/model/common/product/product.dart';

part 'seller_products_response.freezed.dart';
part 'seller_products_response.g.dart';

@freezed
class SellerProductsResponse with _$SellerProductsResponse {
  const factory SellerProductsResponse({
    @JsonKey(name: "vendor_name") String? vendorName,
    @JsonKey(name: "vendor_meta_keywords") dynamic vendorMetaKeywords,
    @JsonKey(name: "vendor_meta_description") dynamic vendorMetaDescription,
    @JsonKey(name: "total_count") int? totalCount,
    @JsonKey(name: "items") List<Product>? items,
  }) = _SellerProductsResponse;

  factory SellerProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$SellerProductsResponseFromJson(json);
}
