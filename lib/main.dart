import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/core/cache/fast_cache_manager.dart';
import 'package:pickaboo/core/monitoring/crash_reporter.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/data/services/push_notification_service.dart';
import 'package:pickaboo/firebase_options.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/my_app.dart';
import 'package:pickaboo/data/services/recaptcha_service.dart';

void main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = CrashReporter.recordFlutterError;
  binding.platformDispatcher.onError = (error, stack) {
    CrashReporter.record(error, stack, fatal: true);
    return true;
  };

  await FastCacheManager.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await configureDependencies();

  await getIt<AuthCacheManager>().warmUp();

  unawaited(getIt<AnalyticsService>().init());
  unawaited(getIt<PushNotificationService>().initialize());

  try {
    await getIt<RecaptchaService>().initialize();
  } catch (error, stack) {
    CrashReporter.record(error, stack, fatal: false);
    if (kDebugMode) {
      print('⚠️ Non-fatal Recaptcha init bypass: $error');
    }
  }

  if (kDebugMode) {
    print('main: Initialization complete, calling runApp');
  }

  runApp(const MyApp());
}
