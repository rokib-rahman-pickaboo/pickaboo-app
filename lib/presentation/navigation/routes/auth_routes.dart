import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/auth/forgot_password_confirm_page/forgot_password_confirm_page.dart';
import 'package:pickaboo/presentation/ui/pages/auth/forgot_password_page/forgot_password_page.dart';
import 'package:pickaboo/presentation/ui/pages/auth/login_page/login_page.dart';
import 'package:pickaboo/presentation/ui/pages/auth/registration_detail_page/registration_detail_page.dart';
import 'package:pickaboo/presentation/ui/pages/auth/registration_page/registration_page.dart';
import 'package:pickaboo/presentation/ui/pages/deep_link_resolver_page.dart';
import 'package:pickaboo/presentation/ui/pages/no_internet_page/no_internet_page.dart';
import 'package:pickaboo/presentation/ui/pages/splash_page/splash_page.dart';

/// Routes for authentication, onboarding, deep links, and connectivity states.
final List<RouteBase> authRoutes = [
  GoRoute(
    path: Routes.splash,
    name: 'splash',
    builder: (context, state) => const SplashPage(),
  ),
  GoRoute(
    path: Routes.login,
    name: 'login',
    builder: (context, state) {
      final isPop = state.uri.queryParameters['isPop'] == 'true';
      final isBuyNow = state.uri.queryParameters['isBuyNow'] == 'true';
      final isPopGuest = state.uri.queryParameters['isPopGuest'] == 'true';
      final from = state.uri.queryParameters['from'];
      final redirectToHome =
          state.uri.queryParameters['redirectToHome'] == 'true' ||
          from == 'profile' ||
          from == 'drawer';

      return LoginPage(
        isPop: isPop,
        isBuyNow: isBuyNow,
        isPopGuest: isPopGuest,
        redirectToHome: redirectToHome,
      );
    },
  ),
  GoRoute(
    path: Routes.forgotPassword,
    name: 'forgotPassword',
    builder: (context, state) => const ForgotPasswordPage(),
  ),
  GoRoute(
    path: Routes.forgotPasswordConfirm,
    name: 'forgotPasswordConfirm',
    builder: (context, state) {
      final extras = state.extra as Map<String, dynamic>?;
      final isEmail = extras?['isEmail'] as bool? ?? true;
      final value = extras?['value'] as String? ?? '';
      return ForgotPasswordConfirmPage(isEmail: isEmail, value: value);
    },
  ),
  GoRoute(
    path: Routes.registration,
    name: 'registration',
    builder: (context, state) {
      final phone = state.uri.queryParameters['phone'] ?? '';
      return RegistrationPage(phone: phone);
    },
  ),
  GoRoute(
    path: Routes.registrationDetail,
    name: 'registrationDetail',
    builder: (context, state) {
      final extras = state.extra as Map<String, dynamic>?;
      final phone = extras?['phone'] ?? '';
      final otp = extras?['otp'] ?? '';
      return RegistrationDetailPage(phone: phone, otp: otp);
    },
  ),
  GoRoute(
    path: '/product-detail/:slug',
    builder: (context, state) {
      final slug = state.pathParameters['slug'] ?? '';
      return DeepLinkResolverPage(slug: slug, type: 'product');
    },
  ),
  GoRoute(
    path: '/category/:slug',
    builder: (context, state) {
      final slug = state.pathParameters['slug'] ?? '';
      return DeepLinkResolverPage(slug: slug, type: 'category');
    },
  ),
  GoRoute(
    path: Routes.noInternet,
    name: 'no_internet',
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>?;
      return NoInternetPage(
        title: extra?['title'] as String?,
        message: extra?['message'] as String?,
        onRetry: extra?['onRetry'] as VoidCallback?,
        onBack: extra?['onBack'] as VoidCallback?,
      );
    },
  ),
];
