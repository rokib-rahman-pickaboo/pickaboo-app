// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_flash_sale_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductFlashSaleResponseImpl _$$ProductFlashSaleResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProductFlashSaleResponseImpl(
  inFlashSale: json['in_flash_sale'] as bool?,
  flashSale:
      json['flash_sale'] == null
          ? null
          : FlashSale.fromJson(json['flash_sale'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ProductFlashSaleResponseImplToJson(
  _$ProductFlashSaleResponseImpl instance,
) => <String, dynamic>{
  'in_flash_sale': instance.inFlashSale,
  'flash_sale': instance.flashSale,
};

_$FlashSaleImpl _$$FlashSaleImplFromJson(Map<String, dynamic> json) =>
    _$FlashSaleImpl(
      saleId: (json['sale_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      startTime:
          json['start_time'] == null
              ? null
              : DateTime.parse(json['start_time'] as String),
      endTime:
          json['end_time'] == null
              ? null
              : DateTime.parse(json['end_time'] as String),
      shortDescription: json['short_description'] as String?,
      description: json['description'] as String?,
      isUpcoming: json['is_upcoming'] as bool?,
      bannerImageUrl: json['banner_image_url'] as String?,
      bannerMobileImageUrl: json['banner_mobile_image_url'] as String?,
      bannerLinkType: json['banner_link_type'] as String?,
      bannerLinkValue: json['banner_link_value'] as String?,
    );

Map<String, dynamic> _$$FlashSaleImplToJson(_$FlashSaleImpl instance) =>
    <String, dynamic>{
      'sale_id': instance.saleId,
      'title': instance.title,
      'slug': instance.slug,
      'start_time': instance.startTime?.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
      'short_description': instance.shortDescription,
      'description': instance.description,
      'is_upcoming': instance.isUpcoming,
      'banner_image_url': instance.bannerImageUrl,
      'banner_mobile_image_url': instance.bannerMobileImageUrl,
      'banner_link_type': instance.bannerLinkType,
      'banner_link_value': instance.bannerLinkValue,
    };
