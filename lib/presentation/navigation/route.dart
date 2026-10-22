import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/navigation/app_navigator_key.dart';
import 'package:pickaboo/data/services/auth_service.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/navigation/routes/auth_routes.dart';
import 'package:pickaboo/presentation/navigation/routes/cart_routes.dart';
import 'package:pickaboo/presentation/navigation/routes/dashboard_routes.dart';
import 'package:pickaboo/presentation/navigation/routes/order_routes.dart';
import 'package:pickaboo/presentation/navigation/routes/product_routes.dart';

import 'package:pickaboo/data/services/push_notification_service.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/ui/pages/deep_link_resolver_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// Central application router coordinating modular route definitions.
class AppRouter {
  final AuthService authService;

  AppRouter(this.authService);

  late final GoRouter router = GoRouter(
    navigatorKey: appNavigatorKey,
    initialLocation: Routes.splash,
    debugLogDiagnostics: true,
    refreshListenable: authService,
    routes: [
      ...authRoutes,
      ...dashboardRoutes,
      ...productRoutes,
      ...cartRoutes,
      ...orderRoutes,
    ],
    errorBuilder: (context, state) => _handleRouterError(context, state),
  );
}

bool _isHomeOrDomain(String str) {
  if (PushNotificationService.isRootOrAdHome(str)) {
    return true;
  }
  final clean = str.trim().toLowerCase();
  if (clean.isEmpty || clean == '/' || clean == '/home' || clean == 'home') {
    return true;
  }
  if (clean == 'pickaboo' || clean == '/pickaboo') {
    return true;
  }
  if (clean == 'pickaboo.com' || clean == '/pickaboo.com') {
    return true;
  }
  if (clean == 'www.pickaboo.com' || clean == '/www.pickaboo.com') {
    return true;
  }
  if (clean.startsWith('https://www.pickaboo.com?') ||
      clean.startsWith('https://pickaboo.com?') ||
      clean.startsWith('pickaboo.com?') ||
      clean.startsWith('www.pickaboo.com?')) {
    return true;
  }
  return false;
}

