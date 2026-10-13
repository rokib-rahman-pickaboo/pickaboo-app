import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'category_response.freezed.dart';
part 'category_response.g.dart';

String? _toStringSafe(dynamic value) => value?.toString();

List<CategoryResponse>? _childsFromJson(dynamic value) {
  if (value is! List) return null;
  return value
      .whereType<Map>()
      .map((e) => CategoryResponse.fromJson(Map<String, dynamic>.from(e)))
      .toList();
}

@freezed
@HiveType(typeId: 1, adapterName: 'CategoryResponseAdapter')
class CategoryResponse with _$CategoryResponse {
  const factory CategoryResponse({
    @HiveField(0) @JsonKey(name: "id", fromJson: _toStringSafe) String? id,
    @HiveField(1) @JsonKey(name: "slug") String? slug,
    @HiveField(2) @JsonKey(name: "name") String? name,
    @HiveField(3) @JsonKey(name: "is_special", fromJson: _toStringSafe)
    String? isSpecial,
    @HiveField(4) @JsonKey(name: "icon") String? icon,
    @HiveField(5) @JsonKey(name: "childs", fromJson: _childsFromJson)
    List<CategoryResponse>? childs,
  }) = _CategoryResponse;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}
