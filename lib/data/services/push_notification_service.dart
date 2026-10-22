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
      final deepLink = PushNotificationService.extractDeepLinkFromData(data);
      await showLocalNotification(
        title: title,
        body: body,
        imageUrl: data['bigPicture'] ?? data['image'],
        deepLink: deepLink,
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
          if (!isDeepLinkConsumed(link)) {
            Future.microtask(() => _deepLinkController.add(link));
          }
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

  String? _lastEmittedLink;
  DateTime? _lastEmittedTime;
  final Set<String> _consumedSlugsOrLinks = {};
  final Set<String> _notificationLinks = {};

  bool consumeIsNotification(String link) {
    return _notificationLinks.remove(link);
  }

  /// Marks a deep link slug, path, or URL as already handled (e.g. by
  /// GoRouter/DeepLinkResolverPage on app launch) so that background/queued
  /// streams do not replay it and re-navigate when HomePage mounts.
  void consumeInitialLink(String? slugOrLink) {
    if (slugOrLink == null || slugOrLink.isEmpty) return;
    final clean = slugOrLink.toLowerCase().trim();
    _consumedSlugsOrLinks.add(clean);
    if (clean.endsWith('.html')) {
      _consumedSlugsOrLinks.add(clean.replaceAll('.html', ''));
    }
    if (clean.contains('?')) {
      _consumedSlugsOrLinks.add(clean.split('?').first);
    }
    try {
      final uri = Uri.parse(clean);
      for (final seg in uri.pathSegments) {
        if (seg.isNotEmpty) {
          _consumedSlugsOrLinks.add(seg);
          if (seg.endsWith('.html')) {
            _consumedSlugsOrLinks.add(seg.replaceAll('.html', ''));
          }
        }
      }
    } catch (_) {}

    if (_pendingDeepLink != null && isDeepLinkConsumed(_pendingDeepLink!)) {
      _pendingDeepLink = null;
    }
  }

  bool isDeepLinkConsumed(String deepLink) {
    if (_consumedSlugsOrLinks.isEmpty) return false;
    final lower = deepLink.toLowerCase();
    for (final consumed in _consumedSlugsOrLinks) {
      if (consumed.isNotEmpty && lower.contains(consumed)) {
        return true;
      }
    }
    return false;
  }

  /// Checks whether a link points to the root homepage or Google Ads click tracking
  /// that lands on the homepage (with parameters like gclid, gad_source, etc.).
  static bool isRootOrAdHome(String link) {
    final clean = link.trim();
    if (clean.isEmpty) return true;

    // Check if it's an ad URL with an embedded adurl destination
    if (clean.contains('adurl=')) {
      try {
        final uri = Uri.parse(clean);
        final adurl = uri.queryParameters['adurl'];
        if (adurl != null && adurl.isNotEmpty) {
          return isRootOrAdHome(Uri.decodeComponent(adurl));
        }
      } catch (_) {}
    }

    final lower = clean.toLowerCase();
    if (lower.contains('googleadservices.com') ||
        lower.contains('doubleclick.net') ||
        lower.contains('/pagead/aclk') ||
        lower.contains('/aclk')) {
      return true;
    }

    var toParse = clean;
    if (!toParse.contains('://')) {
      if (toParse.startsWith('/')) {
        toParse = toParse.substring(1);
      }
      toParse = 'https://$toParse';
    }

    try {
      final uri = Uri.parse(toParse);
      final host = uri.host.toLowerCase();
      final path = uri.path.trim();

      if (host.isEmpty ||
          host == 'pickaboo.com' ||
          host == 'www.pickaboo.com' ||
          host == 'pickaboo') {
        var cleanPath = path;
        while (cleanPath.endsWith('/') && cleanPath.length > 1) {
          cleanPath = cleanPath.substring(0, cleanPath.length - 1);
        }
        if (cleanPath.isEmpty ||
            cleanPath == '/' ||
            cleanPath == '/home' ||
            cleanPath == '/pickaboo' ||
            cleanPath == '/pickaboo.com' ||
            cleanPath == '/www.pickaboo.com' ||
            cleanPath == '/index' ||
            cleanPath == '/main') {
          return true;
        }
        final segments = uri.pathSegments
            .where((s) => s.trim().isNotEmpty)
            .toList();
        if (segments.isEmpty) return true;
        if (segments.length == 1) {
          final s0 = segments[0].toLowerCase();
          if (s0 == 'home' ||
              s0 == 'pickaboo' ||
              s0 == 'pickaboo.com' ||
              s0 == 'www.pickaboo.com' ||
              s0 == 'index' ||
              s0 == 'main' ||
              s0 == 'aclk') {
            return true;
          }
        }
      }
    } catch (_) {}

    return false;
  }

  /// Extracts the real destination URL if the link is a Google Ads click redirect
  static String extractDestinationUrl(String link) {
    final clean = link.trim();
    if (clean.contains('adurl=')) {
      try {
        final uri = Uri.parse(clean);
        final adurl = uri.queryParameters['adurl'];
        if (adurl != null && adurl.isNotEmpty) {
          return Uri.decodeComponent(adurl).trim();
        }
      } catch (_) {}
    }
    return clean;
  }

  /// Strips query parameters so tracking tokens (srsltid, gclid, utm_*)
  /// don't defeat deduplication.
  static String _normalizeForDedup(String link) {
    try {
      final dest = extractDestinationUrl(link);
      final uri = Uri.parse(dest);
      return Uri(
        scheme: uri.scheme,
        host: uri.host,
        path: uri.path,
      ).toString();
    } catch (_) {
      return link;
    }
  }

  /// Extracts the destination deep link from a notification's data payload.
  /// Handles category, special category, product, brand, orders, full URLs, and raw paths.
  static String? extractDeepLinkFromData(Map<String, dynamic>? data) {
    if (data == null || data.isEmpty) return null;

    final rawLink = data['deeplink'] ??
        data['deepLink'] ??
        data['url'] ??
        data['link'] ??
        data['click_action'];
    if (rawLink != null && rawLink.toString().trim().isNotEmpty) {
      return rawLink.toString().trim();
    }

    final type = (data['type'] ?? data['target_type'] ?? data['target'])
        ?.toString()
        .toLowerCase()
        .trim();

    if (type == 'special_category' ||
        type == 'specialcategory' ||
        type == 'special-category') {
      final slug = data['slug'] ??
          data['categorySlug'] ??
          data['category_slug'] ??
          data['specialCategorySlug'] ??
          data['special_category_slug'] ??
          data['id'];
      if (slug != null && slug.toString().trim().isNotEmpty) {
        return '/special-category/${slug.toString().trim()}';
      }
    }
    final specialCatSlug = data['specialCategorySlug'] ??
        data['special_category_slug'] ??
        data['special_category_id'] ??
        data['specialCategoryId'];
    if (specialCatSlug != null && specialCatSlug.toString().trim().isNotEmpty) {
      return '/special-category/${specialCatSlug.toString().trim()}';
    }

    if (type == 'category') {
      final idOrSlug = data['id'] ??
          data['categoryId'] ??
          data['category_id'] ??
          data['slug'] ??
          data['categorySlug'] ??
          data['category_slug'];
      if (idOrSlug != null && idOrSlug.toString().trim().isNotEmpty) {
        return '/category/${idOrSlug.toString().trim()}';
      }
    }
    final catId = data['categoryId'] ??
        data['category_id'] ??
        data['categorySlug'] ??
        data['category_slug'];
    if (catId != null && catId.toString().trim().isNotEmpty) {
      return '/category/${catId.toString().trim()}';
    }

    if (type == 'product') {
      final idOrSlug = data['id'] ??
          data['productId'] ??
          data['product_id'] ??
          data['slug'] ??
          data['productSlug'] ??
          data['product_slug'];
      if (idOrSlug != null && idOrSlug.toString().trim().isNotEmpty) {
        return '/product/${idOrSlug.toString().trim()}';
      }
    }
    final prodId = data['productId'] ??
        data['product_id'] ??
        data['productSlug'] ??
        data['product_slug'];
    if (prodId != null && prodId.toString().trim().isNotEmpty) {
      return '/product/${prodId.toString().trim()}';
    }

    if (type == 'brand') {
      final idOrSlug = data['id'] ??
          data['brandId'] ??
          data['brand_id'] ??
          data['slug'] ??
          data['brandSlug'] ??
          data['brand_slug'];
      if (idOrSlug != null && idOrSlug.toString().trim().isNotEmpty) {
        return '/brand/${idOrSlug.toString().trim()}';
      }
    }

    return null;
  }

  void _emitDeepLink(String deepLink, {bool isNotification = false}) {
    if (isNotification) {
      _notificationLinks.add(deepLink);
    }

    if (!isNotification && isDeepLinkConsumed(deepLink)) {
      return;
    }

    if (!isNotification) {
      final normalized = _normalizeForDedup(deepLink);
      final now = DateTime.now();
      if (_lastEmittedLink == normalized &&
          _lastEmittedTime != null &&
          now.difference(_lastEmittedTime!).inSeconds < 30) {
        return;
      }
      _lastEmittedLink = normalized;
      _lastEmittedTime = now;
    }

    if (_hasActiveListener || _deepLinkController.hasListener) {
      _deepLinkController.add(deepLink);
    } else {
      _pendingDeepLink = deepLink;
    }
  }

  void clearPendingDeepLink() {
    _pendingDeepLink = null;
  }

  Future<String?> _waitForApnsToken({
    int maxRetries = 10,
    Duration delay = const Duration(milliseconds: 500),
  }) async {
    if (!Platform.isIOS) return null;
    for (int i = 0; i < maxRetries; i++) {
      try {
        final apnsToken = await _firebaseMessaging.getAPNSToken();
        if (apnsToken != null && apnsToken.isNotEmpty) {
          debugPrint('✅ [APNS] Got APNs token');
          return apnsToken;
        }
      } catch (e) {
        debugPrint('⚠️ [APNS] Error reading APNs token (attempt ${i + 1}): $e');
      }
      await Future.delayed(delay);
    }
    debugPrint(
      '⚠️ [APNS] APNs token not available after $maxRetries attempts (expected on simulator)',
    );
    return null;
  }

  Future<void> initialize() async {
    try {
      await _initializeLocalNotifications();

      _requestPermissions().then((_) async {
        await _subscribeToTopics();
        await _getAndSaveFcmToken();
      });

      _firebaseMessaging.onTokenRefresh.listen((token) {
        _onTokenRefresh(token);
        _subscribeToTopics();
      });

      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

      FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);

      _handleInitialMessage();
      _handleLocalNotificationInitialMessage();
      _handleInitialAppRoute();

      _appLinks.uriLinkStream.listen((uri) {
        final uriStr = uri.toString();
        if (isRootOrAdHome(uriStr)) {
          consumeInitialLink(uriStr);
          return;
        }
        _emitDeepLink(uriStr);
      });
    } catch (e) {
      debugPrint('❌ Error initializing PushNotificationService: $e');
    }
  }

  Future<void> _subscribeToTopics() async {
    try {
      if (Platform.isAndroid) {
        await _firebaseMessaging.subscribeToTopic(
          'pickaboo_notification_android',
        );
        debugPrint('✅ Subscribed to pickaboo_notification_android');
      } else if (Platform.isIOS) {
        await _waitForApnsToken();
        await _firebaseMessaging.subscribeToTopic(
          'pickaboo_notification_ios_new',
        );
        debugPrint('✅ Subscribed to pickaboo_notification_ios_new');
      }
    } catch (e) {
      debugPrint('❌ Error subscribing to topics: $e');
    }
  }

  /// Directly binds authenticated user to Firebase topics & analytics.
  Future<void> bindUserToFirebase(String userId) async {
    try {
      if (Platform.isIOS) {
        await _waitForApnsToken();
      }
      final userTopic = 'user_$userId';
      final customerTopic = 'customer_$userId';
      await _firebaseMessaging.subscribeToTopic(userTopic);
      await _firebaseMessaging.subscribeToTopic(customerTopic);
    } catch (e) {
      debugPrint('❌ Error binding user to Firebase: $e');
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
      debugPrint('❌ Error unbinding user from Firebase: $e');
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

    if (Platform.isIOS) {
      await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
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
      if (Platform.isIOS) {
        await _waitForApnsToken();
      }
      final token = await _firebaseMessaging.getToken();
      if (token != null && token.isNotEmpty) {
        await _saveTokenLocally(token);
        _tokenController.add(token);
        debugPrint('🔥 [FCM] Got token: $token');
        return token;
      }
    } catch (e) {
      debugPrint('❌ [FCM] Error getting token: $e');
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
        deepLink: extractDeepLinkFromData(data),
      );
    }
  }

  void _onLocalNotificationTap(NotificationResponse response) {
    final deepLink = response.payload;
    if (deepLink != null && deepLink.isNotEmpty) {
      _emitDeepLink(deepLink, isNotification: true);
    }
  }

  Future<void> _handleInitialMessage() async {
    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      _handleNotificationTap(initialMessage);
    }
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
          _emitDeepLink(payload, isNotification: true);
        }
      }
    } catch (e) {
    }
  }

  Future<void> _handleInitialAppRoute() async {
    try {
      final initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        final uriStr = initialUri.toString();
        if (isDeepLinkConsumed(uriStr)) {
          return;
        }
        final prefs = await SharedPreferences.getInstance();
        final normalized = _normalizeForDedup(uriStr);
        final lastLink = prefs.getString('last_initial_link');

        if (lastLink == normalized) {
          return;
        }
        await prefs.setString('last_initial_link', normalized);

        if (isRootOrAdHome(uriStr)) {
          consumeInitialLink(uriStr);
          consumeInitialLink(normalized);
          return;
        }

        _emitDeepLink(uriStr);
      }
    } catch (e) {
    }
  }

  void _handleNotificationTap(RemoteMessage message) {
    final deepLink = extractDeepLinkFromData(message.data);
    if (deepLink != null && deepLink.isNotEmpty) {
      _emitDeepLink(deepLink, isNotification: true);
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
      await _subscribeToTopics();
    } catch (e) {
      debugPrint('❌ Error enabling notifications: $e');
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
