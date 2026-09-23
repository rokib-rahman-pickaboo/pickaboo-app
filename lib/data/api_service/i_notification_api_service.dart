import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/core/network/api_error_parser.dart';
import 'package:pickaboo/data/api_service/notification_api_service.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/notification_item/notification_item.dart';
import 'package:pickaboo/domain/entity/notification_entity/notification_entity.dart';

@LazySingleton(as: NotificationApiService)
class INotificationApiService extends NotificationApiService {
  final Dio _client;

  INotificationApiService(this._client);

  ErrorResponse checkErrorResponse(DioException err) {
    return ApiErrorParser.parse(err);
  }

  @override
  Future<Either<ErrorResponse, void>> saveFcmToken({
    required String fcmToken,
  }) async {
    // Commented out as requested: Tokens are not stored in our DB; managed directly in Firebase
    /*
    final osName = Platform.isAndroid ? 'android' : 'ios';
    try {
      final response = await _client.post(
        ApiEndpoints.saveFcmTokenUrl,
        data: {
          'token': fcmToken,
          'device_type': 'mobile',
          'os_name': osName,
          'browser_name': 'pickaboo_app',
          'status': 'subscribed',
        },
      );
      return right(null);
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
    */

    // ignore: avoid_print

    return right(null);
  }

  @override
  Future<Either<ErrorResponse, void>> deleteFcmToken({
    required String fcmToken,
  }) async {
    try {
      await _client.delete(
        ApiEndpoints.deleteFcmTokenUrl,
        queryParameters: {'token': fcmToken},
      );

      return right(null);
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, List<NotificationEntity>>>
  getNotificationList() async {
    try {
      final response = await _client.get(ApiEndpoints.getNotificationListUrl);

      if (response.data is List) {
        final notifications = (response.data as List)
            .map((json) => NotificationItem.fromJson(json))
            .map((item) => item.toEntity())
            .toList();
        return right(notifications);
      }

      return left(
        const ErrorResponse(message: 'Invalid notification list response'),
      );
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, void>> updateNotificationStatus({
    required int tag,
  }) async {
    try {
      await _client.put(
        ApiEndpoints.updateNotificationStatusUrl,
        queryParameters: {'tag': tag, 'is_fetched': 1, 'is_clicked': 1},
      );

      return right(null);
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, void>> markAllAsRead() async {
    try {
      await _client.put(ApiEndpoints.markAllAsReadUrl);

      return right(null);
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }
}
