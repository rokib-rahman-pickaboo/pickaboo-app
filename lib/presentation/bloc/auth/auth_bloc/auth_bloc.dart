import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/auth/user_entity.dart';
import 'package:pickaboo/domain/repository/auth_repository.dart';
import 'package:pickaboo/domain/repository/user_profile_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pickaboo/data/services/push_notification_service.dart';
import 'package:pickaboo/injection.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

/// Global Authentication BLoC.
///
/// Coordinates user authentication lifecycle, session persistence, and third-party
/// service bindings (such as Firebase Push Notifications).
///
/// ### Session Resilience Architecture:
/// - **Cold-Start Resilience:** Transient network errors (socket timeouts, HTTP 500)
///   during app launch will **not** wipe the stored auth token. Instead, the BLoC
///   falls back to the cached profile (`UserProfileRepository.getProfile()`), keeping
///   the user authenticated offline or in degraded connectivity.
/// - **Single Source of Revocation:** Explicit token invalidation (HTTP 401) is handled
///   centrally by `AuthInterceptor`, preventing race conditions where minor network hiccups
///   sign out the customer.
/// - **Push Notification Binding:** Automatically binds/unbinds the customer ID
///   with Firebase Cloud Messaging on login and logout.
@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  final UserProfileRepository _userProfileRepository;

  AuthBloc(this.repository, this._userProfileRepository)
      : super(const AuthState.initial()) {
    on<_AppStarted>(_onAppStarted);
    on<_UserLoggedIn>(_onUserLoggedIn);
    on<_UserLoggedOut>(_onUserLoggedOut);
    on<_TokenRefreshed>(_onTokenRefreshed);
  }

  /// Wipes persisted session credentials and cached profile data.
  Future<void> _clearAllCaches() async {
    await repository.clearToken();
    await _userProfileRepository.clearUserProfile();
  }

  /// Handles app launch / cold-start authentication check.
  ///
  /// Inspects storage for an existing auth token:
  /// 1. If present, attempts to fetch fresh user data from `/customers/me`.
  /// 2. If the network request fails with a non-auth error (500, timeout, offline),
  ///    it recovers using cached user profile data so the user retains their session.
  /// 3. If no token exists or cache is empty and remote call fails, emits `unauthenticated`.
  Future<void> _onAppStarted(_AppStarted event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      final token = await repository.getStoredToken();

      if (token != null && token.isNotEmpty) {
        final result = await repository.getCurrentUser();

        await result.fold<Future<void>>(
          (error) async {
            // A 500, timeout, or no connection is NOT an auth failure. Wiping the
            // token here would force re-login on backend downtime and lose the
            // cached customer ID. Real 401s are intercepted by AuthInterceptor.
            final cached = await _userProfileRepository.getProfile();
            cached.fold(
              (_) {
                // No cached profile available: stay unauthenticated for this launch
                // but keep the stored token so retry/subsequent launches can recover.
                emit(const AuthState.unauthenticated());
              },
              (user) => emit(AuthState.authenticated(token: token, user: user)),
            );
          },
          (user) async {
            emit(AuthState.authenticated(token: token, user: user));
            _syncWithFirebase(user.id.toString());
          },
        );
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      // Unexpected client-side exception: do not purge tokens; emit unauthenticated for safety.
      emit(const AuthState.unauthenticated());
    }
  }

  /// Processes successful user login.
  ///
  /// Fetches authenticated user info, persists token, emits `authenticated`,
  /// and links the customer ID to Firebase for targeted push notifications.
  Future<void> _onUserLoggedIn(
    _UserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    try {
      final result = await repository.getCurrentUser();
      final token = await repository.getStoredToken();

      result.fold(
        (error) {
          emit(const AuthState.unauthenticated());
        },
        (user) {
          emit(AuthState.authenticated(token: token ?? '', user: user));
          _syncWithFirebase(user.id.toString());
        },
      );
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }

  /// Processes user-initiated logout.
  ///
  /// Unbinds the user ID from Firebase notifications so subsequent push messages
  /// are not delivered to this device, clears local tokens/caches, and emits `unauthenticated`.
  Future<void> _onUserLoggedOut(
    _UserLoggedOut event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final profileResult = await _userProfileRepository.getProfile();
      profileResult.fold(
        (_) {},
        (user) => getIt<PushNotificationService>().unbindUserFromFirebase(user.id.toString()),
      );
    } catch (_) {
      // Best-effort push unbind failure must not prevent session clearing.
    }
    await _clearAllCaches();
    emit(const AuthState.unauthenticated());
  }

  /// Updates persisted token and re-verifies user session.
  ///
  /// Fallbacks to cached profile if remote verification hits transient errors.
  Future<void> _onTokenRefreshed(
    _TokenRefreshed event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    try {
      await repository.saveToken(event.newToken);

      final result = await repository.getCurrentUser();

      await result.fold<Future<void>>(
        (error) async {
          // Token was freshly minted. A network failure here indicates a transient
          // backend issue rather than invalid credentials; fallback to cached profile.
          final cached = await _userProfileRepository.getProfile();
          cached.fold(
            (_) => emit(const AuthState.unauthenticated()),
            (user) {
              emit(AuthState.authenticated(token: event.newToken, user: user));
              _syncWithFirebase(user.id.toString());
            },
          );
        },
        (user) async {
          emit(AuthState.authenticated(token: event.newToken, user: user));
          _syncWithFirebase(user.id.toString());
        },
      );
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }

  /// Synchronizes user ID with Firebase Messaging for targeted notifications.
  ///
  /// Wrapped in try-catch so notification setup failures never interrupt core auth.
  Future<void> _syncWithFirebase(String userId) async {
    try {
      final pushService = getIt<PushNotificationService>();
      await pushService.bindUserToFirebase(userId);
      String? fcmToken = await pushService.getStoredToken();
      if (fcmToken == null || fcmToken.isEmpty) {
        fcmToken = await FirebaseMessaging.instance.getToken();
      }
    } catch (_) {
      // Push notification binding failure is non-fatal to the auth session.
    }
  }
}
