import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/data/services/push_notification_service.dart';
import 'package:pickaboo/domain/entity/slug_resolution/slug_resolution_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

class DeepLinkResolverPage extends StatefulWidget {
  final String slug;
  final String type;

  const DeepLinkResolverPage({
    super.key,
    required this.slug,
    required this.type,
  });

  @override
  State<DeepLinkResolverPage> createState() => _DeepLinkResolverPageState();
}

class _DeepLinkResolverPageState extends State<DeepLinkResolverPage> {
  @override
  void initState() {
    super.initState();
    try {
      final pushService = getIt<PushNotificationService>();
      pushService.consumeInitialLink(widget.slug);
      pushService.clearPendingDeepLink();
    } catch (_) {}
    _resolve();
  }

  Future<void> _resolve() async {
    try {
      await _performResolution().timeout(
        const Duration(seconds: 8),
        onTimeout: () {
          if (mounted) {
            context.go(Routes.home);
          }
        },
      );
    } catch (_) {
      if (mounted) {
        context.go(Routes.home);
      }
    }
  }

  Future<void> _performResolution() async {
    String cleanSlug = Uri.decodeComponent(widget.slug).trim();
    if (cleanSlug.contains('?')) {
      cleanSlug = cleanSlug.split('?').first;
    }
    while (cleanSlug.endsWith('/')) {
      cleanSlug = cleanSlug.substring(0, cleanSlug.length - 1);
    }
    if (cleanSlug.endsWith('.html')) {
      cleanSlug = cleanSlug.replaceAll('.html', '');
    }

    final lowerSlug = cleanSlug.toLowerCase();
    if (lowerSlug.isEmpty ||
        lowerSlug == 'home' ||
        lowerSlug == 'index' ||
        lowerSlug == 'main' ||
        lowerSlug == 'pickaboo' ||
        lowerSlug == 'pickaboo.com' ||
        lowerSlug == 'www.pickaboo.com' ||
        lowerSlug.contains('pickaboo.com') ||
        lowerSlug.endsWith('.com') ||
        lowerSlug == 'aclk' ||
        lowerSlug == 'pagead' ||
        lowerSlug.contains('google') ||
        lowerSlug.contains('doubleclick') ||
        lowerSlug.contains('gclid') ||
        lowerSlug.contains('gad_source') ||
        lowerSlug.contains('utm_')) {
      if (!mounted) return;
      context.go(Routes.home);
      return;
    }

    // Fast-path: If it's already a numeric product ID, navigate directly
    if (int.tryParse(cleanSlug) != null) {
      if (!mounted) return;
      _navigateToTarget(Routes.productDetail.replaceFirst(':id', cleanSlug));
      return;
    }

    // Fast-path: Special category
    if (widget.type == 'special_category' || widget.type == 'special-category') {
      if (!mounted) return;
      final target = Uri(
        path: Routes.specialCategoryProduct,
        queryParameters: {'categorySlug': cleanSlug},
      ).toString();
      _navigateToTarget(target);
      return;
    }

    final repository = getIt<ProductRepository>();
    SlugResolutionEntity? resolution;

    if (widget.type == 'auto' || widget.type.isEmpty) {
      // Parallel resolution: Check category and product simultaneously
      final results = await Future.wait([
        repository.resolveSlug(slug: cleanSlug, type: 'category'),
        repository.resolveSlug(slug: cleanSlug, type: 'product'),
      ]);
      final catRes = results[0].fold((_) => null, (r) => r);
      final prodRes = results[1].fold((_) => null, (r) => r);

      if (catRes != null && catRes.id.isNotEmpty) {
        resolution = catRes;
      } else if (prodRes != null && prodRes.id.isNotEmpty) {
        resolution = prodRes;
      }
    } else {
      final result = await repository.resolveSlug(
        slug: cleanSlug,
        type: widget.type,
      );
      resolution = result.fold((_) => null, (r) => r);

      // Fallback: If specified type returned null/error, try the alternate type before giving up
      if (resolution == null || resolution.id.isEmpty) {
        final altType = widget.type == 'category' ? 'product' : 'category';
        final altResult = await repository.resolveSlug(
          slug: cleanSlug,
          type: altType,
        );
        resolution = altResult.fold((_) => null, (r) => r);
      }
    }

    if (!mounted) return;

    if (resolution == null || resolution.id.isEmpty) {
      try {
        final pushService = getIt<PushNotificationService>();
        pushService.consumeInitialLink(widget.slug);
        pushService.clearPendingDeepLink();
      } catch (_) {}

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

      // Fallback: If cleanSlug is explicitly an in-app category route (/category/slug) and resolution failed,
      // try opening category by slug directly.
      // But if type is 'auto', unknown, or domain/tracking token, NEVER open category skeleton — go to home!
      if (!isInvalidCat && widget.type == 'category') {
        final target = Uri(
          path: Routes.categoryProduct,
          queryParameters: {'categorySlug': cleanSlug},
        ).toString();
        _navigateToTarget(target);
        return;
      }

      context.go(Routes.home);
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

    _navigateToTarget(target);
  }

  void _navigateToTarget(String target) {
    if (!mounted) return;
    try {
      final pushService = getIt<PushNotificationService>();
      pushService.consumeInitialLink(widget.slug);
      pushService.consumeInitialLink(target);
      pushService.clearPendingDeepLink();
    } catch (_) {}

    if (context.canPop()) {
      context.pushReplacement(target);
    } else {
      context.go(Routes.home);
      context.push(target);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AppLoader.fullPage());
  }
}
