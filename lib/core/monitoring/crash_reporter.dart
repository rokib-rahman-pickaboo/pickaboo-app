import 'package:flutter/foundation.dart';

class CrashReporter {
  const CrashReporter._();

  static void recordFlutterError(FlutterErrorDetails details) {
    FlutterError.presentError(details);
    record(details.exception, details.stack, fatal: false);
  }

  static void record(Object error, StackTrace? stack, {bool fatal = false}) {
    if (kDebugMode) {
      debugPrint('🔥 [CrashReporter] ${fatal ? 'FATAL ' : ''}$error');
      if (stack != null) debugPrintStack(stackTrace: stack);
    }
  }
}
