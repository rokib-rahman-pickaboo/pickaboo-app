import 'package:flutter/material.dart';

export 'package:pickaboo/core/constants/app_strings.dart';
export 'package:pickaboo/core/theme/app_decorations.dart';

/// ============================================================================
/// 🎨 CENTRALIZED ZERO-HARDCODE COLOR SYSTEM FOR PICKABOO APP
/// Single source of truth driving the entire application palette.
/// 
/// 🚫 RULE: ZERO HARDCODED [Color(0x...)] instantiations allowed.
/// All colors must directly reference [AppColors.<colorName>].
/// ============================================================================
abstract class AppColors {
  // ──────────────────────────────────────────────────────────────────────────
  // ── 🌟 PART 1: BASIC REGULAR USED COLORS (Used 3+ times across app) ───────
  // ──────────────────────────────────────────────────────────────────────────

  // 1. Brand Identity & Interactive
  /// Primary Brand Sky Blue (CTA Buttons, Active Tabs, Action Links, Icons)
  static const Color pickabooBlue = Color(0xFF00AEEF);
  static const Color primary      = pickabooBlue;

  /// Primary Dark Navy (Page Headings, Card Titles, High-Contrast Text)
  static const Color navy         = Color(0xFF14304A);

  // 2. Canvas, Surfaces & Cards
  /// Universal Card Surface, Sheet Canvas, App Bar Background & White Text
  static const Color white        = Color(0xFFFFFFFF);

  /// Universal Page Scaffold Canvas Floor & Neutral Section Base
  //static const Color pageBg       = Color(0xFFF8FAFC);
  static const Color pageBg       = Color(0xFFFBFCFD);

  /// Soft Ice-Blue Surface Tint (Trust Ribbon, Q&A Blocks, Info Strips)
  static const Color surfaceBlue  = Color(0xFFEFF6FF);

  // 3. Dividers, Outlines & Borders
  /// Unified Card Borders, Dividers, Separation Lines & Input Field Outlines
  //static const Color border       = Color(0xFFE2E8F0);
  static const Color border       = Color(0xFFF0F4F8);

  // 4. Typography & Text Roles
  /// Primary Dark Body Text & Review Comments
  static const Color text         = Color(0xFF1A1F27);

  /// Secondary Muted Subtitles, Timestamps, Inactive Nav Icons & Strike-Through
  static const Color muted        = Color(0xFF70788A);

  /// Form Field Placeholders, Disabled Text & Inactive Chevrons
  static const Color mutedLight   = Color(0xFF94A3B8);

  // 5. Status & Feedback
  /// Positive Status (In Stock, Official Warranty, Success, Savings Text)
  static const Color green        = Color(0xFF16A34A);

  /// Soft Green Badge Surface (In Stock, Pickaboo Assured)
  static const Color greenBg      = Color(0xFFDCFCE7);

  /// Destructive & Sale (Discount % Tags, Delete Actions, Stock-Out, Form Errors)
  static const Color red          = Color(0xFFF1483A);

  /// Soft Red Badge Surface (Discount Tags, Cancellation, Stock-Out)
  static const Color redBg        = Color(0xFFFFECEB);

  /// Warning & Highlights (Rating Stars, EMI Highlights, Pending Status)
  static const Color amber        = Color(0xFFF59E0B);

  /// Soft Amber Highlight Surface (EMI Cards, Rating Boxes)
  static const Color amberBg      = Color(0xFFFFF7F0);

  // 6. System Utilities
  /// Full-Screen Media Viewer Canvas & Deep Shadow Base
  static const Color black        = Color(0xFF000000);

  /// Transparent Tap Targets & Clear Overlays
  static const Color transparent  = Color(0x00000000);

  // ──────────────────────────────────────────────────────────────────────────
  // ── 🎯 PART 2: SPECIAL & ONE-TIME USED COLORS (Used 1–3 times in app) ─────
  // ──────────────────────────────────────────────────────────────────────────

  /// bKash Payment Gateway Badge & Pickaboo Spotlight Tag
  static const Color pink         = Color(0xFFE91E63);

  /// Nagad Digital Payment Badge & Flash Deal Flame Accent
  static const Color orange       = Color(0xFFFF7043);

  /// Visa / MasterCard 0% EMI Financing Badge
  static const Color visaBlue     = Color(0xFF1A237E);

  /// Facebook Social Login Button Surface
  static const Color facebookBlue = Color(0xFF1877F2);

  /// Verified Customer VIP Shield & Monsoon Promo Ribbon
  static const Color gold         = Color(0xFFFFD700);
}
