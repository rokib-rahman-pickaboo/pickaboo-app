import 'package:pickaboo/data/model/category_response/category_response.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';

extension CategoryResponseMapper on CategoryResponse {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id ?? '',
      slug: slug ?? '',
      name: name ?? '',
      icon: icon ?? '',
      isSpecial: _parseBool(isSpecial),
      children: childs?.map((e) => e.toEntity()).toList() ?? const [],
    );
  }

  bool _parseBool(String? value) {
    return value == '1' || value?.toLowerCase() == 'true';
  }
}
