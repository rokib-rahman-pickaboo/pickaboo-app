import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/utils/product_image_resolver.dart';
import 'package:pickaboo/domain/entity/cms_block/cms_block_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/banner_bloc/banner_bloc.dart';
import 'package:pickaboo/presentation/bloc/brand_products_bloc/brand_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/category_banner_bloc/category_banner_bloc.dart';
import 'package:pickaboo/presentation/bloc/category_products_bloc/category_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/cms_content_bloc/cms_content_bloc.dart';
import 'package:pickaboo/presentation/bloc/delivery_charge_bloc/delivery_charge_bloc.dart';
import 'package:pickaboo/presentation/bloc/emi_bloc/emi_bloc.dart';
import 'package:pickaboo/presentation/bloc/filter_bloc/filter_bloc.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/place_picker_bloc/place_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/product_detail_bloc/product_detail_bloc.dart';
import 'package:pickaboo/presentation/bloc/product_flash_sale_bloc/product_flash_sale_bloc.dart';
import 'package:pickaboo/presentation/bloc/promo_bloc/promo_bloc.dart';
import 'package:pickaboo/presentation/bloc/recommended_products_bloc/recommended_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/related_products_bloc/related_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/review_bloc/review_bloc.dart';
import 'package:pickaboo/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:pickaboo/presentation/bloc/seller_products_bloc/seller_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/special_category_products_bloc/special_category_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:pickaboo/presentation/bloc/write_review_bloc/write_review_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/brand_product_page/brand_product_page.dart';
import 'package:pickaboo/presentation/ui/pages/category_product_page/category_product_page.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/all_product_review_page/all_product_review_page.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/cms_content_page/cms_content_page.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/product_comparison_page/product_comparison_page.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/product_description_page/product_description_page.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/product_detail_page.dart';
import 'package:pickaboo/presentation/ui/pages/product_shop_page/product_shop_page.dart';
import 'package:pickaboo/presentation/ui/pages/search_page/search_page.dart';
import 'package:pickaboo/presentation/ui/pages/seller_product_page/seller_product_page.dart';
import 'package:pickaboo/presentation/ui/pages/special_category_product_page/special_category_product_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/write_review_page/write_review_page.dart';

