import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pickaboo/core/color/app_colors.dart';

/// ============================================================================
/// ✍️ CENTRALIZED SINGLE-SOURCE TYPOGRAPHY SYSTEM FOR PICKABOO APP
/// 
/// Consolidates all text styling across the entire application into strictly
/// 20 canonical design tokens:
/// - 12 Changeable-Colour Styles (Core scale with pre-baked default colors)
/// - 8 Fixed-Colour Styles (Strict single-purpose eCommerce tokens)
/// 
/// 100% UI preservation: Fonts, weights, sizes, line heights, letter spacings,
/// and colors match production down to the exact sub-pixel.
/// ============================================================================
abstract class AppTypography {
  // ──────────────────────────────────────────────────────────────────────────
  // ── 🎨 12 CHANGEABLE-COLOUR STYLES (Default Color Pre-baked) ───────────────
  // ──────────────────────────────────────────────────────────────────────────

  /// 1. Hero Campaign & Timer Display (Plus Jakarta Sans, 22px, Bold w700)
  /// Default: AppColors.navy. Fluent override: `.white` on dark banners.
  static TextStyle get heroTitle => GoogleFonts.plusJakartaSans(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.navy,
        height: 1.20,
      );

  /// 2. Primary Page Title & App Bar (Plus Jakarta Sans, 16px, Bold w700)
  /// Default: AppColors.navy. Fluent override: `.white` on dark headers.
  static TextStyle get titleLarge => GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.navy,
        height: 1.25,
      );

  /// 3. Section Title across Home & Profile (Plus Jakarta Sans, 14.5px, ExtraBold w800)
  /// Default: AppColors.navy.
  static TextStyle get titleMedium => GoogleFonts.plusJakartaSans(
        fontSize: 14.5,
        fontWeight: FontWeight.w800,
        color: AppColors.navy,
        height: 1.25,
      );

  /// 4. Card & Grid Item Title (Plus Jakarta Sans, 12.5px, Bold w700)
  /// Default: AppColors.navy. Fluent override: `.blue` when active.
  static TextStyle get titleSmall => GoogleFonts.plusJakartaSans(
        fontSize: 12.5,
        fontWeight: FontWeight.w700,
        color: AppColors.navy,
        height: 1.25,
      );

  /// 5. 2-Column Catalog Product Card Title (Plus Jakarta Sans, 11.5px, SemiBold w600)
  /// Default: AppColors.navy.
  static TextStyle get titleMicro => GoogleFonts.plusJakartaSans(
        fontSize: 11.5,
        fontWeight: FontWeight.w600,
        color: AppColors.navy,
        height: 1.25,
      );

  /// 6. Emphasized Body Copy & Form Labels (Inter, 13.5px, SemiBold w600)
  /// Default: AppColors.navy.
  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 13.5,
        fontWeight: FontWeight.w600,
        color: AppColors.navy,
        height: 1.35,
      );

  /// 7. Standard Body Copy & Descriptions (Inter, 12px, Regular w400)
  /// Default: AppColors.navy.
  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.navy,
        height: 1.40,
      );

  /// 8. Secondary Subtitles, Order Dates & Timestamps (Inter, 11px, Regular w400)
  /// Default: AppColors.muted. Fluent override: `.navy`.
  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.muted,
        height: 1.30,
      );

  /// 9. Fine Print Legal & Inactive Tab Captions (Inter, 9.5px, Regular w400)
  /// Default: AppColors.muted.
  static TextStyle get bodyTiny => GoogleFonts.inter(
        fontSize: 9.5,
        fontWeight: FontWeight.w400,
        color: AppColors.muted,
        height: 1.25,
      );

  /// 10. Headline Price & Checkout Total (Poppins, 22px, Bold w700)
  /// Default: AppColors.navy. Fluent override: `.blue` on cart checkout.
  static TextStyle get priceLarge => GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.navy,
        letterSpacing: 0.2,
        height: 1.20,
      );

  /// 11. Product Grid & Cart Item Price (Poppins, 14.5px, Bold w700)
  /// Default: AppColors.navy. Fluent override: `.blue` or `.red`.
  static TextStyle get priceStandard => GoogleFonts.poppins(
        fontSize: 14.5,
        fontWeight: FontWeight.w700,
        color: AppColors.navy,
        height: 1.20,
      );

  /// 12. Primary Action Button Label (Plus Jakarta Sans, 12.5px, Bold w700)
  /// Default: AppColors.white. Fluent override: `.blue` for secondary button.
  static TextStyle get button => GoogleFonts.plusJakartaSans(
        fontSize: 12.5,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
        letterSpacing: 0.3,
        height: 1.20,
      );

  // ──────────────────────────────────────────────────────────────────────────
  // ── 🔒 8 FIXED-COLOUR STYLES (Single-Purpose, Immutable) ───────────────────
  // ──────────────────────────────────────────────────────────────────────────

  /// 13. Savings text e.g. "You save ৳500 today" (Poppins, 11.5px, Bold w700, Green)
  static TextStyle get savingsText => GoogleFonts.poppins(
        fontSize: 11.5,
        fontWeight: FontWeight.w700,
        color: AppColors.green,
        height: 1.25,
      );

  /// 14. Strikethrough original price (Poppins, 11px, Regular w400, MutedLight)
  static TextStyle get priceStrike => GoogleFonts.poppins(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.mutedLight,
        decoration: TextDecoration.lineThrough,
        height: 1.20,
      );

  /// 15. Uppercase brand tag chip e.g. "SAMSUNG" (Plus Jakarta Sans, 9.5px, ExtraBold w800, Blue)
  static TextStyle get brandTag => GoogleFonts.plusJakartaSans(
        fontSize: 9.5,
        fontWeight: FontWeight.w800,
        color: AppColors.pickabooBlue,
        letterSpacing: 0.5,
        height: 1.10,
      );

  /// 16. Express delivery assurance tag (Inter, 9.5px, SemiBold w600, Green)
  static TextStyle get deliveryTag => GoogleFonts.inter(
        fontSize: 9.5,
        fontWeight: FontWeight.w600,
        color: AppColors.green,
        height: 1.20,
      );

  /// 17. Action text e.g. "View All", "See More" (Inter, 11.5px, SemiBold w600, Blue)
  static TextStyle get brandAction => GoogleFonts.inter(
        fontSize: 11.5,
        fontWeight: FontWeight.w600,
        color: AppColors.pickabooBlue,
        height: 1.25,
      );

  /// 18. In-line interactive navigation link (Inter, 12px, Medium w500, Blue)
  static TextStyle get link => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.pickabooBlue,
        decoration: TextDecoration.none,
        height: 1.25,
      );

  /// 19. Form text field placeholder hint (Inter, 13.5px, Regular w400, MutedLight)
  static TextStyle get inputHint => GoogleFonts.inter(
        fontSize: 13.5,
        fontWeight: FontWeight.w400,
        color: AppColors.mutedLight,
        height: 1.30,
      );

  /// 20. Form validation error warning (Inter, 11.5px, Medium w500, Red)
  static TextStyle get inputError => GoogleFonts.inter(
        fontSize: 11.5,
        fontWeight: FontWeight.w500,
        color: AppColors.red,
        height: 1.20,
      );
}

