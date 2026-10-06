import 'package:pickaboo/core/utils/category_lookup_helper.dart';
import 'package:pickaboo/data/model/category_response/category_response.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';

extension CategoryResponseMapper on CategoryResponse {
  CategoryEntity toEntity() {
    final effectiveIcon = CategoryLookupHelper.canonicalIcon(
      icon,
      id: id,
      slug: slug,
      name: name,
    );
    return CategoryEntity(
      id: id ?? '',
      slug: slug ?? '',
      name: name ?? '',
      icon: effectiveIcon,
      isSpecial: _parseBool(isSpecial),
      children: childs?.map((e) => e.toEntity()).toList() ?? const [],
    );
  }

  bool _parseBool(String? value) {
    return value == '1' || value?.toLowerCase() == 'true';
  }
}
