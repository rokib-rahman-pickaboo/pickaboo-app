class NotificationEntity {
  final int id;
  final String title;
  final String message;
  final String? deepLink;
  final String? imageUrl;
  final String? createdAt;
  final bool isFetched;
  final bool isClicked;
  final int tag;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.message,
    this.deepLink,
    this.imageUrl,
    this.createdAt,
    required this.isFetched,
    required this.isClicked,
    required this.tag,
  });
}
