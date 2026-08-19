// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductListResponseImpl _$$ProductListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProductListResponseImpl(
  total: (json['total'] as num?)?.toInt(),
  currentPage: (json['current_page'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$ProductListResponseImplToJson(
  _$ProductListResponseImpl instance,
) => <String, dynamic>{
  'total': instance.total,
  'current_page': instance.currentPage,
  'limit': instance.limit,
  'products': instance.products,
};
