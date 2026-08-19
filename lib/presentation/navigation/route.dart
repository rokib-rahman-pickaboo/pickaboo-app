import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/data/services/auth_service.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/checkout/payment_methods_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/banner_bloc/banner_bloc.dart';
import 'package:pickaboo/presentation/bloc/home_banner_bloc/home_banner_bloc.dart';
import 'package:pickaboo/presentation/bloc/category_banner_bloc/category_banner_bloc.dart';
import 'package:pickaboo/presentation/bloc/card_bin_bloc/card_bin_bloc.dart';
import 'package:pickaboo/presentation/bloc/brand_products_bloc/brand_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/category_products_bloc/category_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/special_category_products_bloc/special_category_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/cms_content_bloc/cms_content_bloc.dart';
import 'package:pickaboo/presentation/bloc/delivery_charge_bloc/delivery_charge_bloc.dart';
import 'package:pickaboo/presentation/bloc/place_picker_bloc/place_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/home_content_bloc/home_content_bloc.dart';
import 'package:pickaboo/presentation/bloc/homepage_offers_bloc/homepage_offers_bloc.dart';
import 'package:pickaboo/presentation/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:pickaboo/presentation/bloc/home_flash_sale_bloc/home_flash_sale_bloc.dart';
import 'package:pickaboo/presentation/bloc/popup_bloc/popup_bloc.dart';
import 'package:pickaboo/presentation/bloc/product_flash_sale_bloc/product_flash_sale_bloc.dart';
import 'package:pickaboo/presentation/bloc/promo_bloc/promo_bloc.dart';
import 'package:pickaboo/presentation/bloc/promotion_slider_bloc/promotion_slider_bloc.dart';
import 'package:pickaboo/presentation/bloc/recommended_products_bloc/recommended_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/related_products_bloc/related_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/support/support_article_bloc/support_article_bloc.dart';
import 'package:pickaboo/presentation/bloc/support/support_category_bloc/support_category_bloc.dart';
import 'package:pickaboo/presentation/bloc/write_review_bloc/write_review_bloc.dart';
import 'package:pickaboo/presentation/bloc/emi_bloc/emi_bloc.dart';
import 'package:pickaboo/presentation/bloc/filter_bloc/filter_bloc.dart';
import 'package:pickaboo/presentation/bloc/just_for_you_bloc/just_for_you_bloc.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/product_detail_bloc/product_detail_bloc.dart';
import 'package:pickaboo/presentation/bloc/review_bloc/review_bloc.dart';
import 'package:pickaboo/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:pickaboo/presentation/bloc/support/privacy_policy_bloc/privacy_policy_bloc.dart';
import 'package:pickaboo/presentation/bloc/support/return_policy_bloc/return_policy_bloc.dart';
import 'package:pickaboo/presentation/bloc/support/terms_and_condition_bloc/terms_and_condition_bloc.dart';
import 'package:pickaboo/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/domain/entity/cms_block/cms_block_entity.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/account_information_page/account_information_page.dart';
import 'package:pickaboo/presentation/ui/pages/add_card_page/add_card_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/address_page/address_page.dart';
import 'package:pickaboo/presentation/ui/pages/cart/cart_page/cart_page.dart';
import 'package:pickaboo/presentation/ui/pages/discover_category_page/discover_category_page.dart';
import 'package:pickaboo/presentation/ui/pages/brand_product_page/brand_product_page.dart';
import 'package:pickaboo/presentation/ui/pages/category_product_page/category_product_page.dart';
import 'package:pickaboo/presentation/ui/pages/special_category_product_page/special_category_product_page.dart';

