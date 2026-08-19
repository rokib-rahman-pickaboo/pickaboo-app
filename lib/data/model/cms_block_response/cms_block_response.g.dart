// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cms_block_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CmsBlockResponseImpl _$$CmsBlockResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CmsBlockResponseImpl(
  id: (json['id'] as num?)?.toInt(),
  identifier: json['identifier'] as String?,
  title: json['title'] as String?,
  content: json['content'] as String?,
  active: json['active'] as bool?,
  creationTime: json['creation_time'] as String?,
  updateTime: json['update_time'] as String?,
);

Map<String, dynamic> _$$CmsBlockResponseImplToJson(
  _$CmsBlockResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'identifier': instance.identifier,
  'title': instance.title,
  'content': instance.content,
  'active': instance.active,
  'creation_time': instance.creationTime,
  'update_time': instance.updateTime,
};
