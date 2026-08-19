// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homepage_offers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomepageOffersResponseImpl _$$HomepageOffersResponseImplFromJson(
  Map<String, dynamic> json,
) => _$HomepageOffersResponseImpl(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                HomepageOfferMenuResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$$HomepageOffersResponseImplToJson(
  _$HomepageOffersResponseImpl instance,
) => <String, dynamic>{'items': instance.items};

_$HomepageOfferMenuResponseImpl _$$HomepageOfferMenuResponseImplFromJson(
  Map<String, dynamic> json,
) => _$HomepageOfferMenuResponseImpl(
  entityId: (json['entity_id'] as num?)?.toInt(),
  menuName: json['menu_name'] as String?,
  category:
      json['category'] == null
          ? null
          : OfferCategoryResponse.fromJson(
            json['category'] as Map<String, dynamic>,
          ),
  banners: json['banners'] as List<dynamic>?,
  subsections:
      (json['subsections'] as List<dynamic>?)
          ?.map(
            (e) => OfferSubsectionResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$$HomepageOfferMenuResponseImplToJson(
  _$HomepageOfferMenuResponseImpl instance,
) => <String, dynamic>{
  'entity_id': instance.entityId,
  'menu_name': instance.menuName,
  'category': instance.category,
  'banners': instance.banners,
  'subsections': instance.subsections,
};

_$OfferCategoryResponseImpl _$$OfferCategoryResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OfferCategoryResponseImpl(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  slug: json['slug'] as String?,
);

Map<String, dynamic> _$$OfferCategoryResponseImplToJson(
  _$OfferCategoryResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
};

_$OfferSubsectionResponseImpl _$$OfferSubsectionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OfferSubsectionResponseImpl(
  sectionType: json['section_type'] as String?,
  title: json['title'] as String?,
  status: (json['status'] as num?)?.toInt(),
  seeMoreLink: json['see_more_link'] as String?,
  seeMoreLinkType: json['see_more_link_type'] as String?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OfferItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$OfferSubsectionResponseImplToJson(
  _$OfferSubsectionResponseImpl instance,
) => <String, dynamic>{
  'section_type': instance.sectionType,
  'title': instance.title,
  'status': instance.status,
  'see_more_link': instance.seeMoreLink,
  'see_more_link_type': instance.seeMoreLinkType,
  'items': instance.items,
};

_$OfferItemResponseImpl _$$OfferItemResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OfferItemResponseImpl(
  entityId: (json['entity_id'] as num?)?.toInt(),
  itemType: json['item_type'] as String?,
  itemId: (json['item_id'] as num?)?.toInt(),
  link: json['link'] as String?,
  name: json['name'] as String?,
  imageUrl: json['image_url'] as String?,
  discountType: json['discount_type'] as String?,
  discountValue: json['discount_value'] as num?,
  maxDiscount: json['max_discount'] as num?,
  discountFilter:
      json['discount_filter'] == null
          ? null
          : OfferDiscountFilterResponse.fromJson(
            json['discount_filter'] as Map<String, dynamic>,
          ),
  sortOrder: (json['sort_order'] as num?)?.toInt(),
);

Map<String, dynamic> _$$OfferItemResponseImplToJson(
  _$OfferItemResponseImpl instance,
) => <String, dynamic>{
  'entity_id': instance.entityId,
  'item_type': instance.itemType,
  'item_id': instance.itemId,
  'link': instance.link,
  'name': instance.name,
  'image_url': instance.imageUrl,
  'discount_type': instance.discountType,
  'discount_value': instance.discountValue,
  'max_discount': instance.maxDiscount,
  'discount_filter': instance.discountFilter,
  'sort_order': instance.sortOrder,
};

_$OfferDiscountFilterResponseImpl _$$OfferDiscountFilterResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OfferDiscountFilterResponseImpl(
  type: json['type'] as String?,
  value: json['value'] as num?,
  maxDiscount: json['max_discount'] as num?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$$OfferDiscountFilterResponseImplToJson(
  _$OfferDiscountFilterResponseImpl instance,
) => <String, dynamic>{
  'type': instance.type,
  'value': instance.value,
  'max_discount': instance.maxDiscount,
  'url': instance.url,
};