// ============================================================================
// 🛠️ FLUENT COLOR & TYPOGRAPHY MODIFIERS ON [TextStyles]
// ============================================================================
extension AppTypographyModifiers on TextStyle {
  // ── Color Shortcuts ──
  TextStyle get white => copyWith(color: AppColors.white);
  TextStyle get navy => copyWith(color: AppColors.navy);
  TextStyle get blue => copyWith(color: AppColors.pickabooBlue);
  TextStyle get muted => copyWith(color: AppColors.muted);
  TextStyle get mutedLight => copyWith(color: AppColors.mutedLight);
  TextStyle get green => copyWith(color: AppColors.green);
  TextStyle get red => copyWith(color: AppColors.red);
  TextStyle get amber => copyWith(color: AppColors.amber);

  // ── Direct Modifications ──
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle size(double size) => copyWith(fontSize: size);
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);
  TextStyle bold() => copyWith(fontWeight: FontWeight.w700);
  TextStyle extraBold() => copyWith(fontWeight: FontWeight.w900);
  TextStyle black() => copyWith(fontWeight: FontWeight.w900);
  TextStyle semiBold() => copyWith(fontWeight: FontWeight.w600);
  TextStyle medium() => copyWith(fontWeight: FontWeight.w500);
  TextStyle regular() => copyWith(fontWeight: FontWeight.w400);
  TextStyle light() => copyWith(fontWeight: FontWeight.w300);
  TextStyle italic() => copyWith(fontStyle: FontStyle.italic);
  TextStyle underline([Color? color]) => copyWith(decoration: TextDecoration.none);
  TextStyle lineThrough([Color? color]) => copyWith(
        decoration: TextDecoration.lineThrough,
        decorationColor: color ?? this.color,
      );
  TextStyle withHeight(double height) => copyWith(height: height);
  TextStyle withLetterSpacing(double spacing) => copyWith(letterSpacing: spacing);
  TextStyle withShadows(List<Shadow> shadows) => copyWith(shadows: shadows);
}
