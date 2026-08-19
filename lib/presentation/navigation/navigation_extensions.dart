import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/domain/entity/checkout/payment_methods_entity.dart';
import 'route_constants.dart';
import 'package:url_launcher/url_launcher.dart';

extension NavigationExtensions on BuildContext {

  void goToProductDetail(
    String productId, {
    String? slug,
    String? productName,
  }) {
    final path = Routes.productDetail.replaceAll(':id', productId);
    final query = <String, String>{};
    if (slug != null && slug.trim().isNotEmpty) {
      query['slug'] = slug;
    }
    if (productName != null && productName.trim().isNotEmpty) {
      query['name'] = productName;
    }
    push(Uri(path: path, queryParameters: query.isEmpty ? null : query).toString());
  }

  void goToProductReviews(String productId) {
    push('/product/$productId/reviews');
  }

  void goToWriteReview(
    String productId, {
    String? productName,
    String? productImage,
  }) {
    push(
      '/product/$productId/review/write',
      extra: {'productName': productName, 'productImage': productImage},
    );
  }

  void goToProductComparison(String productId) {
    push('/product/$productId/${Routes.productComparison}');
  }

  void goToShop(String shopId) {
    go(Routes.productShop.replaceAll(':id', shopId));
  }

  void goToSearch({String? query}) {
    if (query != null && query.isNotEmpty) {
      go('${Routes.search}?q=${Uri.encodeComponent(query)}');
    } else {
      go(Routes.search);
    }
  }

  void goToCart({bool guest = false}) {
    go(guest ? Routes.cartGuest : Routes.cart);
  }

  void goToOrderDetails(String orderId) {
    go(Routes.orderDetails.replaceAll(':id', orderId));
  }

  void goToOrderPlaced({String? orderId, int earnedPoints = 0}) {
    if (orderId != null) {
      go(
        '${Routes.orderPlaced}'
        '?orderId=${Uri.encodeComponent(orderId)}'
        '&earnedPoints=$earnedPoints',
      );
    } else {
      go(Routes.orderPlaced);
    }
  }

  void goToOrderFailed({String? orderId}) {
    if (orderId != null) {
      go('${Routes.orderFailed}?orderId=${Uri.encodeComponent(orderId)}');
    } else {
      go(Routes.orderFailed);
    }
  }

  void goToOrderCancelled({String? orderId}) {
    if (orderId != null) {
      go('${Routes.orderCancelled}?orderId=${Uri.encodeComponent(orderId)}');
    } else {
      go(Routes.orderCancelled);
    }
  }

  void goToOrderPayment({
    String? orderId,
    String? selectedMethod,
    double? grandTotal,
    double? subtotal,
    double? shippingAmount,
    double? discountAmount,
    int? itemsCount,
    String? quoteId,
  }) {
    push(
      Routes.orderPayment,
      extra: {
        'orderId': orderId,
        'selectedMethod': selectedMethod,
        'grandTotal': grandTotal,
        'subtotal': subtotal,
        'shippingAmount': shippingAmount,
        'discountAmount': discountAmount,
        'itemsCount': itemsCount,
        'quoteId': quoteId,
      },
    );
  }

  void goToOrderList() {
    go(Routes.orderList);
  }

  void goToTicketDetail(String ticketId) {
    go(Routes.ticketDetail.replaceAll(':id', ticketId));
  }

  void goToCreateTicket() {
    go(Routes.createTicket);
  }

  void goToKnowledgeBaseArticle(String articleId) {
    go(Routes.knowledgeBaseDetails.replaceAll(':id', articleId));
  }

  void goToContactUs() {
    go(Routes.contactUs);
  }

  void goToDiscoverCategory() {
    go(Routes.discoverCategory);
  }

