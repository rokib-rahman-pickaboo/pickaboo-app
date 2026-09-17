import 'package:collection/collection.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';

/// ============================================================================
/// 🏷️ CATEGORY QUESTION HELPER
/// Manages prioritized filter question selection across category feeds:
/// - Max 3 questions per category.
/// - If a category has specific 3 question priorities, those are used.
/// - Otherwise, defaults to:
///     1. Price (price)
///     2. Brand (manufacturer)
///     3. Express Delivery (express_delivery)
/// - Dynamically prunes options (e.g. price ranges) that have zero matching data.
/// ============================================================================
class CategoryQuestionHelper {
  /// Category-specific prioritized filter codes (max 3)
  static final Map<String, List<String>> _categoryPriorityCodes = {
    // Air Conditioner
    'air-conditioner': ['capacity', 'inverter', 'price'],
    'air conditioner': ['capacity', 'inverter', 'price'],
    '64': ['capacity', 'inverter', 'price'],

    // Television
    'television': ['screen_size', 'tv_type', 'price'],
    'televisions': ['screen_size', 'tv_type', 'price'],
    '29': ['screen_size', 'tv_type', 'price'],

    // Smartphones
    'smartphone': ['ram', 'rom', 'price'],
    'smartphones': ['ram', 'rom', 'price'],
    '171': ['ram', 'rom', 'price'],

    // Computers
    'computer-pc': ['processor', 'ram', 'price'],
    'computers': ['processor', 'ram', 'price'],
    '4': ['processor', 'ram', 'price'],

    // Washing Machine
    'washing-machine': ['capacity', 'function_type', 'price'],
    'washing machine': ['capacity', 'function_type', 'price'],
    '66': ['capacity', 'function_type', 'price'],

    // Microwave Oven
    'microwave-oven': ['capacity', 'oven_type', 'price'],
    'oven': ['capacity', 'oven_type', 'price'],
    '68': ['capacity', 'oven_type', 'price'],

    // Electronics & Appliances
    'electronics-appliances': ['price', 'manufacturer', 'express_delivery'],
    'electronics & appliances': ['price', 'manufacturer', 'express_delivery'],
    'electronics and appliances': ['price', 'manufacturer', 'express_delivery'],
    '7': ['price', 'manufacturer', 'express_delivery'],
  };

  /// Default fallback priority for any category without specific rules
  static const List<String> _defaultPriorityCodes = [
    'price',
    'manufacturer',
    'express_delivery',
  ];

  /// Extracts at most 3 filter attributes based on category priority rules.
  static List<FilterAttributeEntity> extractQuestions({
    required List<FilterAttributeEntity> attributes,
    String? categoryId,
    String? categorySlug,
    String? categoryName,
    int maxQuestions = 3,
  }) {
    if (attributes.isEmpty) return const [];

    // ============================================================================
    // 🛑 SKIP SINGLE-OPTION QUESTIONS:
    // A question with only 1 choice (e.g. price range "30 - 922990" or a single brand)
    // makes no sense to display as the user cannot make an active selection.
    // Skip price or ANY filter attribute that has only 1 option (items.length <= 1).
    // NOTE: This rule must always be maintained in future updates.
    // ============================================================================
    final validAttributes = attributes
        .where((a) => a.items.length > 1 && a.filterCode.trim().isNotEmpty)
        .toList();

    if (validAttributes.isEmpty) return const [];

    // Find category-specific priority or fallback to default
    final lookupKey = _resolveLookupKey(
      categoryId: categoryId,
      categorySlug: categorySlug,
      categoryName: categoryName,
    );

    final targetCodes = lookupKey != null && _categoryPriorityCodes.containsKey(lookupKey)
        ? _categoryPriorityCodes[lookupKey]!
        : _defaultPriorityCodes;

    final selectedQuestions = <FilterAttributeEntity>[];

    for (final code in targetCodes) {
      final match = validAttributes.firstWhereOrNull((attr) {
        final aCode = attr.filterCode.toLowerCase().trim();
        final targetCode = code.toLowerCase().trim();

        if (targetCode == 'manufacturer' || targetCode == 'brand') {
          return aCode == 'manufacturer' ||
              aCode == 'brand' ||
              aCode == 'brands' ||
              aCode == 'brand_name' ||
              aCode == 'product_brand';
        }

        return aCode == targetCode;
      });

      if (match != null && !selectedQuestions.contains(match)) {
        selectedQuestions.add(match);
      }

      if (selectedQuestions.length >= maxQuestions) {
        break;
      }
    }

    // If target priority codes did not fill all question slots (e.g., price was skipped
    // because it had only 1 option), fill remaining slots from other valid attributes
    // that have at least 2 options.
    if (selectedQuestions.length < maxQuestions) {
      for (final attr in validAttributes) {
        if (!selectedQuestions.contains(attr)) {
          selectedQuestions.add(attr);
          if (selectedQuestions.length >= maxQuestions) {
            break;
          }
        }
      }
    }

    return selectedQuestions;
  }

