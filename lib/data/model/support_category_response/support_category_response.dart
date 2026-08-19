import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_category_response.freezed.dart';
part 'support_category_response.g.dart';

@freezed
class SupportCategoryResponse with _$SupportCategoryResponse {
  const factory SupportCategoryResponse({
    @JsonKey(name: "category_id") String? categoryId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "childs") List<Child>? childs,
  }) = _SupportCategoryResponse;

  factory SupportCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SupportCategoryResponseFromJson(json);
}

@freezed
class Child with _$Child {
  const factory Child({
    @JsonKey(name: "category_id") String? categoryId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "children_count") String? childrenCount,
  }) = _Child;

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);
}
