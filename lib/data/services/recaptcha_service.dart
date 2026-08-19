import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:recaptcha_enterprise_flutter/recaptcha.dart';
import 'package:recaptcha_enterprise_flutter/recaptcha_action.dart';
import 'package:recaptcha_enterprise_flutter/recaptcha_client.dart';

@lazySingleton
class RecaptchaService {
  RecaptchaClient? _client;

  void _log(String msg) {
    print('[RECAPTCHA] $msg');
  }

  Future<void> initialize() async {
    final siteKey = Platform.isAndroid
        ? "6LeVkkUtAAAAALSE-yoYI9ntzJGhFOF4ICxaFg7W"
        : "6Lchp0UtAAAAAFtg0H-YYA3qJOLJJIee02iPXxo4";

    _log('initialize start | platform=${Platform.operatingSystem} siteKey=$siteKey');
    try {
      _client = await Recaptcha.fetchClient(siteKey);
      _log('initialize success | client=${_client != null}');
    } catch (e, st) {
      _log('initialize FAILED | error=$e');
      _log('initialize stackTrace | $st');
      rethrow;
    }
  }

  Future<String> executeAction(String action) async {
    _log('executeAction start | action=$action clientReady=${_client != null}');
    if (_client == null) {
      _log('executeAction ABORT | client not initialized');
      throw Exception("Recaptcha not initialized");
    }
    try {
      final token = await _client!.execute(RecaptchaAction.custom(action));
      _log('executeAction success | action=$action tokenLen=${token.length} '
          'tokenPrefix=${token.length > 12 ? token.substring(0, 12) : token}...');
      return token;
    } catch (e, st) {
      _log('executeAction FAILED | action=$action error=$e');
      _log('executeAction stackTrace | $st');
      rethrow;
    }
  }
}
