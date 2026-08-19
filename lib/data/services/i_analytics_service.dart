import 'dart:convert';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:injectable/injectable.dart';
import 'analytics_service.dart';

@LazySingleton(as: AnalyticsService)
class IAnalyticsService implements AnalyticsService {
  final FirebaseAnalytics _firebase = FirebaseAnalytics.instance;
  final FacebookAppEvents _facebook = FacebookAppEvents();

  @override
  Future<void> init() async {
    try {
      await _firebase.setAnalyticsCollectionEnabled(true);

      final status =
          await AppTrackingTransparency.requestTrackingAuthorization();
      final tracking = status == TrackingStatus.authorized;

      await _facebook.setAutoLogAppEventsEnabled(true);
      await _facebook.setAdvertiserTracking(enabled: tracking);
    } catch (_) {
    }
  }

  @override
  Future<void> logViewItem({
    required String id,
    required String name,
    required double price,
    String? category,
  }) async {
    await _firebase.logViewItem(
      currency: 'BDT',
      value: price,
      items: [AnalyticsEventItem(itemId: id, itemName: name, price: price)],
    );

    await _facebook.logEvent(
      name: 'ViewContent',
      parameters: {
        'content_ids': id,
        'content_type': 'product',
        'value': price,
        'currency': 'BDT',
        'description': name,
      },
    );
  }

  @override
  Future<void> logAddToCart({
    required String id,
    required String name,
    required double price,
    int quantity = 1,
  }) async {
    await _firebase.logAddToCart(
      currency: 'BDT',
      value: price * quantity,
      items: [
        AnalyticsEventItem(
          itemId: id,
          itemName: name,
          price: price,
          quantity: quantity,
        ),
      ],
    );

    await _facebook.logAddToCart(
      id: id,
      type: 'product',
      currency: 'BDT',
      price: price,
    );
  }

  @override
  Future<void> logAddToWishlist({
    required String id,
    String name = '',
    double price = 0,
    String? brand,
    String? category,
  }) async {
    try {
      await _firebase.logAddToWishlist(
        currency: 'BDT',
        value: price,
        items: [
          AnalyticsEventItem(
            itemId: id,
            itemName: name,
            price: price,
            itemBrand: brand,
            itemCategory: category,
          ),
        ],
      );

      await _facebook.logEvent(
        name: 'AddToWishlist',
        parameters: _clean({
          'content_type': 'product',
          'content_ids': jsonEncode([id]),
          'value': price,
          'currency': 'BDT',
          'content_name': name,
        }),
      );
    } catch (_) {}
  }

  @override
  Future<void> logViewCategory({
    required String categoryId,
    required String categoryName,
  }) async {
    try {
      final params = _clean({
        'content_type': 'product_group',
        'content_ids': categoryId,
        'content_name': categoryName,
        'currency': 'BDT',
      });
      await _firebase.logEvent(name: 'ViewCategory', parameters: params);
      await _facebook.logEvent(name: 'ViewCategory', parameters: params);
    } catch (_) {}
  }

  @override
  Future<void> logSearch({required String searchString}) async {
    try {
      await _firebase.logSearch(searchTerm: searchString);
      await _facebook.logEvent(
        name: 'Search',
        parameters: _clean({'search_string': searchString}),
      );
    } catch (_) {}
  }

  @override
  Future<void> logBeginCheckout({
    required double value,
    String? coupon,
    required List<Map<String, dynamic>> items,
  }) async {
    try {
      await _firebase.logBeginCheckout(
        value: value,
        currency: 'BDT',
        coupon: coupon,
        items: _toEventItems(items),
      );

      await _facebook.logEvent(
        name: 'InitiateCheckout',
        parameters: _clean({
          'content_type': 'product',
          'num_items': items.length,
          'value': value,
          'currency': 'BDT',
          'content_ids': jsonEncode(items.map((e) => e['id']).toList()),
          'content_name': jsonEncode(items.map((e) => e['name']).toList()),
        }),
      );
    } catch (_) {}
  }

  @override
  Future<void> logAddShippingInfo({
    required double value,
    String? coupon,
    String? shippingTier,
    required List<Map<String, dynamic>> items,
  }) async {
    try {
      await _firebase.logAddShippingInfo(
        value: value,
        currency: 'BDT',
        coupon: coupon,
        shippingTier: shippingTier,
        items: _toEventItems(items),
      );

      await _facebook.logEvent(
        name: 'AddShippingInfo',
        parameters: _clean({
          'content_type': 'product',
          'num_items': items.length,
          'value': value,
          'currency': 'BDT',
          'content_ids': jsonEncode(items.map((e) => e['id']).toList()),
          'content_name': jsonEncode(items.map((e) => e['name']).toList()),
        }),
      );
    } catch (_) {}
  }

  @override
  Future<void> logAddPaymentInfo({
    required double value,
    String? coupon,
    String? paymentType,
    required List<Map<String, dynamic>> items,
  }) async {
    try {
      await _firebase.logAddPaymentInfo(
        value: value,
        currency: 'BDT',
        coupon: coupon,
        paymentType: paymentType,
        items: _toEventItems(items),
      );

      await _facebook.logEvent(
        name: 'AddPaymentInfo',
        parameters: _clean({
          'content_type': 'product',
          'num_items': items.length,
          'value': value,
          'currency': 'BDT',
          'content_ids': jsonEncode(items.map((e) => e['id']).toList()),
          'content_name': jsonEncode(items.map((e) => e['name']).toList()),
        }),
      );
    } catch (_) {}
  }