  /// Extracts min and max numerical bounds from a price filter item.
  static ({double min, double max})? extractPriceBounds(FilterItemEntity item) {
    // 1. Try native rangeBounds getter
    final nativeBounds = item.rangeBounds;
    if (nativeBounds != null) return nativeBounds;

    // 2. Try parsing numeric ranges from value (e.g. "30000-40000", "30000,40000", "30000_40000", "80000-")
    final val = item.value.trim();
    if (val.isNotEmpty) {
      final parts = val.split(RegExp(r'[,-_]'));
      if (parts.length >= 2) {
        final minStr = parts[0].replaceAll(RegExp(r'[^0-9.]'), '');
        final maxStr = parts[1].replaceAll(RegExp(r'[^0-9.]'), '');
        final min = double.tryParse(minStr) ?? 0.0;
        final max = maxStr.isNotEmpty ? (double.tryParse(maxStr) ?? double.infinity) : double.infinity;
        if (min < max || max == double.infinity) {
          return (min: min, max: max);
        }
      } else if (parts.length == 1) {
        final numOnly = double.tryParse(parts[0].replaceAll(RegExp(r'[^0-9.]'), ''));
        if (numOnly != null && numOnly > 0) {
          return (min: numOnly, max: double.infinity);
        }
      }
    }

    // 3. Try parsing from label (e.g. "Below 30,000", "30,000 - 40,000", "Above 80,000", "৳30,000 to ৳50,000")
    final cleanLabel = item.label.replaceAll(',', '');
    final numbers = RegExp(r'\d+(?:\.\d+)?')
        .allMatches(cleanLabel)
        .map((m) => double.tryParse(m.group(0)!))
        .whereType<double>()
        .toList();

    if (numbers.length >= 2) {
      final min = numbers[0];
      final max = numbers[1];
      return (min: min < max ? min : max, max: min < max ? max : min);
    } else if (numbers.length == 1) {
      final lowerLabel = item.label.toLowerCase();
      if (lowerLabel.contains('below') || lowerLabel.contains('under') || lowerLabel.contains('less') || lowerLabel.contains('<')) {
        return (min: 0.0, max: numbers[0]);
      } else if (lowerLabel.contains('above') || lowerLabel.contains('over') || lowerLabel.contains('more') || lowerLabel.contains('+') || lowerLabel.contains('>')) {
        return (min: numbers[0], max: double.infinity);
      }
    }

    return null;
  }

