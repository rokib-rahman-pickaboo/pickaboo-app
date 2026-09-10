import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pickaboo/core/color/app_colors.dart';
export 'style/app_text_styles.dart';

/// ============================================================================
/// ✍️ CENTRALIZED ZERO-HARDCODE TYPOGRAPHY SYSTEM FOR PICKABOO APP
/// Single source of truth driving the entire application typography.
/// 
/// 🚫 RULE: ZERO HARDCODED [TextStyle] or [GoogleFonts] instantiations allowed.
/// All text must directly reference [AppTypography.<styleName>].
/// Preset font sizes, weights, and brand colors ensure compile-time const speed
/// and cross-device consistency across all screen sizes.
/// ============================================================================
abstract class AppTypography {
  // ── 1. TITLES, HEADERS & DISPLAY (PLUS JAKARTA SANS) ──

  /// Primary page app bar & main view titles (Plus Jakarta Sans, 16px, Bold w700, Navy)
  static TextStyle pageTitle = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.navy,
    height: 1.25,
  );

  /// White page title for dark headers or image backdrops (Plus Jakarta Sans, 16px, Bold w700, White)
  static TextStyle pageTitleWhite = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    height: 1.25,
  );

  /// Primary card header titles & main product name (Plus Jakarta Sans, 16px, Bold w700, Navy)
  static TextStyle mainHeaderTitle = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.navy,
    height: 1.25,
  );

  /// Section headers across Home, Profile & Settings (Plus Jakarta Sans, 14.5px, ExtraBold w800, Navy)
  static TextStyle sectionTitle = GoogleFonts.plusJakartaSans(
    fontSize: 14.5,
    fontWeight: FontWeight.w800,
    color: AppColors.navy,
    height: 1.25,
  );

  /// Shared card & grid item titles (Plus Jakarta Sans, 12.5px, Bold w700, Navy)
  static TextStyle cardTitle = GoogleFonts.plusJakartaSans(
    fontSize: 12.5,
    fontWeight: FontWeight.w700,
    color: AppColors.navy,
    height: 1.25,
  );

  static TextStyle cardTitleBold = GoogleFonts.plusJakartaSans(
    fontSize: 12.5,
    fontWeight: FontWeight.w900,
    color: AppColors.navy,
    height: 1.25,
  );

  /// Prominent campaign & hero banner headlines (Plus Jakarta Sans, 22px, Bold w700, Navy)
  static TextStyle heroTitle = GoogleFonts.plusJakartaSans(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.navy,
    height: 1.2,
  );

  // ── 2. BODY TEXT & DESCRIPTIONS (INTER) ──

  /// Emphasized readable body copy, key bullet highlights (Inter, 13.5px, SemiBold w600, Navy)
  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 13.5,
    fontWeight: FontWeight.w600,
    color: AppColors.navy,
    height: 1.35,
  );

  /// Standard body copy, descriptions, and paragraphs (Inter, 12px, Regular w400, Navy)
  static TextStyle bodyRegular = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.navy,
    height: 1.4,
  );

  /// Secondary muted body text, user email, IDs, & timestamps (Inter, 11px, Regular w400, Muted)
  static TextStyle bodyMuted = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.muted,
    height: 1.3,
  );

  /// Subtle light muted copy, secondary hints, disabled labels (Inter, 11px, Regular w400, MutedLight)
  static TextStyle bodyMutedLight = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.mutedLight,
    height: 1.3,
  );

  /// Micro captions, fine print legal text, inactive nav labels (Inter, 9.5px, Regular w400, Muted)
  static TextStyle bodyTiny = GoogleFonts.inter(
    fontSize: 9.5,
    fontWeight: FontWeight.w400,
    color: AppColors.muted,
    height: 1.25,
  );

  // ── 3. PRICING & SAVINGS TOKENS (POPPINS - AS IT IS) ──

  /// PDP headline price, checkout total payable (Poppins, 22px, Bold w700, Navy)
  static TextStyle priceLarge = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.navy,
    letterSpacing: 0.2,
    height: 1.2,
  );

  /// Product grid / card price, cart item price (Poppins, 14.5px, Bold w700, Navy)
  static TextStyle priceStandard = GoogleFonts.poppins(
    fontSize: 14.5,
    fontWeight: FontWeight.w700,
    color: AppColors.navy,
    height: 1.2,
  );

  /// Product strikethrough original price (Poppins, 11px, Regular w400, MutedLight)
  static TextStyle priceStrikethrough = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.mutedLight,
    decoration: TextDecoration.lineThrough,
    height: 1.2,
  );

  /// Green discount savings text (e.g. "You save ৳500 today") (Poppins, 11.5px, Bold w700, Green)
  static TextStyle savingsText = GoogleFonts.poppins(
    fontSize: 11.5,
    fontWeight: FontWeight.w700,
    color: AppColors.green,
    height: 1.25,
  );

  // ── 4. BUTTONS, ACTIONS & LINKS (PLUS JAKARTA SANS & INTER) ──

  /// Primary button label text (Plus Jakarta Sans, 12.5px, Bold w700, White)
  static TextStyle buttonPrimary = GoogleFonts.plusJakartaSans(
    fontSize: 12.5,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    letterSpacing: 0.3,
    height: 1.2,
  );

  /// Secondary / outlined button label text (Plus Jakarta Sans, 12.5px, Bold w700, Pickaboo Blue)
  static TextStyle buttonSecondary = GoogleFonts.plusJakartaSans(
    fontSize: 12.5,
    fontWeight: FontWeight.w700,
    color: AppColors.pickabooBlue,
    letterSpacing: 0.3,
    height: 1.2,
  );

  /// Sky blue brand action text & clickable links (e.g. "View All", "See More") (Inter, 11.5px, SemiBold w600, Blue)
  static TextStyle brandActionText = GoogleFonts.inter(
    fontSize: 11.5,
    fontWeight: FontWeight.w600,
    color: AppColors.pickabooBlue,
    height: 1.25,
  );

  /// Interactive link (Inter, 12px, Medium w500, Pickaboo Blue - No underline per UX rules)
  static TextStyle linkText = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.pickabooBlue,
    decoration: TextDecoration.none,
    height: 1.25,
  );

  // ── 5. FORM INPUTS & VALIDATION (INTER) ──

  /// Form field label above text fields (Inter, 13.5px, SemiBold w600, Navy)
  static TextStyle inputLabel = GoogleFonts.inter(
    fontSize: 13.5,
    fontWeight: FontWeight.w600,
    color: AppColors.navy,
    height: 1.25,
  );

  /// Active text typed inside text inputs (Inter, 13.5px, Regular w400, Navy)
  static TextStyle inputText = GoogleFonts.inter(
    fontSize: 13.5,
    fontWeight: FontWeight.w400,
    color: AppColors.navy,
    height: 1.3,
  );

  /// Placeholder hint inside text fields (Inter, 13.5px, Regular w400, MutedLight)
  static TextStyle inputHint = GoogleFonts.inter(
    fontSize: 13.5,
    fontWeight: FontWeight.w400,
    color: AppColors.mutedLight,
    height: 1.3,
  );

  /// Form validation error message (Inter, 11.5px, Medium w500, Red)
  static TextStyle inputError = GoogleFonts.inter(
    fontSize: 11.5,
    fontWeight: FontWeight.w500,
    color: AppColors.red,
    height: 1.2,
  );

  // ── 6. BADGES, STATUS & BRAND TAGS (INTER & PLUS JAKARTA SANS) ──

  /// Discount pill badge text in PDP (e.g. "-25% OFF") (Inter, 13.5px, ExtraBold w800, White)
  static TextStyle badgeDiscount = GoogleFonts.inter(
    fontSize: 13.5,
    fontWeight: FontWeight.w800,
    color: AppColors.white,
    height: 1.1,
  );

  /// Discount badge on product cards / item UI (Inter, 12.0px, ExtraBold w800, Red)
  static TextStyle badgeDiscountItem = GoogleFonts.inter(
    fontSize: 12.0,
    fontWeight: FontWeight.w800,
    color: AppColors.red,
    height: 1.1,
  );

  /// In Stock status badge text (Inter, 9.5px, ExtraBold w800, Green)
  static TextStyle badgeInStock = GoogleFonts.inter(
    fontSize: 9.5,
    fontWeight: FontWeight.w800,
    color: AppColors.green,
    height: 1.1,
  );

  /// Stock Out status badge text (Inter, 9.5px, ExtraBold w800, Red)
  static TextStyle badgeStockOut = GoogleFonts.inter(
    fontSize: 9.5,
    fontWeight: FontWeight.w800,
    color: AppColors.red,
    height: 1.1,
  );

  /// Delivery text on product card (e.g. "Next Day Delivery") (Inter, 9.5px, SemiBold w600, Green)
  static TextStyle deliveryTag = GoogleFonts.inter(
    fontSize: 9.5,
    fontWeight: FontWeight.w600,
    color: AppColors.green,
    height: 1.2,
  );

  /// Delivery "Delivery by " prefix label on product card (Inter, 9.5px, Regular w400, Muted)
  static TextStyle deliveryByLabel = GoogleFonts.inter(
    fontSize: 9.5,
    fontWeight: FontWeight.w400,
    color: AppColors.muted,
    height: 1.2,
  );

  /// Delivery target bold text on product card (e.g. "Tomorrow, 4 Sep") (Inter, 9.5px, Bold w700, Navy)
  static TextStyle deliveryByDate = GoogleFonts.inter(
    fontSize: 9.5,
    fontWeight: FontWeight.w700,
    color: AppColors.navy,
    height: 1.2,
  );

  /// Brand name tag chip (e.g. "SAMSUNG", "APPLE") (Plus Jakarta Sans, 9.5px, ExtraBold w800, Pickaboo Blue)
  static TextStyle brandTag = GoogleFonts.plusJakartaSans(
    fontSize: 9.5,
    fontWeight: FontWeight.w800,
    color: AppColors.pickabooBlue,
    letterSpacing: 0.5,
    height: 1.1,
  );

  /// Sponsored tag label on product cards (Inter, 9.5px, SemiBold w600, Muted)
  static TextStyle sponsoredLabel = GoogleFonts.inter(
    fontSize: 9.5,
    fontWeight: FontWeight.w600,
    color: AppColors.muted,
    height: 1.25,
  );

  // ── 7. PAGE & FEATURE SPECIFIC STYLES ──

  /// Support & FAQ question accordion title (Plus Jakarta Sans, 13px, SemiBold w600, Navy)
  static TextStyle supportFaqQuestion = GoogleFonts.plusJakartaSans(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.navy,
    height: 1.35,
  );

  /// Support & FAQ answer description (Inter, 12px, Regular w400, Navy)
  static TextStyle supportFaqAnswer = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.navy,
    height: 1.5,
  );

  /// Homepage category circular icon chip navigation title (Inter, 10px, Medium w500, Navy)
  static TextStyle homeCategoryNavTitle = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.navy,
    height: 1.2,
  );

  /// Active bottom navigation tab label (Inter, 10px, Bold w700, Pickaboo Blue)
  static TextStyle bottomNavActive = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: AppColors.pickabooBlue,
    height: 1.2,
  );

  /// Inactive bottom navigation tab label (Inter, 10px, Medium w500, Muted)
  static TextStyle bottomNavInactive = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.muted,
    height: 1.2,
  );

  /// Product catalog & grid card title (Plus Jakarta Sans, 11.5px, SemiBold w600, Navy)
  static TextStyle productCardTitle = GoogleFonts.plusJakartaSans(
    fontSize: 11.5,
    fontWeight: FontWeight.w600,
    color: AppColors.navy,
    height: 1.25,
  );
}

