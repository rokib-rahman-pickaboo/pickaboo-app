import 'dart:async';
import 'package:flutter/foundation.dart';

class PerformanceMonitor {
  static final Map<String, List<int>> _metrics = {};

  static Future<T> measure<T>(String name, Future<T> Function() action) async {
    final stopwatch = Stopwatch()..start();
    try {
      final result = await action();
      stopwatch.stop();
      _record(name, stopwatch.elapsedMicroseconds);
      return result;
    } catch (e) {
      stopwatch.stop();
      _record(name, stopwatch.elapsedMicroseconds);
      rethrow;
    }
  }

  static void _record(String name, int microseconds) {
    if (!_metrics.containsKey(name)) {
      _metrics[name] = [];
    }
    _metrics[name]!.add(microseconds);

    if (kDebugMode) {
      debugPrint('⏱️ [PERF] $name: ${microseconds / 1000}ms');
    }
  }

  static void printReport() {
    debugPrint('\n================ PERFORMANCE REPORT ================');
    _metrics.forEach((name, times) {
      final count = times.length;
      final total = times.reduce((a, b) => a + b);
      final avg = total / count / 1000;
      final min = times.reduce((a, b) => a < b ? a : b) / 1000;
      final max = times.reduce((a, b) => a > b ? a : b) / 1000;

      debugPrint('$name:');
      debugPrint('  Count: $count');
      debugPrint('  Average: ${avg.toStringAsFixed(2)}ms');
      debugPrint('  Min: ${min.toStringAsFixed(2)}ms');
      debugPrint('  Max: ${max.toStringAsFixed(2)}ms');
      debugPrint('----------------------------------------------------');
    });
    debugPrint('====================================================\n');
  }
}
