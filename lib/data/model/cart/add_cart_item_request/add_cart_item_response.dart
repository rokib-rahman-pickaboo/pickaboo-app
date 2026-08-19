import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_cart_item_response.freezed.dart';
part 'add_cart_item_response.g.dart';

@freezed
class AddCartItemResponse with _$AddCartItemResponse {
  const factory AddCartItemResponse({
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "qty") int? qty,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "product_type") String? productType,
    @JsonKey(name: "quote_id") String? quoteId,
    @JsonKey(name: "extension_attributes")
    ExtensionAttributes? extensionAttributes,
  }) = _AddCartItemResponse;

  factory AddCartItemResponse.fromJson(Map<String, dynamic> json) =>
      _$AddCartItemResponseFromJson(json);
}

@freezed
class ExtensionAttributes with _$ExtensionAttributes {
  const factory ExtensionAttributes({
    @JsonKey(name: "cart_items_count") int? cartItemsCount,
    @JsonKey(name: "cart_items_qty") int? cartItemsQty,
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "product_url_key") String? productUrlKey,
    @JsonKey(name: "category_ids") List<String>? categoryIds,
    @JsonKey(name: "category_names") List<String>? categoryNames,
    @JsonKey(name: "stock_available") bool? stockAvailable,
    @JsonKey(name: "brand_id") String? brandId,
    @JsonKey(name: "brand") String? brand,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "sold_by") String? soldBy,
    @JsonKey(name: "regular_price") int? regularPrice,
    @JsonKey(name: "spacial_price") int? spacialPrice,
    @JsonKey(name: "discount") String? discount,
    @JsonKey(name: "item_subtotal") int? itemSubtotal,
  }) = _ExtensionAttributes;

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$ExtensionAttributesFromJson(json);
}
