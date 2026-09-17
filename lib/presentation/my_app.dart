// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/core/theme/app_themes.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:pickaboo/data/services/auth_service.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/address/address_bloc.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/auth/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:pickaboo/presentation/bloc/auth/login_bloc/login_bloc.dart';
import 'package:pickaboo/presentation/bloc/auth/otp_bloc/otp_bloc.dart';
import 'package:pickaboo/presentation/bloc/auth/registration_bloc/registration_bloc.dart';
import 'package:pickaboo/presentation/bloc/recaptcha_bloc/recaptcha_bloc.dart';
import 'package:pickaboo/presentation/bloc/autocomplete_bloc/autocomplete_bloc.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:pickaboo/presentation/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_bloc.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_event.dart';
import 'package:pickaboo/presentation/bloc/compare_bloc/compare_bloc.dart';
import 'package:pickaboo/presentation/bloc/discover_category_bloc/discover_category_bloc.dart';
import 'package:pickaboo/presentation/bloc/just_for_you_bloc/just_for_you_bloc.dart';
import 'package:pickaboo/presentation/bloc/notification_bloc/notification_bloc.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/bloc/referral/referral_bloc.dart';
import 'package:pickaboo/presentation/bloc/ticket_bloc/ticket_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_event.dart';
import 'package:pickaboo/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/navigation/app_navigator_key.dart';
import 'package:pickaboo/core/navigation/session_expiration_notifier.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:provider/provider.dart';
import 'bloc/internet/internet_bloc.dart';
import 'bloc/nav_drawer/nav_drawer_bloc.dart';
import 'navigation/route.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthService _authService;
  late final AppRouter _appRouter;
  StreamSubscription<void>? _sessionExpirationSub;

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
    _appRouter = AppRouter(_authService);
    _sessionExpirationSub =
        SessionExpirationNotifier.onSessionExpired.listen((_) {
      final context = appNavigatorKey.currentContext;
      if (context != null && context.mounted) {
        context.go(Routes.login);
      }
    });
  }

  @override
  void dispose() {
    _sessionExpirationSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _authService),

        BlocProvider(create: (context) => getIt<InternetBloc>()),

        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.appStarted()),
        ),
        BlocProvider(create: (context) => getIt<LoginBloc>()),
        BlocProvider(create: (context) => getIt<RegistrationBloc>()),
        BlocProvider(create: (context) => getIt<ForgotPasswordBloc>()),
        BlocProvider(create: (context) => getIt<OtpBloc>()),
        BlocProvider(create: (context) => getIt<RecaptchaBloc>()),

        BlocProvider(create: (context) => getIt<UserProfileBloc>()),
        BlocProvider(create: (context) => getIt<AddressBloc>()),
        BlocProvider(create: (context) => getIt<AutocompleteBloc>()),

        BlocProvider(create: (context) => getIt<OrderBloc>()),

        BlocProvider(create: (context) => getIt<NotificationBloc>()),

        BlocProvider(create: (context) => getIt<JustForYouBloc>()),

        BlocProvider(create: (context) => getIt<CategoryBloc>()),

        BlocProvider(create: (context) => getIt<DiscoverCategoryBloc>()),

        BlocProvider(create: (context) => getIt<CartBloc>()),
        BlocProvider(create: (context) => getIt<CheckoutBloc>()),

        BlocProvider(create: (context) => getIt<ClubPointBloc>()),

        BlocProvider(create: (context) => getIt<ReferralBloc>()),

        BlocProvider(create: (context) => getIt<WishlistBloc>()),

        BlocProvider(create: (context) => getIt<TicketBloc>()),

        BlocProvider(create: (context) => getIt<NavDrawerBloc>()),

        BlocProvider(create: (context) => getIt<CompareBloc>()),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) {
          final wasAuthenticated = previous.maybeWhen(
            authenticated: (_, _) => true,
            orElse: () => false,
          );
          final isAuthenticated = current.maybeWhen(
            authenticated: (_, _) => true,
            orElse: () => false,
          );
          return wasAuthenticated != isAuthenticated;
        },
        listener: (context, state) async {
          final isAuthenticated = state.maybeWhen(
            authenticated: (_, _) => true,
            orElse: () => false,
          );
          if (isAuthenticated) {
            context.read<UserProfileBloc>().add(
              const UserProfileEvent.loadUserProfile(),
            );
            context.read<ClubPointBloc>().add(
              const ClubPointEvent.getClubPoints(limit: 5),
            );
            context.read<WishlistBloc>().add(
              const WishlistEvent.started(),
            );
            final guestCartId =
                await getIt<AuthCacheManager>().getGuestCartId();
            if (context.mounted) {
              if (guestCartId != null && guestCartId.isNotEmpty) {
                context.read<CartBloc>().add(
                  CartEvent.mergeGuestCart(guestCartId: guestCartId),
                );
              } else {
                context.read<CartBloc>().add(const CartEvent.getCart());
              }
              context.read<CheckoutBloc>().add(
                const CheckoutEvent.loadCheckout(),
              );
            }
          } else {
            context.read<UserProfileBloc>().add(
              const UserProfileEvent.clear(),
            );
            context.read<CartBloc>().add(const CartEvent.clearCartSession());
            context.read<CheckoutBloc>().add(
              const CheckoutEvent.resetCheckout(),
            );
          }
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Android hands out a 0x0 window for the first frame(s)
            // ("FlutterRenderer: Width is zero"). ScreenUtil would derive a
            // scale of 0 from it, making every `.sp` 0.
            // Skip those frames; the native splash is still on screen.
            if (constraints.biggest.isEmpty) {
              return const SizedBox.shrink();
            }

            return ScreenUtilInit(
              designSize: ResponsiveDesign.designSizeFor(constraints.biggest),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp.router(
                  title: 'Pickaboo',
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.light(),
                  darkTheme: AppTheme.dark(),
                  themeMode: ThemeMode.light,
                  routerConfig: _appRouter.router,
                  builder: (context, child) {
                    final mediaQueryData =
                        MediaQuery.maybeOf(context) ??
                        MediaQueryData.fromView(View.of(context));

                    return MediaQuery(
                      data: mediaQueryData.copyWith(
                        textScaler: mediaQueryData.textScaler.clamp(
                          minScaleFactor: 0.8,
                          maxScaleFactor: 1.1,
                        ),
                      ),
                      child: MultiBlocListener(
                        listeners: [
                          BlocListener<InternetBloc, InternetState>(
                            listener: (context, state) {
                              debugPrint(
                                '🌐 [MyApp] BlocListener received state: $state',
                              );
                              state.whenOrNull(
                                disconnected: (message) {
                                  debugPrint(
                                    '🌐 [MyApp] Offline: "$message"',
                                  );
                                },
                                connected: (message) {
                                  debugPrint(
                                    '🌐 [MyApp] ✅ Connected: "$message"',
                                  );
                                },
                              );
                            },
                          ),
                        ],
                        child: child!,
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
