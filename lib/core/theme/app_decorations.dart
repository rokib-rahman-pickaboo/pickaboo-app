import 'package:flutter/material.dart';
import 'package:pickaboo/core/color/app_colors.dart';

export 'package:pickaboo/core/color/app_colors.dart';
export 'app_typography.dart';

// ============================================================================
// 🎨 CENTRALIZED DESIGN SYSTEM CONSTANTS & TOKENS
// ============================================================================

/// Centralized Border Radius Tokens
class AppRadius {
  /// 1. Card & Container radius (Default: 12.0)
  static const double card = 12.0;
  static const BorderRadius cardRadius = BorderRadius.all(Radius.circular(card));
  static const BorderRadius cardTop = BorderRadius.vertical(top: Radius.circular(card));
  static const BorderRadius cardBottom = BorderRadius.vertical(bottom: Radius.circular(card));

  /// 2. Button & Input Field radius (Default: 8.0)
  static const double button = 8.0;
  static const BorderRadius buttonRadius = BorderRadius.all(Radius.circular(button));

  /// 3. Chip & Filter Pill radius (Default: 10.0)
  static const double chip = 10.0;
  static const BorderRadius chipRadius = BorderRadius.all(Radius.circular(chip));

  /// 4. Badge & Status Tag radius (Default: 4.0)
  static const double badge = 4.0;
  static const BorderRadius badgeRadius = BorderRadius.all(Radius.circular(badge));
}

/// Centralized Spacing, Margins & Padding Tokens
class AppSpacing {
  /// 1. Same-Group Item Spacing (Default: 8.0) - standard grid gaps, inner padding, horizontal margins
  static const double sameGroupItemSpacing = 8.0;

  /// 2. Group-to-Group Spacing (Default: 12.0) - separation between distinct section cards
  static const double groupToGroupSpacing = 12.0;

  /// 3. Same-Group Vertical & Horizontal Gaps (8.0)
  static const SizedBox sameGroupGap = SizedBox(height: sameGroupItemSpacing, width: sameGroupItemSpacing);
  static const SizedBox sameGroupHeightGap = SizedBox(height: sameGroupItemSpacing);
  static const SizedBox sameGroupWidthGap = SizedBox(width: sameGroupItemSpacing);

  /// 4. Group-to-Group Vertical Gap (12.0)
  static const SizedBox groupToGroupGap = SizedBox(height: groupToGroupSpacing);

  /// 5. Standard Page Horizontal Padding (8.0)
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(horizontal: sameGroupItemSpacing);

  /// 6. Standard Card & Section Internal Padding (8.0)
  static const EdgeInsets sectionPadding = EdgeInsets.all(sameGroupItemSpacing);

  /// 7. Standard Badge & Tag Padding (Horizontal: 6.0, Vertical: 2.0)
  static const EdgeInsets badgePadding = EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0);
}

/// Centralized Container & Surface BoxDecorations
class AppDecorations {
  AppDecorations._();

  /// Standard Layer 1 White Card Decoration with 1px border and soft depth shadow
  static BoxDecoration cardBoxDecoration({
    Color backgroundColor = AppColors.white,
    BorderRadius? borderRadius,
    Color borderColor = AppColors.border,
    double borderWidth = 1.0,
  }) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: borderRadius ?? AppRadius.cardRadius,
      border: Border.all(color: borderColor, width: borderWidth),
      boxShadow: [
        BoxShadow(
          color: AppColors.navy.withValues(alpha: 0.02),
          blurRadius: 6.0,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  /// Standard Layer 2 Tinted Badge / Pill Decoration
  static BoxDecoration tintBoxDecoration({
    required Color backgroundColor,
    BorderRadius? borderRadius,
    Color? borderColor,
  }) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: borderRadius ?? AppRadius.badgeRadius,
      border: borderColor != null ? Border.all(color: borderColor, width: 1.0) : null,
    );
  }

  /// Standard Layer 3 Bottom Sheet Surface Decoration
  static BoxDecoration bottomSheetDecoration({
    Color backgroundColor = AppColors.white,
    BorderRadius? borderRadius,
  }) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: borderRadius ?? AppRadius.cardTop,
    );
  }
}
