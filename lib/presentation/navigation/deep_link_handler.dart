import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/slug_resolution/slug_resolution_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';

@lazySingleton
class DeepLinkHandler {
  final ProductRepository _productRepository;

  DeepLinkHandler(this._productRepository);

  Future<void> handleDeepLink(String deepLink, GoRouter router) async {
    try {
      final uri = Uri.parse(deepLink);

      String path = uri.path;
      String? slug;
      String type = '';

      if (uri.scheme == 'pickaboo' || uri.scheme.startsWith('http')) {
        path = uri.path;
      } else if (!deepLink.contains('://') && deepLink.startsWith('/')) {
        path = deepLink;
      } else if (deepLink.isNotEmpty && !deepLink.contains('/')) {
        slug = deepLink;
      }

      // Ignore web authentication, account management, social login, and checkout URLs
      // These flows belong in the browser and must never be resolved as product slugs
      final lowerPath = path.toLowerCase();
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

      if (slug == null && path.isNotEmpty && path != '/') {
        if (path.startsWith('/product-detail/')) {
          slug = path.replaceFirst('/product-detail/', '');
          type = 'product';
        } else if (path.startsWith('/category/')) {
          slug = path.replaceFirst('/category/', '');
          type = 'category';
        } else if (path.startsWith('/product/')) {
          // On Pickaboo web, /product/<slug> can be either a category or a product
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
        if (slug.contains('/')) slug = slug.split('/').last;
        if (slug.endsWith('.html')) slug = slug.replaceAll('.html', '');
      }

      if (slug != null && slug.isNotEmpty) {
        // Fast-path: If it's already a numeric product ID, navigate directly
        if (int.tryParse(slug) != null) {
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
          // Slug resolution failed; do not push broken product/category paths
          if (path.isNotEmpty &&
              path != '/' &&
              !path.startsWith('/product') &&
              !path.startsWith('/category')) {
            router.push(path);
          }
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
      } else {
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

    if (!router.canPop()) {
      router.go(Routes.home);
      router.push(target);
    } else {
      router.push(target);
    }
  }
}
