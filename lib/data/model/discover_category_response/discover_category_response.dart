import 'package:freezed_annotation/freezed_annotation.dart';

part 'discover_category_response.freezed.dart';
part 'discover_category_response.g.dart';

@freezed
class DiscoverCategoryResponse with _$DiscoverCategoryResponse {
  const factory DiscoverCategoryResponse({
    @JsonKey(name: "items")
    List<DiscoverCategoryItem>? items,
  }) = _DiscoverCategoryResponse;

  factory DiscoverCategoryResponse.fromJson(Map<String, dynamic> json) => _$DiscoverCategoryResponseFromJson(json);
}

@freezed
class DiscoverCategoryItem with _$DiscoverCategoryItem {
  const factory DiscoverCategoryItem({
    @JsonKey(name: "entity_id")
    int? entityId,
    @JsonKey(name: "menu_name")
    String? menuName,
    @JsonKey(name: "logo_url")
    String? logoUrl,
    @JsonKey(name: "category")
    Category? category,
    @JsonKey(name: "banners")
    List<Banner>? banners,
    @JsonKey(name: "subsections")
    List<Subsection>? subsections,
  }) = _DiscoverCategoryItem;

  factory DiscoverCategoryItem.fromJson(Map<String, dynamic> json) => _$DiscoverCategoryItemFromJson(json);
}

@freezed
class Banner with _$Banner {
  const factory Banner({
    @JsonKey(name: "entity_id")
    int? entityId,
    @JsonKey(name: "image_url")
    String? imageUrl,
    @JsonKey(name: "link_type")
    String? linkType,
    @JsonKey(name: "link_value")
    String? linkValue,
    @JsonKey(name: "link")
    String? link,
    @JsonKey(name: "sort_order")
    int? sortOrder,
  }) = _Banner;

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: "id")
    int? id,
    @JsonKey(name: "name")
    String? name,
    @JsonKey(name: "slug")
    String? slug,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}

@freezed
class Subsection with _$Subsection {
  const factory Subsection({
    @JsonKey(name: "section_type")
    String? sectionType,
    @JsonKey(name: "title")
    String? title,
    @JsonKey(name: "status")
    int? status,
    @JsonKey(name: "see_more_link")
    dynamic seeMoreLink,
    @JsonKey(name: "see_more_link_type")
    String? seeMoreLinkType,
    @JsonKey(name: "see_more_link_value")
    String? seeMoreLinkValue,
    @JsonKey(name: "items")
    List<SubsectionItem>? items,
  }) = _Subsection;

  factory Subsection.fromJson(Map<String, dynamic> json) => _$SubsectionFromJson(json);
}

@freezed
class SubsectionItem with _$SubsectionItem {
  const factory SubsectionItem({
    @JsonKey(name: "entity_id")
    int? entityId,
    @JsonKey(name: "item_type")
    String? itemType,
    @JsonKey(name: "item_id")
    int? itemId,
    @JsonKey(name: "link_type")
    String? linkType,
    @JsonKey(name: "link_value")
    String? linkValue,
    @JsonKey(name: "link")
    String? link,
    @JsonKey(name: "name")
    String? name,
    @JsonKey(name: "image_url")
    String? imageUrl,
    @JsonKey(name: "sort_order")
    int? sortOrder,
  }) = _SubsectionItem;

  factory SubsectionItem.fromJson(Map<String, dynamic> json) => _$SubsectionItemFromJson(json);
}
