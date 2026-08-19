// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PopupResponseImpl _$$PopupResponseImplFromJson(Map<String, dynamic> json) =>
    _$PopupResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      identifier: json['identifier'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      creationTime:
          json['creation_time'] == null
              ? null
              : DateTime.parse(json['creation_time'] as String),
      updateTime:
          json['update_time'] == null
              ? null
              : DateTime.parse(json['update_time'] as String),
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$$PopupResponseImplToJson(_$PopupResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'identifier': instance.identifier,
      'title': instance.title,
      'content': instance.content,
      'creation_time': instance.creationTime?.toIso8601String(),
      'update_time': instance.updateTime?.toIso8601String(),
      'active': instance.active,
    };
