import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/data/model/common/product/product.dart';

part 'product_list_response.freezed.dart';
part 'product_list_response.g.dart';

@freezed
class ProductListResponse with _$ProductListResponse {
  const factory ProductListResponse({
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "current_page") int? currentPage,
    @JsonKey(name: "limit") int? limit,
    @JsonKey(name: "products") List<Product>? products,
  }) = _ProductListResponse;

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListResponseFromJson(json);
}
