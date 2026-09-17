// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// ============================================================================
/// 📋 UNIVERSAL PICKABOO MENU / CATEGORY LIST TILE
/// Unified reusable component used across:
///   - Profile / Dashboard (Account Settings, App Preferences, Logout, etc.)
///   - Help & Support / FAQs (Categories with optional expandable sub-menus)
///
/// Features:
///   - Standard 54px row height with 34x34px soft tinted icon container
///   - Dynamic subtitle:
///       * If explicit subtitle provided -> displays title + subtitle
///       * If subtitle is null/empty & subItems exist -> displays subItems joined by commas (e.g. "Payment, EMI, Refund, EMI Form")
///       * If no subtitle & no subItems -> centers title vertically within the 54px box
///   - Optional expandable accordion for sub-menus (with smooth animated rotation)
///   - Styling variants: Normal, isDestructive (Red theme for Logout), isBrand (Blue theme for Login)
///   - Optional auto divider
/// ============================================================================
class AppMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool isDestructive;
  final bool isBrand;
  final Color? customIconColor;

  // ── Expandable Sub-items (FAQ / Support) ──
  final List<String>? subItems;
  final bool isExpanded;
  final ValueChanged<String>? onSubItemTap;
  final bool showDivider;
  final Widget? trailing;
  final bool? showTrailing;
  final bool isDetailMode;

  const AppMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.isDestructive = false,
    this.isBrand = false,
    this.customIconColor,
    this.subItems,
    this.isExpanded = false,
    this.onSubItemTap,
    this.showDivider = false,
    this.trailing,
    this.showTrailing,
    this.isDetailMode = false,
  });

  /// The horizontal start position for dividers centered between icon end and text start
  static double get dividerIndent =>
      (AppSpacing.sameGroupItemSpacing + 34 + 6).w;

  @override
  Widget build(BuildContext context) {
    final bool hasSubItems = subItems != null && subItems!.isNotEmpty;

    // Determine effective subtitle
    String? effectiveSubtitle = subtitle;
    if ((effectiveSubtitle == null || effectiveSubtitle.isEmpty) &&
        hasSubItems) {
      effectiveSubtitle = subItems!.join(', ');
    }
    final bool hasSubtitle =
        effectiveSubtitle != null && effectiveSubtitle.trim().isNotEmpty;

    // Determine colors
    final Color iconColor = isDestructive
        ? AppColors.red
        : (customIconColor ??
            (isBrand ? AppColors.pickabooBlue : AppColors.pickabooBlue));
    final Color textColor = isDestructive ? AppColors.red : AppColors.navy;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 54.h,
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.sameGroupItemSpacing.w,
              vertical: 6.h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ── Left Icon Container (34x34px) ──
                Container(
                  width: 34.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.1),
                    borderRadius: AppRadius.buttonRadius,
                  ),
                  child: Center(
                    child: Icon(icon, color: iconColor, size: 18.sp),
                  ),
                ),
                SizedBox(width: 12.w),

                // ── Title & Optional Subtitle ──
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isDetailMode) ...[
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.bodySmall,
                        ),
                        if (hasSubtitle) ...[
                          SizedBox(height: 2.h),
                          Text(
                            effectiveSubtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.titleSmall.copyWith(
                              color: textColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ] else ...[
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.titleSmall.copyWith(
                            color: (hasSubItems && isExpanded)
                                ? AppColors.pickabooBlue
                                : textColor,
                          ),
                        ),
                        if (hasSubtitle) ...[
                          SizedBox(height: 2.h),
                          Text(
                            effectiveSubtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.bodySmall,
                          ),
                        ],
                      ],
                    ],
                  ),
                ),

                // ── Trailing Widget / Arrow ──
                if (trailing != null)
                  trailing!
                else if (hasSubItems)
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 20.sp,
                      color: isExpanded
                          ? AppColors.pickabooBlue
                          : AppColors.muted,
                    ),
                  )
                else if (showTrailing ?? !isDetailMode)
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 16.sp,
                    color: AppColors.muted,
                  ),
              ],
            ),
          ),
        ),

        // ── Expandable Sub-items Accordion ──
        if (hasSubItems)
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity),
            secondChild: Container(
              color: AppColors.pageBg,
              child: Column(
                children: subItems!.map((subTitle) {
                  return InkWell(
                    onTap: () => onSubItemTap?.call(subTitle),
                    child: Container(
                      height: 44.h,
                      padding: EdgeInsets.only(left: 60.w, right: 16.w),
                      child: Row(
                        children: [
                          Container(
                            width: 5.w,
                            height: 5.h,
                            decoration: const BoxDecoration(
                              color: AppColors.pickabooBlue,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(
                              subTitle,
                              style: AppTypography.titleSmall,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            size: 16.sp,
                            color: AppColors.muted,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
          ),

        if (showDivider)
          Divider(
            height: 1.h,
            thickness: 1.h,
            indent: dividerIndent,
            color: AppColors.border,
          ),
      ],
    );
  }
}
