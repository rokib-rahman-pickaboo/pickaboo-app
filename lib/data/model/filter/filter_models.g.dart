// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilterCategoryImpl _$$FilterCategoryImplFromJson(Map<String, dynamic> json) =>
    _$FilterCategoryImpl(
      filterCode: json['filterCode'] as String,
      filterName: json['filterName'] as String,
      items:
          (json['items'] as List<dynamic>)
              .map((e) => FilterOption.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$FilterCategoryImplToJson(
  _$FilterCategoryImpl instance,
) => <String, dynamic>{
  'filterCode': instance.filterCode,
  'filterName': instance.filterName,
  'items': instance.items,
};

_$FilterOptionImpl _$$FilterOptionImplFromJson(Map<String, dynamic> json) =>
    _$FilterOptionImpl(
      value: json['value'] as String,
      label: json['label'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
      icon: json['icon'] as String?,
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FilterOptionImplToJson(_$FilterOptionImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'isSelected': instance.isSelected,
      'icon': instance.icon,
      'count': instance.count,
    };

_$AppliedFiltersImpl _$$AppliedFiltersImplFromJson(Map<String, dynamic> json) =>
    _$AppliedFiltersImpl(
      filters:
          (json['filters'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              k,
              (e as List<dynamic>).map((e) => e as String).toList(),
            ),
          ) ??
          const {},
    );

Map<String, dynamic> _$$AppliedFiltersImplToJson(
  _$AppliedFiltersImpl instance,
) => <String, dynamic>{'filters': instance.filters};
