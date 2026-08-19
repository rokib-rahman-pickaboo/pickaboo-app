part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;

  const factory NotificationState.loading() = _Loading;

  const factory NotificationState.tokenSaved() = _TokenSaved;

  const factory NotificationState.listLoaded({
    required List<NotificationEntity> notifications,
  }) = _ListLoaded;

  const factory NotificationState.error(String message) = _Error;
}
