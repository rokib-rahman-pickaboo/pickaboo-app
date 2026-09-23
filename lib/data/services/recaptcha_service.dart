import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:recaptcha_enterprise_flutter/recaptcha.dart';
import 'package:recaptcha_enterprise_flutter/recaptcha_action.dart';
import 'package:recaptcha_enterprise_flutter/recaptcha_client.dart';

@lazySingleton
class RecaptchaService {
  RecaptchaClient? _client;
  DateTime? _clientInitializedAt;
  Future<void>? _initFuture;

  /// reCAPTCHA tokens expire within 120 seconds. We invalidate the client session
  /// after 60 seconds to ensure any generated token has a creation timestamp
  /// well within the backend's validation window.
  static const int _maxSessionAgeSeconds = 60;

  void _log(String msg) {
    debugPrint('[RECAPTCHA_SDK] $msg');
  }

  bool get _isClientStale {
    if (_client == null || _clientInitializedAt == null) return true;
    final age = DateTime.now().difference(_clientInitializedAt!).inSeconds;
    return age >= _maxSessionAgeSeconds;
  }

  Future<void> initialize({bool force = false}) async {
    if (!force && !_isClientStale) {
      _log('ℹ️ client is already active and fresh (sessionAge=${DateTime.now().difference(_clientInitializedAt!).inSeconds}s)');
      return;
    }
    if (_initFuture != null) {
      return _initFuture;
    }
    _initFuture = _doInitialize();
    try {
      await _initFuture;
    } finally {
      _initFuture = null;
    }
  }

  Future<void> _doInitialize() async {
    final siteKey = Platform.isAndroid
        ? "6LdyecAtAAAAAMnsE0qJ4VSh6sSAilFC941Qn_ZQ"
        : "6Lf6O8AtAAAAANxu-bkbEW9MfEGg4yfB5hc2EZrR"; //iOS

    _log('🚀 initialize start | platform=${Platform.operatingSystem} siteKey=$siteKey');
    final sw = Stopwatch()..start();
    try {
      _client = await Recaptcha.fetchClient(siteKey);
      _clientInitializedAt = DateTime.now();
      sw.stop();
      _log('✅ initialize success | duration=${sw.elapsedMilliseconds}ms clientReady=${_client != null}');
    } catch (e, st) {
      sw.stop();
      _client = null;
      _clientInitializedAt = null;
      _log('❌ initialize FAILED | duration=${sw.elapsedMilliseconds}ms error=$e');
      _log('initialize stackTrace | $st');
      rethrow;
    }
  }

  Future<String> executeAction(String action, {bool forceFresh = false}) async {
    final sessionAge = _clientInitializedAt != null
        ? DateTime.now().difference(_clientInitializedAt!).inSeconds
        : null;
    _log('🎯 executeAction start | action=$action clientReady=${_client != null} sessionAge=${sessionAge}s isStale=$_isClientStale forceFresh=$forceFresh');
    if (_client == null || _isClientStale || forceFresh) {
      _log('⏳ client session is null, stale (>${_maxSessionAgeSeconds}s), or forced fresh. Fetching fresh client session...');
      _client = null;
      await initialize(force: true);
    }
    final sw = Stopwatch()..start();
    try {
      final token = await _client!.execute(RecaptchaAction.custom(action));
      sw.stop();
      _log('✅ executeAction success | action=$action duration=${sw.elapsedMilliseconds}ms tokenLen=${token.length} '
          'tokenPrefix=${token.length > 16 ? token.substring(0, 16) : token}...');
      return token;
    } catch (e, st) {
      sw.stop();
      _log('⚠️ executeAction FAILED | action=$action duration=${sw.elapsedMilliseconds}ms error=$e. Re-initializing fresh client and retrying once...');
      _log('executeAction stackTrace | $st');
      try {
        _client = null;
        await initialize(force: true);
        final retrySw = Stopwatch()..start();
        final token = await _client!.execute(RecaptchaAction.custom(action));
        retrySw.stop();
        _log('✅ executeAction retry success | action=$action duration=${retrySw.elapsedMilliseconds}ms tokenLen=${token.length} '
            'tokenPrefix=${token.length > 16 ? token.substring(0, 16) : token}...');
        return token;
      } catch (retryError, retrySt) {
        _log('❌ executeAction retry FAILED | error=$retryError');
        _log('executeAction retry stackTrace | $retrySt');
        rethrow;
      }
    }
  }
}
