import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/data/model/common/product/product.dart';

part 'home_flash_sale_response.freezed.dart';
part 'home_flash_sale_response.g.dart';

@freezed
class HomeFlashSaleResponse with _$HomeFlashSaleResponse {
  const factory HomeFlashSaleResponse({
    @JsonKey(name: "sale_id")
    String? saleId,
    @JsonKey(name: "title")
    String? title,
    @JsonKey(name: "slug")
    String? slug,
    @JsonKey(name: "short_description")
    String? shortDescription,
    @JsonKey(name: "description")
    String? description,
    @JsonKey(name: "title_color")
    String? titleColor,
    @JsonKey(name: "sub_title_color")
    String? subTitleColor,
    @JsonKey(name: "description_color")
    String? descriptionColor,
    @JsonKey(name: "start_time")
    DateTime? startTime,
    @JsonKey(name: "end_time")
    DateTime? endTime,
    @JsonKey(name: "display_start_time")
    DateTime? displayStartTime,
    @JsonKey(name: "is_upcoming")
    bool? isUpcoming,
    @JsonKey(name: "banners")
    List<Banner>? banners,
    @JsonKey(name: "category")
    Category? category,
  }) = _HomeFlashSaleResponse;

  factory HomeFlashSaleResponse.fromJson(Map<String, dynamic> json) => _$HomeFlashSaleResponseFromJson(json);
}

@freezed
class Banner with _$Banner {
  const factory Banner({
    @JsonKey(name: "banner_id")
    String? bannerId,
    @JsonKey(name: "image")
    String? image,
    @JsonKey(name: "image_url")
    String? imageUrl,
    @JsonKey(name: "mobile_image")
    String? mobileImage,
    @JsonKey(name: "mobile_image_url")
    String? mobileImageUrl,
    @JsonKey(name: "link_type")
    String? linkType,
    @JsonKey(name: "link_value")
    String? linkValue,
    @JsonKey(name: "sort_order")
    String? sortOrder,
  }) = _Banner;

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: "category_id")
    int? categoryId,
    @JsonKey(name: "name")
    String? name,
    @JsonKey(name: "url_key")
    String? urlKey,
    @JsonKey(name: "image")
    dynamic image,
    @JsonKey(name: "products")
    List<Product>? products,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
