import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_links/app_links.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (message.notification == null) {
    final data = message.data;
    final String title = data['title'] ?? 'Pickaboo';
    final String body = data['body'] ?? '';

    if (title.isNotEmpty || body.isNotEmpty) {
      await showLocalNotification(
        title: title,
        body: body,
        imageUrl: data['bigPicture'] ?? data['image'],
        deepLink:
            data['deeplink'] ?? data['deepLink'] ?? data['url'] ?? data['link'],
      );
    }
  }
}

Future<void> showLocalNotification({
  required String title,
  required String body,
  String? imageUrl,
  String? deepLink,
}) async {
  final FlutterLocalNotificationsPlugin localNotifications =
      FlutterLocalNotificationsPlugin();

  String? bigPicturePath;
  if (imageUrl != null && imageUrl.isNotEmpty) {
    bigPicturePath = await _downloadAndSaveFile(imageUrl, 'notification_img');
  }

  final androidDetails = AndroidNotificationDetails(
    'high_importance_channel',
    'High Importance Notifications',
    importance: Importance.high,
    priority: Priority.high,
    styleInformation: bigPicturePath != null
        ? BigPictureStyleInformation(
            FilePathAndroidBitmap(bigPicturePath),
            contentTitle: title,
            summaryText: body,
          )
        : null,
  );

  const iosDetails = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  final details = NotificationDetails(android: androidDetails, iOS: iosDetails);

  await localNotifications.show(
    DateTime.now().millisecondsSinceEpoch ~/ 1000,
    title,
    body,
    details,
    payload: deepLink,
  );

}

