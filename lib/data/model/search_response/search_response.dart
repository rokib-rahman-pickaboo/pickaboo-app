import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/data/model/search_response/search_facet_response.dart';

part 'search_response.freezed.dart';
part 'search_response.g.dart';

@freezed
class SearchResponse with _$SearchResponse {
  const factory SearchResponse({
    @JsonKey(name: "totalItems") int? totalItems,
    @JsonKey(name: "startIndex") int? startIndex,
    @JsonKey(name: "itemsPerPage") int? itemsPerPage,
    @JsonKey(name: "currentItemCount") int? currentItemCount,
    @JsonKey(name: "items") List<Item>? items,
    @JsonKey(name: "suggestions") List<String>? suggestions,
    @JsonKey(name: "categories") List<SearchCategory>? categories,
    @JsonKey(name: "correctedQuery") String? correctedQuery,
    @JsonKey(name: "facets") List<SearchFacetResponse>? facets,
  }) = _SearchResponse;

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    @JsonKey(name: "product_id") String? productId,
    @JsonKey(name: "original_product_id") String? originalProductId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "price") String? price,
    @JsonKey(name: "list_price") String? listPrice,
    @JsonKey(name: "quantity") String? quantity,
    @JsonKey(name: "product_code") String? productCode,
    @JsonKey(name: "image_link") String? imageLink,
    @JsonKey(name: "total_reviews") String? totalReviews,
    @JsonKey(name: "reviews_average_score") String? reviewsAverageScore,
    @JsonKey(name: "url_key") String? urlKey,
    @JsonKey(name: "type_id") String? typeId,
    @JsonKey(name: "emi_available") String? emiAvailable,
    @JsonKey(name: "express_delivery") String? expressDelivery,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class SearchCategory with _$SearchCategory {
  const factory SearchCategory({
    @JsonKey(name: "category_id") String? categoryId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "image_link") String? imageLink,
    @JsonKey(name: "description") String? description,
  }) = _SearchCategory;

  factory SearchCategory.fromJson(Map<String, dynamic> json) =>
      _$SearchCategoryFromJson(json);
}
