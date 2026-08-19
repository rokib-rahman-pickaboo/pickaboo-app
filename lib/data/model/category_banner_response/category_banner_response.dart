import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_banner_response.freezed.dart';
part 'category_banner_response.g.dart';

@freezed
class CategoryBannerResponse with _$CategoryBannerResponse {
  const factory CategoryBannerResponse({
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "responsive_image") String? responsiveImage,
    @JsonKey(name: "responsive_image_url") String? responsiveImageUrl,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "link_type") String? linkType,
    @JsonKey(name: "link_value") String? linkValue,
    @JsonKey(name: "resolved_link") String? resolvedLink,
    @JsonKey(name: "is_active") String? isActive,
    @JsonKey(name: "identifier") String? identifier,
    @JsonKey(name: "category_id") int? categoryId,
    @JsonKey(name: "is_category") String? isCategory,
    @JsonKey(name: "sort_order") int? sortOrder,
    @JsonKey(name: "column_count") int? columnCount,
    @JsonKey(name: "image_position") String? imagePosition,
    @JsonKey(name: "for_homepage") String? forHomepage,
    @JsonKey(name: "category") CategoryBannerCategory? category,
  }) = _CategoryBannerResponse;

  factory CategoryBannerResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryBannerResponseFromJson(json);
}

@freezed
class CategoryBannerCategory with _$CategoryBannerCategory {
  const factory CategoryBannerCategory({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
  }) = _CategoryBannerCategory;

  factory CategoryBannerCategory.fromJson(Map<String, dynamic> json) =>
      _$CategoryBannerCategoryFromJson(json);
}