  void pushToCategoryProduct({
    required String categoryId,
    String? categorySlug,
    String? categoryName,
  }) {
    final params = <String>[];
    params.add('categoryId=${Uri.encodeComponent(categoryId.toString())}');
    if (categorySlug != null && categorySlug.isNotEmpty) {
      params.add('categorySlug=${Uri.encodeComponent(categorySlug)}');
    }
    if (categoryName != null) {
      params.add('categoryName=${Uri.encodeComponent(categoryName)}');
    }

    final paramString = params.isEmpty ? '' : '?${params.join('&')}';
    push('${Routes.categoryProduct}$paramString');
  }

  void pushToSpecialCategoryProduct({
    required String categorySlug,
    String? categoryName,
  }) {
    final params = <String>[];
    params.add('categorySlug=${Uri.encodeComponent(categorySlug)}');
    if (categoryName != null) {
      params.add('categoryName=${Uri.encodeComponent(categoryName)}');
    }

    final paramString = params.isEmpty ? '' : '?${params.join('&')}';
    push('${Routes.specialCategoryProduct}$paramString');
  }

  void pushToBrandProduct({
    required String brandKey,
    String? brandSlug,
    String? brandName,
  }) {
    final params = <String>[];
    params.add('brandKey=${Uri.encodeComponent(brandKey.toString())}');
    if (brandSlug != null && brandSlug.isNotEmpty) {
      params.add('brandSlug=${Uri.encodeComponent(brandSlug)}');
    }
    if (brandName != null) {
      params.add('brandName=${Uri.encodeComponent(brandName)}');
    }

    final paramString = params.isEmpty ? '' : '?${params.join('&')}';
    push('${Routes.brandProduct}$paramString');
  }

  void pushToSellerProduct({
    required String shopUrl,
    String? sellerName,
    String? sellerLogo,
  }) {
    final params = <String>[];
    params.add('shopUrl=${Uri.encodeComponent(shopUrl)}');
    if (sellerName != null) {
      params.add('sellerName=${Uri.encodeComponent(sellerName)}');
    }
    if (sellerLogo != null) {
      params.add('sellerLogo=${Uri.encodeComponent(sellerLogo)}');
    }

    final paramString = params.isEmpty ? '' : '?${params.join('&')}';
    push('${Routes.sellerProduct}$paramString');
  }

  Future<void> handleBannerTap({
    required String linkType,
    required String link,
    String? categoryName,
    String? urlKey,
  }) async {
    final type = linkType.trim().toLowerCase();

    switch (type) {
      case 'product':
        goToProductDetail(urlKey ?? link, slug: linkType);
        return;

      case 'category':
        pushToCategoryProduct(categoryId: urlKey ?? link, categoryName: categoryName);
        return;
      case 'special_category':
        pushToSpecialCategoryProduct(
            categorySlug: _firstNonEmpty([link, urlKey]) ?? '',
            categoryName: categoryName);
        return;

      case 'brand':
        pushToBrandProduct(
            brandKey: _firstNonEmpty([link, urlKey]) ?? '',
            brandName: categoryName);
        return;

      case 'page':
        final pageId = _firstNonEmpty([urlKey, link]);
        if (pageId != null) {
          await _openExternalLink('https://www.pickaboo.com/details/$pageId');
        }
        return;

      case 'faq':
      case 'hyperlink':
      goToKnowledgeBaseArticle(urlKey ?? link);
        return;

      case 'external':
        await _openExternalLink(_firstNonEmpty([urlKey, link]));
        return;

      default:
        if (type.isEmpty) return;
        await _openExternalLink(
          _firstNonEmpty([urlKey, link, linkType]),
        );
        return;
    }
  }