  /// Prunes filter question options to remove choices that have zero matching products.
  ///
  /// NOTE: If after pruning, a question has <= 1 option remaining, it is stripped
  /// (returns empty items) so callers skip rendering it as a question.
  static FilterAttributeEntity pruneQuestionOptions({
    required FilterAttributeEntity question,
    required List<ProductEntity> currentProducts,
    List<FilterAttributeEntity>? currentServerAttributes,
  }) {
    // A question with <= 1 option cannot be meaningfully asked to the user
    if (question.items.length <= 1) {
      return FilterAttributeEntity(
        filterName: question.filterName,
        filterCode: question.filterCode,
        items: const [],
        specialForPhone: question.specialForPhone,
      );
    }

    if (currentProducts.isEmpty && (currentServerAttributes == null || currentServerAttributes.isEmpty)) {
      return question.items.length > 1
          ? question
          : FilterAttributeEntity(
              filterName: question.filterName,
              filterCode: question.filterCode,
              items: const [],
              specialForPhone: question.specialForPhone,
            );
    }

    final code = question.filterCode.toLowerCase().trim();
    final name = question.filterName.toLowerCase().trim();
    final isPrice = code == 'price' || name.contains('price') || name.contains('budget');

    if (isPrice) {
      if (currentProducts.isEmpty) {
        return question.items.length > 1
            ? question
            : FilterAttributeEntity(
                filterName: question.filterName,
                filterCode: question.filterCode,
                items: const [],
                specialForPhone: question.specialForPhone,
              );
      }
      final productPrices = currentProducts
          .map((p) => p.finalPrice.toDouble())
          .where((pr) => pr > 0.0)
          .toList();

      if (productPrices.isEmpty) return question;

      final validItems = <FilterItemEntity>[];
      for (final item in question.items) {
        final bounds = extractPriceBounds(item);
        if (bounds != null) {
          final min = bounds.min;
          final max = bounds.max;
          final matchCount = productPrices
              .where((pr) => pr >= min && pr <= max)
              .length;
          if (matchCount > 0) {
            validItems.add(item);
          }
        } else {
          // If bounds cannot be determined, keep item as safety
          validItems.add(item);
        }
      }

      // NOTE: Skip question if pruning leaves <= 1 option
      if (validItems.length > 1) {
        return FilterAttributeEntity(
          filterName: question.filterName,
          filterCode: question.filterCode,
          items: validItems,
          specialForPhone: question.specialForPhone,
        );
      } else {
        return FilterAttributeEntity(
          filterName: question.filterName,
          filterCode: question.filterCode,
          items: const [],
          specialForPhone: question.specialForPhone,
        );
      }
    } else if (currentServerAttributes != null && currentServerAttributes.isNotEmpty) {
      final serverAttr = currentServerAttributes.firstWhereOrNull(
        (a) => a.filterCode.toLowerCase().trim() == code,
      );

      if (serverAttr != null && serverAttr.items.isNotEmpty) {
        final validServerValues = serverAttr.items
            .where((i) => i.count > 0 || currentProducts.isNotEmpty)
            .map((i) => i.value.toString().trim())
            .toSet();
        final validServerLabels = serverAttr.items
            .map((i) => i.label.toLowerCase().trim())
            .toSet();

        final validItems = question.items.where((i) {
          return validServerValues.contains(i.value.toString().trim()) ||
              validServerLabels.contains(i.label.toLowerCase().trim());
        }).toList();

        // NOTE: Skip question if pruning leaves <= 1 option
        if (validItems.length > 1) {
          return FilterAttributeEntity(
            filterName: question.filterName,
            filterCode: question.filterCode,
            items: validItems,
            specialForPhone: question.specialForPhone,
          );
        } else {
          return FilterAttributeEntity(
            filterName: question.filterName,
            filterCode: question.filterCode,
            items: const [],
            specialForPhone: question.specialForPhone,
          );
        }
      }
    }

    return question.items.length > 1
        ? question
        : FilterAttributeEntity(
            filterName: question.filterName,
            filterCode: question.filterCode,
            items: const [],
            specialForPhone: question.specialForPhone,
          );
  }

  static String? _resolveLookupKey({
    String? categoryId,
    String? categorySlug,
    String? categoryName,
  }) {
    if (categoryId != null && categoryId.trim().isNotEmpty) {
      final key = categoryId.trim().toLowerCase();
      if (_categoryPriorityCodes.containsKey(key)) return key;
    }

    if (categorySlug != null && categorySlug.trim().isNotEmpty) {
      final key = categorySlug.trim().toLowerCase();
      if (_categoryPriorityCodes.containsKey(key)) return key;
    }

    if (categoryName != null && categoryName.trim().isNotEmpty) {
      final key = categoryName.trim().toLowerCase();
      if (_categoryPriorityCodes.containsKey(key)) return key;
    }

    return null;
  }
}
