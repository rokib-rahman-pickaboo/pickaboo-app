// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_article_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupportArticleResponseImpl _$$SupportArticleResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SupportArticleResponseImpl(
  articleId: json['article_id'] as String?,
  name: json['name'] as String?,
  text: json['text'] as String?,
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$$SupportArticleResponseImplToJson(
  _$SupportArticleResponseImpl instance,
) => <String, dynamic>{
  'article_id': instance.articleId,
  'name': instance.name,
  'text': instance.text,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
