// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_facet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchFacetResponseImpl _$$SearchFacetResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SearchFacetResponseImpl(
  title: json['title'] as String?,
  defaultTitle: json['default_title'] as String?,
  attribute: json['attribute'] as String?,
  type: json['type'] as String?,
  buckets:
      (json['buckets'] as List<dynamic>?)
          ?.map((e) => FacetBucketResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$SearchFacetResponseImplToJson(
  _$SearchFacetResponseImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'default_title': instance.defaultTitle,
  'attribute': instance.attribute,
  'type': instance.type,
  'buckets': instance.buckets,
};

_$FacetBucketResponseImpl _$$FacetBucketResponseImplFromJson(
  Map<String, dynamic> json,
) => _$FacetBucketResponseImpl(
  value: json['value'] as String?,
  count: (json['count'] as num?)?.toInt(),
);

Map<String, dynamic> _$$FacetBucketResponseImplToJson(
  _$FacetBucketResponseImpl instance,
) => <String, dynamic>{'value': instance.value, 'count': instance.count};