import 'package:pickaboo/presentation/ui/pages/dashboard/club_point_page/club_point_page.dart';
import 'package:pickaboo/presentation/ui/pages/seller_product_page/seller_product_page.dart';
import 'package:pickaboo/presentation/bloc/seller_products_bloc/seller_products_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/contact_us_page/contact_us_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/content/privacy_policy_page/privacy_policy_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/content/return_policy_page/return_policy_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/create_ticket_page/create_ticket_page.dart';
import 'package:pickaboo/presentation/ui/pages/auth/forgot_password_confirm_page/forgot_password_confirm_page.dart';
import 'package:pickaboo/presentation/ui/pages/auth/forgot_password_page/forgot_password_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/ticket_main_page/ticket_main_page.dart';
import 'package:pickaboo/presentation/ui/pages/home_page/home_page.dart';
import 'package:pickaboo/presentation/ui/pages/knowledge_base_details_page/knowledge_base_details_page.dart';
import 'package:pickaboo/presentation/ui/pages/knowledge_base_page/knowledge_base_page.dart';
import 'package:pickaboo/presentation/ui/pages/auth/login_page/login_page.dart';
import 'package:pickaboo/presentation/ui/pages/main_page.dart';
import 'package:pickaboo/presentation/ui/pages/cart/new_address_cart_page/new_address_cart_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/new_address_page/new_address_page.dart';
import 'package:pickaboo/presentation/ui/pages/notification_list_page/notification_list_page.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_cancelled_page/order_cancelled_page.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_details_page/order_details_page.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_failed_page/order_failed_page.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_list_page/order_list_page.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_placed_page/order_placed_page.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_payment_page.dart';
import 'package:pickaboo/presentation/ui/pages/cart/payment_method_page/payment_method_page.dart';
import 'package:pickaboo/presentation/ui/pages/cart/payment_review_page/payment_review_page.dart';
import 'package:pickaboo/presentation/ui/pages/cart/change_address_cart_page/change_address_cart_page.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/product_detail_page.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/cms_content_page/cms_content_page.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/all_product_review_page/all_product_review_page.dart';
import 'package:pickaboo/presentation/ui/pages/product_shop_page/product_shop_page.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/product_description_page/product_description_page.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/product_comparison_page/product_comparison_page.dart';

import 'package:pickaboo/presentation/ui/pages/dashboard/referral_code_page/referral_code_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/referral_page/referral_page.dart';
import 'package:pickaboo/presentation/ui/pages/auth/registration_detail_page/registration_detail_page.dart';
import 'package:pickaboo/presentation/ui/pages/auth/registration_page/registration_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/review_page/review_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/save_payment_page/save_payment_page.dart';
import 'package:pickaboo/presentation/ui/pages/search_page/search_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/setting_page/setting_page.dart';
import 'package:pickaboo/presentation/ui/pages/splash_page/splash_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/content/terms_page/terms_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/ticket_detail_page/ticket_detail_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/wish_list_page/wish_list_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/write_review_page/write_review_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/your_review_page/your_review_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/dashboard_page/dashboard_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/edit_account_information_page/edit_account_information_page.dart';
import 'package:pickaboo/presentation/ui/pages/deep_link_resolver_page.dart';
import 'package:pickaboo/presentation/bloc/saved_payment/saved_payment_bloc.dart';
import 'package:pickaboo/core/navigation/app_navigator_key.dart';
import 'package:pickaboo/presentation/ui/widgets/common/payment_web_view.dart';

class AppRouter {
  final AuthService authService;

  AppRouter(this.authService);

