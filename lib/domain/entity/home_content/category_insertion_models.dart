library;

import 'package:pickaboo/domain/entity/banner/banner_entity.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';

enum InsertionWidgetType {
  banner,
  productGrid,
  flashSale,
  categoryGrid,
  customWidget,
}

enum BannerSlot {
  top,

  center,

  bottom,
}

enum BannerDisplayPolicy {
  full,

  normal,

  skip,
}

extension BannerDisplayPolicyX on BannerDisplayPolicy {
  static String _normalize(String identifier) =>
      identifier.trim().toLowerCase().replaceAll(RegExp(r'[\s_]+'), '-');

  static BannerDisplayPolicy fromIdentifier(String identifier) {
    final id = _normalize(identifier);

    if (_columns(id) > 1) return BannerDisplayPolicy.normal;

    if (id == 'home-banner-right') return BannerDisplayPolicy.full;
    if (id.contains('right')) return BannerDisplayPolicy.skip;
    if (id.contains('full')) return BannerDisplayPolicy.full;
    return BannerDisplayPolicy.normal;
  }

  static bool isMultiColumn(String identifier) =>
      columnsForIdentifier(identifier) > 1;

  static int columnsForIdentifier(String identifier) =>
      _columns(_normalize(identifier));

  static int _columns(String normalizedId) {
    if (normalizedId.contains('three-col')) return 3;
    if (normalizedId.contains('two-col')) return 2;
    return 1;
  }

  static BannerSlot slotForIdentifier(String identifier) {
    final id = _normalize(identifier);
    if (id.contains('top')) return BannerSlot.top;
    if (id.contains('bottom')) return BannerSlot.bottom;
    return BannerSlot.center;
  }
}

class CategoryInsertionItem {
  final String id;
  final InsertionWidgetType type;
  final int afterSectionIndex;
  final Map<String, Object> data;

  const CategoryInsertionItem({
    required this.id,
    required this.type,
    required this.afterSectionIndex,
    required this.data,
  });

  factory CategoryInsertionItem.banner({
    required String id,
    required int afterSectionIndex,
    required SliderEntity banner,
  }) {
    return CategoryInsertionItem(
      id: id,
      type: InsertionWidgetType.banner,
      afterSectionIndex: afterSectionIndex,
      data: {'banner': banner},
    );
  }

  factory CategoryInsertionItem.categoryMatchedBanner({
    required String id,
    required int afterSectionIndex,
    required BannerEntity banner,
    required BannerDisplayPolicy displayPolicy,
  }) {
    return CategoryInsertionItem(
      id: id,
      type: InsertionWidgetType.banner,
      afterSectionIndex: afterSectionIndex,
      data: {
        'banner': banner,
        'displayPolicy': displayPolicy,
      },
    );
  }

  factory CategoryInsertionItem.productGrid({
    required String id,
    required int afterSectionIndex,
    required List<ProductEntity> products,
    String? title,
  }) {
    return CategoryInsertionItem(
      id: id,
      type: InsertionWidgetType.productGrid,
      afterSectionIndex: afterSectionIndex,
      data: {'products': products, 'title': title ?? ''},
    );
  }

  factory CategoryInsertionItem.flashSale({
    required String id,
    required int afterSectionIndex,
    required List<ProductEntity> products,
    required DateTime endTime,
    String? title,
  }) {
    return CategoryInsertionItem(
      id: id,
      type: InsertionWidgetType.flashSale,
      afterSectionIndex: afterSectionIndex,
      data: {'products': products, 'endTime': endTime, 'title': title ?? ''},
    );
  }

  factory CategoryInsertionItem.categoryGrid({
    required String id,
    required int afterSectionIndex,
    required CategorySliderEntity categorySlider,
  }) {
    return CategoryInsertionItem(
      id: id,
      type: InsertionWidgetType.categoryGrid,
      afterSectionIndex: afterSectionIndex,
      data: {'categorySlider': categorySlider},
    );
  }

  factory CategoryInsertionItem.categoryMatchedMultiColumnBanner({
    required String id,
    required int afterSectionIndex,
    required List<BannerEntity> banners,
    required int columnCount,
  }) {
    return CategoryInsertionItem(
      id: id,
      type: InsertionWidgetType.customWidget,
      afterSectionIndex: afterSectionIndex,
      data: {
        'widgetType': 'multiColumnCategoryBanner',
        'banners': banners,
        'columnCount': columnCount,
      },
    );
  }

  factory CategoryInsertionItem.multiLayoutBanner({
    required String id,
    required int afterSectionIndex,
    required List<SliderEntity> banners,
    required String layout,
    required int itemCount,
  }) {
    return CategoryInsertionItem(
      id: id,
      type: InsertionWidgetType.customWidget,
      afterSectionIndex: afterSectionIndex,
      data: {
        'widgetType': 'multiLayoutBanner',
        'banners': banners,
        'layout': layout,
        'itemCount': itemCount,
      },
    );
  }

  factory CategoryInsertionItem.customWidget({
    required String id,
    required int afterSectionIndex,
    required Map<String, Object> customData,
  }) {
    return CategoryInsertionItem(
      id: id,
      type: InsertionWidgetType.customWidget,
      afterSectionIndex: afterSectionIndex,
      data: customData,
    );
  }
}
