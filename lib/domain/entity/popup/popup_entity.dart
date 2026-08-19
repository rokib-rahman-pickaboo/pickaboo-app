class PopupEntity {
  final int id;
  final String identifier;
  final String title;
  final String content;
  final DateTime creationTime;
  final DateTime updateTime;
  final bool active;

  const PopupEntity({
    required this.id,
    required this.identifier,
    required this.title,
    required this.content,
    required this.creationTime,
    required this.updateTime,
    required this.active,
  });
}
