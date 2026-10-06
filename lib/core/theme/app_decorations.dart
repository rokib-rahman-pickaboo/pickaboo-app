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

/// Centralized Border Radius Tokens (Strict 4-tier scale: 4px, 8px, 16px, 999px)
class AppRadius {
  AppRadius._();

  // ── 1. Scalar Values (double) ──
  static const double r4    = 4.0;   // Micro, badges, tags, indicator bars, shimmers
  static const double r8    = 8.0;   // Buttons, inputs, chips, cards, standard components
  static const double r16   = 16.0;  // Modal bottom sheets, dialogs, alerts, large cards
  static const double rFull = 999.0; // Circular avatars, rounded pills, capsule tags

  // ── 2. All-Corner BorderRadius ──
  static const BorderRadius k4    = BorderRadius.all(Radius.circular(r4));
  static const BorderRadius k8    = BorderRadius.all(Radius.circular(r8));
  static const BorderRadius k16   = BorderRadius.all(Radius.circular(r16));
  static const BorderRadius kFull = BorderRadius.all(Radius.circular(rFull));

  // ── 3. Directional BorderRadius ──
  static const BorderRadius top8     = BorderRadius.vertical(top: Radius.circular(r8));
  static const BorderRadius top16    = BorderRadius.vertical(top: Radius.circular(r16));
  static const BorderRadius bottom8  = BorderRadius.vertical(bottom: Radius.circular(r8));
  static const BorderRadius bottom16 = BorderRadius.vertical(bottom: Radius.circular(r16));

  // ── 4. Radius Helpers (for BorderRadius.only or CustomPainters) ──
  static const Radius rad4    = Radius.circular(r4);
  static const Radius rad8    = Radius.circular(r8);
  static const Radius rad16   = Radius.circular(r16);
  static const Radius radFull = Radius.circular(rFull);
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
  static const EdgeInsets cardPadding  = EdgeInsets.all(sm);
  static const EdgeInsets badgePadding = EdgeInsets.symmetric(horizontal: sm, vertical: xxs);
}

/// Centralized Container & Surface BoxDecorations
class AppDecorations {
  AppDecorations._();

  /// Canonical crisp, ultra-clean neutral shadow with zero color cast
  static final List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.035),
      blurRadius: 4.0,
      offset: const Offset(0, 1.5),
      spreadRadius: 0,
    ),
  ];

  /// 360-degree ambient shadow for borderless cards & chips floating on white surfaces
  static final List<BoxShadow> shadow360 = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 4.5,
      offset: Offset.zero,
      spreadRadius: 0.5,
    ),
  ];

  /// Standard Layer 1 White Card Decoration with micro-hairline border and clean shadow
  static BoxDecoration cardBoxDecoration({
    Color backgroundColor = AppColors.white,
    BorderRadius? borderRadius,
    bool hasBorder = true,
    Color borderColor = AppColors.border,
    double borderWidth = 0.8,
    List<BoxShadow>? boxShadow,
  }) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: borderRadius ?? AppRadius.k8,
      border: hasBorder ? Border.all(color: borderColor, width: borderWidth) : null,
      boxShadow: boxShadow ?? cardShadow,
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
      borderRadius: borderRadius ?? AppRadius.k4,
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
      borderRadius: borderRadius ?? AppRadius.top16,
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