  Future<void> _openExternalLink(String? rawUrl) async {
    if (rawUrl == null) return;

    final cleaned = rawUrl.trim().replaceAll('&amp;', '&');
    if (cleaned.isEmpty || cleaned == '#') return;

    final hasScheme = RegExp(r'^[a-z][a-z0-9+\-.]*:', caseSensitive: false)
        .hasMatch(cleaned);
    final normalized = hasScheme ? cleaned : 'https://$cleaned';

    final url = Uri.tryParse(Uri.encodeFull(normalized));
    if (url == null) return;

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  String? _firstNonEmpty(List<String?> values) {
    for (final value in values) {
      if (value != null && value.trim().isNotEmpty) return value.trim();
    }
    return null;
  }

  void goToAddressList() {
    go(Routes.address);
  }

  void goToNewAddress() {
    go(Routes.newAddress);
  }

  void goToNewAddressFromCart() {
    go(Routes.newAddressCart);
  }

  void goToChangeAddress() {
    go(Routes.changeAddressCart);
  }

  void goToPaymentReview() {
    go(Routes.paymentReview);
  }

  void goToPaymentMethod({
    String? orderId,
    String? selectedMethod,
    String? cartId,
    List<PaymentMethodEntity>? availablePaymentMethods,
  }) {
    pushReplacement(
      Routes.paymentMethod,
      extra: {
        'orderId': orderId,
        'selectedMethod': selectedMethod,
        'cartId': cartId,
        'availablePaymentMethods': availablePaymentMethods,
      },
    );
  }

  void goToPaymentWebView({
    required String url,
    required String title,
    Map<String, String>? formFields,
    required Function(bool success, String? message) onPaymentResult,
    void Function(String type, String paymentId)? onBkashCallback,
    void Function(Map<String, String> params)? onNagadCallback,
    VoidCallback? onUserClosed,
  }) {
    push(
      Routes.paymentWebView,
      extra: {
        'url': url,
        'title': title,
        'formFields': formFields,
        'onPaymentResult': onPaymentResult,
        'onBkashCallback': onBkashCallback,
        'onNagadCallback': onNagadCallback,
        'onUserClosed': onUserClosed,
      },
    );
  }

  void goToPaymentOrderSummary() {
    go(Routes.paymentOrderSummary);
  }

  void goToSavedPaymentMethods() {
    go(Routes.savePayment);
  }

  void goToAddCard() {
    go(Routes.addCard);
  }

  void goToDashboard() {
    go(Routes.dashboard);
  }

  void goToAccountInfo() {
    go(Routes.accountInformation);
  }

  void goToEditAccountInfo() {
    go(Routes.editAccountInformation);
  }

  void goToWishlist() {
    go(Routes.wishlist);
  }

  void goToSettings() {
    go(Routes.setting);
  }

  void goToClubPoints() {
    go(Routes.clubPoint);
  }

  void goToLogin({
    bool isPop = false,
    bool isBuyNow = false,
    bool isPopGuest = false,
  }) {
    final params = <String>[];
    if (isPop) params.add('isPop=true');
    if (isBuyNow) params.add('isBuyNow=true');
    if (isPopGuest) params.add('isPopGuest=true');

    final paramString = params.isEmpty ? '' : '?${params.join('&')}';
    go('${Routes.login}$paramString');
  }

  void goToForgotPassword() {
    push(Routes.forgotPassword);
  }

  void goToHome() {
    go(Routes.home);
  }

  void goToReviewList() {
    go(Routes.review);
  }

  void goToYourReviews() {
    go(Routes.yourReview);
  }

  void goToTerms() {
    go(Routes.terms);
  }

  void goToPrivacy() {
    go(Routes.privacyPolicy);
  }

  void goToReturn() {
    go(Routes.returnPolicy);
  }

  void goToNotifications() {
    go(Routes.notificationList);
  }

  void goToKnowledgeBase() {
    go(Routes.knowledgeBase);
  }

  void goToReferral() {
    go(Routes.referral);
  }

  void goToReferralCode() {
    go(Routes.referralCode);
  }

  void goToRegistration() {
    go(Routes.registration);
  }

  void goToRegistrationDetail() {
    go(Routes.registrationDetail);
  }
}
