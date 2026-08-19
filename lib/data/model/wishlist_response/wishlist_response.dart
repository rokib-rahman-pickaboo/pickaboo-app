import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_response.freezed.dart';
part 'wishlist_response.g.dart';

@freezed
class WishlistResponse with _$WishlistResponse {
  const factory WishlistResponse({
    @JsonKey(name: "wishlist_item_id") String? wishlistItemId,
    @JsonKey(name: "wishlist_id") String? wishlistId,
    @JsonKey(name: "product_id") String? productId,
    @JsonKey(name: "product_url_key") String? productUrlKey,
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "product_type") String? productType,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "store_id") String? storeId,
    @JsonKey(name: "added_at") DateTime? addedAt,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "description") dynamic description,
    @JsonKey(name: "varient") List<Varient>? varient,
    @JsonKey(name: "sold_by") String? soldBy,
    @JsonKey(name: "regular_price") int? regularPrice,
    @JsonKey(name: "special_price") int? specialPrice,
    @JsonKey(name: "discount") int? discount,
    @JsonKey(name: "is_available") bool? isAvailable,
    @JsonKey(name: "share_url") String? shareUrl,
  }) = _WishlistResponse;

  factory WishlistResponse.fromJson(Map<String, dynamic> json) =>
      _$WishlistResponseFromJson(json);
}

@freezed
class Varient with _$Varient {
  const factory Varient({
    @JsonKey(name: "option_id") String? optionId,
    @JsonKey(name: "option_name") String? optionName,
    @JsonKey(name: "options") List<Option>? options,
  }) = _Varient;

  factory Varient.fromJson(Map<String, dynamic> json) =>
      _$VarientFromJson(json);
}

@freezed
class Option with _$Option {
  const factory Option({
    @JsonKey(name: "option_value") String? optionValue,
    @JsonKey(name: "option_text") String? optionText,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}
