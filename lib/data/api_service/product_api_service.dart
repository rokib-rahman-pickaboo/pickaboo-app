import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/banner_response/banner_response.dart';
import 'package:pickaboo/data/model/brand_products_response/brand_products_response.dart';
import 'package:pickaboo/data/model/promo_response/promo_response.dart';
import 'package:pickaboo/data/model/delivery_charge_response/delivery_charge_response.dart';
import 'package:pickaboo/data/model/category_products_response/category_products_response.dart';
import 'package:pickaboo/data/model/category_response/category_response.dart';
import 'package:pickaboo/data/model/cms_block_response/cms_block_response.dart';
import 'package:pickaboo/data/model/emi_response/emi_response.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/home_content_response/home_content_response.dart';
import 'package:pickaboo/data/model/home_flash_sale_response/home_flash_sale_response.dart';
import 'package:pickaboo/data/model/popup_response/popup_response.dart';
import 'package:pickaboo/data/model/product_banner_response/product_banner_response.dart';
import 'package:pickaboo/data/model/product_detail_response/product_detail_response.dart';
import 'package:pickaboo/data/model/product_flash_sale_response/product_flash_sale_response.dart';
import 'package:pickaboo/data/model/product_list_response/product_list_response.dart';
import 'package:pickaboo/data/model/recommended_product_response/recommended_product_response.dart';
import 'package:pickaboo/data/model/related_product_response/related_product_response.dart';
import 'package:pickaboo/data/model/product_reviews_response/product_reviews_response.dart';
import 'package:pickaboo/data/model/review_response/review_response.dart';
import 'package:pickaboo/data/model/seller_products_response/seller_products_response.dart';
import 'package:pickaboo/data/model/slug_resolution_response/slug_resolution_response.dart';
import 'package:pickaboo/data/model/promotion_slider_response/promotion_slider_response.dart';
import 'package:pickaboo/data/model/discover_category_response/discover_category_response.dart';
import 'package:pickaboo/data/model/user_review_response/user_review_response.dart';

abstract class ProductApiService {
  Future<Either<ErrorResponse, SlugResolutionResponse>> resolveSlug({
    required String slug,
    required String type,
  });
  Future<Either<ErrorResponse, List<CategoryResponse>>> getAllCategories();

  Future<Either<ErrorResponse, HomeContentResponse>> getHomeFeedContent({
    required int productLimit,
  });

  Future<Either<ErrorResponse, HomeFlashSaleResponse>> getHomeFlashSale();

  Future<Either<ErrorResponse, List<BannerResponse>>> getBannerContent();

  Future<Either<ErrorResponse, PopupResponse>> getPopupContent();

  Future<Either<ErrorResponse, ProductListResponse>> getJustForYouProducts({
    required int productLimit,
    required int currentPage,
  });
  Future<Either<ErrorResponse, CategoryProductsResponse>> getCategoryProducts({
    required String categoryKey,
    required int prodLimit,
    required int currentPage,
    required int featProdLimit,
    String? sort,
    Map<String, List<String>>? filters,
  });

  Future<Either<ErrorResponse, CategoryProductsResponse>> getSpecialCategoryProducts({
    required String categorySlug,
    required int prodLimit,
    required int currentPage,
    required int featProdLimit,
    String? sort,
    Map<String, List<String>>? filters,
  });

  Future<Either<ErrorResponse, BrandProductsResponse>> getBrandProducts({
    required String brandKey,
    required int prodLimit,
    required int currentPage,
    String? sort,
    Map<String, List<String>>? filters,
  });

  Future<Either<ErrorResponse, ProductDetailResponse>> getProductDetail({
    required String productId,
    int? customerId,
  });

  Future<Either<ErrorResponse, ProductFlashSaleResponse>> getProductFlashSale({
    required String slug
  });

  Future<Either<ErrorResponse, RecommendedProductResponse>> getRecommendedProducts({
    required String slug
  });

  Future<Either<ErrorResponse, RelatedProductResponse>> getRelatedProducts({
    required String slug,
  });

  Future<Either<ErrorResponse, ProductReviewsResponse>> getProductReviews({
    required String productId,
    required int page,
    required int pageSize,
  });

  Future<Either<ErrorResponse, List<ReviewResponse>>> getProductReviewVotes({
    required String productId,
    int? customerId,
  });

  Future<Either<ErrorResponse, bool>> submitReview({
    required String productId,
    required String detail,
    required List<Map<String, dynamic>> ratings,
    required List<String> imagePaths,
  });

  Future<Either<ErrorResponse, bool>> voteReview({
    required String productId,
    required String reviewId,
    required String voteType,
  });

  Future<Either<ErrorResponse, List<EmiResponse>>> getEmiDetails({
    required String productId,
  });

  Future<Either<ErrorResponse, List<ProductBannerResponse>>>
  getProductBanners();

  Future<Either<ErrorResponse, CmsBlockResponse>> getCmsBlock({
    required String blockUrl,
  });

  Future<Either<ErrorResponse, SellerProductsResponse>> getSellerProducts({
    required String shopUrl,
    required int currentPage,
    required int pageSize,
  });

  Future<Either<ErrorResponse, List<UserReviewResponse>>> getUserReviews();

  Future<Either<ErrorResponse, DeliveryChargeResponse>> getDeliveryCharge({
    required String productId,
  });

  Future<Either<ErrorResponse, List<PromotionSliderResponse>>> getPromotionSlider();

  Future<Either<ErrorResponse, PromoResponse>> getPromoCode({
    required String slug,
  });

  Future<Either<ErrorResponse, List<DiscoverCategoryItem>>> getDiscoverCategories();
}
