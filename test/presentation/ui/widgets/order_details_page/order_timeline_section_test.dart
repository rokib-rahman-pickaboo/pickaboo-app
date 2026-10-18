import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_timeline_section.dart';

void main() {
  testWidgets('OrderTimelineSection deduplicates repeated consecutive identical statuses', (tester) async {
    // Exact scenario from user's live order screenshot:
    // "Processing for Delivery" repeated 7 times at various timestamps
    final rawHistory = [
      const StatusHistoryEntity(
        entityId: 12,
        status: 'in_delivery',
        createdAt: '2026-10-12 01:38:00 AM',
      ),
      const StatusHistoryEntity(
        entityId: 11,
        status: 'processing_for_delivery',
        createdAt: '2026-10-11 11:29:00 PM',
      ),
      const StatusHistoryEntity(
        entityId: 10,
        status: 'processing_for_delivery',
        createdAt: '2026-10-11 11:29:00 PM',
      ),
      const StatusHistoryEntity(
        entityId: 9,
        status: 'processing_for_delivery',
        createdAt: '2026-10-11 11:25:00 PM',
      ),
      const StatusHistoryEntity(
        entityId: 8,
        status: 'processing_for_delivery',
        createdAt: '2026-10-11 10:43:00 PM',
      ),
      const StatusHistoryEntity(
        entityId: 7,
        status: 'processing_for_delivery',
        createdAt: '2026-10-11 10:43:00 PM',
      ),
      const StatusHistoryEntity(
        entityId: 6,
        status: 'processing_for_delivery',
        createdAt: '2026-10-11 10:43:00 PM',
      ),
      const StatusHistoryEntity(
        entityId: 5,
        status: 'processing_for_delivery',
        createdAt: '2026-10-11 10:09:00 PM',
      ),
      const StatusHistoryEntity(
        entityId: 4,
        status: 'pickup_in_progress',
        createdAt: '2026-10-11 10:04:00 PM',
      ),
      const StatusHistoryEntity(
        entityId: 3,
        status: 'authorized',
        createdAt: '2026-10-11 09:22:00 PM',
      ),
      const StatusHistoryEntity(
        entityId: 2,
        status: 'processing_for_delivery',
        createdAt: '2026-10-11 09:22:00 PM',
      ),
      const StatusHistoryEntity(
        entityId: 1,
        status: 'pending',
        createdAt: '2026-10-11 09:18:00 PM',
      ),
    ];

    String formatStatus(String s) {
      switch (s) {
        case 'in_delivery':
          return 'In Delivery';
        case 'processing_for_delivery':
          return 'Processing for Delivery';
        case 'pickup_in_progress':
          return 'Pickup In Progress';
        case 'authorized':
          return 'Authorized';
        case 'pending':
          return 'Order Placed';
        default:
          return s;
      }
    }

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, __) => MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: OrderTimelineSection(
                statusHistory: rawHistory,
                formatStatusText: formatStatus,
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // "Processing for Delivery" appeared at 09:22 PM and then at 10:09 PM.
    // The consecutive duplicates at 10:43 PM, 11:25 PM, 11:29 PM must be collapsed.
    // Instead of appearing 8 times total, it should appear only 2 times (at initial transition stages).
    final processingFinders = find.text('Processing for Delivery');
    expect(processingFinders, findsNWidgets(2));

    expect(find.text('Order Placed'), findsOneWidget);
    expect(find.text('Authorized'), findsOneWidget);
    expect(find.text('Pickup In Progress'), findsOneWidget);
    expect(find.text('In Delivery'), findsOneWidget);
  });

  testWidgets('OrderTimelineSection renders status_history_new label and time directly from API', (tester) async {
    final historyNew = [
      const StatusHistoryEntity(
        status: 'processing_for_delivery',
        label: 'Processing for Delivery',
        time: '2026-10-04 05:17:53 PM',
        createdAt: '2026-10-04 05:17:53 PM',
      ),
      const StatusHistoryEntity(
        status: 'pending',
        label: 'Order Placed',
        time: '2026-10-04 04:30:28 PM',
        createdAt: '2026-10-04 04:30:28 PM',
      ),
    ];

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, __) => MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: OrderTimelineSection(
                statusHistory: historyNew,
                formatStatusText: (s) => 'Fallback $s',
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Must display label directly from API, not the fallback formatting
    expect(find.text('Order Placed'), findsOneWidget);
    expect(find.text('Processing for Delivery'), findsOneWidget);
    expect(find.textContaining('Fallback'), findsNothing);
  });
}
