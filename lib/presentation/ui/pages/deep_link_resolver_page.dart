import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';

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
    debugPrint(
      'DeepLinkResolverPage: Resolving slug: ${widget.slug} (type: ${widget.type})',
    );
    _resolve();
  }

  Future<void> _resolve() async {
    final repository = getIt<ProductRepository>();
    final result = await repository.resolveSlug(
      slug: widget.slug,
      type: widget.type,
    );

    if (!mounted) return;

    result.fold(
      (error) {
        debugPrint(
          'DeepLinkResolverPage: Error resolving slug: ${error.message}',
        );
        context.go(Routes.home);
      },
      (resolution) {
        if (!mounted) return;
        debugPrint(
          'DeepLinkResolverPage: Successfully resolved to: ${resolution.type} (ID: ${resolution.id})',
        );

        final String target;
        if (resolution.type == 'product') {
          target = Routes.productDetail.replaceFirst(':id', resolution.id);
        } else if (resolution.type == 'category') {
          target = Uri(
            path: Routes.categoryProduct,
            queryParameters: {'categoryId': resolution.id},
          ).toString();
        } else if (resolution.id.isNotEmpty) {
          target = Routes.productDetail.replaceFirst(':id', resolution.id);
        } else {
          context.go(Routes.home);
          return;
        }

        if (!context.canPop()) {
          debugPrint(
            'DeepLinkResolverPage: Cold start detected, establishing home stack',
          );
          context.go(Routes.home);
          context.push(target);
        } else {
          debugPrint(
            'DeepLinkResolverPage: Warm start detected, replacing resolver with target',
          );
          context.pushReplacement(target);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
