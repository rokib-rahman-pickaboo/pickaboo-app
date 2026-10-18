import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/data/model/order/order_detail_response/order_detail_response.dart';
import 'package:pickaboo/data/mapper/order_mapper/order_detail_mapper.dart';

void main() {
  group('OrderDetailResponse.fromJson date parsing', () {
    test('successfully parses OrderDetailResponse with 12-hour AM/PM created_at', () {
      final json = {
        'order_id': 3595,
        'order_number': 'ORD-3595',
        'customer_id': 1234,
        'created_at': '2026-09-13 04:03:20 PM',
        'state': 'processing',
        'status': 'processing',
        'items': [],
        'status_history': [
          {
            'entity_id': '101',
            'status': 'pending',
            'comment': 'Order placed',
            'created_at': '2026-09-13 04:03:20 PM',
          }
        ],
      };

      final response = OrderDetailResponse.fromJson(json);

      expect(response.orderId, equals(3595));
      expect(response.createdAt, isNotNull);
      expect(response.createdAt!.year, equals(2026));
      expect(response.createdAt!.hour, equals(16));
      expect(response.createdAt!.minute, equals(3));
      expect(response.createdAt!.second, equals(20));

      expect(response.statusHistory, isNotEmpty);
      final history = response.statusHistory!.first;
      expect(history.createdAt, isNotNull);
      expect(history.createdAt!.hour, equals(16));

      // Test mapping to entity
      final entity = response.toEntity();
      expect(entity.orderId, equals(3595));
      expect(entity.createdAt, isNotEmpty);
      expect(entity.statusHistory.first.createdAt, isNotEmpty);
    });

    test('handles standard ISO 8601 created_at seamlessly', () {
      final json = {
        'order_id': 3595,
        'order_number': 'ORD-3595',
        'created_at': '2026-09-13T16:03:20.000Z',
      };

      final response = OrderDetailResponse.fromJson(json);
      expect(response.createdAt, isNotNull);
      expect(response.createdAt!.year, equals(2026));
    });

    test('handles null or missing created_at without error', () {
      final json = {
        'order_id': 3595,
      };

      final response = OrderDetailResponse.fromJson(json);
      expect(response.createdAt, isNull);
    });
  });

  group('OrderDetailResponse.fromJson entity_name parsing', () {
    test('successfully parses shipment in status_history without ArgumentError', () {
      final json = {
        'order_id': 3595,
        'order_number': 'ORD-3595',
        'status_history': [
          {
            'entity_id': '101',
            'status': 'complete',
            'entity_name': 'shipment',
            'created_at': '2026-09-13 04:03:20 PM',
          },
          {
            'entity_id': '102',
            'status': 'processing',
            'entity_name': 'invoice',
          },
          {
            'entity_id': '103',
            'status': 'pending',
            'entity_name': 'order',
          },
          {
            'entity_id': '104',
            'status': 'refunded',
            'entity_name': 'creditmemo',
          },
          {
            'entity_id': '105',
            'status': 'custom',
            'entity_name': 'unknown_custom_entity',
          },
        ],
      };

      final response = OrderDetailResponse.fromJson(json);
      expect(response.statusHistory, hasLength(5));
      expect(response.statusHistory![0].entityName, equals(EntityName.shipment));
      expect(response.statusHistory![1].entityName, equals(EntityName.invoice));
      expect(response.statusHistory![2].entityName, equals(EntityName.order));
      expect(response.statusHistory![3].entityName, equals(EntityName.creditmemo));
      expect(response.statusHistory![4].entityName, isNull);

      // Verify mapping to entity works without issues
      final entity = response.toEntity();
      expect(entity.statusHistory, hasLength(5));
    });

    test('safeEntityNameFromJson parses all known entities and handles unknown safely', () {
      expect(safeEntityNameFromJson('shipment'), equals(EntityName.shipment));
      expect(safeEntityNameFromJson('SHIPMENT'), equals(EntityName.shipment));
      expect(safeEntityNameFromJson('invoice'), equals(EntityName.invoice));
      expect(safeEntityNameFromJson('order'), equals(EntityName.order));
      expect(safeEntityNameFromJson('creditmemo'), equals(EntityName.creditmemo));
      expect(safeEntityNameFromJson('any_unsupported_string'), isNull);
      expect(safeEntityNameFromJson(null), isNull);
    });
  });

  group('OrderDetailResponse convenience fee and EMI parsing', () {
    test('parses explicit convenience_fee and convenience_fee_percent from JSON', () {
      final json = {
        'order_id': 3595,
        'order_number': 'ORD-3595',
        'order_summary': {
          'subtotal': 19990,
          'shipping_fee': 500,
          'discount_amount': 0,
          'grand_total': 22232,
          'convenience_fee': 1741.65,
          'convenience_fee_percent': '8.5%',
        },
        'payment_information': [
          {'code': 'payment_mode', 'title': 'Payment Mode', 'value': 'Card on delivery'},
          {'code': 'emi_tenure', 'title': 'EMI Tenure', 'value': '12'},
          {'code': 'emi_bank', 'title': 'EMI Bank', 'value': 'United Commercial Bank'},
        ],
      };

      final response = OrderDetailResponse.fromJson(json);
      final entity = response.toEntity();

      expect(entity.orderSummary.convenienceFee, equals(1741.65));
      expect(entity.orderSummary.convenienceFeePercent, equals('8.5%'));
      expect(entity.orderSummary.grandTotal, equals(22232));
      expect(entity.paymentInformation, hasLength(3));
      expect(entity.paymentInformation[0].title, equals('Payment Mode'));
      expect(entity.paymentInformation[0].value, equals('Card on delivery'));
      expect(entity.paymentInformation[1].title, equals('EMI Tenure'));
      expect(entity.paymentInformation[1].value, equals('12'));
      expect(entity.paymentInformation[2].title, equals('EMI Bank'));
      expect(entity.paymentInformation[2].value, equals('United Commercial Bank'));
    });

    test('calculates fallback convenience fee and percentage when missing from api entity', () {
      final json = {
        'order_id': 3595,
        'order_number': 'ORD-3595',
        'order_summary': {
          'subtotal': 19990,
          'shipping_fee': 500,
          'discount_amount': 0,
          'grand_total': 22232,
        },
        'payment_mode': 'Card on delivery',
        'emi_tenure': 12,
        'emi_bank': 'United Commercial Bank',
      };

      final response = OrderDetailResponse.fromJson(json);
      final entity = response.toEntity();

      expect(entity.orderSummary.convenienceFee, closeTo(1742, 0.5));
      expect(entity.orderSummary.convenienceFeePercent, equals('8.5%'));
      expect(entity.paymentInformation.any((p) => p.code == 'payment_mode' && p.value == 'Card on delivery'), isTrue);
      expect(entity.paymentInformation.any((p) => p.code == 'emi_tenure' && p.value == '12'), isTrue);
      expect(entity.paymentInformation.any((p) => p.code == 'emi_bank' && p.value == 'United Commercial Bank'), isTrue);
    });

    test('safePaymentInformationFromJson handles map format gracefully', () {
      final json = {
        'order_id': 3595,
        'order_number': 'ORD-3595',
        'payment_information': {
          'payment_mode': 'Card on delivery',
          'emi_tenure': 12,
          'emi_bank': 'United Commercial Bank',
        },
      };

      final response = OrderDetailResponse.fromJson(json);
      expect(response.paymentInformation, isNotNull);
      expect(response.paymentInformation, hasLength(3));
      final entity = response.toEntity();
      expect(entity.paymentInformation, hasLength(3));
    });
  });

  group('OrderDetailResponse status_label and status_history resilience', () {
    test('successfully parses status_label when API returns List<String>', () {
      final json = {
        'order_id': 1237723,
        'order_number': '1710711744',
        'status_label': [
          'Delivered',
          'Complete',
          'Authorized',
          'In Delivery',
          'Processing',
          'Order Placed',
          'Processing for Delivery',
        ],
        'status_history': [
          {
            'status': 'processing_for_delivery',
            'label': 'Processing for Delivery',
            'time': '2026-10-04 05:17:53 PM',
          },
          {
            'status': 'pending',
            'label': 'Order Placed',
            'time': '2026-10-04 04:30:28 PM',
          }
        ],
      };

      // Must not throw "type 'String' is not a subtype of type 'Map<String, dynamic>' in type cast"
      final response = OrderDetailResponse.fromJson(json);
      expect(response.statusLabel, hasLength(7));
      expect(response.statusLabel!.first.status, equals('Delivered'));
      expect(response.statusHistory, hasLength(2));
      expect(response.statusHistory!.first.status, equals('processing_for_delivery'));

      final entity = response.toEntity();
      expect(entity.statusLabel, hasLength(7));
      expect(entity.statusHistory, hasLength(2));
      expect(entity.statusHistory.first.status, equals('processing_for_delivery'));
      expect(entity.statusHistory.first.createdAt, isNotEmpty);
    });

    test('successfully parses status_label when API returns List<Map<String, dynamic>>', () {
      final json = {
        'order_id': 1237723,
        'status_label': [
          {'status': 'delivered', 'state': 'complete'},
          {'status': 'processing', 'state': 'processing'},
        ],
      };

      final response = OrderDetailResponse.fromJson(json);
      expect(response.statusLabel, hasLength(2));
      expect(response.statusLabel!.first.status, equals('delivered'));
      expect(response.statusLabel!.first.state, equals('complete'));
    });

    test('prioritizes status_history_new and populates label and time directly from API', () {
      final json = {
        'order_id': 1237723,
        'status_history': [
          {
            'status': 'legacy_status',
            'created_at': '2026-10-04 05:17:53 PM',
            'entity_name': 'invoice',
          }
        ],
        'status_history_new': [
          {
            'status': 'processing_for_delivery',
            'label': 'Processing for Delivery',
            'time': '2026-10-04 05:17:53 PM',
          },
          {
            'status': 'pending',
            'label': 'Order Placed',
            'time': '2026-10-04 04:30:28 PM',
          }
        ],
      };

      final response = OrderDetailResponse.fromJson(json);
      expect(response.statusHistoryNew, hasLength(2));
      expect(response.statusHistoryNew![0].label, equals('Processing for Delivery'));
      expect(response.statusHistoryNew![0].timeRaw, equals('2026-10-04 05:17:53 PM'));

      final entity = response.toEntity();
      // Should prioritize status_history_new over legacy status_history
      expect(entity.statusHistory, hasLength(2));
      expect(entity.statusHistory[0].label, equals('Processing for Delivery'));
      expect(entity.statusHistory[0].time, equals('2026-10-04 05:17:53 PM'));
      expect(entity.statusHistory[1].label, equals('Order Placed'));
      expect(entity.statusHistory[1].time, equals('2026-10-04 04:30:28 PM'));
    });
  });
}
