// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeBannerResponseImpl _$$HomeBannerResponseImplFromJson(
  Map<String, dynamic> json,
) => _$HomeBannerResponseImpl(
  entityId: (json['entity_id'] as num?)?.toInt(),
  title: json['title'] as String?,
  image: json['image'] as String?,
  imageUrl: json['image_url'] as String?,
  responsiveImage: json['responsive_image'] as String?,
  responsiveImageUrl: json['responsive_image_url'] as String?,
  link: json['link'] as String?,
  linkType: json['link_type'] as String?,
  linkValue: json['link_value'] as String?,
  resolvedLink: json['resolved_link'] as String?,
  isActive: json['is_active'] as String?,
  identifier: json['identifier'] as String?,
  categoryId: (json['category_id'] as num?)?.toInt(),
  isCategory: json['is_category'] as String?,
  sortOrder: (json['sort_order'] as num?)?.toInt(),
  columnCount: (json['column_count'] as num?)?.toInt(),
  imagePosition: json['image_position'] as String?,
  forHomepage: json['for_homepage'] as String?,
  category:
      json['category'] == null
          ? null
          : HomeBannerCategory.fromJson(
            json['category'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$$HomeBannerResponseImplToJson(
  _$HomeBannerResponseImpl instance,
) => <String, dynamic>{
  'entity_id': instance.entityId,
  'title': instance.title,
  'image': instance.image,
  'image_url': instance.imageUrl,
  'responsive_image': instance.responsiveImage,
  'responsive_image_url': instance.responsiveImageUrl,
  'link': instance.link,
  'link_type': instance.linkType,
  'link_value': instance.linkValue,
  'resolved_link': instance.resolvedLink,
  'is_active': instance.isActive,
  'identifier': instance.identifier,
  'category_id': instance.categoryId,
  'is_category': instance.isCategory,
  'sort_order': instance.sortOrder,
  'column_count': instance.columnCount,
  'image_position': instance.imagePosition,
  'for_homepage': instance.forHomepage,
  'category': instance.category,
};

_$HomeBannerCategoryImpl _$$HomeBannerCategoryImplFromJson(
  Map<String, dynamic> json,
) => _$HomeBannerCategoryImpl(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  slug: json['slug'] as String?,
);

Map<String, dynamic> _$$HomeBannerCategoryImplToJson(
  _$HomeBannerCategoryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
};
