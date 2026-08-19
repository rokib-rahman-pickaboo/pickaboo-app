// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductBannerResponseImpl _$$ProductBannerResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProductBannerResponseImpl(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  image: json['image'] as String?,
  link: json['link'] as String?,
  sortOrder: (json['sort_order'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ProductBannerResponseImplToJson(
  _$ProductBannerResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'image': instance.image,
  'link': instance.link,
  'sort_order': instance.sortOrder,
  'status': instance.status,
};
