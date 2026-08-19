import 'package:dartz/dartz.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/notification_entity/notification_entity.dart';

abstract class NotificationRepository {
  Future<Either<AppErrorEntity, void>> saveFcmToken({required String fcmToken});

  Future<Either<AppErrorEntity, void>> deleteFcmToken({
    required String fcmToken,
  });

  Future<Either<AppErrorEntity, List<NotificationEntity>>>
  getNotificationList();

  Future<Either<AppErrorEntity, void>> updateNotificationStatus({
    required int tag,
  });

  Future<Either<AppErrorEntity, void>> markAllAsRead();
}
