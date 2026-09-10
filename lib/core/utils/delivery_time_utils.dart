/// Utility class for calculating standardized delivery estimates across:
/// - Product Item cards (ProductView, ListProductView, SliderProductView)
/// - PDP Details Trust Ribbon
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

  /// Standard/Non-express delivery target text: "3-4 working days"
  static const String standardDeliveryDays = '3-4 working days';

  /// Standard/Non-express full phrase: "Delivery by 3-4 working days"
  static const String standardDeliveryText = 'Delivery by 3-4 working days';

  /// Location selector text in PDP:
  /// - Express: "Delivery by Today" or "Delivery by Tomorrow"
  /// - Non-Express: "Delivery by 3-4 working days"
  static String getLocationSelectorDeliveryText({
    required bool isExpress,
    DateTime? now,
  }) {
    if (!isExpress) {
      return standardDeliveryText;
    }
    return 'Delivery by ${getExpressTargetText(now: now)}';
  }

  /// Trust ribbon delivery info in PDP:
  /// - Express: label "Delivery by ", boldSuffix "Today" or "Tomorrow"
  /// - Non-Express: label "Delivery by ", boldSuffix "3-4 working days"
  static ({String label, String boldSuffix}) getTrustRibbonDeliveryInfo({
    required bool isExpress,
    DateTime? now,
  }) {
    return (
      label: 'Delivery by ',
      boldSuffix: isExpress ? getExpressTargetText(now: now) : standardDeliveryDays,
    );
  }

  /// Product Item delivery info in Product Cards (ProductView, ListProductView, SliderProductView):
  /// - If [customDeliveryInfo] is provided and non-empty, parse and return it.
  /// - Express: label "Delivery by ", target "Today" or "Tomorrow"
  /// - Non-Express: label "Delivery by ", target "3-4 working days"
  static ({String label, String target}) getProductItemDeliveryInfo({
    required bool isExpress,
    String? customDeliveryInfo,
    DateTime? now,
  }) {
    if (customDeliveryInfo != null && customDeliveryInfo.trim().isNotEmpty) {
      final text = customDeliveryInfo.trim();
      final lower = text.toLowerCase();
      if (lower.startsWith('delivery by ')) {
        return (
          label: 'Delivery by ',
          target: text.substring(12).trim(),
        );
      } else if (lower.startsWith('get delivery in ')) {
        var rest = text.substring(16).trim();
        if (rest.toLowerCase() == '3-5 working days' || rest.toLowerCase() == '3-4 working days') {
          rest = standardDeliveryDays;
        }
        return (
          label: 'Delivery by ',
          target: rest,
        );
      }
      return (label: 'Delivery by ', target: text);
    }

    return (
      label: 'Delivery by ',
      target: isExpress ? getExpressTargetText(now: now) : standardDeliveryDays,
    );
  }
}
