import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/utils/delivery_time_utils.dart';

void main() {
  group('DeliveryTimeUtils - Express Delivery Rules', () {
    test('Non-Friday morning (12:00 AM - 11:59 AM) -> Delivery by Today', () {
      // Monday 00:00 (Midnight)
      final mondayMidnight = DateTime(2026, 9, 7, 0, 0);
      expect(DeliveryTimeUtils.isExpressToday(now: mondayMidnight), isTrue);
      expect(DeliveryTimeUtils.getExpressTargetText(now: mondayMidnight), 'Today');

      // Wednesday 11:59 AM
      final wednesdayMorning = DateTime(2026, 9, 9, 11, 59);
      expect(DeliveryTimeUtils.isExpressToday(now: wednesdayMorning), isTrue);
      expect(DeliveryTimeUtils.getExpressTargetText(now: wednesdayMorning), 'Today');
    });

    test('Non-Friday afternoon/night (12:00 PM - 11:59 PM) -> Delivery by Tomorrow', () {
      // Monday 12:00 PM (Noon)
      final mondayNoon = DateTime(2026, 9, 7, 12, 0);
      expect(DeliveryTimeUtils.isExpressToday(now: mondayNoon), isFalse);
      expect(DeliveryTimeUtils.getExpressTargetText(now: mondayNoon), 'Tomorrow');

      // Thursday 23:59 (Late Night)
      final thursdayNight = DateTime(2026, 9, 10, 23, 59);
      expect(DeliveryTimeUtils.isExpressToday(now: thursdayNight), isFalse);
      expect(DeliveryTimeUtils.getExpressTargetText(now: thursdayNight), 'Tomorrow');
    });

    test('Friday skip rule: Any time on Friday -> Delivery by Tomorrow (Saturday)', () {
      // Friday 00:00 (Midnight)
      final fridayMidnight = DateTime(2026, 9, 11, 0, 0);
      expect(fridayMidnight.weekday, DateTime.friday);
      expect(DeliveryTimeUtils.isExpressToday(now: fridayMidnight), isFalse);
      expect(DeliveryTimeUtils.getExpressTargetText(now: fridayMidnight), 'Tomorrow');

      // Friday 09:30 AM (Even before 12 PM, Friday orders cannot be delivered today)
      final fridayMorning = DateTime(2026, 9, 11, 9, 30);
      expect(DeliveryTimeUtils.isExpressToday(now: fridayMorning), isFalse);
      expect(DeliveryTimeUtils.getExpressTargetText(now: fridayMorning), 'Tomorrow');

      // Friday 15:00 (Afternoon)
      final fridayAfternoon = DateTime(2026, 9, 11, 15, 0);
      expect(DeliveryTimeUtils.isExpressToday(now: fridayAfternoon), isFalse);
      expect(DeliveryTimeUtils.getExpressTargetText(now: fridayAfternoon), 'Tomorrow');
    });
  });

  group('DeliveryTimeUtils - Location Selector Delivery Text', () {
    test('Non-express returns "Delivery by 3-4 working days"', () {
      expect(
        DeliveryTimeUtils.getLocationSelectorDeliveryText(isExpress: false),
        'Delivery by 3-4 working days',
      );
    });

    test('Express before 12 PM on weekday returns "Delivery by Today"', () {
      final morning = DateTime(2026, 9, 8, 10, 0); // Tuesday 10am
      expect(
        DeliveryTimeUtils.getLocationSelectorDeliveryText(isExpress: true, now: morning),
        'Delivery by Today',
      );
    });

    test('Express after 12 PM on weekday returns "Delivery by Tomorrow"', () {
      final afternoon = DateTime(2026, 9, 8, 14, 0); // Tuesday 2pm
      expect(
        DeliveryTimeUtils.getLocationSelectorDeliveryText(isExpress: true, now: afternoon),
        'Delivery by Tomorrow',
      );
    });

    test('Express on Friday returns "Delivery by Tomorrow" regardless of time', () {
      final fridayMorning = DateTime(2026, 9, 11, 10, 0);
      expect(
        DeliveryTimeUtils.getLocationSelectorDeliveryText(isExpress: true, now: fridayMorning),
        'Delivery by Tomorrow',
      );
    });
  });

  group('DeliveryTimeUtils - Trust Ribbon Delivery Info', () {
    test('Express morning returns label "Delivery by " and boldSuffix "Today"', () {
      final morning = DateTime(2026, 9, 9, 9, 0);
      final info = DeliveryTimeUtils.getTrustRibbonDeliveryInfo(isExpress: true, now: morning);
      expect(info.label, 'Delivery by ');
      expect(info.boldSuffix, 'Today');
    });

    test('Express afternoon returns label "Delivery by " and boldSuffix "Tomorrow"', () {
      final afternoon = DateTime(2026, 9, 9, 16, 0);
      final info = DeliveryTimeUtils.getTrustRibbonDeliveryInfo(isExpress: true, now: afternoon);
      expect(info.label, 'Delivery by ');
      expect(info.boldSuffix, 'Tomorrow');
    });

    test('Express on Friday returns label "Delivery by " and boldSuffix "Tomorrow"', () {
      final fridayMorning = DateTime(2026, 9, 11, 8, 0);
      final info = DeliveryTimeUtils.getTrustRibbonDeliveryInfo(isExpress: true, now: fridayMorning);
      expect(info.label, 'Delivery by ');
      expect(info.boldSuffix, 'Tomorrow');
    });

    test('Non-express returns label "Delivery by " and boldSuffix "3-4 working days"', () {
      final info = DeliveryTimeUtils.getTrustRibbonDeliveryInfo(isExpress: false);
      expect(info.label, 'Delivery by ');
      expect(info.boldSuffix, '3-4 working days');
    });
  });

  group('DeliveryTimeUtils - Product Item Delivery Info', () {
    test('Express morning returns label "Delivery by " and target "Today"', () {
      final morning = DateTime(2026, 9, 9, 9, 0);
      final info = DeliveryTimeUtils.getProductItemDeliveryInfo(isExpress: true, now: morning);
      expect(info.label, 'Delivery by ');
      expect(info.target, 'Today');
    });

    test('Express afternoon returns label "Delivery by " and target "Tomorrow"', () {
      final afternoon = DateTime(2026, 9, 9, 14, 0);
      final info = DeliveryTimeUtils.getProductItemDeliveryInfo(isExpress: true, now: afternoon);
      expect(info.label, 'Delivery by ');
      expect(info.target, 'Tomorrow');
    });

    test('Express Friday returns label "Delivery by " and target "Tomorrow"', () {
      final friday = DateTime(2026, 9, 11, 10, 0);
      final info = DeliveryTimeUtils.getProductItemDeliveryInfo(isExpress: true, now: friday);
      expect(info.label, 'Delivery by ');
      expect(info.target, 'Tomorrow');
    });

    test('Non-express returns label "Delivery by " and target "3-4 working days"', () {
      final info = DeliveryTimeUtils.getProductItemDeliveryInfo(isExpress: false);
      expect(info.label, 'Delivery by ');
      expect(info.target, '3-4 working days');
    });

    test('Custom deliveryInfo overrides dynamic calculation', () {
      final custom1 = DeliveryTimeUtils.getProductItemDeliveryInfo(
        isExpress: true,
        customDeliveryInfo: 'Delivery by 25 Dec',
      );
      expect(custom1.label, 'Delivery by ');
      expect(custom1.target, '25 Dec');

      final custom2 = DeliveryTimeUtils.getProductItemDeliveryInfo(
        isExpress: false,
        customDeliveryInfo: 'Get delivery in 7-10 days',
      );
      expect(custom2.label, 'Delivery by ');
      expect(custom2.target, '7-10 days');

      final custom3 = DeliveryTimeUtils.getProductItemDeliveryInfo(
        isExpress: false,
        customDeliveryInfo: 'Pickup in store',
      );
      expect(custom3.label, 'Delivery by ');
      expect(custom3.target, 'Pickup in store');
    });
  });
}
