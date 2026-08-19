class ContentPageEntity {
  final String id;
  final String title;
  final String layout;
  final String identifier;
  final String heading;
  final String content;
  final bool isActive;
  final int sortOrder;

  final String metaTitle;
  final String metaKeywords;
  final String metaDescription;

  final DateTime createdAt;
  final DateTime updatedAt;

  const ContentPageEntity({
    required this.id,
    required this.title,
    required this.layout,
    required this.identifier,
    required this.heading,
    required this.content,
    required this.isActive,
    required this.sortOrder,
    required this.metaTitle,
    required this.metaKeywords,
    required this.metaDescription,
    required this.createdAt,
    required this.updatedAt,
  });
}
