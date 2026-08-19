import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
@HiveType(typeId: 10, adapterName: 'CategoryAdapter')
class Category with _$Category {
  const factory Category({
    @HiveField(0) @JsonKey(name: "id") String? id,
    @HiveField(1) @JsonKey(name: "slug") String? slug,
    @HiveField(2) @JsonKey(name: "name") String? name,
    @HiveField(3) @JsonKey(name: "is_special") String? isSpecial,
    @HiveField(4) @JsonKey(name: "icon") String? icon,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
