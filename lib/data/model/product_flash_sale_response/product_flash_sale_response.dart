import 'package:freezed_annotation/freezed_annotation.dart';


part 'product_flash_sale_response.freezed.dart';
part 'product_flash_sale_response.g.dart';

@freezed
class ProductFlashSaleResponse with _$ProductFlashSaleResponse {
  const factory ProductFlashSaleResponse({
    @JsonKey(name: "in_flash_sale")
    bool? inFlashSale,
    @JsonKey(name: "flash_sale")
    FlashSale? flashSale,
  }) = _ProductFlashSaleResponse;

  factory ProductFlashSaleResponse.fromJson(Map<String, dynamic> json) => _$ProductFlashSaleResponseFromJson(json);
}

@freezed
class FlashSale with _$FlashSale {
  const factory FlashSale({
    @JsonKey(name: "sale_id")
    int? saleId,
    @JsonKey(name: "title")
    String? title,
    @JsonKey(name: "slug")
    String? slug,
    @JsonKey(name: "start_time")
    DateTime? startTime,
    @JsonKey(name: "end_time")
    DateTime? endTime,
    @JsonKey(name: "short_description")
    String? shortDescription,
    @JsonKey(name: "description")
    String? description,
    @JsonKey(name: "is_upcoming")
    bool? isUpcoming,
    @JsonKey(name: "banner_image_url")
    String? bannerImageUrl,
    @JsonKey(name: "banner_mobile_image_url")
    String? bannerMobileImageUrl,
    @JsonKey(name: "banner_link_type")
    String? bannerLinkType,
    @JsonKey(name: "banner_link_value")
    String? bannerLinkValue,
  }) = _FlashSale;

  factory FlashSale.fromJson(Map<String, dynamic> json) => _$FlashSaleFromJson(json);
}
