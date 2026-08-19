// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SortOptionImpl _$$SortOptionImplFromJson(Map<String, dynamic> json) =>
    _$SortOptionImpl(
      title: json['title'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$$SortOptionImplToJson(_$SortOptionImpl instance) =>
    <String, dynamic>{'title': instance.title, 'value': instance.value};

_$FilterItemImpl _$$FilterItemImplFromJson(Map<String, dynamic> json) =>
    _$FilterItemImpl(
      label: json['label'] as String?,
      value: _parseFilterValue(json['value']),
      count: _parseInt(json['count']),
    );

Map<String, dynamic> _$$FilterItemImplToJson(_$FilterItemImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'count': instance.count,
    };

_$FilterAttributeImpl _$$FilterAttributeImplFromJson(
  Map<String, dynamic> json,
) => _$FilterAttributeImpl(
  filterName: json['filter_name'] as String?,
  filterCode: json['filter_code'] as String?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => FilterItem.fromJson(e as Map<String, dynamic>))
          .toList(),
  specialForPhone: json['special_for_phone'] as bool?,
);

Map<String, dynamic> _$$FilterAttributeImplToJson(
  _$FilterAttributeImpl instance,
) => <String, dynamic>{
  'filter_name': instance.filterName,
  'filter_code': instance.filterCode,
  'items': instance.items,
  'special_for_phone': instance.specialForPhone,
};
