# 🗂️ 02: Two-Way Category Architecture & Dynamic API Routing

## 🎯 Objectives & Motivation
A core directive of this mission was resolving how categories are browsed across the application:
1. **Homepage Inline Preview (Way 1)**: When a user taps a category tab on the homepage, they see a tailored, fast-loading inline feed of the first **20 products** interleaved with dynamic filter questions and brand chips.
2. **Full Category Page (Way 2)**: When a user taps "View All" on the homepage or selects a category from the App Drawer, they are routed to [`CategoryProductPage`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/category_product_page/category_product_page.dart) with full catalog pagination, sorting, facet filters, and grid/list view toggles.

---

## 🏗️ Architecture Comparison: Way 1 vs Way 2

```
┌────────────────────────────────────────────────────────┐
│                        HOMEPAGE                        │
│   [For You]  [Smartphones]  [Accessories]  [Lifestyle] │
└──────────────────────────┬─────────────────────────────┘
                           │ (Taps "Smartphones")
                           ▼
┌────────────────────────────────────────────────────────┐
│             WAY 1: SECONDARY HOME WIDGET               │
│                                                        │
│  1. [Brand Chips]  (SAMSUNG  APPLE  XIAOMI  REALME)    │
│  2. [Question #1]  "Which budget are you looking for?" │
│  3. [Header]       "Top Featured Smartphones Offers >" │
│  4. [Grid: 4 Prods] [Prod 1] [Prod 2] [Prod 3] [Prod 4]│
│  5. [Question #2]  "Choose your preferred RAM"         │
│  6. [Grid: 8 Prods] [Prod 5] ... [Prod 12]             │
│  7. [Question #3]  "Choose your preferred Storage"     │
│  8. [Grid: 8 Prods] [Prod 13] ... [Prod 20]            │
│  9. [CTA Button]   "VIEW ALL SMARTPHONES"              │
└──────────────────────────┬─────────────────────────────┘
                           │ (Taps "View All" / CTA Button)
                           ▼
┌────────────────────────────────────────────────────────┐
│             WAY 2: CATEGORY PRODUCT PAGE               │
│                                                        │
│  1. [AppBar]       "< Smartphones   [Search] [Cart]"   │
│  2. [Brand Chips]  (ALL BRANDS  APPLE  SAMSUNG ...)    │
│  3. [Control Bar]  [Sort: Featured] [Filter] [Toggle]  │
│  4. [Grid: 2 Prods] [Prod 1] [Prod 2]                  │
│  5. [Question #1]  "Which budget are you looking for?" │
│  6. [Grid: 4 Prods] [Prod 3] [Prod 4] [Prod 5] [Prod 6]│
│  7. [Question #2]  "Choose your preferred RAM"         │
│  8. [Grid: 8 Prods] [Prod 7] ... [Prod 14]             │
│  9. [Infinite Pagination...]                           │
└────────────────────────────────────────────────────────┘
```

---

## 🧠 Dynamic API Filter Questions System

### Zero Hardcoded Data
Previously, dummy questions were hardcoded in UI mockups. In the live implementation, questions are **100% dynamically derived** from the Magento backend's `filterableAttributes`:

```dart
// 1. Filter out brands (brands are handled in the top horizontal brand bar)
final validAttributes = categoryData.filterableAttributes
    .where((attr) =>
        attr.filterCode != 'manufacturer' &&
        attr.filterCode != 'brand' &&
        attr.items.isNotEmpty)
    .toList();

// 2. Format human-friendly titles
String _formatQuestionTitle(FilterAttributeEntity attr) {
  if (attr.filterCode.toLowerCase() == 'price') {
    return 'Which budget are you looking for?';
  }
  return 'Choose your preferred ${attr.filterName}';
}

// 3. Populate live selectable chips
options: attr.items.map((i) => i.label).toList()
```

---

## 🧭 Unified Navigation & Routing Fixes

### 1. Unified Entry Point Resolution
Both entry points (Drawer menu and Homepage "View All") route to the same `CategoryProductPage` with identical parameters:
```dart
context.pushToCategoryProduct(
  categoryId: category.id,
  categorySlug: category.slug,
  categoryName: category.name,
);
```

### 2. Category Key Priority (`id` vs `slug`)
- **Bug Fixed**: The Magento endpoint `/rest/V1/categorypageapi/{id}` requires numeric IDs for non-special categories. Previously, `SecondaryHomeWidget` sent `slug` first, causing `404/500` loading errors.
- **Resolution**: Both `CategoryProductPage` and `SecondaryHomeWidget` now strictly prioritize `categoryId` over `categorySlug`.

### 3. Lifecycle & Stale Data Prevention
- In `CategoryProductPage`, `didUpdateWidget` was implemented to detect when a user navigates between categories without unmounting the page (e.g. from drawer menu):
```dart
@override
void didUpdateWidget(covariant CategoryProductPage oldWidget) {
  super.didUpdateWidget(oldWidget);
  if (oldWidget.categoryKey != widget.categoryKey) {
    _selectedBrand = null;
    _pagingController.refresh();
  }
}
```

---

## 🔄 Comparison: `Pickaboo-App-UI` vs `Pickaboo-App`

| Feature | 🎨 `Pickaboo-App-UI` | 📱 `Pickaboo-App` (Current) | Status |
|---|---|---|---|
| **Way 1 (Inline 20)** | Static mockup with 20 dummy products | Live API data (`ProductRepository.getCategoryProducts`) taking first 20 products | ✅ **Live API Integrated** |
| **Way 2 (Full Catalog)** | Interleaved product chunks + questions | Interleaved product chunks + dynamic `FilterAttributeEntity` questions | ✅ **Live API Integrated** |
| **Brand Filter Bar** | Horizontal uppercase chips with "ALL" clear chip | Reusable [`BrandFilterWidget`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/filters/brand_filter_widget.dart) | ✅ **100% Match** |
| **Sort / Filter Bar** | Rounded card buttons (`12.r`) + modal sheets | Modernized [`FilterSortBar`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/filter_sort_bar.dart) matching UI app | ✅ **100% Match** |

---

## 💡 Remarks & Architectural Suggestions

1. **Category Cache Expiry**:
   - *Current*: `SecondaryHomeWidget` caches visited category products in memory during the app session (`_cache[cacheKey]`).
   - *Suggestion*: Add a TTL (e.g., 10 minutes) or pull-to-refresh on `SecondaryHomeWidget` so stock updates reflect without restarting the app.
2. **Dynamic Multi-Select in Inline Questions**:
   - *Current*: Single option selection per question pill.
   - *Suggestion*: Support multi-select filter tags if a user wants to view multiple RAM/Storage variants simultaneously.
