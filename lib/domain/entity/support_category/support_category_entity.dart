import 'package:pickaboo/domain/entity/support_category/support_child_entity.dart';

class SupportCategoryEntity {
  final String id;
  final String name;
  final List<SupportChildEntity> children;

  const SupportCategoryEntity({
    required this.id,
    required this.name,
    required this.children,
  });
}
