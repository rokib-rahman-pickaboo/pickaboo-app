# 🛍️ 03: Product Card System Redesign & Carousel Alignment

## 🎯 Objectives & Motivation
Product cards represent the highest-frequency visual touchpoint in any eCommerce application. Previously, product items in **Pickaboo-App** used:
- Center-aligned typography (conflicting with natural reading flow)
- 1.6 aspect ratio image containers (compressing tall product imagery)
- Stagnant top-right discount bookmarks overlaying product art
- 3 disparate, un-synchronized widgets (`ProductView`, `ListProductView`, `SliderProductView`)

The mission was to **100% align all product cards with [`Pickaboo-App-UI`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App-UI)**.

---

## 🎨 Visual Anatomy of the Modernized Card

```
┌────────────────────────────────────────────────────────┐
│ [Express Tag]              [🤍 Favorite Button (Opt)] │
│                                                        │
│                    PRODUCT IMAGE                       │
│               (1:1 Square Aspect Ratio)                │
│                                                        │
├────────────────────────────────────────────────────────┤
│ SAMSUNG                                                │ ◄─ Brand (Sky Blue, Uppercase, 9.5sp)
│ Galaxy S24 Ultra 5G (12GB/256GB)...                    │ ◄─ Title (Navy, Max 2 lines, 12sp)
│ ★★★★☆ (48)                                            │ ◄─ Rating (Amber Stars + Muted Count)
│ ৳149,999  ৳169,999  [-12%]                             │ ◄─ Price Row (Current + Strike + Badge)
└────────────────────────────────────────────────────────┘
```

---

## 🛠️ Key Technical Implementations

### 1. `ProductEntityX` Domain Extension
To extract clean metadata without breaking existing backend DTOs, a non-destructive extension was added in [`product_entity.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/domain/entity/common/product/product_entity.dart):
```dart
extension ProductEntityX on ProductEntity {
  /// Extracts brand from backend attributes or first word of product name
  String get brand {
    for (final attr in attributes) {
      if (attr.code.toLowerCase() == 'manufacturer' ||
          attr.code.toLowerCase() == 'brand') {
        if (attr.value.isNotEmpty) return attr.value;
        if (attr.label.isNotEmpty) return attr.label;
      }
    }
    final firstWord = productName.trim().split(' ').first;
    if (firstWord.length >= 2 && !firstWord.contains(RegExp(r'[0-9]'))) {
      return firstWord;
    }
    return '';
  }

  int get finalPrice => productSpecialPrice > 0 ? productSpecialPrice : productPrice;
  int get originalPrice => productSpecialPrice > 0 ? productPrice : 0;
  
  int get computedDiscountPercentage {
    if (productDiscount > 0) return productDiscount;
    if (productSpecialPrice > 0 && productPrice > productSpecialPrice) {
      return ((productPrice - productSpecialPrice) / productPrice * 100).round();
    }
    return 0;
  }
}
```

### 2. Standardized Rating Stars Widget
Created [`RatingStars`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/rating_stars.dart) using `NewAppColors.amber` (`#F59E0B`) with filled, half, and outline star states.

### 3. Carousel Height & Aspect Ratio Math Fix
- **Root Cause of 30px Overflow**: Previous carousels computed height as `cardWidth / 1.45`. When images transitioned to `1:1` square (`cardWidth / 1.0`), the card required ~50px more vertical clearance than the parent `CarouselOptions.height` allowed.
- **Fix Applied**: Updated `_calculateCarouselHeight` across all sliders:
```dart
double _calculateCarouselHeight(BuildContext context) {
  final screenWidth = MediaQuery.sizeOf(context).width;
  const viewportFraction = 0.43;
  final cardWidth = screenWidth * viewportFraction;
  final imageHeight = cardWidth; // Exact 1:1 square ratio
  final textScaleFactor = MediaQuery.textScalerOf(context).scale(1.0);
  final textContentHeight = (88.h * textScaleFactor).clamp(80.0, 130.0);
  final verticalPadding = 12.h;

  return imageHeight + textContentHeight + verticalPadding;
}
```

---

## 🔄 Comparison: `Pickaboo-App-UI` vs `Pickaboo-App`

| Component | 🎨 `Pickaboo-App-UI` | 📱 `Pickaboo-App` (Current) | Status |
|---|---|---|---|
| **Grid Card** | `ProductItemWidget` | [`ProductView`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/product_view.dart) | ✅ **100% Match** |
| **List Card** | `ProductItemWidget.list` | [`ListProductView`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/list_product_view.dart) | ✅ **100% Match** |
| **Slider Card** | Fixed-width card rail | [`SliderProductView`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/slider_product_view.dart) | ✅ **100% Match** |
| **Rating Component** | `RatingStars` (Amber/Gold) | [`RatingStars`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/rating_stars.dart) | ✅ **100% Match** |
| **Grid Aspect Ratio** | `childAspectRatio: 0.63` | `childAspectRatio: 0.63` | ✅ **100% Match** |

---

## 💡 Remarks & Architectural Suggestions

1. **Add to Cart Micro-Animation**:
   - *Suggestion*: Add a subtle scale/bounce animation on the cart or favorite heart icon when tapped.
2. **Badge Tag System Expansion**:
   - *Current*: Supports Express Delivery and Out of Stock badges.
   - *Suggestion*: Support official warranty badges (`Official Warranty`, `Pickaboo Assured`) as secondary pill badges.
