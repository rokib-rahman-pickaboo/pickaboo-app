// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentResponseImpl _$$ContentResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ContentResponseImpl(
  pageId: json['page_id'] as String?,
  title: json['title'] as String?,
  pageLayout: json['page_layout'] as String?,
  metaKeywords: json['meta_keywords'] as String?,
  metaDescription: json['meta_description'] as String?,
  identifier: json['identifier'] as String?,
  contentHeading: json['content_heading'] as String?,
  content: json['content'] as String?,
  creationTime:
      json['creation_time'] == null
          ? null
          : DateTime.parse(json['creation_time'] as String),
  updateTime:
      json['update_time'] == null
          ? null
          : DateTime.parse(json['update_time'] as String),
  isActive: json['is_active'] as String?,
  sortOrder: json['sort_order'] as String?,
  metaTitle: json['meta_title'] as String?,
);

Map<String, dynamic> _$$ContentResponseImplToJson(
  _$ContentResponseImpl instance,
) => <String, dynamic>{
  'page_id': instance.pageId,
  'title': instance.title,
  'page_layout': instance.pageLayout,
  'meta_keywords': instance.metaKeywords,
  'meta_description': instance.metaDescription,
  'identifier': instance.identifier,
  'content_heading': instance.contentHeading,
  'content': instance.content,
  'creation_time': instance.creationTime?.toIso8601String(),
  'update_time': instance.updateTime?.toIso8601String(),
  'is_active': instance.isActive,
  'sort_order': instance.sortOrder,
  'meta_title': instance.metaTitle,
};
