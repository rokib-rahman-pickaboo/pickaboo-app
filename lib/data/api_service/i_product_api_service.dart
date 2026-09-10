import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/data/model/banner_response/banner_response.dart';
import 'package:pickaboo/data/model/brand_products_response/brand_products_response.dart';
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
import 'package:pickaboo/data/model/delivery_charge_response/delivery_charge_response.dart';
import 'package:pickaboo/data/model/promotion_slider_response/promotion_slider_response.dart';
import 'package:pickaboo/data/model/promo_response/promo_response.dart';
import 'package:pickaboo/data/model/discover_category_response/discover_category_response.dart';
import 'package:pickaboo/data/model/user_review_response/user_review_response.dart';
import 'product_api_service.dart';

@LazySingleton(as: ProductApiService)
class IProductApiService extends ProductApiService {
  final Dio _client;

  IProductApiService(this._client);

  @override
  Future<Either<ErrorResponse, SlugResolutionResponse>> resolveSlug({
    required String slug,
    required String type,
  }) async {
    try {
      final response = await _client.get(
        '${ApiEndpoints.resolveSlugUrl(type: type)}/$slug',
      );

      if (kDebugMode) {
        print("resolve_slug -> ${response.data}");
      }

      final data = response.data;

      if (data is List && data.isNotEmpty) {
        final result = SlugResolutionResponse.fromJson(
          data.first as Map<String, dynamic>,
        );
        return right(result);
      } else if (data is Map<String, dynamic>) {
        final result = SlugResolutionResponse.fromJson(data);
        return right(result);
      } else {
        return left(
          const ErrorResponse(
            message: 'Invalid slug resolution response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print("resolve_slug_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  ErrorResponse? _tryParseErrorList(dynamic data) {
    if (data is List && data.isNotEmpty) {
      final first = data.first;
      if (first is Map<String, dynamic>) {
        final isError = first['status'] == 'error' || first.containsKey('message');
        if (isError) {
          final message = first['message'];
          if (message is String && message.isNotEmpty) {
            return ErrorResponse(success: false, message: message);
          }
        }
      }
    }
    return null;
  }

  ErrorResponse checkErrorResponse(DioException err) {
    if (err.type == DioExceptionType.badResponse) {
      final errorData = err.response?.data;

      if (errorData is Map<String, dynamic>) {
        return ErrorResponse.fromJson(errorData);
      }
    }
    return ErrorResponse(
      success: false,
      message: err.message ?? err.error?.toString() ?? 'Network error (${err.type})',
    );
  }

  String _buildFiltersJson(Map<String, List<String>> filters) {
    final filtersList = filters.entries.map((entry) {
      return {
        'code': entry.key,
        'value': entry.value.join(','),
      };
    }).toList();

    return jsonEncode(filtersList);
  }

  @override
  Future<Either<ErrorResponse, List<CategoryResponse>>>
  getAllCategories() async {
    try {
      final response = await _client.get(ApiEndpoints.allCategoryUrl);
      if (kDebugMode) {
        print("all_category -> ${response.data}");
      }

      final data = response.data;

      if (data is List) {
        final result = data
            .map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return right(result);
      } else {
        return left(
          const ErrorResponse(message: 'Invalid category response format'),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print("all_category_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, HomeContentResponse>> getHomeFeedContent({
    required int productLimit,
  }) async {
    try {
      final response = await _client.get(
        ApiEndpoints.homeFeedContentUrl,
        queryParameters: {'prod_limit': productLimit},
      );
      if (kDebugMode) {
        print("home_feed_content -> ${response.data}");
      }

      final data = response.data;

      if (data is Map<String, dynamic>) {
        final result = HomeContentResponse.fromJson(data);
        return right(result);
      } else {
        final errorList = _tryParseErrorList(data);
        if (errorList != null) {
          return left(errorList);
        }
        return left(
          const ErrorResponse(
            message: 'Invalid home feed content response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print("home_feed_content_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, ProductListResponse>> getJustForYouProducts({
    required int productLimit,
    required int currentPage,
  }) async {
    try {
      final response = await _client.get(
        ApiEndpoints.justForYouProductsUrl,
        queryParameters: {
          'prod_limit': productLimit,
          'currentPage': currentPage,
        },
      );
      if (kDebugMode) {
        print("just_for_content -> ${response.data}");
      }

      final data = response.data;

      if (data is Map<String, dynamic>) {
        final result = ProductListResponse.fromJson(data);
        return right(result);
      } else {
        final errorList = _tryParseErrorList(data);
        if (errorList != null) {
          return left(errorList);
        }
        return left(
          const ErrorResponse(message: 'Invalid Product list response format'),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print("just_for_content_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, CategoryProductsResponse>> getCategoryProducts({
    required String categoryKey,
    required int prodLimit,
    required int currentPage,
    required int featProdLimit,
    String? sort,
    Map<String, List<String>>? filters,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'prod_limit': prodLimit,
        'currentPage': currentPage,
        'featProdLimit': featProdLimit,
      };

      if (sort != null && sort.isNotEmpty) {
        queryParams['sort'] = sort;
      }

      if (filters != null && filters.isNotEmpty) {
        queryParams['filters'] = _buildFiltersJson(filters);
      }

      final response = await _client.get(
        ApiEndpoints.categoryProductsUrl(categoryKey: categoryKey),
        queryParameters: queryParams,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (kDebugMode) {
        print("category_products -> ${response.data}");
      }

      final data = response.data;

      if (data is Map<String, dynamic>) {
        final result = CategoryProductsResponse.fromJson(data);
        return right(result);
      } else {
        final errorList = _tryParseErrorList(data);
        if (errorList != null) {
          return left(errorList);
        }
        return left(
          const ErrorResponse(
            message: 'Invalid category products response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print("category_products_error ->$e");
      }
      return left(checkErrorResponse(e));
    } catch (e) {
      if (kDebugMode) {
        print("category_products_parse_error ->$e");
      }
      return left(
        const ErrorResponse(
          success: false,
          message: 'Could not load products. Please try again.',
        ),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, CategoryProductsResponse>> getSpecialCategoryProducts({
    required String categorySlug,
    required int prodLimit,
    required int currentPage,
    required int featProdLimit,
    String? sort,
    Map<String, List<String>>? filters,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'prod_limit': prodLimit,
        'currentPage': currentPage,
        'featProdLimit': featProdLimit,
      };

      if (sort != null && sort.isNotEmpty) {
        queryParams['sort'] = sort;
      }

      if (filters != null && filters.isNotEmpty) {
        queryParams['filters'] = _buildFiltersJson(filters);
      }

      final response = await _client.get(
        ApiEndpoints.specialCategoryProductsUrl(slug: categorySlug),
        queryParameters: queryParams,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (kDebugMode) {
        print("special_category_products -> ${response.data}");
      }

      final data = response.data;

      if (data is Map<String, dynamic>) {
        final result = CategoryProductsResponse.fromJson(data);
        return right(result);
      } else {
        final errorList = _tryParseErrorList(data);
        if (errorList != null) {
          return left(errorList);
        }
        return left(
          const ErrorResponse(
            message: 'Invalid special category products response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print("special_category_products_error ->$e");
      }
      return left(checkErrorResponse(e));
    } catch (e) {
      if (kDebugMode) {
        print("special_category_products_parse_error ->$e");
      }
      return left(
        const ErrorResponse(
          success: false,
          message: 'Could not load special products. Please try again.',
        ),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, BrandProductsResponse>> getBrandProducts({
    required String brandKey,
    required int prodLimit,
    required int currentPage,
    String? sort,
    Map<String, List<String>>? filters,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'prodLimit': prodLimit,
        'currentPage': currentPage,
      };

      if (sort != null && sort.isNotEmpty) {
        queryParams['sort'] = sort;
      }

      if (filters != null && filters.isNotEmpty) {
        queryParams['filters'] = _buildFiltersJson(filters);
      }

      final response = await _client.get(
        ApiEndpoints.brandProductsUrl(brandKey: brandKey),
        queryParameters: queryParams,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (kDebugMode) {
        print("brand_products -> ${response.data}");
      }

      final data = response.data;

      if (data is Map<String, dynamic>) {
        final result = BrandProductsResponse.fromJson(data);
        return right(result);
      } else {
        final errorList = _tryParseErrorList(data);
        if (errorList != null) {
          return left(errorList);
        }
        return left(
          const ErrorResponse(
            message: 'Invalid brand products response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print("brand_products_error ->$e");
      }
      return left(checkErrorResponse(e));
    } catch (e) {
      if (kDebugMode) {
        print("brand_products_parse_error ->$e");
      }
      return left(
        const ErrorResponse(
          success: false,
          message: 'Could not load products. Please try again.',
        ),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, ProductDetailResponse>> getProductDetail({
    required String productId,
    int? customerId,
  }) async {
    try {
      final endpoint = ApiEndpoints.productDetailUrl(productId: productId);

      final queryParams = <String, dynamic>{};
      if (customerId != null) {
        queryParams['customerId'] = customerId;
      }

      if (kDebugMode) {
        print('─────────────────────────────────────────');
        print('[ProductApiService] getProductDetail');
        print('  endpoint    : $endpoint');
        print('  customerId  : ${customerId ?? "NOT SENT (null)"}');
        print('  queryParams : $queryParams');
        print('─────────────────────────────────────────');
      }

      final response = await _client.get(
        endpoint,
        queryParameters: queryParams,
      );

      if (kDebugMode) {
        print("product_detail -> ${response.data}");
      }

      final data = response.data;

      if (data is Map<String, dynamic>) {
        final modifiedJson = Map<String, dynamic>.from(data);
        final listKeys = [
          'category_ids', 'images', 'varient', 'extra_options', 'buys_togather',
          'more_information', 'detailed_ratings', 'detailed_summary', 'all_review_images',
          'reviews_collection', 'similar_products', 'you_may_also_like', 'other_brands',
          'recently_viewed_products'
        ];
        for (var key in listKeys) {
          if (modifiedJson[key] != null && modifiedJson[key] is! List) {
            modifiedJson[key] = null;
          }
        }
        final stringListKeys = [
          'category_ids',
          'images',
          'all_review_images',
        ];
        for (var key in stringListKeys) {
          if (modifiedJson[key] is List) {
            modifiedJson[key] = (modifiedJson[key] as List)
                .map((e) => e.toString())
                .toList();
          }
        }
        if (modifiedJson['detailed_summary'] is List) {
          modifiedJson['detailed_summary'] = (modifiedJson['detailed_summary'] as List)
              .map((e) => (e is num) ? e.toInt() : (int.tryParse(e.toString()) ?? 0))
              .toList();
        }
        if (modifiedJson['variant_matrix'] is! Map<String, dynamic>) {
          modifiedJson['variant_matrix'] = null;
        }
        final result = ProductDetailResponse.fromJson(modifiedJson);
        return right(result);
      } else {
        final errorList = _tryParseErrorList(data);
        if (errorList != null) {
          return left(errorList);
        }
        return left(
          const ErrorResponse(
            message: 'Invalid product detail response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print("product_detail_error ->$e");
      }
      return left(checkErrorResponse(e));
    } catch (e) {
      if (kDebugMode) {
        print("product_detail_parse_error ->$e");
      }
      return left(
        const ErrorResponse(
          success: false,
          message: 'Could not load this product. Please try again.',
        ),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, PopupResponse>> getPopupContent() async {
    try {
      final response = await _client.get(
        ApiEndpoints.popupContentUrl,
        options: Options(
          headers: {'Cookie': 'PHPSESSID=ps58gcls4pit6838o60egjh3ne'},
        ),
      );

      if (kDebugMode) {
        print("popup_content -> ${response.data}");
      }

      final data = response.data;
      Map<String, dynamic>? targetData;

      if (data is List && data.isNotEmpty) {
        targetData = data.first as Map<String, dynamic>;
      } else if (data is Map<String, dynamic>) {
        targetData = data;
      }

      if (targetData != null) {
        final result = PopupResponse.fromJson(targetData);
        return right(result);
      } else {
        return left(
          const ErrorResponse(message: 'Invalid popup content response format'),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print("popup_content_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, RecommendedProductResponse>> getRecommendedProducts({required String slug}) async {
    try {

      final response = await _client.get(
        ApiEndpoints.sellerRecommendedProductsUrl(slug: slug),
      );

      if (kDebugMode) {
        debugPrint("recommended_products -> ${response.data}");
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final result = RecommendedProductResponse.fromJson(data);
        return right(result);
      } else {
        final errorList = _tryParseErrorList(data);
        if (errorList != null) {
          return left(errorList);
        }
        return left(
          const ErrorResponse(
            message: 'Invalid recommended products response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("recommended_products_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, RelatedProductResponse>> getRelatedProducts({required String slug}) async {
    try {
      final response = await _client.get(
        ApiEndpoints.relatedProductsUrl(slug: slug),
      );

      if (kDebugMode) {
        debugPrint("related_products -> ${response.data}");
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final result = RelatedProductResponse.fromJson(data);
        return right(result);
      } else {
        final errorList = _tryParseErrorList(data);
        if (errorList != null) {
          return left(errorList);
        }
        return left(
          const ErrorResponse(
            message: 'Invalid related products response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("related_products_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, ProductReviewsResponse>> getProductReviews({
    required String productId,
    required int page,
    required int pageSize,
  }) async {
    try {
      final response = await _client.get(
        ApiEndpoints.productReviewsUrl(productId: productId),
        queryParameters: {'page': page, 'pageSize': pageSize},
      );

      if (kDebugMode) {
        debugPrint("product_reviews -> ${response.data}");
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        return right(ProductReviewsResponse.fromJson(data));
      } else {
        final errorList = _tryParseErrorList(data);
        if (errorList != null) {
          return left(errorList);
        }
        return left(
          const ErrorResponse(message: 'Invalid reviews response format'),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("product_reviews_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, List<ReviewResponse>>> getProductReviewVotes({
    required String productId,
    int? customerId,
  }) async {
    try {
      final queryParams = <String, dynamic>{'productId': productId};
      if (customerId != null) {
        queryParams['customerId'] = customerId;
      }

      final response = await _client.get(
        ApiEndpoints.reviewVotesUrl,
        queryParameters: queryParams,
      );

      if (kDebugMode) {
        debugPrint("product_review_votes -> ${response.data}");
      }

      final data = response.data;
      if (data is List) {
        return right(
          data
              .map((e) => ReviewResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
      }
      return right(const []);
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("product_review_votes_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> submitReview({
    required String productId,
    required String detail,
    required List<Map<String, dynamic>> ratings,
    required List<String> imagePaths,
  }) async {
    try {
      if (kDebugMode) {
        debugPrint("=== submitReview API Called ===");
        debugPrint("productId: $productId");
        debugPrint("detail: $detail");
        debugPrint("ratings: $ratings");
        debugPrint("imagePaths: $imagePaths");
      }

      final formData = FormData.fromMap({
        'title': '',
        'detail': detail,
        'product_id': productId,
        'ratings': jsonEncode(ratings),
      });

      for (int i = 0; i < imagePaths.length; i++) {
        formData.files.add(MapEntry(
          'review_images[$i]',
          await MultipartFile.fromFile(imagePaths[i]),
        ));
      }

      if (kDebugMode) {
        debugPrint("FormData fields: ${formData.fields}");
        debugPrint("FormData files: ${formData.files.map((e) => '${e.key}: ${e.value.filename}').toList()}");
      }

      final response = await _client.post(
        ApiEndpoints.writeReviewUrl,
        data: formData,
        options: Options(
          headers: {
            Headers.contentLengthHeader: formData.length,
          },
        ),
      );

      if (kDebugMode) {
        debugPrint("submit_review response -> ${response.data}");
      }

      return right(true);
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("submit_review_error -> ${e.message}");
        debugPrint("submit_review_error response -> ${e.response?.data}");
        debugPrint("submit_review_error type -> ${e.type}");
        debugPrint("submit_review_error error -> ${e.error}");
      }
      return left(checkErrorResponse(e));
    } catch (e) {
      if (kDebugMode) {
        debugPrint("submit_review unexpected error -> $e");
      }
      return left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> voteReview({
    required String productId,
    required String reviewId,
    required String voteType,
  }) async {
    try {
      final formData = FormData.fromMap({
        'productId': productId,
        'reviewsId': reviewId,
        'type': voteType,
      });

      final response = await _client.post(
        ApiEndpoints.reviewVoteUrl,
        data: formData,
      );

      if (kDebugMode) {
        debugPrint("review_vote -> ${response.data}");
      }

      return right(true);
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("review_vote_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, List<EmiResponse>>> getEmiDetails({
    required String productId,
  }) async {
    try {
      final response = await _client.get(
        ApiEndpoints.emiDetailsUrl,
        queryParameters: {'id': productId},
      );

      if (kDebugMode) {
        debugPrint("emi_details -> ${response.data}");
      }

      final data = response.data;
      if (data is List) {
        final result = data
            .map((e) => EmiResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return right(result);
      } else {
        return left(
          const ErrorResponse(message: 'Invalid EMI response format'),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("emi_details_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, List<ProductBannerResponse>>>
  getProductBanners() async {
    try {
      final response = await _client.get(ApiEndpoints.productBannerUrl);

      if (kDebugMode) {
        debugPrint("product_banners -> ${response.data}");
      }

      final data = response.data;
      if (data is List) {
        final result = data
            .map(
              (e) => ProductBannerResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        return right(result);
      } else {
        return left(
          const ErrorResponse(
            message: 'Invalid product banners response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("product_banners_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, CmsBlockResponse>> getCmsBlock({
    required String blockUrl,
  }) async {
    try {
      if (kDebugMode) {
        debugPrint("cms_block_url -> $blockUrl");
      }

      final response = await _client.get(blockUrl);

      if (kDebugMode) {
        debugPrint("cms_block -> ${response.data}");
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final result = CmsBlockResponse.fromJson(data);
        return right(result);
      } else {
        final errorList = _tryParseErrorList(data);
        if (errorList != null) {
          return left(errorList);
        }
        return left(
          const ErrorResponse(message: 'Invalid CMS block response format'),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("cms_block_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, SellerProductsResponse>> getSellerProducts({
    required String shopUrl,
    required int currentPage,
    required int pageSize,
  }) async {
    try {
      final response = await _client.get(
        ApiEndpoints.sellerProductsUrl,
        queryParameters: {
          'shopUrl': shopUrl,
          'currentPage': currentPage,
          'pageSize': pageSize,
        },
        options: Options(extra: const {'noAuth': true}),
      );

      if (kDebugMode) {
        debugPrint("seller_products -> ${response.data}");
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final result = SellerProductsResponse.fromJson(data);
        return right(result);
      } else {
        final errorList = _tryParseErrorList(data);
        if (errorList != null) {
          return left(errorList);
        }
        return left(
          const ErrorResponse(
            message: 'Invalid seller products response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("seller_products_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, List<BannerResponse>>> getBannerContent() async {
    try {
      final response = await _client.get(
        ApiEndpoints.activeBannersUrl,
      );

      if (kDebugMode) {
        debugPrint("banner_content -> ${response.data}");
      }

      final data = response.data;
      if (data is List) {
        final result = data
            .map((e) => BannerResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return right(result);
      } else {
        return left(
          const ErrorResponse(
            message: 'Invalid banner content response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("banner_content_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, HomeFlashSaleResponse>> getHomeFlashSale() async {
    try {
      final response = await _client.get(
        ApiEndpoints.homeFlashSaleUrl,
      );

      if (kDebugMode) {
        debugPrint("home_flash_sale -> ${response.data}");
      }

      final data = response.data;
      if (data is List && data.isNotEmpty) {
        final result = HomeFlashSaleResponse.fromJson(data.first as Map<String, dynamic>);
        return right(result);
      } else if (data is Map<String, dynamic>) {
        final result = HomeFlashSaleResponse.fromJson(data);
        return right(result);
      } else {
        return left(
          const ErrorResponse(
            message: 'Invalid home flash sale response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("home_flash_sale_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, ProductFlashSaleResponse>> getProductFlashSale({required String slug}) async {
    try {
      final response = await _client.get(
        ApiEndpoints.productFlashSaleUrl(slug: slug),
      );

      if (kDebugMode) {
        debugPrint("product_flash_sale -> ${response.data}");
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final result = ProductFlashSaleResponse.fromJson(data);
        return right(result);
      } else {
        final errorList = _tryParseErrorList(data);
        if (errorList != null) {
          return left(errorList);
        }
        return left(
          const ErrorResponse(
            message: 'Invalid product flash sale response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("product_flash_sale_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, List<UserReviewResponse>>> getUserReviews() async {
    try {
      final response = await _client.get(
        ApiEndpoints.userReviewsUrl,
      );

      if (kDebugMode) {
        debugPrint("user_reviews -> ${response.data}");
      }

      final data = response.data;
      if (data is List) {
        final result = data
            .map((e) => UserReviewResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return right(result);
      } else {
        return left(
          const ErrorResponse(message: 'Invalid user reviews response format'),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("user_reviews_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, DeliveryChargeResponse>> getDeliveryCharge({
    required String productId,
  }) async {
    try {
      final response = await _client.get(
        ApiEndpoints.deliveryChargeUrl,
        queryParameters: {'productId': productId},
      );

      if (kDebugMode) {
        debugPrint("delivery_charge -> ${response.data}");
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final result = DeliveryChargeResponse.fromJson(data);
        return right(result);
      } else {
        final errorList = _tryParseErrorList(data);
        if (errorList != null) {
          return left(errorList);
        }
        return left(
          const ErrorResponse(
            message: 'Invalid delivery charge response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("delivery_charge_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, PromoResponse>> getPromoCode({
    required String slug,
  }) async {
    try {
      final response = await _client.get(
        ApiEndpoints.promoCodeUrl(slug: slug),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (kDebugMode) {
        debugPrint("promo_code -> ${response.data}");
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final result = PromoResponse.fromJson(data);
        return right(result);
      } else {
        final errorList = _tryParseErrorList(data);
        if (errorList != null) {
          return left(errorList);
        }
        return left(
          const ErrorResponse(message: 'Invalid promo code response format'),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("promo_code_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, List<PromotionSliderResponse>>> getPromotionSlider() async {
    try {
      final response = await _client.get(
        ApiEndpoints.promotionSliderUrl,
      );

      if (kDebugMode) {
        debugPrint("promotion_slider -> ${response.data}");
      }

      final data = response.data;
      if (data is List) {
        final result = data
            .map((e) => PromotionSliderResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return right(result);
      } else {
        return left(
          const ErrorResponse(
            message: 'Invalid promotion slider response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("promotion_slider_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, List<DiscoverCategoryItem>>> getDiscoverCategories() async {
    try {
      final response = await _client.get(
        ApiEndpoints.discoverCategoryUrl,
      );

      if (kDebugMode) {
        debugPrint("discover_category -> ${response.data}");
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final result = DiscoverCategoryResponse.fromJson(data);
        return right(result.items ?? []);
      } else {
        final errorList = _tryParseErrorList(data);
        if (errorList != null) {
          return left(errorList);
        }
        return left(
          const ErrorResponse(
            message: 'Invalid discover category response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("discover_category_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }
}