Widget _handleRouterError(BuildContext context, GoRouterState state) {
  var uriString = state.uri.toString().trim();
  final rawPath = state.uri.path.trim();

  if (_isHomeOrDomain(uriString) ||
      _isHomeOrDomain(rawPath) ||
      rawPath.isEmpty ||
      rawPath == '/' ||
      rawPath == Routes.splash ||
      rawPath == Routes.home) {
    return const _RouteFallbackPage(target: Routes.home);
  }

  // Extract destination URL if wrapped in adurl query parameter
  final extracted = PushNotificationService.extractDestinationUrl(uriString);
  if (extracted != uriString) {
    uriString = extracted;
    if (_isHomeOrDomain(uriString)) {
      return const _RouteFallbackPage(target: Routes.home);
    }
  }

  var toParse = uriString;
  if (!toParse.contains('://') &&
      (toParse.startsWith('pickaboo.com') ||
       toParse.startsWith('www.pickaboo.com') ||
       toParse.startsWith('/pickaboo.com') ||
       toParse.startsWith('/www.pickaboo.com'))) {
    if (toParse.startsWith('/')) toParse = toParse.substring(1);
    toParse = 'https://$toParse';
  }
  final effectiveUri = Uri.tryParse(toParse) ?? state.uri;

  final segments = effectiveUri.pathSegments
      .map((s) => s.trim())
      .where((s) => s.isNotEmpty)
      .toList();

  final nonDomainSegments = segments
      .where((s) {
        final l = s.toLowerCase();
        return l != 'pickaboo.com' &&
            l != 'www.pickaboo.com' &&
            l != 'pickaboo' &&
            l != 'http:' &&
            l != 'https:' &&
            l != 'aclk' &&
            l != 'pagead' &&
            !l.contains('google') &&
            !l.contains('doubleclick') &&
            !l.contains('gclid') &&
            !l.contains('gad_source') &&
            !l.contains('utm_');
      })
      .toList();

  if (nonDomainSegments.isEmpty) {
    return const _RouteFallbackPage(target: Routes.home);
  }

  final firstSeg = nonDomainSegments.first.toLowerCase();

  // Ignore admin / auth / api / checkout routes
  if (firstSeg.startsWith('customer') ||
      firstSeg.startsWith('sociallogin') ||
      firstSeg.startsWith('checkout') ||
      firstSeg.startsWith('oauth') ||
      firstSeg.startsWith('admin') ||
      firstSeg.startsWith('api') ||
      firstSeg.startsWith('rest') ||
      firstSeg == 'index' ||
      firstSeg == 'main' ||
      firstSeg == 'r' ||
      firstSeg == 'home') {
    return const _RouteFallbackPage(target: Routes.home);
  }

  if (firstSeg == 'special-category' || firstSeg == 'special_category') {
    final slug = nonDomainSegments.length > 1 ? nonDomainSegments.sublist(1).join('/') : '';
    if (slug.isNotEmpty) {
      return DeepLinkResolverPage(slug: slug, type: 'special_category');
    }
    return const _RouteFallbackPage(target: Routes.home);
  }

  if (firstSeg == 'category' || firstSeg == 'categories') {
    final slug = nonDomainSegments.length > 1 ? nonDomainSegments.sublist(1).join('/') : '';
    if (slug.isNotEmpty) {
      return DeepLinkResolverPage(slug: slug, type: 'category');
    }
    return const _RouteFallbackPage(target: Routes.home);
  }

  if (firstSeg == 'product' ||
      firstSeg == 'product-detail' ||
      firstSeg == 'product-details' ||
      firstSeg == 'products') {
    final slug = nonDomainSegments.length > 1 ? nonDomainSegments.sublist(1).join('/') : '';
    if (slug.isNotEmpty) {
      return DeepLinkResolverPage(slug: slug, type: 'product');
    }
    return const _RouteFallbackPage(target: Routes.home);
  }

  if (firstSeg == 'brand' || firstSeg == 'brand_detail' || firstSeg == 'brands') {
    final slug = nonDomainSegments.length > 1 ? nonDomainSegments.sublist(1).join('/') : '';
    if (slug.isNotEmpty) {
      return _RouteFallbackPage(
        target: Routes.brandProduct,
        queryParams: {'brandSlug': slug},
      );
    }
    return const _RouteFallbackPage(target: Routes.home);
  }

  final slug = nonDomainSegments.last;
  final lowerSlug = slug.toLowerCase();
  if (lowerSlug.isEmpty ||
      lowerSlug == 'home' ||
      lowerSlug == 'index' ||
      lowerSlug == 'main' ||
      lowerSlug == 'pickaboo' ||
      lowerSlug.contains('pickaboo.com') ||
      lowerSlug.endsWith('.com') ||
      lowerSlug == 'aclk' ||
      lowerSlug == 'pagead' ||
      lowerSlug.contains('google') ||
      lowerSlug.contains('doubleclick') ||
      lowerSlug.contains('gclid') ||
      lowerSlug.contains('gad_source') ||
      lowerSlug.contains('utm_')) {
    return const _RouteFallbackPage(target: Routes.home);
  }

  return DeepLinkResolverPage(slug: slug, type: 'auto');
}

class _RouteFallbackPage extends StatefulWidget {
  final String target;
  final Map<String, String>? queryParams;

  const _RouteFallbackPage({
    required this.target,
    this.queryParams,
  });

  @override
  State<_RouteFallbackPage> createState() => _RouteFallbackPageState();
}

class _RouteFallbackPageState extends State<_RouteFallbackPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      try {
        final pushService = getIt<PushNotificationService>();
        pushService.consumeInitialLink(widget.target);
        pushService.clearPendingDeepLink();
      } catch (_) {}

      final destination =
          (widget.queryParams != null && widget.queryParams!.isNotEmpty)
              ? Uri(path: widget.target, queryParameters: widget.queryParams).toString()
              : widget.target;

      if (destination == Routes.home) {
        context.go(Routes.home);
      } else {
        if (context.canPop()) {
          context.pushReplacement(destination);
        } else {
          context.go(Routes.home);
          context.push(destination);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AppLoader.fullPage());
  }
}
