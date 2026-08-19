// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BannerResponseImpl _$$BannerResponseImplFromJson(Map<String, dynamic> json) =>
    _$BannerResponseImpl(
      entityId: _toIntSafe(json['entity_id']),
      title: _toStringSafe(json['title']),
      image: _toStringSafe(json['image']),
      imageUrl: _toStringSafe(json['image_url']),
      responsiveImage: _toStringSafe(json['responsive_image']),
      responsiveImageUrl: _toStringSafe(json['responsive_image_url']),
      link: _toStringSafe(json['link']),
      linkType: _toStringSafe(json['link_type']),
      linkValue: _toStringSafe(json['link_value']),
      resolvedLink: _toStringSafe(json['resolved_link']),
      isActive: _toStringSafe(json['is_active']),
      identifier: _toStringSafe(json['identifier']),
      categoryId: _toIntSafe(json['category_id']),
      isCategory: _toStringSafe(json['is_category']),
      sortOrder: _toIntSafe(json['sort_order']),
      columnCount: _toIntSafe(json['column_count']),
      imagePosition: _toStringSafe(json['image_position']),
      forHomepage: _toStringSafe(json['for_homepage']),
      category:
          json['category'] == null
              ? null
              : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BannerResponseImplToJson(
  _$BannerResponseImpl instance,
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

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: _toIntSafe(json['id']),
      name: _toStringSafe(json['name']),
      slug: _toStringSafe(json['slug']),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };
