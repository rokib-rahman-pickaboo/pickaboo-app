import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/api_service/product_api_service.dart';
import 'package:pickaboo/data/mapper/brand_products_mapper/brand_products_mapper.dart';
import 'package:pickaboo/data/mapper/category_mapper.dart';
import 'package:pickaboo/data/mapper/category_products_mapper/category_products_mapper.dart';
import 'package:pickaboo/data/mapper/error_mapper.dart';
import 'package:pickaboo/data/mapper/home_content_mapper/home_content_mapper.dart';
import 'package:pickaboo/data/mapper/popup_mapper/popup_mapper.dart';
import 'package:pickaboo/data/mapper/product_detail_mapper/product_detail_mapper.dart';
import 'package:pickaboo/data/mapper/product_detail_mapper/product_detail_reverse_mapper.dart';
import 'package:pickaboo/data/mapper/product_list_mapper/product_list_mapper.dart';
import 'package:pickaboo/data/mapper/seller_products_mapper/seller_products_mapper.dart';
import 'package:pickaboo/data/mapper/banner_mapper/banner_mapper.dart';
import 'package:pickaboo/data/local_data_source/category_local_data_source.dart';
import 'package:pickaboo/data/local_data_source/home_content_local_data_source.dart';
import 'package:pickaboo/data/local_data_source/product_detail_local_data_source.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/brand_products/brand_products_entity.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/domain/entity/popup/popup_entity.dart';
import 'package:pickaboo/domain/entity/seller_products/seller_products_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/domain/entity/product_list/product_list_entity.dart';
import 'package:pickaboo/domain/entity/slug_resolution/slug_resolution_entity.dart';
import 'package:pickaboo/domain/entity/banner/banner_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/domain/entity/recommended_product/recommended_product_entity.dart';
import 'package:pickaboo/data/mapper/recommended_product_mapper/recommended_product_mapper.dart';
import 'package:pickaboo/domain/entity/related_product/related_product_entity.dart';
import 'package:pickaboo/data/mapper/related_product_mapper/related_product_mapper.dart';
import 'package:pickaboo/domain/entity/home_flash_sale/home_flash_sale_entity.dart';
import 'package:pickaboo/data/mapper/home_flash_sale_mapper/home_flash_sale_mapper.dart';
import 'package:pickaboo/domain/entity/product_flash_sale/product_flash_sale_entity.dart';
import 'package:pickaboo/data/mapper/product_flash_sale_mapper/product_flash_sale_mapper.dart';
import 'package:pickaboo/domain/entity/review/product_reviews_entity.dart';
import 'package:pickaboo/data/mapper/product_detail_mapper/product_reviews_mapper.dart';
import 'package:pickaboo/data/model/review_response/review_response.dart';
import 'package:pickaboo/domain/entity/user_review/user_review_entity.dart';
import 'package:pickaboo/data/mapper/user_review_mapper/user_review_mapper.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_entity.dart';
import 'package:pickaboo/data/mapper/discover_category_mapper/discover_category_mapper.dart';
import 'package:pickaboo/domain/entity/promotion_slider/promotion_slider_entity.dart';
import 'package:pickaboo/data/mapper/promotion_slider_mapper/promotion_slider_mapper.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  @override
  final ProductApiService apiService;
  final CategoryLocalDataSource _categoryLocalDataSource;
  final ProductDetailLocalDataSource _productDetailLocalDataSource;
  final HomeContentLocalDataSource _homeContentLocalDataSource;

  ProductRepositoryImpl(
    this.apiService,
    this._categoryLocalDataSource,
    this._productDetailLocalDataSource,
    this._homeContentLocalDataSource,
  );

  @override
  Future<Either<AppErrorEntity, SlugResolutionEntity>> resolveSlug({
    required String slug,
    required String type,
  }) async {
    final result = await apiService.resolveSlug(slug: slug, type: type);

    return result.fold(
      (error) =>
          left(AppErrorEntity(message: error.message ?? 'Unknown error')),
      (response) {
        final id = response.prodId;
        if (id == null || id.isEmpty) {
          return left(
            const AppErrorEntity(message: 'Could not resolve product link'),
          );
        }
        return right(SlugResolutionEntity(id: id, type: type));
      },
    );
  }

  @override
  Future<Either<AppErrorEntity, List<CategoryEntity>>>
  getAllCategories() async {
    final cachedCategories = await _categoryLocalDataSource
        .getCategoriesIfValid();

    if (cachedCategories != null && cachedCategories.isNotEmpty) {
      return right(cachedCategories.map((e) => e.toEntity()).toList());
    }

    if (kDebugMode) {
      print('🌐 Fetching categories from API');
    }

    final result = await apiService.getAllCategories();

    return result.fold((l) => left(l.toEntity()), (r) async {
      await _categoryLocalDataSource.insertCategories(r);

      return right(r.map((e) => e.toEntity()).toList());
    });
  }

  @override
  Future<Either<AppErrorEntity, HomeContentEntity>> getHomeFeedContent({
    required int productLimit,
    bool forceRefresh = false,
  }) async {
    if (!forceRefresh) {
      final cached = await _homeContentLocalDataSource.getHomeContentIfValid();
      if (cached != null) {
        final entity = cached.toEntity();
        return right(await _alignHomeFeedCategories(entity));
      }
    }

    if (kDebugMode) {
      print('🌐 Fetching home feed content from API');
    }

    final result = await apiService.getHomeFeedContent(
      productLimit: productLimit,
    );

    return result.fold(
      // Offline / transport failure: fall back to whatever is cached, even
      // expired. A stale home feed is better than an error screen, and it is
      // what makes the page usable with no connection. Only when there is
      // nothing cached at all does the error reach the UI, which then renders
      // the no-internet view.
      (l) async {
        final stale = await _homeContentLocalDataSource.getHomeContentStale();
        if (stale != null) {
          final entity = stale.toEntity();
          return right(await _alignHomeFeedCategories(entity));
        }
        return left(l.toEntity());
      },
      (r) async {
        await _homeContentLocalDataSource.insertHomeContent(r);
        final entity = r.toEntity();
        return right(await _alignHomeFeedCategories(entity));
      },
    );
  }

  Future<HomeContentEntity> _alignHomeFeedCategories(
    HomeContentEntity entity,
  ) async {
    try {
      final cachedCategories =
          await _categoryLocalDataSource.getCategoriesIfValid();
      if (cachedCategories == null || cachedCategories.isEmpty) {
        return entity;
      }
      final orderMap = <String, int>{};
      for (int i = 0; i < cachedCategories.length; i++) {
        final cat = cachedCategories[i];
        if (cat.id != null && cat.id!.isNotEmpty) {
          orderMap[cat.id!] = i;
        }
        if (cat.slug != null && cat.slug!.isNotEmpty) {
          orderMap[cat.slug!.toLowerCase()] = i;
        }
        if (cat.name != null && cat.name!.isNotEmpty) {
          orderMap[cat.name!.toLowerCase()] = i;
        }
      }

      final sortedList = List<CategoryListEntity>.from(entity.categoryList);
      sortedList.sort((a, b) {
        final indexA = orderMap[a.id] ??
            orderMap[a.slug.toLowerCase()] ??
            orderMap[a.name.toLowerCase()] ??
            999;
        final indexB = orderMap[b.id] ??
            orderMap[b.slug.toLowerCase()] ??
            orderMap[b.name.toLowerCase()] ??
            999;
        return indexA.compareTo(indexB);
      });

      return HomeContentEntity(
        categoryList: sortedList,
        mainSlider: entity.mainSlider,
        commonLinkSlider: entity.commonLinkSlider,
        categorySlider: entity.categorySlider,
        categoryProducts: entity.categoryProducts,
        justForYou: entity.justForYou,
      );
    } catch (_) {
      return entity;
    }
  }

  @override
  Future<Either<AppErrorEntity, ProductListEntity>> getJustForYouProducts({
    required int productLimit,
    required int currentPage,
  }) async {
    final result = await apiService.getJustForYouProducts(
      productLimit: productLimit,
      currentPage: currentPage,
    );

    return result.fold((l) => left(l.toEntity()), (r) => right(r.toDomain()));
  }

  @override
  Future<Either<AppErrorEntity, CategoryProductsEntity>> getCategoryProducts({
    required String categoryKey,
    required int prodLimit,
    required int currentPage,
    required int featProdLimit,
    String? sort,
    Map<String, List<String>>? filters,
  }) async {
    final result = await apiService.getCategoryProducts(
      categoryKey: categoryKey,
      prodLimit: prodLimit,
      currentPage: currentPage,
      featProdLimit: featProdLimit,
      sort: sort,
      filters: filters,
    );

    return result.fold((l) => left(l.toEntity()), (r) {
      try {
        return right(r.toDomain());
      } catch (e) {
        return left(
          const AppErrorEntity(message: 'Could not load products. Please try again.'),
        );
      }
    });
  }

  @override
  Future<Either<AppErrorEntity, ProductDetailEntity>> getProductDetail({
    required String productId,
    int? customerId,
  }) async {
    final result = await apiService.getProductDetail(
      productId: productId,
      customerId: customerId,
    );

    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  @override
  Future<Either<AppErrorEntity, void>> saveProductDetailsForCache({
    required ProductDetailEntity entity,
  }) async {
    try {
      final response = entity.toResponse();
      await _productDetailLocalDataSource.saveProductDetail(response);
      return right(null);
    } catch (e) {
      return left(AppErrorEntity(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorEntity, void>> removeProductDetails({
    required String productId,
  }) async {
    try {
      await _productDetailLocalDataSource.removeProductDetail(productId);
      return right(null);
    } catch (e) {
      return left(AppErrorEntity(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorEntity, void>> clearProductDetailsCache() async {
    try {
      await _productDetailLocalDataSource.clearProductDetails();
      return right(null);
    } catch (e) {
      return left(AppErrorEntity(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorEntity, List<ProductDetailEntity>>> getAllSavedProductDetails() async {
    try {
      final details = await _productDetailLocalDataSource.getProductDetailsIfValid();
      if (details == null || details.isEmpty) {
        return right([]);
      }
      return right(details.map((e) => e.toEntity()).toList());
    } catch (e) {
      return left(AppErrorEntity(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorEntity, PopupEntity>> getPopupContent() async {
    final result = await apiService.getPopupContent();

    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  @override
  Future<Either<AppErrorEntity, SellerProductsEntity>> getSellerProducts({
    required String shopUrl,
    required int currentPage,
    required int pageSize,
  }) async {
    final result = await apiService.getSellerProducts(
      shopUrl: shopUrl,
      currentPage: currentPage,
      pageSize: pageSize,
    );

    return result.fold((l) => left(l.toEntity()), (r) => right(r.toDomain()));
  }

  @override
  Future<Either<AppErrorEntity, List<BannerEntity>>> getBannerContent() async {
    final result = await apiService.getBannerContent();
    return result.fold(
      (error) => left(error.toEntity()),
      (response) => right(response.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<AppErrorEntity, RecommendedProductEntity>> getRecommendedProducts({
    required String slug,
  }) async {
    try {
      final result = await apiService.getRecommendedProducts(slug: slug);
      return result.fold(
        (error) => left(error.toEntity()),
        (response) => right(response.toEntity()),
      );
    } catch (e) {
      return left(AppErrorEntity(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorEntity, CategoryProductsEntity>> getSpecialCategoryProducts({
    required String categorySlug,
    required int currentPage,
    required int prodLimit,
    required int featProdLimit,
    String? sort,
    Map<String, List<String>>? filters,
  }) async {
    final result = await apiService.getSpecialCategoryProducts(
      categorySlug: categorySlug,
      currentPage: currentPage,
      prodLimit: prodLimit,
      featProdLimit: featProdLimit,
      sort: sort,
      filters: filters,
    );

    return result.fold((l) => left(l.toEntity()), (r) {
      try {
        return right(r.toDomain());
      } catch (e) {
        return left(
          const AppErrorEntity(message: 'Could not load products. Please try again.'),
        );
      }
    });
  }

  @override
  Future<Either<AppErrorEntity, BrandProductsEntity>> getBrandProducts({
    required String brandKey,
    required int currentPage,
    required int prodLimit,
    String? sort,
    Map<String, List<String>>? filters,
  }) async {
    final result = await apiService.getBrandProducts(
      brandKey: brandKey,
      currentPage: currentPage,
      prodLimit: prodLimit,
      sort: sort,
      filters: filters,
    );

    return result.fold((l) => left(l.toEntity()), (r) {
      try {
        return right(r.toDomain());
      } catch (e) {
        return left(
          const AppErrorEntity(message: 'Could not load products. Please try again.'),
        );
      }
    });
  }

  @override
  Future<Either<AppErrorEntity, RelatedProductEntity>> getRelatedProducts({
    required String slug,
  }) async {
    final result = await apiService.getRelatedProducts(slug: slug);
    return result.fold(
      (error) => left(error.toEntity()),
      (response) => right(response.toEntity()),
    );
  }

  @override
  Future<Either<AppErrorEntity, HomeFlashSaleEntity>> getHomeFlashSale() async {
    final result = await apiService.getHomeFlashSale();
    return result.fold(
      (error) => left(error.toEntity()),
      (response) => right(response.toEntity()),
    );
  }

  @override
  Future<Either<AppErrorEntity, ProductFlashSaleEntity>> getProductFlashSale({
    required String slug,
  }) async {
    final result = await apiService.getProductFlashSale(slug: slug);
    return result.fold(
      (error) => left(error.toEntity()),
      (response) => right(response.toEntity()),
    );
  }

  @override
  Future<Either<AppErrorEntity, ProductReviewsEntity>> getProductReviews({
    required String productId,
    required int page,
    required int pageSize,
    int? customerId,
  }) async {
    final reviewsFuture = apiService.getProductReviews(
      productId: productId,
      page: page,
      pageSize: pageSize,
    );
    final votesFuture = apiService.getProductReviewVotes(
      productId: productId,
      customerId: customerId,
    );

    final reviewsResult = await reviewsFuture;
    final votesResult = await votesFuture;

    return reviewsResult.fold((error) => left(error.toEntity()), (response) {
      final reviews = response.toEntity();

      final votes = votesResult.fold((_) => <ReviewResponse>[], (v) => v);
      if (votes.isEmpty) return right(reviews);

      final votesByReviewId = {
        for (final vote in votes)
          if (vote.reviewId != null) vote.reviewId!: vote,
      };

      return right(reviews.copyWithVotes(votesByReviewId));
    });
  }

  @override
  Future<Either<AppErrorEntity, bool>> submitReview({
    required String productId,
    required String detail,
    required List<Map<String, dynamic>> ratings,
    required List<String> imagePaths,
  }) async {
    final result = await apiService.submitReview(
      productId: productId,
      detail: detail,
      ratings: ratings,
      imagePaths: imagePaths,
    );

    return result.fold(
      (l) => left(l.toEntity()),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorEntity, bool>> voteReview({
    required String productId,
    required String reviewId,
    required String voteType,
  }) async {
    final result = await apiService.voteReview(
      productId: productId,
      reviewId: reviewId,
      voteType: voteType,
    );
    return result.fold(
      (error) => left(error.toEntity()),
      (success) => right(success),
    );
  }

  @override
  Future<Either<AppErrorEntity, List<UserReviewEntity>>> getUserReviews() async {
    final result = await apiService.getUserReviews();
    return result.fold(
      (error) => left(error.toEntity()),
      (response) => right(response.map((r) => r.toEntity()).toList()),
    );
  }

  @override
  Future<Either<AppErrorEntity, List<PromotionSliderEntity>>> getPromotionSlider() async {
    final result = await apiService.getPromotionSlider();
    return result.fold(
      (error) => left(error.toEntity()),
      (response) => right(response.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<AppErrorEntity, List<DiscoverCategoryEntity>>> getDiscoverCategories() async {
    final result = await apiService.getDiscoverCategories();
    return result.fold(
      (error) => left(error.toEntity()),
      (response) => right(response.map((e) => e.toEntity()).toList()),
    );
  }
}
