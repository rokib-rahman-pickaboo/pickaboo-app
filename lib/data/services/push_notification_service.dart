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

  if (kDebugMode) {
    print('Background message received: ${message.messageId}');
  }

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

  if (kDebugMode) {
    print('📧 Local notification shown with payload: $deepLink');
  }
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
    if (kDebugMode) {
      print('Error downloading notification image: $e');
    }
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
          if (kDebugMode) {
            print(
              '🔗 [DeepLink] Replaying pending deep link: $_pendingDeepLink',
            );
          }
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
      if (kDebugMode) {
        print('🔗 [DeepLink] Emitting to active listeners: $deepLink');
      }
      _deepLinkController.add(deepLink);
    } else {
      if (kDebugMode) {
        print('🔗 [DeepLink] No active listeners. Storing pending: $deepLink');
      }
      _pendingDeepLink = deepLink;
    }
  }

  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('PushNotificationService: Starting initialization');
      }

      await _initializeLocalNotifications();

      if (kDebugMode) {
        print('PushNotificationService: Local notifications initialized');
      }

      _requestPermissions().then((_) {
        if (kDebugMode) {
          print('PushNotificationService: Permissions handled');
        }
        _subscribeToTopics();
      });

      _getAndSaveFcmToken().then((token) {
        if (token != null) {
          _tokenController.add(token);
        }
        if (kDebugMode) {
          print('PushNotificationService: Initial token handled');
        }
      });

      _firebaseMessaging.onTokenRefresh.listen(_onTokenRefresh);

      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

      FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);

      _handleInitialMessage();
      _handleLocalNotificationInitialMessage();
      _handleInitialAppRoute();

      _appLinks.uriLinkStream.listen((uri) {
        if (kDebugMode) {
          print('🔗 [PushNotificationService] Stream Link Received: $uri');
        }
        _emitDeepLink(uri.toString());
      });

      if (kDebugMode) {
        print('PushNotificationService initialization (async parts started)');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing PushNotificationService: $e');
      }
    }
  }

  Future<void> _subscribeToTopics() async {
    try {
      if (Platform.isAndroid) {
        await _firebaseMessaging.subscribeToTopic(
          'pickaboo_notification_android',
        );
        if (kDebugMode) {
          print(
            'PushNotificationService: Subscribed to pickaboo_notification_android',
          );
        }
      } else if (Platform.isIOS) {
        await _firebaseMessaging.subscribeToTopic(
          'pickaboo_notification_ios_new',
        );
        if (kDebugMode) {
          print(
            'PushNotificationService: Subscribed to pickaboo_notification_ios_new',
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error subscribing to topics: $e');
      }
    }
  }

  /// Directly binds authenticated user to Firebase topics & analytics.
  Future<void> bindUserToFirebase(String userId) async {
    try {
      final userTopic = 'user_$userId';
      final customerTopic = 'customer_$userId';
      await _firebaseMessaging.subscribeToTopic(userTopic);
      await _firebaseMessaging.subscribeToTopic(customerTopic);
      debugPrint('╔═══════════════════════════════════════════════════════════════════════════════════════');
      debugPrint('║ 🔥 [FIREBASE] Bound device directly to user topics: $userTopic, $customerTopic');
      debugPrint('╚═══════════════════════════════════════════════════════════════════════════════════════');
      if (kDebugMode) {
        print('✅ [FIREBASE] Subscribed device to topics: $userTopic, $customerTopic');
      }
    } catch (e) {
      debugPrint('❌ [FIREBASE] Error subscribing to user topic: $e');
    }
  }

  /// Directly unbinds user from Firebase topics upon logout.
  Future<void> unbindUserFromFirebase(String userId) async {
    try {
      final userTopic = 'user_$userId';
      final customerTopic = 'customer_$userId';
      await _firebaseMessaging.unsubscribeFromTopic(userTopic);
      await _firebaseMessaging.unsubscribeFromTopic(customerTopic);
      debugPrint('🚪 [FIREBASE] Unsubscribed device from user topics: $userTopic, $customerTopic');
    } catch (e) {
      debugPrint('❌ [FIREBASE] Error unsubscribing from user topic: $e');
    }
  }

  Future<void> _requestPermissions() async {
    final status = await Permission.notification.request();

    if (kDebugMode) {
      // permission_handler covers both platforms; the old label said "Android"
      // and printed on iOS too, which sent debugging down the wrong path.
      print('Notification permission (${Platform.isIOS ? 'iOS' : 'Android'}): $status');
      if (status.isPermanentlyDenied) {
        print(
          '⚠️ Notifications permanently denied — the system prompt will not '
          'appear again; the Settings page toggle routes to app settings.',
        );
      }
    }

    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    if (kDebugMode) {
      print('iOS notification permission: ${settings.authorizationStatus}');
    }
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

    if (kDebugMode) {
      print('✅ Local notifications initialized with tap handler');
    }

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
        if (kDebugMode) {
          print('FCM Token: $token');
        }
        return token;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error getting FCM token: $e');
      }
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
    if (kDebugMode) {
      print('FCM Token refreshed: $newToken');
    }
    await _saveTokenLocally(newToken);
    _tokenController.add(newToken);
  }

  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    if (!await isNotificationsEnabled()) {
      if (kDebugMode) {
        print('🔕 Notifications disabled, skipping display');
      }
      return;
    }

    if (kDebugMode) {
      print('🔔 Foreground message received');
      print('Title: ${message.notification?.title}');
      print('Body: ${message.notification?.body}');
      print('Data: ${message.data}');
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
    if (kDebugMode) {
      print('\ud83d\udd14 Local Notification Tapped');
      print('Payload: ${response.payload}');
    }
    final deepLink = response.payload;
    if (deepLink != null && deepLink.isNotEmpty) {
      if (kDebugMode) {
        print('\ud83d\udd17 [DeepLink] Notification Clicked: $deepLink');
      }
      _emitDeepLink(deepLink);
    }
  }

  Future<void> _handleInitialMessage() async {
    if (kDebugMode) {
      print(
        '🔍 [DeepLink] Checking for initial message (app opened from terminated state)...',
      );
    }

    final initialMessage = await _firebaseMessaging.getInitialMessage();

    if (initialMessage != null) {
      if (kDebugMode) {
        print('✅ [DeepLink] Initial message found!');
        print('   Title: ${initialMessage.notification?.title}');
        print('   Data: ${initialMessage.data}');
      }
      _handleNotificationTap(initialMessage);
    } else {}
  }

  Future<void> _handleLocalNotificationInitialMessage() async {
    try {
      final details = await _localNotifications
          .getNotificationAppLaunchDetails();
      if (details != null && details.didNotificationLaunchApp) {
        final payload = details.notificationResponse?.payload;
        if (kDebugMode) {
          print('✅ [DeepLink] App launched via local notification');
          print('   Payload: $payload');
        }
        if (payload != null && payload.isNotEmpty) {
          if (kDebugMode) {
            print('🔍 [DeepLink] Checking sticky local notification...');
            print('   Current Payload: $payload');

            final prefs = await SharedPreferences.getInstance();
            final lastPayload = prefs.getString('last_initial_payload');
            print('   Last Stored Payload: $lastPayload');

            if (lastPayload == payload) {
              print(
                '🚫 [DeepLink] Ignoring sticky local notification in debug mode: $payload',
              );
              return;
            }
            await prefs.setString('last_initial_payload', payload);
            print('✅ [DeepLink] New payload saved to prefs.');
          }
          _emitDeepLink(payload);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error handling local notification initial message: $e');
      }
    }
  }

  Future<void> _handleInitialAppRoute() async {
    try {
      final initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        if (kDebugMode) {
          print(
            '🔗 [PushNotificationService] Initial AppLink Received: $initialUri',
          );
          final prefs = await SharedPreferences.getInstance();
          final lastLink = prefs.getString('last_initial_link');
          print('🔗 [PushNotificationService] Last Handled Link: $lastLink');

          if (lastLink == initialUri.toString()) {
            print(
              '🚫 [DeepLink] Ignoring sticky initial link in debug mode: $initialUri',
            );
            return;
          }
          await prefs.setString('last_initial_link', initialUri.toString());
          print('✅ [DeepLink] New initial link saved: $initialUri');
        }

        if (kDebugMode) {
          print('✅ [DeepLink] Processing Initial AppLink: $initialUri');
        }
        _emitDeepLink(initialUri.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error handling initial AppLink: $e');
      }
    }
  }

  void _handleNotificationTap(RemoteMessage message) {
    if (kDebugMode) {
      print('\ud83d\udd14 Firebase Notification Tapped');
      print('Title: ${message.notification?.title}');
      print('Body: ${message.notification?.body}');
      print('Data: ${message.data}');
    }
    final deepLink =
        message.data['deeplink'] ??
        message.data['deepLink'] ??
        message.data['url'] ??
        message.data['link'];
    if (deepLink != null && deepLink.isNotEmpty) {
      if (kDebugMode) {
        print('🔗 [DeepLink] Notification Clicked: $deepLink');
      }
      _emitDeepLink(deepLink);
    }
  }

  Future<bool> isNotificationsEnabled() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_notificationsEnabledKey) ??
          true;
    } catch (e) {
      if (kDebugMode) {
        print('Error checking notification status: $e');
      }
      return true;
    }
  }

  Future<void> enableNotifications() async {
    try {
      if (kDebugMode) {
        print('\u2705 Enabling notifications...');
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_notificationsEnabledKey, true);

      await _firebaseMessaging.setAutoInitEnabled(true);

      await _requestPermissions();

      await _getAndSaveFcmToken();

      if (kDebugMode) {
        print('\u2705 Notifications enabled successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('\u274c Error enabling notifications: $e');
      }
      rethrow;
    }
  }

  Future<void> disableNotifications() async {
    try {
      if (kDebugMode) {
        print('\ud83d\udd15 Disabling notifications...');
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_notificationsEnabledKey, false);

      await _firebaseMessaging.setAutoInitEnabled(false);

      if (kDebugMode) {
        print('\ud83d\udd15 Notifications disabled successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('\u274c Error disabling notifications: $e');
      }
      rethrow;
    }
  }

  void dispose() {
    _deepLinkController.close();
    _tokenController.close();
  }
}
