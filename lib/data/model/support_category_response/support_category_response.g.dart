// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupportCategoryResponseImpl _$$SupportCategoryResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SupportCategoryResponseImpl(
  categoryId: json['category_id'] as String?,
  name: json['name'] as String?,
  childs:
      (json['childs'] as List<dynamic>?)
          ?.map((e) => Child.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$SupportCategoryResponseImplToJson(
  _$SupportCategoryResponseImpl instance,
) => <String, dynamic>{
  'category_id': instance.categoryId,
  'name': instance.name,
  'childs': instance.childs,
};

_$ChildImpl _$$ChildImplFromJson(Map<String, dynamic> json) => _$ChildImpl(
  categoryId: json['category_id'] as String?,
  name: json['name'] as String?,
  childrenCount: json['children_count'] as String?,
);

Map<String, dynamic> _$$ChildImplToJson(_$ChildImpl instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'name': instance.name,
      'children_count': instance.childrenCount,
    };
