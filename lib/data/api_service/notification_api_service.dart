import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/domain/entity/notification_entity/notification_entity.dart';

abstract class NotificationApiService {
  Future<Either<ErrorResponse, void>> saveFcmToken({required String fcmToken});

  Future<Either<ErrorResponse, void>> deleteFcmToken({
    required String fcmToken,
  });

  Future<Either<ErrorResponse, List<NotificationEntity>>> getNotificationList();

  Future<Either<ErrorResponse, void>> updateNotificationStatus({
    required int tag,
  });

  Future<Either<ErrorResponse, void>> markAllAsRead();
}
