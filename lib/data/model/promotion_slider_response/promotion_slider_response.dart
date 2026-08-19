import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion_slider_response.freezed.dart';
part 'promotion_slider_response.g.dart';

@freezed
class PromotionSliderResponse with _$PromotionSliderResponse {
  const factory PromotionSliderResponse({
    @JsonKey(name: 'slide_id') String? slideId,
    @JsonKey(name: 'slider_id') String? sliderId,
    @JsonKey(name: 'store_id') String? storeId,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'mobile_slug') String? mobileSlug,
    @JsonKey(name: 'target_url') String? targetUrl,
    @JsonKey(name: 'link_title_color') String? linkTitleColor,
    @JsonKey(name: 'background_color') String? backgroundColor,
    @JsonKey(name: 'category_sort_data') String? categorySortData,
    @JsonKey(name: 'is_special_cat') String? isSpecialCat,
    @JsonKey(name: 'subtitle') String? subtitle,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'content_colour') String? contentColour,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'mobile_image') String? mobileImage,
    @JsonKey(name: 'image_position') String? imagePosition,
    @JsonKey(name: 'background_colour') String? backgroundColour,
    @JsonKey(name: 'link') String? link,
    @JsonKey(name: 'linktype') String? linkType,
    @JsonKey(name: 'order') String? order,
    @JsonKey(name: 'pagination_content') String? paginationContent,
    @JsonKey(name: 'active_from') String? activeFrom,
    @JsonKey(name: 'active_to') String? activeTo,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'url_key') String? urlKey,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'alias') String? alias,
    @JsonKey(name: 'tagrget-url') String? tagretUrl,
    @JsonKey(name: 'is_category_status') String? isCategoryStatus,
    @JsonKey(name: 'delay') String? delay,
    @JsonKey(name: 'autoplay') String? autoplay,
    @JsonKey(name: 'transition') String? transition,
    @JsonKey(name: 'pagination') String? pagination,
    @JsonKey(name: 'arrows') String? arrows,
    @JsonKey(name: 'retina_image_size') String? retinaImageSize,
    @JsonKey(name: 'retina_mobile_image_size') String? retinaMobileImageSize,
    @JsonKey(name: 'mobile_image_url') String? mobileImageUrl,
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _PromotionSliderResponse;

  factory PromotionSliderResponse.fromJson(Map<String, dynamic> json) =>
      _$PromotionSliderResponseFromJson(json);
}
