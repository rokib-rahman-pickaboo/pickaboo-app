import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/domain/entity/notification_entity/notification_entity.dart';

part 'notification_item.freezed.dart';
part 'notification_item.g.dart';

@freezed
class NotificationItem with _$NotificationItem {
  const NotificationItem._();

  factory NotificationItem({
    @JsonKey(name: 'notification_id') int? notificationId,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'deeplink') String? deeplink,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'is_fetched') int? isFetched,
    @JsonKey(name: 'is_clicked') int? isClicked,
    @JsonKey(name: 'tag') int? tag,
  }) = _NotificationItem;

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemFromJson(json);

  NotificationEntity toEntity() {
    return NotificationEntity(
      id: notificationId ?? 0,
      title: title ?? '',
      message: message ?? '',
      deepLink: deeplink,
      imageUrl: imageUrl,
      createdAt: createdAt,
      isFetched: isFetched == 1,
      isClicked: isClicked == 1,
      tag: tag ?? 0,
    );
  }
}
