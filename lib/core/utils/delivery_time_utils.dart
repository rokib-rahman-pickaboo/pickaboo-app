/// Utility class for calculating standardized delivery estimates across:
/// - Product Item cards (ProductView, ListProductView, SliderProductView)
/// - PDP Details Price Section
/// - PDP Delivery Location Selector
class DeliveryTimeUtils {
  const DeliveryTimeUtils._();

  /// Returns whether an express delivery can be fulfilled today.
  ///
  /// Business Rules:
  /// - Friday is the weekend in Bangladesh: orders placed anytime on Friday cannot be delivered today.
  /// - On any other day:
  ///   - 12:00 AM – 11:59 AM (`hour < 12`) -> Today
  ///   - 12:00 PM – 11:59 PM (`hour >= 12`) -> Tomorrow
  static bool isExpressToday({DateTime? now}) {
    final current = now ?? DateTime.now();
    if (current.weekday == DateTime.friday) {
      return false;
    }
    return current.hour < 12;
  }

  /// Returns express target text: "Today" or "Tomorrow"
  static String getExpressTargetText({DateTime? now}) {
    return isExpressToday(now: now) ? 'Today' : 'Tomorrow';
  }

  /// Standard/Non-express delivery target text: "2-3 days"
  static const String standardDeliveryDays = '2-3 days';

  /// Standard/Non-express full phrase: "Tentative 2-3 days"
  static const String standardDeliveryText = 'Tentative 2-3 days';

  /// Returns one of the 3 standardized delivery tags:
  /// - "Delivery by Today"
  /// - "Delivery by Tomorrow"
  /// - "Tentative 2-3 days"
  static String getDeliveryTag({
    required bool isExpress,
    DateTime? now,
  }) {
    if (!isExpress) {
      return standardDeliveryText;
    }
    return 'Delivery by ${getExpressTargetText(now: now)}';
  }

  /// Location selector text in PDP:
  /// - Express: "Delivery by Today" or "Delivery by Tomorrow"
  /// - Non-Express: "Tentative 2-3 days"
  static String getLocationSelectorDeliveryText({
    required bool isExpress,
    DateTime? now,
  }) {
    return getDeliveryTag(isExpress: isExpress, now: now);
  }

  /// Product Item delivery info in Product Cards (ProductView, ListProductView, SliderProductView):
  /// - Express: label "Delivery by ", target "Today" or "Tomorrow"
  /// - Non-Express: label "Tentative ", target "2-3 days"
  static ({String label, String target}) getProductItemDeliveryInfo({
    required bool isExpress,
    String? customDeliveryInfo,
    DateTime? now,
  }) {
    if (isExpress) {
      return (
        label: 'Delivery by ',
        target: getExpressTargetText(now: now),
      );
    }
    return (
      label: 'Tentative ',
      target: standardDeliveryDays,
    );
  }
}
