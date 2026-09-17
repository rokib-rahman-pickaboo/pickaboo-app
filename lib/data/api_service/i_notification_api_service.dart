import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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

    debugPrint('╔═══════════════════════════════════════════════════════════════════════════════════════');
    debugPrint('║ 🔥 [FIREBASE_DIRECT] Device Token is active in Firebase:');
    debugPrint('║ 🔑 Token: $fcmToken');
    debugPrint('║ ℹ️ (Backend DB sync disabled: device token is managed directly via Firebase)');
    debugPrint('╚═══════════════════════════════════════════════════════════════════════════════════════');
    // ignore: avoid_print
    print('FIREBASE_ACTIVE_TOKEN: $fcmToken');

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

      if (kDebugMode) {
        print('delete_fcm_token -> Success');
      }

      return right(null);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('delete_fcm_token_error -> $e');
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, List<NotificationEntity>>>
  getNotificationList() async {
    try {
      final response = await _client.get(ApiEndpoints.getNotificationListUrl);

      if (kDebugMode) {
        print('get_notification_list -> ${response.data}');
      }

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
      if (kDebugMode) {
        print('get_notification_list_error -> $e');
      }
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

      if (kDebugMode) {
        print('update_notification_status -> Success');
      }

      return right(null);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('update_notification_status_error -> $e');
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, void>> markAllAsRead() async {
    try {
      await _client.put(ApiEndpoints.markAllAsReadUrl);

      if (kDebugMode) {
        print('mark_all_as_read -> Success');
      }

      return right(null);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('mark_all_as_read_error -> $e');
      }
      return left(checkErrorResponse(e));
    }
  }
}
