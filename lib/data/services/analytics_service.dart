abstract class AnalyticsService {
  Future<void> init();

  Future<void> logViewItem({
    required String id,
    required String name,
    required double price,
    String? category,
    String? categoryId,
    String? brand,
    String? brandId,
  });

  Future<void> logAddToCart({
    required String id,
    required String name,
    required double price,
    int quantity = 1,
    String? categoryId,
    String? brand,
    String? brandId,
  });

  Future<void> logAddToWishlist({
    required String id,
    String name = '',
    double price = 0,
    String? brand,
    String? category,
  });

  Future<void> logViewCategory({
    required String categoryId,
    required String categoryName,
  });

  Future<void> logSearch({required String searchString});

  Future<void> logBeginCheckout({
    required double value,
    String? coupon,
    required List<Map<String, dynamic>> items,
  });

  Future<void> logAddShippingInfo({
    required double value,
    String? coupon,
    String? shippingTier,
    required List<Map<String, dynamic>> items,
  });

  Future<void> logAddPaymentInfo({
    required double value,
    String? coupon,
    String? paymentType,
    required List<Map<String, dynamic>> items,
  });

  Future<void> logPurchase({
    required String orderId,
    required double total,
    required List<Map<String, dynamic>> items,
  });

  Future<void> logOrderSuccess({
    String? transactionId,
    required double value,
    required List<Map<String, dynamic>> items,
  });

  Future<void> logHome({String? customerId, String? customerGroup});

  Future<void> logBannerView({
    required String identifier,
    required String title,
    required String entityId,
    required String position,
    String? imagePosition,
    String? pageType,
    String? imageUrl,
  });

  Future<void> logBannerClick({
    required String identifier,
    required String title,
    required String entityId,
    required String position,
    String? imagePosition,
    String? pageType,
    String? imageUrl,
  });

  Future<void> logClick({
    required String section,
    required String source,
    required String medium,
    String? identifier,
    String? title,
    String? entityId,
    String? position,
    String? linkUrl,
    String? pageType,
  });

  Future<void> logEvent({
    required String name,
    Map<String, dynamic>? parameters,
  });
}
