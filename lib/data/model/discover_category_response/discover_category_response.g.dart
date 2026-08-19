// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscoverCategoryResponseImpl _$$DiscoverCategoryResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DiscoverCategoryResponseImpl(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => DiscoverCategoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$DiscoverCategoryResponseImplToJson(
  _$DiscoverCategoryResponseImpl instance,
) => <String, dynamic>{'items': instance.items};

_$DiscoverCategoryItemImpl _$$DiscoverCategoryItemImplFromJson(
  Map<String, dynamic> json,
) => _$DiscoverCategoryItemImpl(
  entityId: (json['entity_id'] as num?)?.toInt(),
  menuName: json['menu_name'] as String?,
  logoUrl: json['logo_url'] as String?,
  category:
      json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
  banners:
      (json['banners'] as List<dynamic>?)
          ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
          .toList(),
  subsections:
      (json['subsections'] as List<dynamic>?)
          ?.map((e) => Subsection.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$DiscoverCategoryItemImplToJson(
  _$DiscoverCategoryItemImpl instance,
) => <String, dynamic>{
  'entity_id': instance.entityId,
  'menu_name': instance.menuName,
  'logo_url': instance.logoUrl,
  'category': instance.category,
  'banners': instance.banners,
  'subsections': instance.subsections,
};

_$BannerImpl _$$BannerImplFromJson(Map<String, dynamic> json) => _$BannerImpl(
  entityId: (json['entity_id'] as num?)?.toInt(),
  imageUrl: json['image_url'] as String?,
  linkType: json['link_type'] as String?,
  linkValue: json['link_value'] as String?,
  link: json['link'] as String?,
  sortOrder: (json['sort_order'] as num?)?.toInt(),
);

Map<String, dynamic> _$$BannerImplToJson(_$BannerImpl instance) =>
    <String, dynamic>{
      'entity_id': instance.entityId,
      'image_url': instance.imageUrl,
      'link_type': instance.linkType,
      'link_value': instance.linkValue,
      'link': instance.link,
      'sort_order': instance.sortOrder,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

_$SubsectionImpl _$$SubsectionImplFromJson(Map<String, dynamic> json) =>
    _$SubsectionImpl(
      sectionType: json['section_type'] as String?,
      title: json['title'] as String?,
      status: (json['status'] as num?)?.toInt(),
      seeMoreLink: json['see_more_link'],
      seeMoreLinkType: json['see_more_link_type'] as String?,
      seeMoreLinkValue: json['see_more_link_value'] as String?,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => SubsectionItem.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$SubsectionImplToJson(_$SubsectionImpl instance) =>
    <String, dynamic>{
      'section_type': instance.sectionType,
      'title': instance.title,
      'status': instance.status,
      'see_more_link': instance.seeMoreLink,
      'see_more_link_type': instance.seeMoreLinkType,
      'see_more_link_value': instance.seeMoreLinkValue,
      'items': instance.items,
    };

_$SubsectionItemImpl _$$SubsectionItemImplFromJson(Map<String, dynamic> json) =>
    _$SubsectionItemImpl(
      entityId: (json['entity_id'] as num?)?.toInt(),
      itemType: json['item_type'] as String?,
      itemId: (json['item_id'] as num?)?.toInt(),
      linkType: json['link_type'] as String?,
      linkValue: json['link_value'] as String?,
      link: json['link'] as String?,
      name: json['name'] as String?,
      imageUrl: json['image_url'] as String?,
      sortOrder: (json['sort_order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SubsectionItemImplToJson(
  _$SubsectionItemImpl instance,
) => <String, dynamic>{
  'entity_id': instance.entityId,
  'item_type': instance.itemType,
  'item_id': instance.itemId,
  'link_type': instance.linkType,
  'link_value': instance.linkValue,
  'link': instance.link,
  'name': instance.name,
  'image_url': instance.imageUrl,
  'sort_order': instance.sortOrder,
};
