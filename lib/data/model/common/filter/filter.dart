import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter.freezed.dart';
part 'filter.g.dart';

@freezed
class SortOption with _$SortOption {
  const factory SortOption({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "value") String? value,
  }) = _SortOption;

  factory SortOption.fromJson(Map<String, dynamic> json) =>
      _$SortOptionFromJson(json);
}

int? _parseInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

String? _parseFilterValue(dynamic value) {
  if (value == null) return null;
  if (value is String) return value;
  return value.toString();
}

@freezed
class FilterItem with _$FilterItem {
  const factory FilterItem({
    @JsonKey(name: "label") String? label,
    @JsonKey(name: "value", fromJson: _parseFilterValue) String? value,
    @JsonKey(name: "count", fromJson: _parseInt) int? count,
  }) = _FilterItem;

  factory FilterItem.fromJson(Map<String, dynamic> json) =>
      _$FilterItemFromJson(json);
}

@freezed
class FilterAttribute with _$FilterAttribute {
  const factory FilterAttribute({
    @JsonKey(name: "filter_name") String? filterName,
    @JsonKey(name: "filter_code") String? filterCode,
    @JsonKey(name: "items") List<FilterItem>? items,
    @JsonKey(name: "special_for_phone") bool? specialForPhone,
  }) = _FilterAttribute;

  factory FilterAttribute.fromJson(Map<String, dynamic> json) =>
      _$FilterAttributeFromJson(json);
}
