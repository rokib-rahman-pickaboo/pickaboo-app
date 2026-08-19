import 'package:freezed_annotation/freezed_annotation.dart';

part 'homepage_offers_response.freezed.dart';
part 'homepage_offers_response.g.dart';

@freezed
class HomepageOffersResponse with _$HomepageOffersResponse {
  const factory HomepageOffersResponse({
    @JsonKey(name: "items") List<HomepageOfferMenuResponse>? items,
  }) = _HomepageOffersResponse;

  factory HomepageOffersResponse.fromJson(Map<String, dynamic> json) =>
      _$HomepageOffersResponseFromJson(json);
}

@freezed
class HomepageOfferMenuResponse with _$HomepageOfferMenuResponse {
  const factory HomepageOfferMenuResponse({
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "menu_name") String? menuName,
    @JsonKey(name: "category") OfferCategoryResponse? category,
    @JsonKey(name: "banners") List<dynamic>? banners,
    @JsonKey(name: "subsections") List<OfferSubsectionResponse>? subsections,
  }) = _HomepageOfferMenuResponse;

  factory HomepageOfferMenuResponse.fromJson(Map<String, dynamic> json) =>
      _$HomepageOfferMenuResponseFromJson(json);
}

@freezed
class OfferCategoryResponse with _$OfferCategoryResponse {
  const factory OfferCategoryResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
  }) = _OfferCategoryResponse;

  factory OfferCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferCategoryResponseFromJson(json);
}

@freezed
class OfferSubsectionResponse with _$OfferSubsectionResponse {
  const factory OfferSubsectionResponse({
    @JsonKey(name: "section_type") String? sectionType,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "see_more_link") String? seeMoreLink,
    @JsonKey(name: "see_more_link_type") String? seeMoreLinkType,
    @JsonKey(name: "items") List<OfferItemResponse>? items,
  }) = _OfferSubsectionResponse;

  factory OfferSubsectionResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferSubsectionResponseFromJson(json);
}

@freezed
class OfferItemResponse with _$OfferItemResponse {
  const factory OfferItemResponse({
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "item_type") String? itemType,
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "discount_type") String? discountType,
    @JsonKey(name: "discount_value") num? discountValue,
    @JsonKey(name: "max_discount") num? maxDiscount,
    @JsonKey(name: "discount_filter") OfferDiscountFilterResponse? discountFilter,
    @JsonKey(name: "sort_order") int? sortOrder,
  }) = _OfferItemResponse;

  factory OfferItemResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferItemResponseFromJson(json);
}

@freezed
class OfferDiscountFilterResponse with _$OfferDiscountFilterResponse {
  const factory OfferDiscountFilterResponse({
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "value") num? value,
    @JsonKey(name: "max_discount") num? maxDiscount,
    @JsonKey(name: "url") String? url,
  }) = _OfferDiscountFilterResponse;

  factory OfferDiscountFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferDiscountFilterResponseFromJson(json);
}
