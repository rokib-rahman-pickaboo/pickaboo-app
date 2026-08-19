// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationItemImpl _$$NotificationItemImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationItemImpl(
  notificationId: (json['notification_id'] as num?)?.toInt(),
  title: json['title'] as String?,
  message: json['message'] as String?,
  deeplink: json['deeplink'] as String?,
  imageUrl: json['image_url'] as String?,
  createdAt: json['created_at'] as String?,
  isFetched: (json['is_fetched'] as num?)?.toInt(),
  isClicked: (json['is_clicked'] as num?)?.toInt(),
  tag: (json['tag'] as num?)?.toInt(),
);

Map<String, dynamic> _$$NotificationItemImplToJson(
  _$NotificationItemImpl instance,
) => <String, dynamic>{
  'notification_id': instance.notificationId,
  'title': instance.title,
  'message': instance.message,
  'deeplink': instance.deeplink,
  'image_url': instance.imageUrl,
  'created_at': instance.createdAt,
  'is_fetched': instance.isFetched,
  'is_clicked': instance.isClicked,
  'tag': instance.tag,
};
