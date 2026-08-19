import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'internet_state.dart';
part 'internet_event.dart';
part 'internet_bloc.freezed.dart';

@LazySingleton()
class InternetBloc extends Bloc<InternetEvent, InternetState>
    with WidgetsBindingObserver {
  StreamSubscription<InternetConnectionStatus>? _subscription;
  Timer? _disconnectDebounce;
  Timer? _suppressTimer;

  bool _isInForeground = true;

  bool _suppressAfterResume = false;

  static const _tag = '🌐 [InternetBloc]';

  InternetBloc() : super(const _Initial()) {
    WidgetsBinding.instance.addObserver(this);
    debugPrint('$_tag ✅ INIT — observer registered, initial state: $state');

    on<InternetEvent>((event, emit) {
      event.map(
        onConnected: (_) {
          debugPrint('$_tag 📥 EVENT onConnected — cancelling debounce, emitting connected');
          _disconnectDebounce?.cancel();
          _disconnectDebounce = null;
          emit(const InternetState.connected("Back Online"));
          debugPrint('$_tag ✅ STATE → connected');
        },
        onNotConnected: (_) {
          debugPrint('$_tag 📥 EVENT onNotConnected — emitting disconnected');
          emit(const InternetState.disconnected("No Internet Connection"));
          debugPrint('$_tag ❌ STATE → disconnected (this triggers the snackbar!)');
        },
      );
    });

    _subscription =
        InternetConnectionChecker().onStatusChange.listen(_onStatusChange);
    debugPrint('$_tag 📡 Subscribed to InternetConnectionChecker.onStatusChange');
  }

  void _onStatusChange(InternetConnectionStatus status) {
    debugPrint('$_tag ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    debugPrint('$_tag 📡 onStatusChange: $status');
    debugPrint('$_tag    _isInForeground: $_isInForeground');
    debugPrint('$_tag    _suppressAfterResume: $_suppressAfterResume');
    debugPrint('$_tag    currentState: $state');

    if (status == InternetConnectionStatus.connected) {
      debugPrint('$_tag ✅ Status=connected → adding onConnected event');
      add(const InternetEvent.onConnected());
    } else {
      if (!_isInForeground) {
        debugPrint('$_tag 🛡️ BLOCKED — app is in background, ignoring disconnect');
        debugPrint('$_tag ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
        return;
      }

      debugPrint('$_tag ⚠️ Status=disconnected → starting 3s debounce timer');
      _disconnectDebounce?.cancel();
      _disconnectDebounce = Timer(const Duration(seconds: 3), () async {
        debugPrint('$_tag ⏰ Debounce timer FIRED (3s elapsed)');
        debugPrint('$_tag    _isInForeground: $_isInForeground');
        debugPrint('$_tag    _suppressAfterResume: $_suppressAfterResume');

        if (!_isInForeground) {
          debugPrint('$_tag 🛡️ BLOCKED — app moved to background during debounce');
          return;
        }

        if (_suppressAfterResume) {
          debugPrint('$_tag 🛡️ SUPPRESSED — app recently resumed, skipping');
          return;
        }

        debugPrint('$_tag 🔍 Verifying connectivity with DNS lookup...');
        final hasConnection = await _verifyConnectivity();
        debugPrint('$_tag 🔍 DNS verify result: hasConnection=$hasConnection');

        if (!hasConnection) {
          if (!_isInForeground) {
            debugPrint('$_tag 🛡️ BLOCKED — app went to background during DNS check');
            return;
          }
          debugPrint('$_tag ❌ DNS verify FAILED → adding onNotConnected event');
          add(const InternetEvent.onNotConnected());
        } else {
          debugPrint('$_tag ✅ DNS verify PASSED → false alarm, not disconnecting');
        }
      });
    }
    debugPrint('$_tag ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  }

  Future<bool> _verifyConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 3));
      final ok = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      debugPrint('$_tag 🔍 _verifyConnectivity: success=$ok, '
          'results=${result.length}');
      return ok;
    } catch (e) {
      debugPrint('$_tag 🔍 _verifyConnectivity: EXCEPTION: $e');
      return false;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState lifecycleState) {
    super.didChangeAppLifecycleState(lifecycleState);
    debugPrint('$_tag 🔄 LIFECYCLE: $lifecycleState');

    switch (lifecycleState) {
      case AppLifecycleState.resumed:
        _isInForeground = true;
        _suppressAfterResume = true;
        _disconnectDebounce?.cancel();
        _disconnectDebounce = null;
        _suppressTimer?.cancel();
        _suppressTimer = Timer(const Duration(seconds: 5), () {
          _suppressAfterResume = false;
          debugPrint('$_tag 🔄 Suppress window EXPIRED — disconnect events allowed');
        });
        debugPrint('$_tag 🔄 App RESUMED — foreground=true, suppress=5s');

      case AppLifecycleState.inactive:
        debugPrint('$_tag 🔄 App INACTIVE (transitioning)');

      case AppLifecycleState.hidden:
        _isInForeground = false;
        _disconnectDebounce?.cancel();
        _disconnectDebounce = null;
        debugPrint('$_tag 🔄 App HIDDEN — foreground=false, debounce cancelled');

      case AppLifecycleState.paused:
        _isInForeground = false;
        _disconnectDebounce?.cancel();
        _disconnectDebounce = null;
        debugPrint('$_tag 🔄 App PAUSED — foreground=false, debounce cancelled');

      case AppLifecycleState.detached:
        _isInForeground = false;
        debugPrint('$_tag 🔄 App DETACHED');
    }
  }

  @override
  Future<void> close() async {
    debugPrint('$_tag 🛑 CLOSE — cleaning up');
    WidgetsBinding.instance.removeObserver(this);
    _disconnectDebounce?.cancel();
    _suppressTimer?.cancel();
    await _subscription?.cancel();
    return super.close();
  }
}