  @override
  Future<void> logPurchase({
    required String orderId,
    required double total,
    required List<Map<String, dynamic>> items,
  }) async {
    await _firebase.logPurchase(
      transactionId: orderId,
      value: total,
      currency: 'BDT',
      items: items
          .map(
            (i) => AnalyticsEventItem(
              itemId: i['id'],
              itemName: i['name'],
              price: i['price'].toDouble(),
              quantity: i['qty'] is int
                  ? i['qty']
                  : int.tryParse(i['qty'].toString()) ?? 1,
            ),
          )
          .toList(),
    );

    await _facebook.logPurchase(
      amount: total,
      currency: 'BDT',
      parameters: {
        'order_id': orderId,
        'content_ids': items.map((e) => e['id']).join(','),
      },
    );
  }

  @override
  Future<void> logOrderSuccess({
    String? transactionId,
    required double value,
    required List<Map<String, dynamic>> items,
  }) async {
    try {
      final params = _clean({
        'num_items': items.length,
        'value': value,
        'currency': 'BDT',
        'content_ids': jsonEncode(items.map((e) => e['id']).toList()),
        'content_name': jsonEncode(items.map((e) => e['name']).toList()),
        'transaction_id': transactionId,
      });
      await _firebase.logEvent(name: 'Success', parameters: params);
      await _facebook.logEvent(name: 'Success', parameters: params);
    } catch (_) {}
  }

  @override
  Future<void> logHome({String? customerId, String? customerGroup}) async {
    try {
      await _firebase.logEvent(
        name: 'home',
        parameters: _clean({
          'ecomm_pagetype': 'home',
          'customerId': customerId,
          'customerGroup': customerGroup,
        }),
      );
    } catch (_) {}
  }

  @override
  Future<void> logBannerView({
    required String identifier,
    required String title,
    required String entityId,
    required String position,
    String? imagePosition,
    String? pageType,
    String? imageUrl,
  }) async {
    try {
      await _firebase.logEvent(
        name: 'banner_view',
        parameters: _clean({
          'banner_identifier': identifier,
          'banner_title': title,
          'banner_id': entityId,
          'banner_position': position,
          'banner_image_position': imagePosition,
          'page_type': pageType,
          'image_url': imageUrl,
        }),
      );
      await _facebook.logEvent(
        name: 'BannerView',
        parameters: _clean({
          'content_type': 'banner',
          'content_name': title,
          'content_ids': jsonEncode([entityId]),
        }),
      );
    } catch (_) {}
  }

  @override
  Future<void> logBannerClick({
    required String identifier,
    required String title,
    required String entityId,
    required String position,
    String? imagePosition,
    String? pageType,
    String? imageUrl,
  }) async {
    try {
      await _firebase.logEvent(
        name: 'banner_click',
        parameters: _clean({
          'banner_identifier': identifier,
          'banner_title': title,
          'banner_id': entityId,
          'banner_position': position,
          'banner_image_position': imagePosition,
          'page_type': pageType,
          'image_url': imageUrl,
        }),
      );
      await _facebook.logEvent(
        name: 'BannerClick',
        parameters: _clean({
          'content_type': 'banner',
          'content_name': title,
          'content_ids': jsonEncode([entityId]),
        }),
      );
    } catch (_) {}
  }

  @override
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
  }) async {
    try {
      await _firebase.logEvent(
        name: 'click',
        parameters: _clean({
          'section': section,
          'source': source,
          'medium': medium,
          'identifier': identifier,
          'title': title,
          'entity_id': entityId,
          'position': position,
          'link_url': linkUrl,
          'page_type': pageType,
        }),
      );
    } catch (_) {}
  }

  List<AnalyticsEventItem> _toEventItems(List<Map<String, dynamic>> items) {
    return items
        .map(
          (i) => AnalyticsEventItem(
            itemId: i['id']?.toString(),
            itemName: i['name']?.toString(),
            price: (i['price'] as num?)?.toDouble(),
            quantity: i['quantity'] is int
                ? i['quantity']
                : int.tryParse(i['quantity']?.toString() ?? '') ?? 1,
            itemBrand: i['brand']?.toString(),
            itemCategory: i['category']?.toString(),
          ),
        )
        .toList();
  }

  Map<String, Object> _clean(Map<String, dynamic> params) {
    final out = <String, Object>{};
    params.forEach((key, value) {
      if (value == null) return;
      if (value is List || value is Map) {
        out[key] = jsonEncode(value);
      } else {
        out[key] = value as Object;
      }
    });
    return out;
  }

  @override
  Future<void> logEvent({
    required String name,
    Map<String, dynamic>? parameters,
  }) async {
    await _firebase.logEvent(
      name: name,
      parameters: parameters?.cast<String, Object>(),
    );

    Map<String, dynamic>? sanitizedParams;
    if (parameters != null) {
      sanitizedParams = Map.from(parameters);
      sanitizedParams.forEach((key, value) {
        if (value is List || value is Map) {
          sanitizedParams![key] = jsonEncode(value);
        }
      });
    }

    await _facebook.logEvent(name: name, parameters: sanitizedParams);
  }
}
