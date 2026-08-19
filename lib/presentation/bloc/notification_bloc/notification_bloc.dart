import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/notification_entity/notification_entity.dart';
import 'package:pickaboo/domain/repository/notification_repository.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository _repository;

  NotificationBloc(this._repository)
    : super(const NotificationState.initial()) {
    on<_SaveFcmToken>(_onSaveFcmToken);
    on<_LoadNotificationList>(_onLoadNotificationList);
    on<_UpdateNotificationStatus>(_onUpdateNotificationStatus);
    on<_MarkAllAsRead>(_onMarkAllAsRead);
    on<_DeleteFcmToken>(_onDeleteFcmToken);
  }

  Future<void> _onSaveFcmToken(
    _SaveFcmToken event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationState.loading());

    final result = await _repository.saveFcmToken(fcmToken: event.token);

    result.fold(
      (error) => emit(NotificationState.error(error.message)),
      (_) => emit(const NotificationState.tokenSaved()),
    );
  }

  Future<void> _onLoadNotificationList(
    _LoadNotificationList event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationState.loading());

    final result = await _repository.getNotificationList();

    result.fold(
      (error) => emit(NotificationState.error(error.message)),
      (notifications) =>
          emit(NotificationState.listLoaded(notifications: notifications)),
    );
  }

  Future<void> _onUpdateNotificationStatus(
    _UpdateNotificationStatus event,
    Emitter<NotificationState> emit,
  ) async {
    final result = await _repository.updateNotificationStatus(
      tag: event.notificationId,
    );

    result.fold((error) => emit(NotificationState.error(error.message)), (_) {
      add(const NotificationEvent.loadNotificationList());
    });
  }

  Future<void> _onMarkAllAsRead(
    _MarkAllAsRead event,
    Emitter<NotificationState> emit,
  ) async {
    final result = await _repository.markAllAsRead();

    result.fold((error) => emit(NotificationState.error(error.message)), (_) {
      add(const NotificationEvent.loadNotificationList());
    });
  }

  Future<void> _onDeleteFcmToken(
    _DeleteFcmToken event,
    Emitter<NotificationState> emit,
  ) async {
    final result = await _repository.deleteFcmToken(fcmToken: event.token);

    result.fold(
      (error) => emit(NotificationState.error(error.message)),
      (_) => emit(const NotificationState.initial()),
    );
  }
}
