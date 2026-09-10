import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/config/api_config.dart';

@injectable
class ApiEndpoints {
  static const String baseUrl = ApiConfig.baseUrl;

  /// auth endpoints
  static String checkCustomerUrl = '/rest/V1/customer-check/exist';

  /// all endpoints
  static const String pickabooClub = '/rest/V1/clubpoints/mine';
  static String homeFeedContentUrl = '/rest/V1/new-homepageapi';
  static const String homepageOffersUrl = '/rest/default/V1/homepage-offers';
  static String activeBannersUrl = '/rest/V1/custom-banners/active';
  static String homeBannersUrl = '/rest/V1/custom-banners/homepage';
  static String categoryBannersUrl({required int categoryId}) =>
      '/rest/V1/custom-banners/category/$categoryId';
  static String justForYouProductsUrl = '/rest/default/V1/home-products';
  static String allCategoryUrl = '/rest/V1/all-categories';
  static const String popupContentUrl =
      '/rest/default/V1/pickaboo-cms-block/dc-popup-adv-app';
  /// Category storefront. [categoryKey] is either the numeric category id or
  /// the category slug — the endpoint resolves both.
  static String categoryProductsUrl({required String categoryKey}) =>
      '/rest/V1/categorypageapi/$categoryKey';
  static String specialCategoryProductsUrl({required String slug}) =>
      '/rest/V1/categorypageapi/$slug';
  /// Brand storefront. [brandKey] is either the numeric brand id or the brand
  /// slug — the endpoint resolves both, exactly like the category one.
  static String brandProductsUrl({required String brandKey}) =>
      '/rest/V1/brandpageapi/$brandKey';
  static String categoryProductsBySlugUrl({required String slug}) =>
      '/rest/V1/category-id/slug/$slug';

  static String productDetailUrl({required String productId}) =>
      '/rest/V1/product/info/id/$productId';
  static String productDetailBySlugUrl({required String slug}) =>
      '/rest/V1/product-id/slug/$slug';

  static String allSupportCategoryUrl = '/rest/V1/dcastalia-help/categoryList';

  /// support/help category endpoint
  static String supportCategoryUrl = '/rest/V1/support-categories';
  static String supportArticleUrl({required String categoryId}) =>
      '/rest/V1/dcastalia-help/articleList?category_id=$categoryId';
  static String searchSupportArticleUrl({required String query}) =>
      '/rest/V1/dcastalia-help/searchArticle?query_string=$query';

  /// content
  static String termsAndConditionUrl = '/rest/V1/terms-and-conditions';
  static String privacyPolicyUrl = '/rest/V1/getpage/privacy-policy';
  static String returnPolicyUrl = '/rest/V1/getpage/return-policy';

  /// searchanise
  static const String searchaniseBaseUrl = 'https://searchserverapi.com';
  static const String searchaniseUrl = '/getresults';

  static const String _productionSearchaniseApiKey = '6W7Z0N7U0T';
  static const String _stagingSearchaniseApiKey = '4B4B7b3t4J';

  /// Automatically switches to production key (`6W7Z0N7U0T`) when [ApiConfig.isProduction] is true,
  /// and staging key (`4B4B7b3t4J`) when false.
  static const String searchaniseApiKey = ApiConfig.isProduction
      ? _productionSearchaniseApiKey
      : _stagingSearchaniseApiKey;

  /// cart endpoints - authenticated
  static const String createCartUrl = '/rest/default/V1/carts/mine/';
  static const String getCartUrl =
      '/rest/default/V1/dcastalia-checkout/checkout';
  static const String addCartItemUrl = '/rest/default/V1/carts/mine/items';
  static String updateCartItemUrl({required int itemId}) =>
      '/rest/V1/carts/mine/items/$itemId';
  static String deleteCartItemUrl({required int itemId}) =>
      '/rest/V1/carts/mine/items/$itemId';