/// Routes for products, catalog, search, and product details.
final List<RouteBase> productRoutes = [
  GoRoute(
    path: Routes.categoryProduct,
    name: 'categoryProduct',
    builder: (context, state) {
      final rawId = state.uri.queryParameters['categoryId']?.trim() ?? '';
      final rawSlug = state.uri.queryParameters['categorySlug']?.trim() ?? '';
      final isNumericId = int.tryParse(rawId) != null;

      final categorySlug = rawSlug.isNotEmpty
          ? rawSlug
          : (rawId.isNotEmpty && !isNumericId ? rawId : null);
      final categoryId = isNumericId ? rawId : null;

      final categoryName = state.uri.queryParameters['categoryName'] ?? '';

      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<CategoryProductsBloc>()),
          BlocProvider(create: (context) => getIt<CategoryBannerBloc>()),
        ],
        child: CategoryProductPage(
          categoryId: categorySlug == null ? (categoryId ?? '') : categoryId,
          categorySlug: categorySlug,
          categoryName: categoryName,
        ),
      );
    },
  ),

  GoRoute(
    path: Routes.brandProduct,
    name: 'brandProduct',
    builder: (context, state) {
      final rawKey = state.uri.queryParameters['brandKey']?.trim() ?? '';
      final rawSlug = state.uri.queryParameters['brandSlug']?.trim() ?? '';
      final isNumericId = int.tryParse(rawKey) != null;

      final brandSlug = rawSlug.isNotEmpty
          ? rawSlug
          : (rawKey.isNotEmpty && !isNumericId ? rawKey : null);
      final brandId = isNumericId ? rawKey : null;

      final brandName = state.uri.queryParameters['brandName'] ?? '';

      return BlocProvider(
        create: (context) => getIt<BrandProductsBloc>(),
        child: BrandProductPage(
          brandId: brandSlug == null ? (brandId ?? '') : brandId,
          brandSlug: brandSlug,
          brandName: brandName,
        ),
      );
    },
  ),

  GoRoute(
    path: Routes.sellerProduct,
    name: 'sellerProduct',
    builder: (context, state) {
      final shopUrl = state.uri.queryParameters['shopUrl'] ?? '';
      final sellerName = state.uri.queryParameters['sellerName'] ?? '';
      final sellerLogo = state.uri.queryParameters['sellerLogo'];

      return BlocProvider(
        create: (context) => getIt<SellerProductsBloc>(),
        child: SellerProductPage(
          shopUrl: shopUrl,
          sellerName: sellerName,
          sellerLogo: sellerLogo,
        ),
      );
    },
  ),

  GoRoute(
    path: Routes.productDetail,
    name: 'productDetail',
    builder: (context, state) {
      final extra = state.extra;
      String? previewImageUrl;
      String? previewPrice;
      ProductEntity? previewProduct;
      if (extra is Map<String, dynamic>) {
        previewImageUrl = extra['imageUrl'] as String?;
        previewPrice = extra['price']?.toString();
        previewProduct = extra['product'] as ProductEntity?;
      }
      previewImageUrl ??= state.uri.queryParameters['image'];
      previewPrice ??= state.uri.queryParameters['price'];

      final rawId = state.pathParameters['id'] ?? '';
      final intId = int.tryParse(rawId) ?? 0;
      final cachedImage = ProductImageResolver.getCachedImage(intId);

      if (cachedImage != null && !ProductImageResolver.isPlaceholderOrBroken(cachedImage)) {
        previewImageUrl = cachedImage;
        if (previewProduct != null && previewProduct.productImg != cachedImage) {
          previewProduct = previewProduct.copyWith(productImg: cachedImage);
        }
      } else if (ProductImageResolver.isPlaceholderOrBroken(previewImageUrl)) {
        previewImageUrl = null;
      }
      if (previewProduct != null && ProductImageResolver.isPlaceholderOrBroken(previewProduct.productImg)) {
        previewProduct = previewProduct.copyWith(productImg: previewImageUrl ?? '');
      }

      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<ProductDetailBloc>()),
          BlocProvider(create: (context) => getIt<ProductFlashSaleBloc>()),
          BlocProvider(create: (context) => getIt<RecommendedProductsBloc>()),
          BlocProvider(create: (context) => getIt<RelatedProductsBloc>()),
          BlocProvider(create: (context) => getIt<ReviewBloc>()),
          BlocProvider(create: (context) => getIt<EmiBloc>()),
          BlocProvider(create: (context) => getIt<CmsContentBloc>()),
          BlocProvider(create: (context) => getIt<WishlistBloc>()),
          BlocProvider(create: (context) => getIt<DeliveryChargeBloc>()),
          BlocProvider(create: (context) => getIt<PlacePickerBloc>()),
          BlocProvider(create: (context) => getIt<PromoBloc>()),
        ],
        child: ProductDetailsPage(
          productId: state.pathParameters['id'] ?? '',
          slug:
              state.uri.queryParameters['slug'] ??
              state.pathParameters['id'] ??
              '',
          productName: state.uri.queryParameters['name'] ?? (extra is Map ? extra['name'] as String? : null) ?? '',
          previewImageUrl: previewImageUrl,
          previewPrice: previewPrice,
          previewProduct: previewProduct,
        ),
      );
    },
    routes: [
      GoRoute(
        path: 'review/write',
        name: 'writeReview',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final extra = state.extra as Map<String, dynamic>?;
          final productName = extra?['productName'] as String? ?? "";
          final productImage = extra?['productImage'] as String? ?? "";

          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<WriteReviewBloc>()),
              BlocProvider(create: (context) => getIt<PhotoPickerBloc>()),
            ],
            child: WriteReviewPage(
              productId: id,
              productName: productName,
              productImage: productImage,
            ),
          );
        },
      ),
      GoRoute(
        path: 'all-reviews',
        name: 'allProductReviews',
        builder: (context, state) {
          final product = state.extra as ProductDetailEntity;
          return BlocProvider(
            create: (context) => getIt<ReviewBloc>(),
            child: AllProductReviewPage(product: product),
          );
        },
      ),
      GoRoute(
        path: Routes.productDescription,
        name: 'productDescription',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final product = extra['product'] as ProductDetailEntity;
          final initialIndex = extra['initialIndex'] as int? ?? 0;
          return ProductDescriptionPage(
            product: product,
            initialIndex: initialIndex,
          );
        },
      ),
      GoRoute(
        path: Routes.cmsContent,
        name: 'cmsContent',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final cmsBlock = extra['cmsBlock'] as CmsBlockEntity;
          return CmsContentPage(cmsBlock: cmsBlock);
        },
      ),
      GoRoute(
        path: Routes.productComparison,
        name: 'productComparison',
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<BannerBloc>()),
            ],
            child: const ProductComparisonPage(),
          );
        },
      ),
    ],
  ),

  GoRoute(
    path: Routes.productShop,
    name: 'productShop',
    builder: (context, state) => const ShopSellerIndex(),
  ),

  GoRoute(
    path: Routes.search,
    name: 'search',
    builder: (context, state) {
      final query = state.uri.queryParameters['q'];
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<SearchBloc>()),
          BlocProvider(create: (context) => getIt<FilterBloc>()),
        ],
        child: SearchPage(initialQuery: query),
      );
    },
  ),

  GoRoute(
    path: Routes.specialCategoryProduct,
    name: 'specialCategoryProduct',
    builder: (context, state) {
      final categorySlug = state.uri.queryParameters['categorySlug'];
      final categoryName = state.uri.queryParameters['categoryName'];
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<SpecialCategoryProductsBloc>()),
          BlocProvider(create: (context) => getIt<BannerBloc>()),
        ],
        child: SpecialCategoryProductPage(
          categorySlug: categorySlug ?? '',
          categoryName: categoryName ?? '',
        ),
      );
    },
  ),
];
