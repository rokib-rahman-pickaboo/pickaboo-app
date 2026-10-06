import 'package:collection/collection.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';

/// ============================================================================
/// 🏷️ CATEGORY LOOKUP HELPER
///
/// Comprehensive category matching helper that supports:
/// - Recursive tree traversal (unlimited depth)
/// - Multi-tier matching (Exact ID -> Exact Slug -> Exact Name -> Stemmed/Normalized -> Contains)
/// - Singular/plural normalization (e.g. "Television" <-> "Televisions", "Smartphones" <-> "Smartphone")
/// - Preference for category nodes that have children
/// ============================================================================
class CategoryLookupHelper {
  CategoryLookupHelper._();

  /// Recursively flattens all category nodes in the tree.
  static List<CategoryEntity> flattenCategories(List<CategoryEntity> categories) {
    final result = <CategoryEntity>[];
    void collect(List<CategoryEntity> list) {
      for (final cat in list) {
        result.add(cat);
        if (cat.children.isNotEmpty) {
          collect(cat.children);
        }
      }
    }
    collect(categories);
    return result;
  }

  /// Normalizes and stems a category name or slug to its singular base form.
  /// Examples:
  /// - "Televisions" -> "television"
  /// - "Television" -> "television"
  /// - "Smartphones" -> "smartphone"
  /// - "Accessories" -> "accessory"
  /// - "Computer & Accessories" -> "computeraccessory"
  static String stemAndNormalize(String? s) {
    if (s == null) return '';
    final normalized = s
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]'), '')
        .trim();
    return _stem(normalized);
  }

  static String _stem(String s) {
    if (s.endsWith('ies') && s.length > 4) {
      return '${s.substring(0, s.length - 3)}y';
    }
    // Plural with -es occurs after s, x, z, ch, sh (e.g. watches, dishes, boxes)
    if (s.length > 4 &&
        (s.endsWith('shes') ||
            s.endsWith('ches') ||
            s.endsWith('sses') ||
            s.endsWith('xes') ||
            s.endsWith('zes'))) {
      return s.substring(0, s.length - 2);
    }
    if (s.endsWith('s') && !s.endsWith('ss') && s.length > 2) {
      return s.substring(0, s.length - 1);
    }
    return s;
  }

  /// Finds the best matching [CategoryEntity] in the tree.
  ///
  /// Matching priority:
  /// 1. Exact ID (if provided and non-empty)
  /// 2. Exact Slug (case-insensitive, prioritizing nodes with children)
  /// 3. Exact Name (case-insensitive, prioritizing nodes with children)
  /// 4. Stemmed / Normalized Name or Slug (singular <-> plural, prioritizing nodes with children)
  /// 5. Substring / Contains Match (prioritizing nodes with children)
  static CategoryEntity? findCategory(
    List<CategoryEntity>? categories, {
    String? categoryId,
    String? categorySlug,
    String? categoryName,
  }) {
    if (categories == null || categories.isEmpty) return null;

    final allNodes = flattenCategories(categories);
    final targetId = categoryId?.trim() ?? '';
    final targetSlug = categorySlug?.trim() ?? '';
    final targetName = categoryName?.trim() ?? '';

    // ── Tier 1: Exact ID Match ──
    if (targetId.isNotEmpty && targetId != '0') {
      final matchWithChildren = allNodes.firstWhereOrNull(
        (c) => c.id.trim() == targetId && c.children.isNotEmpty,
      );
      if (matchWithChildren != null) return matchWithChildren;

      final match = allNodes.firstWhereOrNull((c) => c.id.trim() == targetId);
      if (match != null) return match;
    }

    // ── Tier 2: Exact Slug Match ──
    if (targetSlug.isNotEmpty) {
      final slugLower = targetSlug.toLowerCase();
      final matchWithChildren = allNodes.firstWhereOrNull(
        (c) => c.slug.trim().toLowerCase() == slugLower && c.children.isNotEmpty,
      );
      if (matchWithChildren != null) return matchWithChildren;

      final match = allNodes.firstWhereOrNull(
        (c) => c.slug.trim().toLowerCase() == slugLower,
      );
      if (match != null) return match;
    }

    // ── Tier 3: Exact Name Match ──
    if (targetName.isNotEmpty) {
      final nameLower = targetName.toLowerCase();
      final matchWithChildren = allNodes.firstWhereOrNull(
        (c) => c.name.trim().toLowerCase() == nameLower && c.children.isNotEmpty,
      );
      if (matchWithChildren != null) return matchWithChildren;

      final match = allNodes.firstWhereOrNull(
        (c) => c.name.trim().toLowerCase() == nameLower,
      );
      if (match != null) return match;
    }

    // ── Tier 4: Stemmed / Plural-Singular Normalized Match ──
    final stemmedTargetName = stemAndNormalize(targetName);
    final stemmedTargetSlug = stemAndNormalize(targetSlug);

    if (stemmedTargetName.isNotEmpty || stemmedTargetSlug.isNotEmpty) {
      final matchWithChildren = allNodes.firstWhereOrNull((c) {
        if (c.children.isEmpty) return false;
        final stemmedNodeName = stemAndNormalize(c.name);
        final stemmedNodeSlug = stemAndNormalize(c.slug);

        return (stemmedTargetName.isNotEmpty &&
                (stemmedNodeName == stemmedTargetName ||
                    stemmedNodeSlug == stemmedTargetName)) ||
            (stemmedTargetSlug.isNotEmpty &&
                (stemmedNodeName == stemmedTargetSlug ||
                    stemmedNodeSlug == stemmedTargetSlug));
      });
      if (matchWithChildren != null) return matchWithChildren;

      final match = allNodes.firstWhereOrNull((c) {
        final stemmedNodeName = stemAndNormalize(c.name);
        final stemmedNodeSlug = stemAndNormalize(c.slug);

        return (stemmedTargetName.isNotEmpty &&
                (stemmedNodeName == stemmedTargetName ||
                    stemmedNodeSlug == stemmedTargetName)) ||
            (stemmedTargetSlug.isNotEmpty &&
                (stemmedNodeName == stemmedTargetSlug ||
                    stemmedNodeSlug == stemmedTargetSlug));
      });
      if (match != null) return match;
    }

    // ── Tier 5: Substring / Contains Match ──
    if (targetName.isNotEmpty && targetName.length >= 3) {
      final nameLower = stemAndNormalize(targetName);
      final matchWithChildren = allNodes.firstWhereOrNull((c) {
        if (c.children.isEmpty) return false;
        final cNorm = stemAndNormalize(c.name);
        return cNorm.isNotEmpty && (cNorm.contains(nameLower) || nameLower.contains(cNorm));
      });
      if (matchWithChildren != null) return matchWithChildren;

      final match = allNodes.firstWhereOrNull((c) {
        final cNorm = stemAndNormalize(c.name);
        return cNorm.isNotEmpty && (cNorm.contains(nameLower) || nameLower.contains(cNorm));
      });
      if (match != null) return match;
    }

    return null;
  }

  /// Finds the parent [CategoryEntity] of a given category node in the tree.
  static CategoryEntity? findParentCategory(
    List<CategoryEntity>? categories, {
    String? categoryId,
    String? categorySlug,
    String? categoryName,
  }) {
    if (categories == null || categories.isEmpty) return null;
    final target = findCategory(
      categories,
      categoryId: categoryId,
      categorySlug: categorySlug,
      categoryName: categoryName,
    );
    if (target == null) return null;

    final allNodes = flattenCategories(categories);
    for (final node in allNodes) {
      if (node.children.any((c) => c.id == target.id || c.slug == target.slug)) {
        return node;
      }
    }
    return null;
  }

  /// Canonical category icons when the backend API returns an empty icon ("").
  static const Map<String, String> _canonicalCategoryIcons = {
    '171': 'https://cdntest.pickaboo.com/media/catalog/category/Category-Smartphones.jpg',
    'smartphone': 'https://cdntest.pickaboo.com/media/catalog/category/Category-Smartphones.jpg',
    'smartphones': 'https://cdntest.pickaboo.com/media/catalog/category/Category-Smartphones.jpg',
    'phone': 'https://cdntest.pickaboo.com/media/catalog/category/Category-Smartphones.jpg',
    'phones': 'https://cdntest.pickaboo.com/media/catalog/category/Category-Smartphones.jpg',
  };

  /// Returns a canonical icon URL for known categories if the provided icon is empty.
  static String canonicalIcon(String? icon, {String? id, String? slug, String? name}) {
    if (icon != null && icon.trim().isNotEmpty) return icon.trim();
    if (id != null && _canonicalCategoryIcons.containsKey(id.trim())) {
      return _canonicalCategoryIcons[id.trim()]!;
    }
    if (slug != null && _canonicalCategoryIcons.containsKey(slug.trim().toLowerCase())) {
      return _canonicalCategoryIcons[slug.trim().toLowerCase()]!;
    }
    if (name != null) {
      final normName = stemAndNormalize(name);
      if (_canonicalCategoryIcons.containsKey(normName)) {
        return _canonicalCategoryIcons[normName]!;
      }
    }
    return '';
  }

  /// Resolves the best non-empty icon for a category, falling back
  /// to its parent or ancestor category icon if its own icon is empty.
  static String resolveCategoryIcon(
    List<CategoryEntity>? categories,
    CategoryEntity? category,
  ) {
    if (category == null) return '';
    final direct = canonicalIcon(
      category.icon,
      id: category.id,
      slug: category.slug,
      name: category.name,
    );
    if (direct.isNotEmpty) return direct;

    var current = category;
    while (true) {
      final parent = findParentCategory(
        categories,
        categoryId: current.id,
        categorySlug: current.slug,
        categoryName: current.name,
      );
      if (parent == null) break;
      final parentIcon = canonicalIcon(
        parent.icon,
        id: parent.id,
        slug: parent.slug,
        name: parent.name,
      );
      if (parentIcon.isNotEmpty) return parentIcon;
      current = parent;
    }
    return '';
  }
}

