import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pickaboo/data/model/common/slider/slider.dart';
import 'package:pickaboo/data/model/common/category/category.dart';
import 'package:pickaboo/data/model/common/product/product.dart';

part 'home_content_response.freezed.dart';
part 'home_content_response.g.dart';

@freezed
@HiveType(typeId: 12, adapterName: 'HomeContentResponseAdapter')
class HomeContentResponse with _$HomeContentResponse {
  const factory HomeContentResponse({
    @HiveField(0) @JsonKey(name: "category_list") List<Category>? categoryList,
    @HiveField(1) @JsonKey(name: "main_slider") List<Slider>? mainSlider,
    @HiveField(2)
    @JsonKey(name: "common_link_slider")
    List<Slider>? commonLinkSlider,
    @HiveField(3)
    @JsonKey(name: "category_slider")
    List<CategorySlider>? categorySlider,
    @HiveField(4)
    @JsonKey(name: "category_products")
    List<CategoryProduct>? categoryProducts,
    @HiveField(5) @JsonKey(name: "just_for_you") JustForYou? justForYou,
    @HiveField(6) @JsonKey(name: "cache_time") DateTime? cacheTime,
  }) = _HomeContentResponse;

  factory HomeContentResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeContentResponseFromJson(json);
}

@freezed
@HiveType(typeId: 13, adapterName: 'CategoryProductAdapter')
class CategoryProduct with _$CategoryProduct {
  const factory CategoryProduct({
    @HiveField(0) @JsonKey(name: "category_id") String? categoryId,
    @HiveField(1) @JsonKey(name: "category_slug") String? categorySlug,
    @HiveField(2) @JsonKey(name: "is_home") String? isHome,
    @HiveField(3) @JsonKey(name: "is_todays_special") String? isTodaysSpecial,
    @HiveField(4) @JsonKey(name: "is_launching_soon") String? isLaunchingSoon,
    @HiveField(5) @JsonKey(name: "is_brand") String? isBrand,
    @HiveField(6) @JsonKey(name: "is_featured") String? isFeatured,
    @HiveField(7) @JsonKey(name: "is_banner") String? isBanner,
    @HiveField(8) @JsonKey(name: "home_block_bg") String? homeBlockBg,
    @HiveField(9) @JsonKey(name: "is_flash_hour_cat") String? isFlashHourCat,
    @HiveField(10)
    @JsonKey(name: "flash_hr_start_date_time")
    DateTime? flashHrStartDateTime,
    @HiveField(11)
    @JsonKey(name: "flash_hr_end_date_time")
    DateTime? flashHrEndDateTime,
    @HiveField(12) @JsonKey(name: "background") String? background,
    @HiveField(13) @JsonKey(name: "image") String? image,
    @HiveField(14) @JsonKey(name: "cat_slider") dynamic catSlider,
    @HiveField(15) @JsonKey(name: "category_name") String? categoryName,
    @HiveField(16) @JsonKey(name: "is_special") String? isSpecial,
    @HiveField(17) @JsonKey(name: "products") List<Product>? products,
  }) = _CategoryProduct;

  factory CategoryProduct.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductFromJson(json);
}

@freezed
@HiveType(typeId: 14, adapterName: 'CategorySliderAdapter')
class CategorySlider with _$CategorySlider {
  const factory CategorySlider({
    @HiveField(0) @JsonKey(name: "name") String? name,
    @HiveField(1) @JsonKey(name: "alias") String? alias,
    @HiveField(2) @JsonKey(name: "tagrget-url") dynamic tagrgetUrl,
    @HiveField(3) @JsonKey(name: "background_color") String? backgroundColor,
    @HiveField(4) @JsonKey(name: "link_title_color") String? linkTitleColor,
    @HiveField(5) @JsonKey(name: "status") String? status,
    @HiveField(6) @JsonKey(name: "slides_data") List<Slider>? slidesData,
  }) = _CategorySlider;

  factory CategorySlider.fromJson(Map<String, dynamic> json) =>
      _$CategorySliderFromJson(json);
}

@freezed
@HiveType(typeId: 15, adapterName: 'JustForYouAdapter')
class JustForYou with _$JustForYou {
  const factory JustForYou({
    @HiveField(0) @JsonKey(name: "total") int? total,
    @HiveField(1) @JsonKey(name: "list") List<Product>? list,
  }) = _JustForYou;

  factory JustForYou.fromJson(Map<String, dynamic> json) =>
      _$JustForYouFromJson(json);
}
