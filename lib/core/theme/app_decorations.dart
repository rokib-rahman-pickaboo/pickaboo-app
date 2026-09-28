import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';

export 'package:pickaboo/core/color/app_colors.dart';
export 'package:pickaboo/core/constants/app_assets.dart';
export 'package:pickaboo/core/constants/app_strings.dart';
export 'app_typography.dart';

// ============================================================================
// 🎨 CENTRALIZED DESIGN SYSTEM CONSTANTS & TOKENS
// ============================================================================

/// 📏 Canonical 9-Step Design Scale (T-Shirt Sizing)
/// Single source of truth used across radius, spacing, margins, and layout gaps.
class AppTokens {
  AppTokens._();

  static const double xxs  = 2.0;   // Micro offsets, fine borders
  static const double xs   = 4.0;   // Compact gaps, badge padding
  static const double sm   = 8.0;   // Intra-group item spacing, standard button radius
  static const double md   = 12.0;  // Group-to-group spacing, card radius
  static const double lg   = 16.0;  // Page margins, dialog & modal sheet radius
  static const double xl   = 20.0;  // Pill radius, prominent card spacing
  static const double xxl  = 24.0;  // Hero offsets, bottom clearances
  static const double xxxl = 32.0;  // Major section dividers
  static const double full = 999.0; // Circular avatars, rounded pills
}

/// Centralized Border Radius Tokens
class AppRadius {
  AppRadius._();

  // ── T-Shirt Scale Radii ──
  static const double xxs  = AppTokens.xxs;
  static const double xs   = AppTokens.xs;
  static const double sm   = AppTokens.sm;
  static const double md   = AppTokens.md;
  static const double lg   = AppTokens.lg;
  static const double xl   = AppTokens.xl;
  static const double xxl  = AppTokens.xxl;
  static const double xxxl = AppTokens.xxxl;
  static const double full = AppTokens.full;

  // ── Semantic Component Aliases ──
  static const double badge  = AppTokens.xs;   // 4.0
  static const double button = AppTokens.sm;   // 8.0
  static const double input  = AppTokens.sm;   // 8.0
  static const double chip   = AppTokens.sm;   // 8.0 (canonical token, replaces arbitrary 10.0)
  static const double card   = AppTokens.md;   // 12.0
  static const double dialog = AppTokens.lg;   // 16.0
  static const double sheet  = AppTokens.lg;   // 16.0
  static const double pill   = AppTokens.xl;   // 20.0

  // ── BorderRadius All ──
  static const BorderRadius badgeRadius  = BorderRadius.all(Radius.circular(badge));
  static const BorderRadius smRadius     = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius buttonRadius = BorderRadius.all(Radius.circular(button));
  static const BorderRadius inputRadius  = BorderRadius.all(Radius.circular(input));
  static const BorderRadius chipRadius   = BorderRadius.all(Radius.circular(chip));
  static const BorderRadius cardRadius   = BorderRadius.all(Radius.circular(card));
  static const BorderRadius lgRadius     = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius dialogRadius = BorderRadius.all(Radius.circular(dialog));
  static const BorderRadius pillRadius   = BorderRadius.all(Radius.circular(pill));
  static const BorderRadius fullRadius   = BorderRadius.all(Radius.circular(full));

  // ── Directional Sheet / Card Radii ──
  static const BorderRadius sheetTop   = BorderRadius.vertical(top: Radius.circular(sheet));
  static const BorderRadius cardTop    = BorderRadius.vertical(top: Radius.circular(card));
}

/// Centralized Spacing, Margins & Padding Tokens
class AppSpacing {
  AppSpacing._();

  // ── T-Shirt Scalar Spacing Constants ──
  static const double xxs  = AppTokens.xxs;   // 2.0
  static const double xs   = AppTokens.xs;    // 4.0
  static const double sm   = AppTokens.sm;    // 8.0 (Same-group item spacing)
  static const double md   = AppTokens.md;    // 12.0 (Group-to-group spacing)
  static const double lg   = AppTokens.lg;    // 16.0 (Standard page padding)
  static const double xl   = AppTokens.xl;    // 20.0
  static const double xxl  = AppTokens.xxl;   // 24.0
  static const double xxxl = AppTokens.xxxl;  // 32.0

  // ── Semantic Spacing Aliases (Active throughout app) ──
  static const double sameGroupItemSpacing = sm;
  static const double groupToGroupSpacing  = md;

  // ── SizedBox Vertical Gaps (Canonical 9 Scale) ──
  static const SizedBox gapV8  = SizedBox(height: sm);
  static const SizedBox gapV12 = SizedBox(height: md);
  static const SizedBox gapV16 = SizedBox(height: lg);
  static const SizedBox gapV20 = SizedBox(height: xl);
  static const SizedBox gapV24 = SizedBox(height: xxl);

  // ── SizedBox Horizontal Gaps (Canonical 9 Scale) ──
  static const SizedBox gapH4  = SizedBox(width: xs);
  static const SizedBox gapH8  = SizedBox(width: sm);
  static const SizedBox gapH12 = SizedBox(width: md);
  static const SizedBox gapH16 = SizedBox(width: lg);

  // ── Legacy SizedBox Gaps (Active throughout app) ──
  static const SizedBox sameGroupHeightGap = gapV8;
  static const SizedBox sameGroupWidthGap  = gapH8;
  static const SizedBox groupToGroupGap    = gapV12;

  // ── Semantic Screen & Component Padding (Active) ──
  static const EdgeInsets cardPadding  = EdgeInsets.all(md);
  static const EdgeInsets badgePadding = EdgeInsets.symmetric(horizontal: sm, vertical: xxs);
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

  /// Tuned Shimmer Effect for Skeletonizer
  /// - High-contrast base color [AppColors.skeletonBase] against white surfaces
  /// - Luminous white highlight [AppColors.skeletonHighlight]
  /// - Energetic 1100ms cadence (replaces sluggish 2000ms default)
  static const ShimmerEffect shimmerEffect = ShimmerEffect(
    baseColor: AppColors.skeletonBase,
    highlightColor: AppColors.skeletonHighlight,
    duration: Duration(milliseconds: 1100),
  );
}

/// Centralized Skeleton & Shimmer Tokens
class AppShimmer {
  AppShimmer._();

  /// Tuned Shimmer Effect:
  /// - High-contrast base color on white card surfaces
  /// - Radiant white highlight wave
  /// - Energetic 1100ms cadence (replaces sluggish 2000ms default)
  static const ShimmerEffect effect = AppDecorations.shimmerEffect;
}
