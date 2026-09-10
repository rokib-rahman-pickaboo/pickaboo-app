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
          debugPrint('$_tag 📥 EVENT onNotConnected — requesting strict confirmation');
          _requestDisconnectConfirmation();
        },
        confirmedDisconnected: (_) {
          if (!_isInForeground) {
            debugPrint('$_tag 🛡️ BLOCKED confirmedDisconnected — app is in background');
            return;
          }
          if (_suppressAfterResume) {
            debugPrint('$_tag 🛡️ BLOCKED confirmedDisconnected — in resume grace period');
            return;
          }
          _disconnectDebounce?.cancel();
          _disconnectDebounce = null;
          emit(const InternetState.disconnected("No Internet Connection"));
          debugPrint('$_tag ❌ STATE → disconnected (strictly confirmed)');
        },
      );
    });

    _subscription =
        InternetConnectionChecker().onStatusChange.listen(_onStatusChange);
    debugPrint('$_tag 📡 Subscribed to InternetConnectionChecker.onStatusChange');

    InternetConnectionChecker().hasConnection.then((hasConnection) {
      if (isClosed) return;
      if (hasConnection) {
        add(const InternetEvent.onConnected());
      } else {
        _confirmTrulyNoInternet().then((trulyNoInternet) {
          if (isClosed) return;
          if (trulyNoInternet && _isInForeground && !_suppressAfterResume) {
            add(const InternetEvent.confirmedDisconnected());
          }
        });
      }
    }).catchError((e) {
      debugPrint('$_tag ⚠️ Initial connection check error: $e');
    });
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
      _requestDisconnectConfirmation();
    }
    debugPrint('$_tag ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  }

  void _requestDisconnectConfirmation() {
    if (!_isInForeground) {
      debugPrint('$_tag 🛡️ BLOCKED — app is not in foreground, ignoring disconnect');
      return;
    }

    if (_suppressAfterResume) {
      debugPrint('$_tag 🛡️ SUPPRESSED — app recently resumed, skipping disconnect check');
      return;
    }

    if (state.maybeWhen(disconnected: (_) => true, orElse: () => false)) {
      debugPrint('$_tag ℹ️ Already disconnected, no need to confirm again');
      return;
    }

    if (_disconnectDebounce != null && _disconnectDebounce!.isActive) {
      debugPrint('$_tag ⏳ Confirmation already in progress');
      return;
    }

    debugPrint('$_tag ⚠️ Starting 3.5s disconnect confirmation debounce');
    _disconnectDebounce?.cancel();
    _disconnectDebounce = Timer(const Duration(milliseconds: 3500), () async {
      debugPrint('$_tag ⏰ Debounce elapsed — actively verifying real connectivity...');

      if (!_isInForeground) {
        debugPrint('$_tag 🛡️ BLOCKED — app moved to background during debounce');
        return;
      }

      if (_suppressAfterResume) {
        debugPrint('$_tag 🛡️ SUPPRESSED — app recently resumed during debounce');
        return;
      }

      final trulyOffline = await _confirmTrulyNoInternet();
      debugPrint('$_tag 🔍 Strict check result: trulyOffline=$trulyOffline');

      if (!_isInForeground) {
        debugPrint('$_tag 🛡️ BLOCKED — app moved to background during active check');
        return;
      }

      if (_suppressAfterResume) {
        debugPrint('$_tag 🛡️ SUPPRESSED — app resumed during active check');
        return;
      }

      if (isClosed) return;

      if (trulyOffline) {
        debugPrint('$_tag ❌ CONFIRMED NO INTERNET → dispatching confirmedDisconnected');
        add(const InternetEvent.confirmedDisconnected());
      } else {
        debugPrint('$_tag ✅ Active check PASSED → false alarm, recovering to connected');
        add(const InternetEvent.onConnected());
      }
    });
  }

  Future<bool> _confirmTrulyNoInternet() async {
    try {
      final hasConn = await InternetConnectionChecker()
          .hasConnection
          .timeout(const Duration(seconds: 3));
      if (hasConn) return false;
    } catch (_) {}

    final hosts = ['google.com', 'one.one.one.one'];
    for (final host in hosts) {
      try {
        final result = await InternetAddress.lookup(host)
            .timeout(const Duration(seconds: 2));
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return false;
        }
      } catch (_) {}
    }
    return true;
  }

  void _checkAndRecoverIfOnline() {
    InternetConnectionChecker().hasConnection.then((hasConnection) {
      if (isClosed) return;
      if (hasConnection && _isInForeground) {
        debugPrint('$_tag 🔄 Immediate recovery on resume: online detected!');
        add(const InternetEvent.onConnected());
      }
    }).catchError((_) {});
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint('$_tag 🔄 LIFECYCLE: $state');

    switch (state) {
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
        if (this.state.maybeWhen(disconnected: (_) => true, orElse: () => false)) {
          _checkAndRecoverIfOnline();
        }

      case AppLifecycleState.inactive:
        _isInForeground = false;
        _disconnectDebounce?.cancel();
        _disconnectDebounce = null;
        debugPrint('$_tag 🔄 App INACTIVE (transitioning/locking) — debounce cancelled');

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
        _disconnectDebounce?.cancel();
        _disconnectDebounce = null;
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