Future<String?> _downloadAndSaveFile(String url, String fileName) async {
  try {
    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/$fileName';
    final response = await Dio().get(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    final file = File(filePath);
    await file.writeAsBytes(response.data);
    return filePath;
  } catch (e) {
    return null;
  }
}

@lazySingleton
class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();
  final AppLinks _appLinks = AppLinks();

  final StreamController<String> _deepLinkController =
      StreamController.broadcast();
  late final Stream<String> _deepLinkStream;

  String? _pendingDeepLink;
  bool _hasActiveListener = false;

  PushNotificationService() {
    _deepLinkStream = _deepLinkController.stream.asBroadcastStream(
      onListen: (_) {
        _hasActiveListener = true;
        if (_pendingDeepLink != null) {
          final link = _pendingDeepLink!;
          _pendingDeepLink = null;
          Future.microtask(() => _deepLinkController.add(link));
        }
      },
      onCancel: (_) {
        _hasActiveListener = false;
      },
    );
  }

  Stream<String> get deepLinkStream => _deepLinkStream;

  final StreamController<String?> _tokenController =
      StreamController<String?>.broadcast();
  Stream<String?> get tokenStream => _tokenController.stream;

  static const String _fcmTokenKey = 'fcm_token';
  static const String _notificationsEnabledKey = 'notifications_enabled';

  void _emitDeepLink(String deepLink) {
    if (_hasActiveListener || _deepLinkController.hasListener) {
      _deepLinkController.add(deepLink);
    } else {
      _pendingDeepLink = deepLink;
    }
  }

  Future<void> initialize() async {
    try {

      await _initializeLocalNotifications();

      _requestPermissions().then((_) {
        _subscribeToTopics();
      });

      _getAndSaveFcmToken().then((token) {
        if (token != null) {
          _tokenController.add(token);
        }
      });

      _firebaseMessaging.onTokenRefresh.listen(_onTokenRefresh);

      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

      FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);

      _handleInitialMessage();
      _handleLocalNotificationInitialMessage();
      _handleInitialAppRoute();

      _appLinks.uriLinkStream.listen((uri) {
        _emitDeepLink(uri.toString());
      });

    } catch (e) {
    }
  }

  Future<void> _subscribeToTopics() async {
    try {
      if (Platform.isAndroid) {
        await _firebaseMessaging.subscribeToTopic(
          'pickaboo_notification_android',
        );
      } else if (Platform.isIOS) {
        await _firebaseMessaging.subscribeToTopic(
          'pickaboo_notification_ios_new',
        );
      }
    } catch (e) {
    }
  }

  /// Directly binds authenticated user to Firebase topics & analytics.
  Future<void> bindUserToFirebase(String userId) async {
    try {
      final userTopic = 'user_$userId';
      final customerTopic = 'customer_$userId';
      await _firebaseMessaging.subscribeToTopic(userTopic);
      await _firebaseMessaging.subscribeToTopic(customerTopic);
    } catch (e) {
    }
  }

  /// Directly unbinds user from Firebase topics upon logout.
  Future<void> unbindUserFromFirebase(String userId) async {
    try {
      final userTopic = 'user_$userId';
      final customerTopic = 'customer_$userId';
      await _firebaseMessaging.unsubscribeFromTopic(userTopic);
      await _firebaseMessaging.unsubscribeFromTopic(customerTopic);
    } catch (e) {
    }
  }

  Future<void> _requestPermissions() async {
    await Permission.notification.request();

    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

  }

  Future<void> _initializeLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: _onLocalNotificationTap,
    );

    const channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'Used for important notifications',
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }

  Future<String?> _getAndSaveFcmToken() async {
    try {
      final token = await _firebaseMessaging.getToken();
      if (token != null) {
        await _saveTokenLocally(token);
        return token;
      }
    } catch (e) {
    }
    return null;
  }

  Future<void> _saveTokenLocally(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_fcmTokenKey, token);
  }

  Future<String?> getStoredToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_fcmTokenKey);
  }

  void _onTokenRefresh(String newToken) async {
    await _saveTokenLocally(newToken);
    _tokenController.add(newToken);
  }

  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    if (!await isNotificationsEnabled()) {
      return;
    }

    final notification = message.notification;
    final data = message.data;

    final String title = notification?.title ?? data['title'] ?? 'Pickaboo';
    final String body = notification?.body ?? data['body'] ?? '';

    if (title.isNotEmpty || body.isNotEmpty) {
      await showLocalNotification(
        title: title,
        body: body,
        imageUrl: data['bigPicture'] ?? data['image'],
        deepLink:
            data['deeplink'] ?? data['deepLink'] ?? data['url'] ?? data['link'],
      );
    }
  }

  void _onLocalNotificationTap(NotificationResponse response) {
    final deepLink = response.payload;
    if (deepLink != null && deepLink.isNotEmpty) {
      _emitDeepLink(deepLink);
    }
  }

  Future<void> _handleInitialMessage() async {

    final initialMessage = await _firebaseMessaging.getInitialMessage();

    if (initialMessage != null) {
      _handleNotificationTap(initialMessage);
    } else {}
  }

  Future<void> _handleLocalNotificationInitialMessage() async {
    try {
      final details = await _localNotifications
          .getNotificationAppLaunchDetails();
      if (details != null && details.didNotificationLaunchApp) {
        final payload = details.notificationResponse?.payload;
        if (payload != null && payload.isNotEmpty) {
          if (kDebugMode) {

            final prefs = await SharedPreferences.getInstance();
            final lastPayload = prefs.getString('last_initial_payload');

            if (lastPayload == payload) {
              return;
            }
            await prefs.setString('last_initial_payload', payload);
          }
          _emitDeepLink(payload);
        }
      }
    } catch (e) {
    }
  }

  Future<void> _handleInitialAppRoute() async {
    try {
      final initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        if (kDebugMode) {
          final prefs = await SharedPreferences.getInstance();
          final lastLink = prefs.getString('last_initial_link');

          if (lastLink == initialUri.toString()) {
            return;
          }
          await prefs.setString('last_initial_link', initialUri.toString());
        }

        _emitDeepLink(initialUri.toString());
      }
    } catch (e) {
    }
  }

  void _handleNotificationTap(RemoteMessage message) {
    final deepLink =
        message.data['deeplink'] ??
        message.data['deepLink'] ??
        message.data['url'] ??
        message.data['link'];
    if (deepLink != null && deepLink.isNotEmpty) {
      _emitDeepLink(deepLink);
    }
  }

  Future<bool> isNotificationsEnabled() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_notificationsEnabledKey) ??
          true;
    } catch (e) {
      return true;
    }
  }

  Future<void> enableNotifications() async {
    try {

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_notificationsEnabledKey, true);

      await _firebaseMessaging.setAutoInitEnabled(true);

      await _requestPermissions();

      await _getAndSaveFcmToken();

    } catch (e) {
      rethrow;
    }
  }

  Future<void> disableNotifications() async {
    try {

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_notificationsEnabledKey, false);

      await _firebaseMessaging.setAutoInitEnabled(false);

    } catch (e) {
      rethrow;
    }
  }

  void dispose() {
    _deepLinkController.close();
    _tokenController.close();
  }
}