  late final GoRouter router = GoRouter(
    navigatorKey: appNavigatorKey,
    initialLocation: Routes.splash,
    debugLogDiagnostics: true,
    refreshListenable: authService,
    routes: [
      GoRoute(
        path: Routes.splash,
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),

      GoRoute(
        path: Routes.login,
        name: 'login',
        builder: (context, state) {
          final isPop = state.uri.queryParameters['isPop'] == 'true';
          final isBuyNow = state.uri.queryParameters['isBuyNow'] == 'true';
          final isPopGuest = state.uri.queryParameters['isPopGuest'] == 'true';

          return LoginPage(
            isPop: isPop,
            isBuyNow: isBuyNow,
            isPopGuest: isPopGuest,
          );
        },
      ),

      GoRoute(
        path: Routes.forgotPassword,
        name: 'forgotPassword',
        builder: (context, state) => const ForgotPasswordPage(),
      ),

      GoRoute(
        path: Routes.forgotPasswordConfirm,
        name: 'forgotPasswordConfirm',
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>?;
          final isEmail = extras?['isEmail'] as bool? ?? true;
          final value = extras?['value'] as String? ?? '';
          return ForgotPasswordConfirmPage(isEmail: isEmail, value: value);
        },
      ),

      GoRoute(
        path: Routes.registration,
        name: 'registration',
        builder: (context, state) {
          final phone = state.uri.queryParameters['phone'] ?? '';
          return RegistrationPage(phone: phone);
        },
      ),

      GoRoute(
        path: Routes.registrationDetail,
        name: 'registrationDetail',
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>?;
          final phone = extras?['phone'] ?? '';
          final otp = extras?['otp'] ?? '';
          return RegistrationDetailPage(phone: phone, otp: otp);
        },
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => MainPage(navigationShell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.home,
                name: 'home',
                builder: (context, state) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => getIt<HomeContentBloc>(),
                      ),
                      BlocProvider(
                        create: (context) => getIt<HomepageOffersBloc>(),
                      ),
                      BlocProvider(
                        create: (context) => getIt<PromotionSliderBloc>(),
                      ),
                      BlocProvider(
                        create: (context) => getIt<HomeFlashSaleBloc>(),
                      ),
                      BlocProvider(
                        create: (context) => getIt<HomeBannerBloc>(),
                      ),
                      BlocProvider(create: (context) => getIt<PopupBloc>()),
                      BlocProvider(
                        create: (context) => getIt<JustForYouBloc>(),
                      ),
                    ],
                    child: const HomePage(),
                  );
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.discoverCategory,
                name: 'discoverCategory',
                builder: (context, state) {
                  return const DiscoverCategoryPage();
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.knowledgeBase,
                name: 'knowledgeBase',
                builder: (context, state) {
                  return BlocProvider(
                    create: (context) => getIt<SupportCategoryBloc>(),
                    child: const KnowledgeBasePage(),
                  );
                },
                routes: [
                  GoRoute(
                    path: ':id',
                    name: 'knowledgeBaseDetails',
                    builder: (context, state) {
                      final extra = state.extra as Map<String, dynamic>?;
                      final id = state.pathParameters['id'];
                      final query = extra?['query'] as String?;
                      final categoryId =
                          extra?['categoryId'] as String? ??
                          ((query != null && query.isNotEmpty) ? null : id);
                      final categoryName =
                          extra?['categoryName'] as String? ?? 'Help Articles';

                      return MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => getIt<SupportArticleBloc>(),
                          ),
                          BlocProvider(
                            lazy: false,
                            create: (context) => getIt<SupportCategoryBloc>()
                              ..add(
                                const SupportCategoryEvent
                                    .getSupportCategories(),
                              ),
                          ),
                        ],
                        child: KnowledgeBaseDetailsPage(
                          categoryId: categoryId,
                          categoryName: categoryName,
                          query: query,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.dashboard,
                name: 'dashboard',
                builder: (context, state) => const DashboardPage(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: Routes.categoryProduct,
        name: 'categoryProduct',
        builder: (context, state) {
          final rawId = state.uri.queryParameters['categoryId']?.trim() ?? '';
          final rawSlug =
              state.uri.queryParameters['categorySlug']?.trim() ?? '';
          final isNumericId = int.tryParse(rawId) != null;

          final categorySlug = rawSlug.isNotEmpty
              ? rawSlug
              : (rawId.isNotEmpty && !isNumericId ? rawId : null);
          final categoryId = isNumericId ? rawId : null;

          final categoryName =
              state.uri.queryParameters['categoryName'] ?? '';

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
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<ProductDetailBloc>()),
              BlocProvider(create: (context) => getIt<ProductFlashSaleBloc>()),
              BlocProvider(
                create: (context) => getIt<RecommendedProductsBloc>(),
              ),
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
              productName: state.uri.queryParameters['name'] ?? '',
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
              final productName =
                  extra?['productName'] as String? ?? "";
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
                  BlocProvider(
                    create: (context) => getIt<BannerBloc>(),
                  ),
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
        builder: (context, state) {
          return const ShopSellerIndex();
        },
      ),

      GoRoute(
        path: Routes.search,
        name: 'search',
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<SearchBloc>()),
              BlocProvider(create: (context) => getIt<FilterBloc>()),
            ],
            child: const SearchPage(),
          );
        },
      ),

      GoRoute(
        path: Routes.cart,
        name: 'cart',
        builder: (context, state) => const CartPage(),
      ),

      GoRoute(
        path: Routes.wishlist,
        name: 'wishlist_response',
        builder: (context, state) => const WishListPage(),
      ),

      GoRoute(
        path: Routes.orderList,
        name: 'orderList',
        builder: (context, state) => const OrderListPage(),
      ),

      GoRoute(
        path: Routes.orderPlaced,
        name: 'orderPlaced',
        builder: (context, state) {
          final orderId = state.uri.queryParameters['orderId'];
          final earnedPointsRaw = state.uri.queryParameters['earnedPoints'];
          final earnedPoints = int.tryParse(earnedPointsRaw ?? '') ?? 0;
          return OrderPlacedPage(
            orderNumber: orderId ?? "Unknown",
            earnedPoints: earnedPoints,
            onContinueShopping: () => context.go(Routes.home),
          );
        },
      ),

      GoRoute(
        path: Routes.orderFailed,
        name: 'orderFailed',
        builder: (context, state) {
          final orderId = state.uri.queryParameters['orderId'];
          return OrderFailedPage(
            orderNumber: orderId,
            onContinueShopping: () => context.go(Routes.home),
          );
        },
      ),

      GoRoute(
        path: Routes.orderCancelled,
        name: 'orderCancelled',
        builder: (context, state) =>
            OrderCancelledPage(order: state.extra),
      ),

      GoRoute(
        path: Routes.orderPayment,
        name: 'orderPayment',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final selectedMethod = extra?['selectedMethod'] as String?;
          final orderId = extra?['orderId'] as String?;
          final grandTotal = extra?['grandTotal'] as double?;
          final subtotal = extra?['subtotal'] as double?;
          final shippingAmount = extra?['shippingAmount'] as double?;
          final discountAmount = extra?['discountAmount'] as double?;
          final itemsCount = extra?['itemsCount'] as int?;
          final quoteId = extra?['quoteId'] as String?;

          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<CheckoutBloc>()),
              BlocProvider(create: (context) => getIt<SavedPaymentBloc>()),
              BlocProvider(create: (context) => getIt<CardBinBloc>()),
            ],
            child: OrderPaymentPage(
              selectedMethod: selectedMethod,
              orderId: orderId,
              grandTotal: grandTotal,
              subtotal: subtotal,
              shippingAmount: shippingAmount,
              discountAmount: discountAmount,
              itemsCount: itemsCount,
              quoteId: quoteId,
            ),
          );
        },
      ),

      GoRoute(
        path: Routes.orderDetails,
        name: 'orderDetails',
        builder: (context, state) {
          final orderId = state.pathParameters['id'] ?? '';
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<OrderBloc>()),
              BlocProvider(create: (context) => getIt<JustForYouBloc>()),
            ],
            child: OrderDetailsPage(orderId: orderId),
          );
        },
      ),

      GoRoute(
        path: Routes.paymentReview,
        name: 'paymentReview',
        builder: (context, state) => const PaymentReviewPage(),
      ),

      GoRoute(
        path: Routes.paymentMethod,
        name: 'paymentMethod',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final selectedMethod = extra?['selectedMethod'] as String?;
          final orderId = extra?['orderId'] as String?;
          final cartId = extra?['cartId'] as String?;
          final availablePaymentMethods =
              extra?['availablePaymentMethods'] as List<PaymentMethodEntity>?;
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<SavedPaymentBloc>()),
              BlocProvider(create: (context) => getIt<CardBinBloc>()),
              BlocProvider(create: (context) => getIt<OrderBloc>()),
            ],
            child: PaymentMethodPage(
              selectedMethod: selectedMethod,
              orderId: orderId,
              cartId: cartId,
              availablePaymentMethods: availablePaymentMethods,
            ),
          );
        },
      ),

      GoRoute(
        path: Routes.paymentWebView,
        name: 'paymentWebView',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final url = extra['url'] as String;
          final title = extra['title'] as String;
          final formFields = extra['formFields'] as Map<String, String>?;
          final onPaymentResult =
              extra['onPaymentResult'] as Function(bool, String?);
          final onBkashCallback =
              extra['onBkashCallback'] as void Function(String, String)?;
          final onNagadCallback =
              extra['onNagadCallback'] as void Function(Map<String, String>)?;
          final onUserClosed = extra['onUserClosed'] as VoidCallback?;

          return PaymentWebView(
            url: url,
            title: title,
            formFields: formFields,
            onPaymentResult: onPaymentResult,
            onBkashCallback: onBkashCallback,
            onNagadCallback: onNagadCallback,
            onUserClosed: onUserClosed,
          );
        },
      ),

      GoRoute(
        path: Routes.savePayment,
        name: 'savePayment',
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<SavedPaymentBloc>(),
          child: SavePaymentPage(customerId: (state.extra as String?) ?? ''),
        ),
      ),

      GoRoute(
        path: Routes.addCard,
        name: 'addCard',
        builder: (context, state) => const AddCards(),
      ),

      GoRoute(
        path: Routes.address,
        name: 'address',
        builder: (context, state) => const AddressPage(),
      ),

      GoRoute(
        path: Routes.newAddress,
        name: 'newAddress',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final address = extra?['address'];
          return NewAddressPage(existingAddress: address);
        },
      ),

      GoRoute(
        path: Routes.newAddressCart,
        name: 'newAddressCart',
        builder: (context, state) {
          final title = state.extra as String? ?? 'Shipping Information';
          return NewAddressCartPage(pageTitle: title);
        },
      ),

      GoRoute(
        path: Routes.changeAddressCart,
        name: 'changeAddressCart',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final addresses =
              (extra?['addresses'] as List<dynamic>?)
                  ?.map((e) => e as dynamic)
                  .toList() ??
              [];
          final selectedAddress = extra?['selectedAddress'] as AddressEntity?;
          final title = extra?['title'] as String? ?? 'Select Address';

          return ChangeAddressCartPage(
            addresses: addresses.cast<AddressEntity>(),
            selectedAddress: selectedAddress,
            pageTitle: title,
          );
        },
      ),

      GoRoute(
        path: Routes.review,
        name: 'review',
        builder: (context, state) => const Review(),
      ),

      GoRoute(
        path: Routes.yourReview,
        name: 'yourReview',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<ReviewBloc>(),
            child: const YourReviewPage(),
          );
        },
      ),

      GoRoute(
        path: Routes.writeReview,
        name: 'writeReviewOrder',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<WriteReviewBloc>()),
              BlocProvider(create: (context) => getIt<PhotoPickerBloc>()),
            ],
            child: WriteReviewPage(
              productId: extra['productId'] as String,
              productName: extra['productName'] as String,
              productImage: extra['productImage'] as String? ?? "",
            ),
          );
        },
      ),

      GoRoute(
        path: Routes.ticketMain,
        name: 'ticketMain',
        builder: (context, state) => const TicketMainPage(),
      ),

      GoRoute(
        path: Routes.createTicket,
        name: 'createTicket',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<PhotoPickerBloc>(),
            child: const CreateTicketPage(),
          );
        },
      ),

      GoRoute(
        path: Routes.ticketDetail,
        name: 'ticketDetail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return BlocProvider(
            create: (context) => getIt<PhotoPickerBloc>(),
            child: TicketDetailPage(ticketId: id),
          );
        },
      ),

      GoRoute(
        path: Routes.accountInformation,
        name: 'accountInformation',
        builder: (context, state) => const AccountInformationPage(),
      ),

      GoRoute(
        path: Routes.editAccountInformation,
        name: 'editAccountInformation',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<PhotoPickerBloc>(),
            child: const EditAccountInformationPage(),
          );
        },
      ),

      GoRoute(
        path: Routes.setting,
        name: 'setting',
        builder: (context, state) => const SettingsPage(),
      ),

      GoRoute(
        path: Routes.clubPoint,
        name: 'clubPoint',
        builder: (context, state) => const ClubPointPage(),
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
      GoRoute(
        path: Routes.knowledgeBaseDetailsStandalone,
        name: 'knowledgeBaseDetailsStandalone',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final extra = state.extra as Map<String, dynamic>?;
          final categoryId = extra?['categoryId'] as String?;
          final categoryName =
              extra?['categoryName'] as String? ?? 'Help Articles';
          final query = extra?['query'] as String?;

          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<SupportArticleBloc>()),
              BlocProvider(
                lazy: false,
                create: (context) => getIt<SupportCategoryBloc>()
                  ..add(const SupportCategoryEvent.getSupportCategories()),
              ),
            ],
            child: KnowledgeBaseDetailsPage(
              categoryId: categoryId ?? id,
              categoryName: categoryName,
              query: query,
            ),
          );
        },
      ),

      GoRoute(
        path: Routes.terms,
        name: 'terms',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<TermsAndConditionBloc>(),
            child: const TermsAndConditionPage(),
          );
        },
      ),

      GoRoute(
        path: Routes.privacyPolicy,
        name: 'privacyPolicy',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<PrivacyPolicyBloc>(),
            child: const PrivacyPolicyPage(),
          );
        },
      ),

      GoRoute(
        path: Routes.returnPolicy,
        name: 'returnPolicy',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<ReturnPolicyBloc>(),
            child: const ReturnPolicyPage(),
          );
        },
      ),

      GoRoute(
        path: Routes.contactUs,
        name: 'contactUs',
        builder: (context, state) => const ContactUsPage(),
      ),

      GoRoute(
        path: Routes.notificationList,
        name: 'notificationList',
        builder: (context, state) => const NotificationListPage(),
      ),

      GoRoute(
        path: Routes.referral,
        name: 'referral',
        builder: (context, state) => const ReferralPage(),
      ),

      GoRoute(
        path: Routes.referralCode,
        name: 'referralCode',
        builder: (context, state) =>
            const ReferralCodePage(referralCode: "referralCode"),
      ),

      GoRoute(
        path: '/product-detail/:slug',
        builder: (context, state) {
          final slug = state.pathParameters['slug'] ?? '';
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<ProductDetailBloc>()),
              BlocProvider(create: (context) => getIt<ReviewBloc>()),
              BlocProvider(create: (context) => getIt<EmiBloc>()),
              BlocProvider(create: (context) => getIt<CmsContentBloc>()),
              BlocProvider(create: (context) => getIt<WishlistBloc>()),
              BlocProvider(create: (context) => getIt<PromoBloc>()),
            ],
            child: ProductDetailsPage(
              productId: slug,
              slug: slug,
              productName: (state.extra as Map<String, dynamic>?)?['productName'] as String? ?? '',
            ),
          );
        },
      ),

      GoRoute(
        path: '/category/:slug',
        builder: (context, state) {
          final slug = state.pathParameters['slug'] ?? '';
          return DeepLinkResolverPage(slug: slug, type: 'category');
        },
      ),
    ],

    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: Text('Error', style: context.textStyle.appBarTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64.sp, color: context.colors.red),
            SizedBox(height: 16.h),
            Text(
              'Page not found',
              style: context.textStyle.headingLarge.withColor(
                context.colors.text,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              state.matchedLocation,
              style: context.textStyle.bodyMedium.withColor(
                context.colors.gray,
              ),
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () => context.go(Routes.home),
              child: Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}