  /// coupon endpoints
  static String applyCouponUrl({
    required String cartId,
    required String coupon,
  }) =>
      '/rest/V1/dcastalia-coupon/apply?cart_id=$cartId&coupon=$coupon&is_app=1';
  static String removeCouponUrl({required String cartId}) =>
      '/rest/V1/dcastalia-coupon/remove?cart_id=$cartId';

  /// reward points
  static String applyRewardPointsUrl({
    required String cartId,
    required int pointAmount,
  }) =>
      '/rest/default/V1/rewards/mine/apply?cart_id=$cartId&pointAmount=$pointAmount';

  /// other cart operations
  static String emptyCartUrl({required String quoteId}) =>
      '/rest/V1/dcastalia-emptycart/emptycart?qouteid=$quoteId';

  static const String saveForLaterUrl = '/rest/V1/dcastalia-saveforlater/save';

  /// guest cart endpoints
  static const String createGuestCartUrl = '/rest/default/V1/guest-carts';
  static String getGuestCartUrl({required String cartId}) =>
      '/rest/default/V1/guest-carts/$cartId';
  static String getGuestCheckoutUrl({required String cartId}) =>
      '/rest/default/V1/dcastalia-checkout/checkout?cart_id=$cartId';
  static String addGuestCartItemUrl({required String cartId}) =>
      '/rest/default/V1/guest-carts/$cartId/items';
  static String updateGuestCartItemUrl({
    required String cartId,
    required int itemId,
  }) => '/rest/default/V1/guest-carts/$cartId/items/$itemId';
  static String deleteGuestCartItemUrl({
    required String cartId,
    required int itemId,
  }) => '/rest/default/V1/guest-carts/$cartId/items/$itemId';

  // Merge Guest Cart
  static String mergeGuestCartUrl({required String guestCartId}) =>
      '/rest/default/V1/guest-carts/$guestCartId';

  /// Authentication endpoints
  static const String loginUrl = '/rest/default/V1/integration/mobile/token';

  // Checkout / Shipping
  static const String estimateShippingUrl =
      '/rest/default/V1/carts/mine/estimate-shipping-methods';

  /// Estimate for a saved address-book entry. Preferred over
  /// [estimateShippingUrl] when the address has an ID: the backend resolves
  /// region/postcode itself, so the options always match the picked address.
  static const String estimateShippingByAddressIdUrl =
      '/rest/default/V1/carts/mine/estimate-shipping-methods-by-address-id';
  static const String shippingInformationUrl =
      '/rest/default/V1/carts/mine/shipping-information';

  /// GET /rest/V1/dcastalia-carts/{cartId}/shipping-information
  /// Returns available payment methods + totals for an existing cart.
  static String getPaymentInfoUrl(String cartId) =>
      '/rest/V1/dcastalia-carts/$cartId/shipping-information';
  static const String paymentSelectUrl = '/rest/V1/dccheckout/payment';
  static const String placeOrderUrl = '/rest/V1/dccheckout/orderplace';
  static const String updateOrderPaymentUrl =
      '/rest/V1/dcastalia-order/updateorderpayment';
  static const String dmOrderPlaceUrl =
      '/rest/default/V1/dcastalia/dmorder-place/';
  static const String checkUserExistsUrl =
      '/rest/default/V1/customer-check/exist';
  static const String sendOtpUrl = '/rest/all/V1/sendotp';
  static const String verifyOtpUrl = '/rest/all/V1/validateOtp';
  static const String registerUserUrl =
      '/rest/default/V1/customersignupafterotpv';
  static const String sendEmailOtpUrl =
      '/rest/V1/dcastalia-emailverification/sendcode';
  static const String verifyEmailOtpUrl =
      '/rest/V1/dcastalia-emailverification/checkcode';
  static const String sendForgotPasswordOtpUrl =
      '/rest/V1/dcastalia-forgetpassword/forgetpasswordnew';
  static const String resetPasswordUrl =
      '/rest/V1/dcastalia-forgetpassword/resetpassword';
  static const String socialLoginUrl =
      '/rest/V1/dcastalia-socialintegration/login';
  static const String getCurrentUserUrl = '/rest/default/V1/customers/me';
  static const String customerImageMine = '/rest/V1/customers/image/mine';
  static const String updateCustomerUrl =
      '/rest/V1/dcastalia-address/customers/me';
  static const String uploadProfileImageUrl =
      '/rest/V1/customer/upload/profilepicture/mine';
  static const String changePasswordUrl =
      '/rest/V1/customers/me/password';
  static const String customerMe = getCurrentUserUrl;

