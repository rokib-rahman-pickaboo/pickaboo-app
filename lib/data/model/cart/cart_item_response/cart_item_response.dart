import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/data/model/cart/product_option_response/product_option_response.dart';

part 'cart_item_response.freezed.dart';
part 'cart_item_response.g.dart';

@freezed
class CartItemResponse with _$CartItemResponse {
  const factory CartItemResponse({
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "qty") int? qty,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "price") double? price,
    @JsonKey(name: "product_type") String? productType,
    @JsonKey(name: "quote_id") String? quoteId,
    @JsonKey(name: "product_option") ProductOptionResponse? productOption,
    @JsonKey(name: "row_total") double? rowTotal,
    @JsonKey(name: "row_total_with_discount") double? rowTotalWithDiscount,
  }) = _CartItemResponse;

  factory CartItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CartItemResponseFromJson(json);
}
