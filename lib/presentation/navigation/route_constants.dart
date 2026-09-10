class Routes {
  Routes._();

  static const String splash = '/';
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String forgotPasswordConfirm = '/forgot-password-confirm';

  static const String registration = '/registration';
  static const String registrationDetail = '/registration-detail';

  static const String home = '/home';
  static const String dashboard = '/dashboard';
  static const String discoverCategory = '/discover-category';
  static const String categoryProduct = '/category-product';
  static const String specialCategoryProduct = '/special-category-product';
  static const String sellerProduct = '/seller-product';
  static const String brandProduct = '/brand-product';

  static const String productDetail = '/product/:id';
  static const String productShop = '/shop/:id';
  static const String productDescription = 'description';
  static const String productComparison = 'comparison';
  static const String allProductReviews = '/product/:id/all-reviews';

  static const String cart = '/cart';
  static const String cartGuest = '/cart-guest';

  static const String wishlist = '/wishlist_response';

  static const String orderList = '/orders';
  static const String orderDetails = '/order/:id';
  static const String orderPlaced = '/order/placed';
  static const String orderFailed = '/order/failed';
  static const String orderCancelled = '/order/cancelled';
  static const String orderPayment = '/order/payment';

  static const String paymentReview = '/payment/review';
  static const String paymentOrderSummary = '/payment/summary';
  static const String paymentMethod = '/payment/method';
  static const String paymentWebView = '/payment/webview';
  static const String savePayment = '/payment/saved';
  static const String addCard = '/payment/card/add';

  static const String address = '/address';
  static const String newAddress = '/address/new';
  static const String newAddressCart = '/address/new-cart';
  static const String changeAddressCart = '/address/change-cart';

  static const String review = '/review';
  static const String yourReview = '/review/yours';
  static const String writeReview = '/review/write';

  static const String ticketMain = '/support/tickets';
  static const String ticketDetail = '/support/ticket/:id';
  static const String createTicket = '/support/ticket/create';

  static const String accountInformation = '/account/info';
  static const String editAccountInformation = '/account/edit';
  static const String setting = '/settings';
  static const String clubPoint = '/club-points';

  static const String terms = '/terms';
  static const String privacyPolicy = '/privacy-policy';
  static const String returnPolicy = '/return-policy';
  static const String contactUs = '/contact';
  static const String search = '/search';
  static const String notificationList = '/notifications';

  static const String knowledgeBase = '/help';
  static const String knowledgeBaseDetails = '/help/:id';
  static const String knowledgeBaseDetailsStandalone = '/help-standalone/:id';

  static const String referral = '/referral';
  static const String referralCode = '/referral/code';
  static const String cmsContent = 'cms-content';
  static const String noInternet = '/no-internet';
}
