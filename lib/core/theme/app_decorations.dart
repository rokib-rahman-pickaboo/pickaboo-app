import 'package:flutter/material.dart';
import 'package:pickaboo/core/color/app_colors.dart';

export 'package:pickaboo/core/color/app_colors.dart';
export 'package:pickaboo/core/constants/app_assets.dart';
export 'package:pickaboo/core/constants/app_strings.dart';
export 'app_typography.dart';

// ============================================================================
// 🎨 CENTRALIZED DESIGN SYSTEM CONSTANTS & TOKENS
// ============================================================================

/// Centralized Border Radius Tokens
class AppRadius {
  // ── Scalar Radius Constants ──
  static const double badge = 4.0;
  static const double sm = 6.0;
  static const double button = 8.0;
  static const double input = 8.0;
  static const double chip = 10.0;
  static const double card = 12.0;
  static const double lg = 14.0;
  static const double dialog = 16.0;
  static const double sheet = 16.0;
  static const double pill = 20.0;
  static const double full = 999.0;

  // ── BorderRadius All ──
  static const BorderRadius badgeRadius = BorderRadius.all(Radius.circular(badge));
  static const BorderRadius smRadius = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius buttonRadius = BorderRadius.all(Radius.circular(button));
  static const BorderRadius inputRadius = BorderRadius.all(Radius.circular(input));
  static const BorderRadius chipRadius = BorderRadius.all(Radius.circular(chip));
  static const BorderRadius cardRadius = BorderRadius.all(Radius.circular(card));
  static const BorderRadius lgRadius = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius dialogRadius = BorderRadius.all(Radius.circular(dialog));
  static const BorderRadius sheetRadius = BorderRadius.all(Radius.circular(sheet));
  static const BorderRadius pillRadius = BorderRadius.all(Radius.circular(pill));
  static const BorderRadius fullRadius = BorderRadius.all(Radius.circular(full));

  // ── Directional Sheet / Card Radii ──
  static const BorderRadius sheetTop = BorderRadius.vertical(top: Radius.circular(sheet));
  static const BorderRadius cardTop = BorderRadius.vertical(top: Radius.circular(card));
  static const BorderRadius cardBottom = BorderRadius.vertical(bottom: Radius.circular(card));
}

/// Centralized Spacing, Margins & Padding Tokens
class AppSpacing {
  // ── Scalar Spacing Constants ──
  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double sm = 8.0; // Same-group item spacing
  static const double md = 12.0; // Group-to-group spacing
  static const double lg = 16.0; // Standard page horizontal padding
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;

  // Preserved for backward compatibility
  static const double sameGroupItemSpacing = sm;
  static const double groupToGroupSpacing = md;

  // ── SizedBox Vertical Gaps ──
  static const SizedBox gapV2 = SizedBox(height: 2.0);
  static const SizedBox gapV4 = SizedBox(height: 4.0);
  static const SizedBox gapV6 = SizedBox(height: 6.0);
  static const SizedBox gapV8 = SizedBox(height: 8.0);
  static const SizedBox gapV10 = SizedBox(height: 10.0);
  static const SizedBox gapV12 = SizedBox(height: 12.0);
  static const SizedBox gapV14 = SizedBox(height: 14.0);
  static const SizedBox gapV16 = SizedBox(height: 16.0);
  static const SizedBox gapV20 = SizedBox(height: 20.0);
  static const SizedBox gapV24 = SizedBox(height: 24.0);
  static const SizedBox gapV32 = SizedBox(height: 32.0);

  // ── SizedBox Horizontal Gaps ──
  static const SizedBox gapH2 = SizedBox(width: 2.0);
  static const SizedBox gapH4 = SizedBox(width: 4.0);
  static const SizedBox gapH6 = SizedBox(width: 6.0);
  static const SizedBox gapH8 = SizedBox(width: 8.0);
  static const SizedBox gapH10 = SizedBox(width: 10.0);
  static const SizedBox gapH12 = SizedBox(width: 12.0);
  static const SizedBox gapH14 = SizedBox(width: 14.0);
  static const SizedBox gapH16 = SizedBox(width: 16.0);
  static const SizedBox gapH20 = SizedBox(width: 20.0);
  static const SizedBox gapH24 = SizedBox(width: 24.0);

  // ── Legacy SizedBox Gaps (preserved) ──
  static const SizedBox sameGroupGap = SizedBox(height: sameGroupItemSpacing, width: sameGroupItemSpacing);
  static const SizedBox sameGroupHeightGap = gapV8;
  static const SizedBox sameGroupWidthGap = gapH8;
  static const SizedBox groupToGroupGap = gapV12;

  // ── EdgeInsets Insets All ──
  static const EdgeInsets allXs = EdgeInsets.all(xs);
  static const EdgeInsets allSm = EdgeInsets.all(sm);
  static const EdgeInsets allMd = EdgeInsets.all(md);
  static const EdgeInsets allLg = EdgeInsets.all(lg);
  static const EdgeInsets allXl = EdgeInsets.all(xl);

  // ── EdgeInsets Horizontal ──
  static const EdgeInsets hXs = EdgeInsets.symmetric(horizontal: xs);
  static const EdgeInsets hSm = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets hMd = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets hLg = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets hXl = EdgeInsets.symmetric(horizontal: xl);

  // ── EdgeInsets Vertical ──
  static const EdgeInsets vXs = EdgeInsets.symmetric(vertical: xs);
  static const EdgeInsets vSm = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets vMd = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets vLg = EdgeInsets.symmetric(vertical: lg);

  // ── Semantic Screen & Component Padding ──
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(horizontal: lg, vertical: md);
  static const EdgeInsets pagePaddingHorizontal = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets sectionPadding = EdgeInsets.all(sm);
  static const EdgeInsets cardPadding = EdgeInsets.all(md);
  static const EdgeInsets sheetPadding = EdgeInsets.symmetric(horizontal: lg, vertical: lg);
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
