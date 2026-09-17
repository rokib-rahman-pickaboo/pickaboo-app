import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/api_service/product_api_service.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';
import 'package:pickaboo/domain/entity/brand_products/brand_products_entity.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/domain/entity/popup/popup_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/domain/entity/product_list/product_list_entity.dart';
import 'package:pickaboo/domain/entity/seller_products/seller_products_entity.dart';
import 'package:pickaboo/domain/entity/slug_resolution/slug_resolution_entity.dart';
import 'package:pickaboo/domain/entity/banner/banner_entity.dart';
import 'package:pickaboo/domain/entity/recommended_product/recommended_product_entity.dart';
import 'package:pickaboo/domain/entity/related_product/related_product_entity.dart';
import 'package:pickaboo/domain/entity/home_flash_sale/home_flash_sale_entity.dart';
import 'package:pickaboo/domain/entity/product_flash_sale/product_flash_sale_entity.dart';
import 'package:pickaboo/domain/entity/review/product_reviews_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_entity.dart';
import 'package:pickaboo/domain/entity/promotion_slider/promotion_slider_entity.dart';
import 'package:pickaboo/domain/entity/user_review/user_review_entity.dart';

abstract class ProductRepository {
  final ProductApiService apiService;

  ProductRepository(this.apiService);

  Future<Either<AppErrorEntity, List<CategoryEntity>>> getAllCategories();
  Future<Either<AppErrorEntity, HomeContentEntity>> getHomeFeedContent({
    required int productLimit,
    bool forceRefresh = false,
  });

  Future<bool> isHomeContentStale();

  Future<Either<AppErrorEntity, PopupEntity>> getPopupContent();

  Future<Either<AppErrorEntity, ProductListEntity>> getJustForYouProducts({
    required int productLimit,
    required int currentPage,
  });
  Future<Either<AppErrorEntity, CategoryProductsEntity>> getCategoryProducts({
    required String categoryKey,
    required int prodLimit,
    required int currentPage,
    required int featProdLimit,
    String? sort,
    Map<String, List<String>>? filters,
  });

  Future<Either<AppErrorEntity, CategoryProductsEntity>> getSpecialCategoryProducts({
    required String categorySlug,
    required int currentPage,
    required int prodLimit,
    required int featProdLimit,
    String? sort,
    Map<String, List<String>>? filters,
  });

  Future<Either<AppErrorEntity, BrandProductsEntity>> getBrandProducts({
    required String brandKey,
    required int currentPage,
    required int prodLimit,
    String? sort,
    Map<String, List<String>>? filters,
  });

  Future<Either<AppErrorEntity, ProductDetailEntity>> getProductDetail({
    required String productId,
    int? customerId,
    bool cache = true,
  });

  Future<Either<AppErrorEntity, void>> saveProductDetailsForCache({
    required ProductDetailEntity entity,
  });

  Future<Either<AppErrorEntity, void>> removeProductDetails({
    required String productId,
  });

  Future<Either<AppErrorEntity, void>> clearProductDetailsCache();

  Future<Either<AppErrorEntity, List<ProductDetailEntity>>> getAllSavedProductDetails();

  Future<Either<AppErrorEntity, ProductDetailEntity?>> getSavedProductDetail({
    required String productId,
  });

  Future<Either<AppErrorEntity, SlugResolutionEntity>> resolveSlug({
    required String slug,
    required String type,
  });

  Future<Either<AppErrorEntity, SellerProductsEntity>> getSellerProducts({
    required String shopUrl,
    required int currentPage,
    required int pageSize,
  });

  Future<Either<AppErrorEntity, List<BannerEntity>>> getBannerContent();

  Future<Either<AppErrorEntity, RecommendedProductEntity>> getRecommendedProducts({
    required String slug,
  });

  Future<Either<AppErrorEntity, RelatedProductEntity>> getRelatedProducts({
    required String slug,
  });

  Future<Either<AppErrorEntity, HomeFlashSaleEntity>> getHomeFlashSale({
    bool forceRefresh = false,
  });

  Future<Either<AppErrorEntity, ProductFlashSaleEntity>> getProductFlashSale({
    required String slug,
  });

  Future<Either<AppErrorEntity, ProductReviewsEntity>> getProductReviews({
    required String productId,
    required int page,
    required int pageSize,
    int? customerId,
  });

  Future<Either<AppErrorEntity, bool>> submitReview({
    required String productId,
    required String detail,
    required List<Map<String, dynamic>> ratings,
    required List<String> imagePaths,
  });

  Future<Either<AppErrorEntity, bool>> voteReview({
    required String productId,
    required String reviewId,
    required String voteType,
  });

  Future<Either<AppErrorEntity, List<UserReviewEntity>>> getUserReviews();

  Future<Either<AppErrorEntity, List<PromotionSliderEntity>>> getPromotionSlider();

  Future<Either<AppErrorEntity, List<DiscoverCategoryEntity>>> getDiscoverCategories();
}
