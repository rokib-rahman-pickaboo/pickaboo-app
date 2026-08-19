import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/data/api_service/notification_api_service.dart';
import 'package:pickaboo/data/mapper/error_mapper.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/notification_entity/notification_entity.dart';
import 'package:pickaboo/domain/repository/notification_repository.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationApiService _apiService;
  final AuthCacheManager _cacheManager;

  NotificationRepositoryImpl(this._apiService, this._cacheManager);

  Future<String?> _getToken() async {
    return await _cacheManager.getToken();
  }

  @override
  Future<Either<AppErrorEntity, void>> saveFcmToken({
    required String fcmToken,
  }) async {

    final result = await _apiService.saveFcmToken(fcmToken: fcmToken);

    return result.fold((l) => left(l.toEntity()), (r) => right(null));
  }

  @override
  Future<Either<AppErrorEntity, void>> deleteFcmToken({
    required String fcmToken,
  }) async {

    final result = await _apiService.deleteFcmToken(fcmToken: fcmToken);

    return result.fold((l) => left(l.toEntity()), (r) => right(null));
  }

  @override
  Future<Either<AppErrorEntity, List<NotificationEntity>>>
  getNotificationList() async {
    final token = await _getToken();
    if (token == null) {
      return left(AppErrorEntity(message: 'User not authenticated'));
    }

    final result = await _apiService.getNotificationList();

    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  @override
  Future<Either<AppErrorEntity, void>> updateNotificationStatus({
    required int tag,
  }) async {
    final token = await _getToken();
    if (token == null) {
      return left(AppErrorEntity(message: 'User not authenticated'));
    }

    final result = await _apiService.updateNotificationStatus(tag: tag);

    return result.fold((l) => left(l.toEntity()), (r) => right(null));
  }

  @override
  Future<Either<AppErrorEntity, void>> markAllAsRead() async {
    final token = await _getToken();
    if (token == null) {
      return left(AppErrorEntity(message: 'User not authenticated'));
    }

    final result = await _apiService.markAllAsRead();

    return result.fold((l) => left(l.toEntity()), (r) => right(null));
  }
}
