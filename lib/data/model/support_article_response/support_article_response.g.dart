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
  createdAt: safeDateTimeFromJson(json['created_at']),
  updatedAt: safeDateTimeFromJson(json['updated_at']),
);

Map<String, dynamic> _$$SupportArticleResponseImplToJson(
  _$SupportArticleResponseImpl instance,
) => <String, dynamic>{
  'article_id': instance.articleId,
  'name': instance.name,
  'text': instance.text,
  'created_at': safeDateTimeToJson(instance.createdAt),
  'updated_at': safeDateTimeToJson(instance.updatedAt),
};
