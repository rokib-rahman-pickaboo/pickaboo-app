import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
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

      if (slug == null && path.isNotEmpty && path != '/') {
        if (path.startsWith('/product-detail/')) {
          slug = path.replaceFirst('/product-detail/', '');
          type = 'product';
        } else if (path.startsWith('/category/')) {
          slug = path.replaceFirst('/category/', '');
          type = 'category';
        } else if (path.startsWith('/product/')) {
          slug = path.replaceFirst('/product/', '');
          type = 'category';
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
              type = segments.length == 1 ? 'product' : '';
            }
          } else if (path.length > 1) {
            slug = path.substring(1);
          }
        }
      }

      if (slug != null) {
        if (slug.contains('/')) slug = slug.split('/').last;
        if (slug.endsWith('.html')) slug = slug.replaceAll('.html', '');
      }

      if (slug != null && slug.isNotEmpty) {

        final result = await _productRepository.resolveSlug(
          slug: slug,
          type: type,
        );

        result.fold(
          (error) {
            if (path.isNotEmpty && path != '/') {
              router.push(path);
            } else {
            }
          },
          (resolution) {

            final String target;
            if (resolution.type == 'product') {
              target = Routes.productDetail.replaceFirst(':id', resolution.id);
            } else if (resolution.type == 'category') {
              target = Uri(
                path: Routes.categoryProduct,
                queryParameters: {'categoryId': resolution.id},
              ).toString();
            } else if (resolution.type == 'order') {
              target = Routes.orderDetails.replaceFirst(':id', resolution.id);
            } else if (resolution.id.isNotEmpty) {
              target = Routes.productDetail.replaceFirst(':id', resolution.id);
            } else {
              if (path.isNotEmpty && path != '/') {
                router.push(path);
              }
              return;
            }

            _navigate(router, target);
          },
        );
      } else if (path.isNotEmpty && path != '/') {
        router.push(path);
      } else {
      }
    } catch (e) {
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