  /// Dedicated Profile Phone & Email Update Endpoints
  static const String sendPhoneUpdateOtpUrl =
      '/rest/V1/dcastalia-mobilelogin/sendotp';
  static const String sendPhoneUpdateOtpFallbackUrl =
      '/rest/V1/sendotp';
  static const String updateCustomerMobileUrl =
      '/rest/V1/address/customers/me/mobile';
  static const String sendEmailVerificationCodeUrl =
      '/rest/V1/dcastalia-emailverification/sendcode';
  static const String updateCustomerEmailUrl =
      '/rest/V1/address/customers/me/email';

  /// Address endpoints
  static const String customerAddressUrl =
      '/rest/V1/address/customers/me/address';
  static String deleteCustomerAddressUrl(int id) =>
      '/rest/V1/address/customers/me/address/$id';
  static const String getCityUrl = '/rest/default/V1/dcastalia-address/getcity';
  static const String getAreaUrl = '/rest/default/V1/dcastalia-address/getarea';

  /// Referral endpoints
  static const String referralHistory = '/rest/V1/dcastalia/referral/history';
  static const String referralInvite = '/rest/V1/dcastalia/referral/invite';

  /// Notification endpoints
  static const String saveFcmTokenUrl =
      '/rest/V1/dcastalia-pushnotification/subscriber';
  static const String deleteFcmTokenUrl =
      '/rest/V1/dcastalia-pushnotification/subscriber/delete';
  static const String getNotificationListUrl =
      '/rest/V1/dcastalia-pushnotification/notification/list';
  static const String updateNotificationStatusUrl =
      '/rest/V1/dcastalia-pushnotification/notification/update';
  static const String markAllAsReadUrl =
      '/rest/V1/dcastalia-pushnotification/notification/markasread';

  /// Wishlist endpoints
  static const String getWishlistUrl = '/rest/V1/wishlist/items';
  static String addToWishlistUrl({required String productId}) =>
      '/rest/V1/wishlist/add/$productId';
  static const String removeFromWishlistUrl = '/rest/V1/wishlist/delete';

  /// Helpdesk endpoints
  static const String ticketListUrl = '/rest/V1/dcastalia-helpdesk/ticket/list';
  static const String createTicketUrl =
      '/rest/V1/dcastalia-helpdesk/ticket/create';
  static const String ticketDetailsUrl =
      '/rest/V1/dcastalia-helpdesk/ticket/details';
  static const String ticketReplyUrl =
      '/rest/V1/dcastalia-helpdesk/ticket/reply';
  static const String ticketCloseUrl =
      '/rest/V1/dcastalia-helpdesk/ticket/close';
  static const String ticketOrderInfoUrl =
      '/rest/V1/dcastalia-helpdesk/orderinfo';

  /// Order management endpoints
  static const String getOrderListUrl = '/rest/V1/orders/mine';
  static String getOrderDetailsUrl({required String orderId}) =>
      '/rest/V1/orders/mine/$orderId';
  static const String cancelOrderUrl = '/rest/V1/order/cancel';
  static String reorderUrl({required String orderId}) =>
      '/rest/V1/dcastalia-reorderapi/reorder/$orderId';

  /// Saved Payment endpoints
  static const String getAgreementsUrl =
      '/rest/V1/dcastalia-mobilebkash/getagreements';
  static const String deleteAgreementUrl =
      '/rest/V1/dcastalia-mobilebkash/deleteagreement';

