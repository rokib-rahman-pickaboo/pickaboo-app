import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/core/cache/category_preload_cache.dart';
import 'package:pickaboo/core/services/category_preload_queue.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/banner_bloc/banner_bloc.dart';
import 'package:pickaboo/presentation/bloc/category_banner_bloc/category_banner_bloc.dart';
import 'package:pickaboo/presentation/bloc/category_products_bloc/category_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/special_category_products_bloc/special_category_products_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/category_product_page/category_product_page.dart';
import 'package:pickaboo/presentation/ui/pages/special_category_product_page/special_category_product_page.dart';

/// ============================================================================
/// 🏠 SECONDARY HOME WIDGET (Full Category Page Embedded)
///
/// Directly embeds the complete 100% identical Category Product Page under the
/// homepage top category navigation bar:
/// - Brand / Sub-category chips
/// - Controller toolbar: Sort modal, Filter bottom sheet, Grid/List view mode toggle
/// - Interleaved dynamic question attributes (pruned and shifting)
/// - Continuous infinite scroll pagination (via SpecialCategoryProductsBloc /
///   CategoryProductsBloc)
/// - Pull-to-refresh scoped to the active category feed
/// ============================================================================
class SecondaryHomeWidget extends StatelessWidget {
  final CategoryListEntity category;
  final VoidCallback? onViewAll;

  const SecondaryHomeWidget({
    super.key,
    required this.category,
    this.onViewAll,
  });

  /// Determines whether the given category should use SpecialCategoryProductsBloc
  bool get isSpecialCategory {
    if (category.isSpecial) return true;
    final slug = category.slug.trim();
    if (slug.isNotEmpty && (category.id.isEmpty || int.tryParse(category.id) == null)) {
      return true;
    }
    return false;
  }

  /// Retrieves preloaded products for a category if available in cache
  static List<ProductEntity>? getCachedProducts(String categoryKey) {
    final data = CategoryPreloadCache.instance.read([
      categoryKey,
      'cat:$categoryKey',
      'spec:$categoryKey',
    ]);
    return data?.products;
  }

  /// Proactively pre-warms a category in the background via the controlled queue
  static void prewarm(CategoryListEntity category) {
    CategoryPreloadQueue.instance.enqueue([category]);
  }

  @override
  Widget build(BuildContext context) {
    if (isSpecialCategory) {
      final slug = category.slug.isNotEmpty ? category.slug : category.id;
      return MultiBlocProvider(
        key: ValueKey('special_$slug'),
        providers: [
          BlocProvider(create: (_) => getIt<SpecialCategoryProductsBloc>()),
          BlocProvider(create: (_) => getIt<BannerBloc>()),
        ],
        child: SpecialCategoryProductPage(
          categorySlug: slug,
          categoryName: category.name,
          isEmbedded: true,
        ),
      );
    }

    final catId = category.id.isNotEmpty ? category.id : null;
    final catSlug = category.slug.isNotEmpty ? category.slug : null;

    return MultiBlocProvider(
      key: ValueKey('regular_${catId ?? catSlug ?? category.name}'),
      providers: [
        BlocProvider(create: (_) => getIt<CategoryProductsBloc>()),
        BlocProvider(create: (_) => getIt<CategoryBannerBloc>()),
      ],
      child: CategoryProductPage(
        categoryId: catId,
        categorySlug: catSlug,
        categoryName: category.name,
        isEmbedded: true,
      ),
    );
  }
}
