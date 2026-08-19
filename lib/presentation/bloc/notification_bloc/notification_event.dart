part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.saveFcmToken({required String token}) =
      _SaveFcmToken;

  const factory NotificationEvent.loadNotificationList() =
      _LoadNotificationList;

  const factory NotificationEvent.updateNotificationStatus({
    required int notificationId,
  }) = _UpdateNotificationStatus;

  const factory NotificationEvent.markAllAsRead() = _MarkAllAsRead;

  const factory NotificationEvent.deleteFcmToken(String token) =
      _DeleteFcmToken;
}