  /// Product Detail - Related Products
  static String productRelatedUrl({required String productId}) =>
      '/rest/V1/product/related-products/id/$productId';

  static String sellerRecommendedProductsUrl({required String slug}) =>
      '/rest/V1/seller-recommended-products/$slug';

  static String relatedProductsUrl({required String slug}) =>
      '/rest/V1/related-products/$slug';

  /// Product Detail - Banners
  static const String productBannerUrl =
      '/rest/V1/allslides?searchCriteria[filter_groups][0][filters][0][field]=alias&searchCriteria[filter_groups][0][filters][0][value]=product-banner-management&searchCriteria[filter_groups][0][filters][0][condition_type]=eq';

  /// Promotion / Service Slider
  static const String promotionSliderUrl =
      '/rest/V1/allslides?searchCriteria[filter_groups][0][filters][0][field]=alias&searchCriteria[filter_groups][0][filters][0][value]=Service+Slider&searchCriteria[filter_groups][0][filters][0][condition_type]=eq';

  /// Reviews
  static const String writeReviewUrl = '/rest/V1/reviews/new';

  /// Product Detail - Paginated reviews + rating summary
  /// `/rest/V1/product/info/id/{productId}/review?page=1&pageSize=10`
  static String productReviewsUrl({required String productId}) =>
      '/rest/V1/product/info/id/$productId/review';

  /// Helpful / not-helpful vote counts per review. Kept alongside
  /// [productReviewsUrl] because that endpoint does not return `like_count`,
  /// `dislikes_count`, `do_like` or `do_dislike`; the two are merged by
  /// `review_id` in the repository.
  static const String reviewVotesUrl =
      '/rest/V1/dcastalia-reviewvote/product/votes';
  static const String reviewVoteUrl =
      '/rest/V1/dcastalia-reviewvote/reviewvote';
  static const String userReviewsUrl =
      '/rest/V1/reviews/mine';

  /// EMI Details
  static const String emiDetailsUrl = '/rest/V1/product-emi/details';

  /// Delivery Charge
  static const String deliveryChargeUrl =
      '/rest/V1/pickaboo/delivery-charge/product';

  /// CMS Blocks for Product Detail Page
  static const String productOfferUrl =
      '/rest/default/V1/pickaboo-cms-block/pickaboo-dc-product-offer';
  static const String priceGuaranteeUrl =
      '/rest/default/V1/pickaboo-cms-block/best-price-guaranteed-by-pickaboo';
  static const String priceGuaranteeTcUrl =
      '/rest/default/V1/pickaboo-cms-block/best-price-guaranteed-by-pickaboo-t-and-c';
  static const String pickabooVerifiedUrl =
      '/rest/default/V1/pickaboo-cms-block/pickaboo-verified';
  static const String expressDeliveryUrl =
      '/rest/default/V1/pickaboo-cms-block/delivery-options';
  static String resolveSlugUrl({required String type}) => type == "product"
      ? '/rest/V1/product-id/slug'
      : '/rest/V1/category-id/slug';
  static const String sellerProductsUrl =
      '/rest/V1/dcastalia-vendorshop/products';

  /// Promo Code
  static String promoCodeUrl({required String slug}) =>
      '/rest/V1/product-free-coupon/$slug';

  /// Discover Category
  static const String discoverCategoryUrl = '/rest/V1/discover-category';

  /// Flash Sale
  static const String homeFlashSaleUrl = '/rest/V1/flashsales/active';
  static String productFlashSaleUrl({required String slug}) =>
      '/rest/V1/flashsales/product/$slug';

  // ============================================================
  // Barikoi Place Picker Endpoints
  // ============================================================
  static const String barikoiBaseUrl = 'https://barikoi.xyz/v2/api';
  static const String barikoiApiKey = 'bkoi_1400e6dfbaa8adf41f3ca5b1791208ba89669177f941d491492b663aaa441ef8'; // replace this

  /// GET /search/autocomplete/place?api_key={key}&q={query}
  static const String barikoiAutocompleteUrl = '/search/autocomplete/place';

