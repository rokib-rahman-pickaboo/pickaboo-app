// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchResponseImpl _$$SearchResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SearchResponseImpl(
  totalItems: (json['totalItems'] as num?)?.toInt(),
  startIndex: (json['startIndex'] as num?)?.toInt(),
  itemsPerPage: (json['itemsPerPage'] as num?)?.toInt(),
  currentItemCount: (json['currentItemCount'] as num?)?.toInt(),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
  suggestions:
      (json['suggestions'] as List<dynamic>?)?.map((e) => e as String).toList(),
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => SearchCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
  correctedQuery: json['correctedQuery'] as String?,
  facets:
      (json['facets'] as List<dynamic>?)
          ?.map((e) => SearchFacetResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$SearchResponseImplToJson(
  _$SearchResponseImpl instance,
) => <String, dynamic>{
  'totalItems': instance.totalItems,
  'startIndex': instance.startIndex,
  'itemsPerPage': instance.itemsPerPage,
  'currentItemCount': instance.currentItemCount,
  'items': instance.items,
  'suggestions': instance.suggestions,
  'categories': instance.categories,
  'correctedQuery': instance.correctedQuery,
  'facets': instance.facets,
};

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
  productId: json['product_id'] as String?,
  originalProductId: json['original_product_id'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  link: json['link'] as String?,
  price: json['price'] as String?,
  listPrice: json['list_price'] as String?,
  quantity: json['quantity'] as String?,
  productCode: json['product_code'] as String?,
  imageLink: json['image_link'] as String?,
  totalReviews: json['total_reviews'] as String?,
  reviewsAverageScore: json['reviews_average_score'] as String?,
  urlKey: json['url_key'] as String?,
  typeId: json['type_id'] as String?,
  emiAvailable: json['emi_available'] as String?,
  expressDelivery: json['express_delivery'] as String?,
);

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'original_product_id': instance.originalProductId,
      'title': instance.title,
      'description': instance.description,
      'link': instance.link,
      'price': instance.price,
      'list_price': instance.listPrice,
      'quantity': instance.quantity,
      'product_code': instance.productCode,
      'image_link': instance.imageLink,
      'total_reviews': instance.totalReviews,
      'reviews_average_score': instance.reviewsAverageScore,
      'url_key': instance.urlKey,
      'type_id': instance.typeId,
      'emi_available': instance.emiAvailable,
      'express_delivery': instance.expressDelivery,
    };

_$SearchCategoryImpl _$$SearchCategoryImplFromJson(Map<String, dynamic> json) =>
    _$SearchCategoryImpl(
      categoryId: json['category_id'] as String?,
      title: json['title'] as String?,
      link: json['link'] as String?,
      imageLink: json['image_link'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$SearchCategoryImplToJson(
  _$SearchCategoryImpl instance,
) => <String, dynamic>{
  'category_id': instance.categoryId,
  'title': instance.title,
  'link': instance.link,
  'image_link': instance.imageLink,
  'description': instance.description,
};
