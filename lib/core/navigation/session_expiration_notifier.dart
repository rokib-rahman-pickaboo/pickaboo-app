import 'dart:async';

/// Global event bus for session expiration notifications.
/// Decouples data layer interceptors from presentation routing and UI state.
class SessionExpirationNotifier {
  SessionExpirationNotifier._();

  static final StreamController<void> _controller =
      StreamController<void>.broadcast();

  /// Stream of session expiration events.
  static Stream<void> get onSessionExpired => _controller.stream;

  /// Emits a session expired event to all listeners.
  static void notifySessionExpired() {
    if (!_controller.isClosed) {
      _controller.add(null);
    }
  }
}
