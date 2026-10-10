import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/injection.dart';
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
    _resolve();
  }

  Future<void> _resolve() async {
    String cleanSlug = Uri.decodeComponent(widget.slug).trim();
    if (cleanSlug.endsWith('.html')) {
      cleanSlug = cleanSlug.replaceAll('.html', '');
    }

    // Fast-path: If it's already a numeric product ID, navigate directly
    if (int.tryParse(cleanSlug) != null) {
      if (!mounted) return;
      _navigateToTarget(Routes.productDetail.replaceFirst(':id', cleanSlug));
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
    if (!context.canPop()) {
      context.go(Routes.home);
      context.push(target);
    } else {
      context.pushReplacement(target);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AppLoader.fullPage());
  }
}
