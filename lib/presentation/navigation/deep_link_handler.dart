import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/services/push_notification_service.dart';
import 'package:pickaboo/domain/entity/slug_resolution/slug_resolution_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';

@lazySingleton
class DeepLinkHandler {
  final ProductRepository _productRepository;
  String? _lastHandledPath;
  DateTime? _lastHandledTime;

  DeepLinkHandler(this._productRepository);

  Future<void> handleDeepLink(
    String deepLink,
    GoRouter router, {
    bool isNotification = false,
  }) async {
    final trimmedLink = deepLink.trim();
    if (trimmedLink.isEmpty) return;

    if (!isNotification) {
      String dedupKey;
      try {
        final u = Uri.parse(trimmedLink);
        dedupKey = '${u.host}${u.path}';
      } catch (_) {
        dedupKey = trimmedLink;
      }
      final now = DateTime.now();
      if (_lastHandledPath == dedupKey &&
          _lastHandledTime != null &&
          now.difference(_lastHandledTime!).inSeconds < 30) {
        return;
      }
      _lastHandledPath = dedupKey;
      _lastHandledTime = now;
    }

    try {
      var effectiveLink = PushNotificationService.extractDestinationUrl(trimmedLink);
      if (!effectiveLink.contains('://') &&
          (effectiveLink.startsWith('pickaboo.com') ||
           effectiveLink.startsWith('www.pickaboo.com') ||
           effectiveLink.startsWith('/pickaboo.com') ||
           effectiveLink.startsWith('/www.pickaboo.com'))) {
        if (effectiveLink.startsWith('/')) {
          effectiveLink = effectiveLink.substring(1);
        }
        effectiveLink = 'https://$effectiveLink';
      }

      final uri = Uri.parse(effectiveLink);

      String path = uri.path;
      String? slug;
      String type = '';

      if (uri.scheme == 'pickaboo' || uri.scheme.startsWith('http')) {
        path = uri.path;
      } else if (!trimmedLink.contains('://') && trimmedLink.startsWith('/')) {
        path = trimmedLink.contains('?') ? trimmedLink.split('?').first : trimmedLink;
      } else if (trimmedLink.isNotEmpty && !trimmedLink.contains('/')) {
        slug = trimmedLink;
      }

      // If it's already an in-app target route with query params, navigate directly
      if (path == Routes.categoryProduct ||
          path == Routes.specialCategoryProduct ||
          path == Routes.brandProduct ||
          path == Routes.sellerProduct ||
          path == Routes.cart ||
          path == Routes.wishlist ||
          path == Routes.orderList) {
        _navigate(router, trimmedLink.startsWith('/') ? trimmedLink : '/$trimmedLink');
        return;
      }

      // Root path / homepage / Google Ads root link
      final lowerLink = trimmedLink.toLowerCase();
      final lowerPath = path.toLowerCase();
      if (PushNotificationService.isRootOrAdHome(trimmedLink) ||
          PushNotificationService.isRootOrAdHome(effectiveLink) ||
          lowerPath == '/' ||
          lowerPath.isEmpty ||
          lowerPath == '/home' ||
          lowerLink == '/' ||
          lowerLink.isEmpty ||
          lowerLink == 'pickaboo.com' ||
          lowerLink == 'www.pickaboo.com' ||
          lowerLink == 'pickaboo' ||
          lowerLink == '/pickaboo.com' ||
          lowerLink == '/www.pickaboo.com' ||
          lowerLink == 'https://pickaboo.com' ||
          lowerLink == 'https://www.pickaboo.com' ||
          lowerLink == 'https://pickaboo.com/' ||
          lowerLink == 'https://www.pickaboo.com/' ||
          lowerLink.startsWith('https://www.pickaboo.com/?') ||
          lowerLink.startsWith('https://pickaboo.com/?') ||
          lowerLink.startsWith('https://www.pickaboo.com?') ||
          lowerLink.startsWith('https://pickaboo.com?') ||
          lowerLink.startsWith('http://www.pickaboo.com/?') ||
          lowerLink.startsWith('http://pickaboo.com/?') ||
          lowerLink.startsWith('pickaboo.com/?') ||
          lowerLink.startsWith('www.pickaboo.com/?') ||
          lowerLink.startsWith('pickaboo.com?') ||
          lowerLink.startsWith('www.pickaboo.com?') ||
          lowerLink.startsWith('/?')) {
        _navigate(router, Routes.home);
        return;
      }

      // Ignore web authentication, account management, social login, and checkout URLs
      if (lowerPath.startsWith('/customer') ||
          lowerPath.startsWith('/sociallogin') ||
          lowerPath.startsWith('/checkout') ||
          lowerPath.startsWith('/login') ||
          lowerPath.startsWith('/oauth') ||
          lowerPath.startsWith('/admin') ||
          lowerPath.startsWith('/api') ||
          lowerPath.startsWith('/rest')) {
        return;
      }

      // Special category links
      if (lowerPath.startsWith('/special-category/') ||
          lowerPath.startsWith('/special_category/')) {
        var s = path
            .replaceFirst(RegExp(r'^/special[-_]category/'), '')
            .trim();
        if (s.contains('?')) s = s.split('?').first;
        while (s.endsWith('/')) {
          s = s.substring(0, s.length - 1);
        }
        if (s.isNotEmpty) {
          final target = Uri(
            path: Routes.specialCategoryProduct,
            queryParameters: {'categorySlug': s},
          ).toString();
          _navigate(router, target);
          return;
        }
      }

      if (slug == null && path.isNotEmpty && path != '/') {
        if (path.startsWith('/product-detail/')) {
          slug = path.replaceFirst('/product-detail/', '');
          type = 'product';
        } else if (path.startsWith('/category/')) {
          slug = path.replaceFirst('/category/', '');
          type = 'category';
        } else if (path.startsWith('/brand/')) {
          slug = path.replaceFirst('/brand/', '');
          type = 'brand';
        } else if (path.startsWith('/shop/')) {
          slug = path.replaceFirst('/shop/', '');
          type = 'shop';
        } else if (path.startsWith('/product/')) {
          slug = path.replaceFirst('/product/', '');
          type = 'auto';
        } else if (path.startsWith('/r/')) {
          return;
        } else if (path.startsWith('/order/')) {
          slug = path.replaceFirst('/order/', '');
          type = 'order';
        } else {
          final segments = uri.pathSegments.where((s) => s.isNotEmpty).toList();
          if (segments.isNotEmpty) {
            final lastSegment = segments.last;
            if (lastSegment.endsWith('.html')) {
              slug = lastSegment.replaceAll('.html', '');
              type = 'product';
            } else {
              slug = lastSegment;
              type = 'auto';
            }
          } else if (path.length > 1) {
            slug = path.substring(1);
            type = 'auto';
          }
        }
      }

      if (slug != null) {
        var s = slug.trim();
        if (s.contains('?')) s = s.split('?').first;
        while (s.endsWith('/')) {
          s = s.substring(0, s.length - 1);
        }
        if (s.contains('/')) s = s.split('/').last;
        if (s.endsWith('.html')) s = s.replaceAll('.html', '');
        final lowerS = s.toLowerCase();
        if (lowerS == 'pickaboo' ||
            lowerS == 'pickaboo.com' ||
            lowerS == 'www.pickaboo.com' ||
            lowerS.contains('pickaboo.com') ||
            lowerS.endsWith('.com') ||
            lowerS == 'home' ||
            lowerS == 'index' ||
            lowerS == 'main' ||
            lowerS == 'aclk' ||
            lowerS == 'pagead' ||
            lowerS.contains('google') ||
            lowerS.contains('doubleclick') ||
            lowerS.contains('gclid') ||
            lowerS.contains('gad_source') ||
            lowerS.contains('utm_')) {
          _navigate(router, Routes.home);
          return;
        }
        slug = s;
      }

      if (slug != null && slug.isNotEmpty) {
        // Fast-path: Numeric category ID
        if (type == 'category' && int.tryParse(slug) != null) {
          final target = Uri(
            path: Routes.categoryProduct,
            queryParameters: {'categoryId': slug},
          ).toString();
          _navigate(router, target);
          return;
        }

        // Fast-path: Brand
        if (type == 'brand') {
          final isNumeric = int.tryParse(slug) != null;
          final target = Uri(
            path: Routes.brandProduct,
            queryParameters: isNumeric ? {'brandKey': slug} : {'brandSlug': slug},
          ).toString();
          _navigate(router, target);
          return;
        }

        // Fast-path: Shop
        if (type == 'shop') {
          _navigate(router, Routes.productShop.replaceFirst(':id', slug));
          return;
        }

        // Fast-path: Order
        if (type == 'order') {
          _navigate(router, Routes.orderDetails.replaceFirst(':id', slug));
          return;
        }

        // Fast-path: Numeric product ID (when type is product or auto)
        if (int.tryParse(slug) != null && type != 'category') {
          _navigate(router, Routes.productDetail.replaceFirst(':id', slug));
          return;
        }

        SlugResolutionEntity? resolution;

        if (type == 'auto' || type.isEmpty) {
          // Parallel resolution: Check category and product simultaneously
          final results = await Future.wait([
            _productRepository.resolveSlug(slug: slug, type: 'category'),
            _productRepository.resolveSlug(slug: slug, type: 'product'),
          ]);
          final catRes = results[0].fold((_) => null, (r) => r);
          final prodRes = results[1].fold((_) => null, (r) => r);

          if (catRes != null && catRes.id.isNotEmpty) {
            resolution = catRes;
          } else if (prodRes != null && prodRes.id.isNotEmpty) {
            resolution = prodRes;
          }
        } else {
          final result = await _productRepository.resolveSlug(
            slug: slug,
            type: type,
          );
          resolution = result.fold((_) => null, (r) => r);

          // Fallback: If specified type returned null/error, try the alternate type before giving up
          if (resolution == null || resolution.id.isEmpty) {
            final altType = type == 'category' ? 'product' : 'category';
            final altResult = await _productRepository.resolveSlug(
              slug: slug,
              type: altType,
            );
            resolution = altResult.fold((_) => null, (r) => r);
          }
        }

        if (resolution == null || resolution.id.isEmpty) {
          final lowerSlug = slug.toLowerCase();
          final isInvalidCat = lowerSlug.isEmpty ||
              lowerSlug == 'pickaboo' ||
              lowerSlug.contains('pickaboo.com') ||
              lowerSlug.endsWith('.com') ||
              lowerSlug == 'home' ||
              lowerSlug == 'index' ||
              lowerSlug == 'aclk' ||
              lowerSlug == 'pagead' ||
              lowerSlug.contains('google') ||
              lowerSlug.contains('doubleclick') ||
              lowerSlug.contains('gclid') ||
              lowerSlug.contains('gad_source') ||
              lowerSlug.contains('utm_');

          // If category resolution failed, CategoryProductPage can still load via categorySlug!
          if (!isInvalidCat &&
              (type == 'category' || path.startsWith('/category/'))) {
            final target = Uri(
              path: Routes.categoryProduct,
              queryParameters: {'categorySlug': slug},
            ).toString();
            _navigate(router, target);
            return;
          }
          _navigate(router, Routes.home);
          return;
        }

        final String target;
        if (resolution.type == 'category') {
          target = Uri(
            path: Routes.categoryProduct,
            queryParameters: {'categoryId': resolution.id},
          ).toString();
        } else if (resolution.type == 'product') {
          target = Routes.productDetail.replaceFirst(':id', resolution.id);
        } else if (resolution.type == 'order') {
          target = Routes.orderDetails.replaceFirst(':id', resolution.id);
        } else {
          target = Routes.productDetail.replaceFirst(':id', resolution.id);
        }

        _navigate(router, target);
      } else if (path.isNotEmpty && path != '/') {
        router.push(path);
      }
    } catch (e) {
      // Silently handle unexpected parsing/routing exceptions
    }
  }

  void _navigate(GoRouter router, String target) {
    try {
      final currentUri =
          router.routerDelegate.currentConfiguration.uri.toString();
      if (currentUri == target) {
        return;
      }
    } catch (_) {}

    if (target == Routes.home) {
      String? currentUri;
      try {
        currentUri =
            router.routerDelegate.currentConfiguration.uri.toString();
      } catch (_) {}
      if (currentUri != Routes.home) {
        router.go(Routes.home);
      }
      return;
    }

    if (router.canPop()) {
      router.push(target);
    } else {
      String? currentUri;
      try {
        currentUri =
            router.routerDelegate.currentConfiguration.uri.toString();
      } catch (_) {}
      if (currentUri == Routes.home || currentUri == '/' || currentUri == null) {
        router.push(target);
      } else {
        router.go(target);
      }
    }
  }
}
