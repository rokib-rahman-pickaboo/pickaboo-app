class CategoryEntity {
  final String id;
  final String slug;
  final String name;
  final bool isSpecial;
  final String icon;
  final List<CategoryEntity> children;

  const CategoryEntity({
    required this.id,
    required this.slug,
    required this.name,
    required this.isSpecial,
    required this.icon,
    required this.children,
  });
}
