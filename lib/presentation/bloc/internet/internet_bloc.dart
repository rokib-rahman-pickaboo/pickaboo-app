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


  InternetBloc() : super(const _Initial()) {
    WidgetsBinding.instance.addObserver(this);

    on<InternetEvent>((event, emit) {
      event.map(
        onConnected: (_) {
          _disconnectDebounce?.cancel();
          _disconnectDebounce = null;
          emit(const InternetState.connected("Back Online"));
        },
        onNotConnected: (_) {
          _requestDisconnectConfirmation();
        },
        confirmedDisconnected: (_) {
          if (!_isInForeground) {
            return;
          }
          if (_suppressAfterResume) {
            return;
          }
          _disconnectDebounce?.cancel();
          _disconnectDebounce = null;
          emit(const InternetState.disconnected("No Internet Connection"));
        },
      );
    });

    _subscription =
        InternetConnectionChecker().onStatusChange.listen(_onStatusChange);

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
    });
  }

  void _onStatusChange(InternetConnectionStatus status) {

    if (status == InternetConnectionStatus.connected) {
      add(const InternetEvent.onConnected());
    } else {
      _requestDisconnectConfirmation();
    }
  }

  void _requestDisconnectConfirmation() {
    if (!_isInForeground) {
      return;
    }

    if (_suppressAfterResume) {
      return;
    }

    if (state.maybeWhen(disconnected: (_) => true, orElse: () => false)) {
      return;
    }

    if (_disconnectDebounce != null && _disconnectDebounce!.isActive) {
      return;
    }

    _disconnectDebounce?.cancel();
    _disconnectDebounce = Timer(const Duration(milliseconds: 3500), () async {

      if (!_isInForeground) {
        return;
      }

      if (_suppressAfterResume) {
        return;
      }

      final trulyOffline = await _confirmTrulyNoInternet();

      if (!_isInForeground) {
        return;
      }

      if (_suppressAfterResume) {
        return;
      }

      if (isClosed) return;

      if (trulyOffline) {
        add(const InternetEvent.confirmedDisconnected());
      } else {
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
        add(const InternetEvent.onConnected());
      }
    }).catchError((_) {});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        _isInForeground = true;
        _suppressAfterResume = true;
        _disconnectDebounce?.cancel();
        _disconnectDebounce = null;
        _suppressTimer?.cancel();
        _suppressTimer = Timer(const Duration(seconds: 5), () {
          _suppressAfterResume = false;
        });
        if (this.state.maybeWhen(disconnected: (_) => true, orElse: () => false)) {
          _checkAndRecoverIfOnline();
        }

      case AppLifecycleState.inactive:
        _isInForeground = false;
        _disconnectDebounce?.cancel();
        _disconnectDebounce = null;

      case AppLifecycleState.hidden:
        _isInForeground = false;
        _disconnectDebounce?.cancel();
        _disconnectDebounce = null;

      case AppLifecycleState.paused:
        _isInForeground = false;
        _disconnectDebounce?.cancel();
        _disconnectDebounce = null;

      case AppLifecycleState.detached:
        _isInForeground = false;
        _disconnectDebounce?.cancel();
        _disconnectDebounce = null;
    }
  }

  @override
  Future<void> close() async {
    WidgetsBinding.instance.removeObserver(this);
    _disconnectDebounce?.cancel();
    _suppressTimer?.cancel();
    await _subscription?.cancel();
    return super.close();
  }
}