  /// GET /search/reverse/geocode?api_key={key}&longitude={lon}&latitude={lat}
  static const String barikoiReverseGeocodeUrl = '/search/reverse/geocode';

  // Digital Payment Endpoints
  static const String bkashGetTokenUrl =
      '/rest/V1/dcastalia-mobilebkash/gettoken';
  static const String bkashAgreementCreateUrl =
      '/rest/V1/dcastalia-mobilebkash/agreementcreate';
  static const String bkashAgreementExecuteUrl =
      '/rest/V1/dcastalia-mobilebkash/agreementexecute';
  static const String bkashPaymentCreateUrl =
      '/rest/V1/dcastalia-mobilebkash/paymentcreate';
  static const String bkashPaymentExecuteUrl =
      '/rest/V1/dcastalia-mobilebkash/paymentexecute';
  static const String bkashAgreementSaveUrl =
      '/rest/V1/dcastalia-mobilebkash/saveagreement';
  static const String nagadCreateOrderUrl =
      '/rest/V1/dcastalia-dcastalianagadapi/paymentexecute';
  static const String cityBankCreateOrderUrl =
      '/rest/V1/dcastalia-citybank/createorder';
  static const String bracBankCreateOrderUrl =
      '/rest/V1/dcastalia-bracbank/createorder';
  static const String mtbCreateOrderUrl = '/rest/V1/mtb-gateway/createorder';
  static const String sslPaymentRequestUrl =
      '/rest/V1/dcastalia-sslcommerz/payment/request';
  // NOTE: EBL requires /default/ in path — use this constant everywhere
  static const String eblPaymentProcessUrl =
      '/rest/default/V1/dcastalia-ebl/payment-process';
  static const String getEmiDetailsUrl =
      '/rest/V1/dcastalia-emi/get-emi-details';
  static const String emiQuoteUpdateUrl =
      '/rest/V1/dcastalia-emi/emiUpdateQuote';

  // CEMI (Cardless EMI) endpoints
  static const String getCemiDetailsUrl =
      '/rest/V1/dcastalia-crdemi/get-crdemi-details';
  static const String cemiQuoteUpdateUrl =
      '/rest/V1/dcastalia-emi/cemiUpdateQuote';

  // Card BIN discount endpoints
  static String cardBinVerifyUrl({required String orderId}) =>
      '/rest/V1/orders/$orderId/cardbin/verify';
  static String cardBinApplyUrl({required String orderId}) =>
      '/rest/V1/orders/$orderId/cardbin/apply';
  static String cardBinRemoveUrl({required String orderId}) =>
      '/rest/V1/orders/$orderId/cardbin/remove';
  static const String cardBinStatusUrl = '/rest/V1/cardbin/status';

  // bKash WebView callback paths — intercepted by PaymentWebView._checkUrl.
  // Always use the live domain so bKash can redirect to these URLs.
  static const String bkashAgreementCallbackPath = '/bkash/agreement-callback';
  static const String bkashPaymentCallbackPath = '/bkash/payment-callback';
  static String get bkashAgreementCallbackUrl =>
      '${ApiConfig.productionURL}$bkashAgreementCallbackPath';
  static String get bkashPaymentCallbackUrl =>
      '${ApiConfig.productionURL}$bkashPaymentCallbackPath';

  // Nagad WebView callback path.
  // Must match the returnPath sent to Nagad: URL_LIVE + '/payment-status/nagod'
  // Note: slug is misspelled 'nagod' (matches old web codebase exactly).
  static const String nagadCallbackPath = '/payment-status/nagod';
  static String get nagadCallbackUrl =>
      '${ApiConfig.productionURL}$nagadCallbackPath';

  // Nagad finalize API — called after WebView intercepts the callback.
  // All Nagad callback query params are forwarded as query params to this GET.
  static const String nagadFinalizeUrl =
      '/rest/V1/dcastalia-dcastalianagadapi/nagadcallback';
}
