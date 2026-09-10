import 'package:flutter/foundation.dart';
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

      if (kDebugMode) {
        print('[DeepLink] Handling: $deepLink');
        print(
          '[DeepLink] Scheme: ${uri.scheme}, Host: ${uri.host}, Path: ${uri.path}',
        );
      }

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
          final code = path.replaceFirst('/r/', '');
          if (kDebugMode) {
            print('[DeepLink] Referral code received: $code');
          }
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

      if (kDebugMode) {
        print('[DeepLink] Extracted Slug: $slug, Type: $type, Path: $path');
      }

      if (slug != null && slug.isNotEmpty) {
        if (kDebugMode) {
          print(
            '[DeepLink] Resolving slug: $slug with type: $type via Repository',
          );
        }

        final result = await _productRepository.resolveSlug(
          slug: slug,
          type: type,
        );

        result.fold(
          (error) {
            if (kDebugMode) {
              print('\u274c [DeepLink] Resolution Error: ${error.message}');
            }
            if (path.isNotEmpty && path != '/') {
              if (kDebugMode) {
                print(
                  '\ud83d\udd17 [DeepLink] Fallback: Navigating to path: $path',
                );
              }
              router.push(path);
            } else {
              if (kDebugMode) {
                print(
                  '\u274c [DeepLink] No fallback path available. Just opening app.',
                );
              }
            }
          },
          (resolution) {
            if (kDebugMode) {
              print(
                '\u2705 [DeepLink] Resolved: Type=${resolution.type}, ID=${resolution.id}',
              );
            }

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
              if (kDebugMode) {
                print(
                  '\u274c [DeepLink] Resolution succeeded but ID is empty. Path: $path',
                );
              }
              if (path.isNotEmpty && path != '/') {
                router.push(path);
              }
              return;
            }

            if (kDebugMode) {
              print('\ud83d\udd17 [DeepLink] Navigating to target: $target');
            }
            _navigate(router, target);
          },
        );
      } else if (path.isNotEmpty && path != '/') {
        if (kDebugMode) {
          print(
            '\ud83d\udd17 [DeepLink] No slug found, navigating to path: $path',
          );
        }
        router.push(path);
      } else {
        if (kDebugMode) {
          print(
            '\u26a0 [DeepLink] Deep link was empty or just home path. No navigation triggered.',
          );
        }
      }
    } catch (e, stack) {
      if (kDebugMode) {
        print('\u274c [DeepLink] Critical Error: $e');
        print(stack);
      }
    }
  }

  void _navigate(GoRouter router, String target) {
    try {
      final currentUri =
          router.routerDelegate.currentConfiguration.uri.toString();
      if (currentUri == target) {
        if (kDebugMode) {
          print('🔗 [DeepLink] Already at target: $target. Skipping redundant navigation.');
        }
        return;
      }
    } catch (_) {}

    if (!router.canPop()) {
      if (kDebugMode) {
        print(
          '🔗 [DeepLink] No back stack (Root). Routing to Home then pushing Target.',
        );
      }
      router.go(Routes.home);
      router.push(target);
    } else {
      if (kDebugMode) {
        print('🔗 [DeepLink] App already open. Pushing Target.');
      }
      router.push(target);
    }
  }
}