/// ============================================================================
/// 🛠️ FLUENT MODIFIER EXTENSIONS ON [TextStyle]
/// Allows non-destructive adjustments to base design tokens without hardcoding.
/// ============================================================================
extension AppTypographyModifiers on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);

  TextStyle size(double size) => copyWith(fontSize: size);

  TextStyle bold() => copyWith(fontWeight: FontWeight.w700);

  TextStyle extraBold() => copyWith(fontWeight: FontWeight.w800);

  TextStyle semiBold() => copyWith(fontWeight: FontWeight.w600);

  TextStyle medium() => copyWith(fontWeight: FontWeight.w500);

  TextStyle regular() => copyWith(fontWeight: FontWeight.w400);

  TextStyle light() => copyWith(fontWeight: FontWeight.w300);

  TextStyle italic() => copyWith(fontStyle: FontStyle.italic);

  TextStyle underline([Color? color]) => copyWith(
        decoration: TextDecoration.none,
      );

  TextStyle lineThrough([Color? color]) => copyWith(
        decoration: TextDecoration.lineThrough,
        decorationColor: color ?? this.color,
      );

  TextStyle withHeight(double height) => copyWith(height: height);

  TextStyle withLetterSpacing(double spacing) => copyWith(letterSpacing: spacing);

  TextStyle withShadows(List<Shadow> shadows) => copyWith(shadows: shadows);
}
