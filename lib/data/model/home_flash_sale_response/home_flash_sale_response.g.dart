// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_flash_sale_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeFlashSaleResponseImpl _$$HomeFlashSaleResponseImplFromJson(
  Map<String, dynamic> json,
) => _$HomeFlashSaleResponseImpl(
  saleId: json['sale_id'] as String?,
  title: json['title'] as String?,
  slug: json['slug'] as String?,
  shortDescription: json['short_description'] as String?,
  description: json['description'] as String?,
  titleColor: json['title_color'] as String?,
  subTitleColor: json['sub_title_color'] as String?,
  descriptionColor: json['description_color'] as String?,
  startTime:
      json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
  endTime:
      json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
  displayStartTime:
      json['display_start_time'] == null
          ? null
          : DateTime.parse(json['display_start_time'] as String),
  isUpcoming: json['is_upcoming'] as bool?,
  banners:
      (json['banners'] as List<dynamic>?)
          ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
          .toList(),
  category:
      json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$HomeFlashSaleResponseImplToJson(
  _$HomeFlashSaleResponseImpl instance,
) => <String, dynamic>{
  'sale_id': instance.saleId,
  'title': instance.title,
  'slug': instance.slug,
  'short_description': instance.shortDescription,
  'description': instance.description,
  'title_color': instance.titleColor,
  'sub_title_color': instance.subTitleColor,
  'description_color': instance.descriptionColor,
  'start_time': instance.startTime?.toIso8601String(),
  'end_time': instance.endTime?.toIso8601String(),
  'display_start_time': instance.displayStartTime?.toIso8601String(),
  'is_upcoming': instance.isUpcoming,
  'banners': instance.banners,
  'category': instance.category,
};

_$BannerImpl _$$BannerImplFromJson(Map<String, dynamic> json) => _$BannerImpl(
  bannerId: json['banner_id'] as String?,
  image: json['image'] as String?,
  imageUrl: json['image_url'] as String?,
  mobileImage: json['mobile_image'] as String?,
  mobileImageUrl: json['mobile_image_url'] as String?,
  linkType: json['link_type'] as String?,
  linkValue: json['link_value'] as String?,
  sortOrder: json['sort_order'] as String?,
);

Map<String, dynamic> _$$BannerImplToJson(_$BannerImpl instance) =>
    <String, dynamic>{
      'banner_id': instance.bannerId,
      'image': instance.image,
      'image_url': instance.imageUrl,
      'mobile_image': instance.mobileImage,
      'mobile_image_url': instance.mobileImageUrl,
      'link_type': instance.linkType,
      'link_value': instance.linkValue,
      'sort_order': instance.sortOrder,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      categoryId: (json['category_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      urlKey: json['url_key'] as String?,
      image: json['image'],
      products:
          (json['products'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'name': instance.name,
      'url_key': instance.urlKey,
      'image': instance.image,
      'products': instance.products,
    };
