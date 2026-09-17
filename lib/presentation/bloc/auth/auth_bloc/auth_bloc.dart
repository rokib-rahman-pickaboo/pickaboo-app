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

  Future<void> _clearAllCaches() async {
    await repository.clearToken();
    await _userProfileRepository.clearUserProfile();
  }

  Future<void> _onAppStarted(_AppStarted event, Emitter<AuthState> emit) async {
    if (kDebugMode) print('🔵 AuthBloc: App started, checking auth status');
    emit(const AuthState.loading());

    try {
      final token = await repository.getStoredToken();

      if (token != null && token.isNotEmpty) {
        if (kDebugMode) print('✅ AuthBloc: Token found, fetching user');

        final result = await repository.getCurrentUser();

        await result.fold<Future<void>>(
          (error) async {
            // A 500, a timeout or no connection is NOT an auth failure. This
            // used to clear the token and sign the user out whenever the
            // backend hiccuped on launch — and because the profile cache went
            // with it, customerId stayed null for the rest of the session.
            // Real 401s are handled centrally by AuthInterceptor, which clears
            // the session and routes to login, so nothing is cleared here.
            if (kDebugMode) {
              print(
                '⚠️ AuthBloc: Could not verify user (${error.message}) — '
                'keeping session, falling back to cached profile',
              );
            }

            final cached = await _userProfileRepository.getProfile();
            cached.fold(
              (_) {
                // Nothing cached either: stay signed out for this launch but
                // keep the token so the next launch/retry can recover.
                emit(const AuthState.unauthenticated());
              },
              (user) => emit(AuthState.authenticated(token: token, user: user)),
            );
          },
          (user) async {
            if (kDebugMode) {
              print('✅ AuthBloc: User authenticated - ${user.email}');
            }
            emit(AuthState.authenticated(token: token, user: user));
            _syncWithFirebase(user.id.toString());
          },
        );
      } else {
        if (kDebugMode) print('❌ AuthBloc: No token found');
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      // Same reasoning as above: an unexpected client-side failure must not
      // cost the user their session.
      if (kDebugMode) print('⚠️ AuthBloc: Error checking auth — keeping session: $e');
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onUserLoggedIn(
    _UserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    if (kDebugMode) print('🔵 AuthBloc: User logged in, fetching user data');
    emit(const AuthState.loading());

    try {
      final result = await repository.getCurrentUser();
      final token = await repository.getStoredToken();

      result.fold(
        (error) {
          if (kDebugMode) {
            print('❌ AuthBloc: Failed to get user - ${error.message}');
          }
          emit(const AuthState.unauthenticated());
        },
        (user) {
          if (kDebugMode) {
            print('✅ AuthBloc: User authenticated - ${user.email}');
          }
          emit(AuthState.authenticated(token: token ?? '', user: user));
          _syncWithFirebase(user.id.toString());
        },
      );
    } catch (e) {
      if (kDebugMode) print('❌ AuthBloc: Error fetching user - $e');
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onUserLoggedOut(
    _UserLoggedOut event,
    Emitter<AuthState> emit,
  ) async {
    if (kDebugMode) print('🔵 AuthBloc: User logged out — clearing all caches');
    try {
      final profileResult = await _userProfileRepository.getProfile();
      profileResult.fold(
        (_) {},
        (user) => getIt<PushNotificationService>().unbindUserFromFirebase(user.id.toString()),
      );
    } catch (_) {}
    await _clearAllCaches();
    emit(const AuthState.unauthenticated());
  }

  Future<void> _onTokenRefreshed(
    _TokenRefreshed event,
    Emitter<AuthState> emit,
  ) async {
    if (kDebugMode) {
      print('🔵 AuthBloc: Token refresh received — saving & revalidating');
    }
    emit(const AuthState.loading());

    try {
      await repository.saveToken(event.newToken);

      final result = await repository.getCurrentUser();

      await result.fold<Future<void>>(
        (error) async {
          // The token was just issued — a failed /customers/me here means the
          // backend is unwell, not that the token is bad. Discarding it would
          // sign the user out immediately after a successful login.
          if (kDebugMode) {
            print(
              '⚠️ AuthBloc: Token revalidation failed (${error.message}) — '
              'keeping token, falling back to cached profile',
            );
          }

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
          if (kDebugMode) {
            print('✅ AuthBloc: Token revalidated — ${user.email}');
          }
          emit(AuthState.authenticated(token: event.newToken, user: user));
          _syncWithFirebase(user.id.toString());
        },
      );
    } catch (e) {
      if (kDebugMode) print('⚠️ AuthBloc: Token refresh error — keeping token: $e');
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _syncWithFirebase(String userId) async {
    try {
      final pushService = getIt<PushNotificationService>();
      await pushService.bindUserToFirebase(userId);
      String? fcmToken = await pushService.getStoredToken();
      if (fcmToken == null || fcmToken.isEmpty) {
        fcmToken = await FirebaseMessaging.instance.getToken();
      }

      debugPrint('╔═══════════════════════════════════════════════════════════════════════════════════════');
      debugPrint('║ 🔥 [FIREBASE] Device token active and bound directly to user:');
      debugPrint('║ 👤 User ID: $userId');
      debugPrint('║ 🔑 Token: $fcmToken');
      debugPrint('║ 🏷️ Topics: user_$userId, customer_$userId');
      debugPrint('╚═══════════════════════════════════════════════════════════════════════════════════════');
      // ignore: avoid_print
      print('FIREBASE_ACTIVE_USER_TOKEN: $fcmToken');
    } catch (e) {
      debugPrint('⚠️ [FIREBASE] Exception while syncing with Firebase: $e');
    }
  }
}
