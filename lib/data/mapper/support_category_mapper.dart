import 'package:pickaboo/data/model/support_category_response/support_category_response.dart';
import 'package:pickaboo/domain/entity/support_category/support_category_entity.dart';
import 'package:pickaboo/domain/entity/support_category/support_child_entity.dart';

extension SupportCategoryResponseMapper on SupportCategoryResponse {
  SupportCategoryEntity toEntity() {
    return SupportCategoryEntity(
      id: categoryId ?? '',
      name: name ?? '',
      children: childs?.map((e) => e.toEntity()).toList() ?? const [],
    );
  }
}

extension SupportChildMapper on Child {
  SupportChildEntity toEntity() {
    return SupportChildEntity(
      id: categoryId ?? '',
      name: name ?? '',
      childrenCount: int.tryParse(childrenCount ?? '0') ?? 0,
    );
  }
}
