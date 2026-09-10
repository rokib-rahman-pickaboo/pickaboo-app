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
/// ❓ UNIVERSAL EXPANDABLE FAQ / ACCORDION TILE
/// Reusable tile matching Pickaboo's signature menu/card pattern:
///   - Clean question title + smooth rotating chevron arrow
///   - Expands to reveal answer body inside
///   - Designed to sit inside a single grouped card with inner dividers
/// ============================================================================
class AppFaqTile extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final VoidCallback onTap;
  final Widget? expandedContent;
  final bool showDivider;

  const AppFaqTile({
    super.key,
    required this.title,
    required this.isExpanded,
    required this.onTap,
    this.expandedContent,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            constraints: BoxConstraints(minHeight: 50.h),
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.sameGroupItemSpacing.w,
              vertical: 10.h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: isExpanded
                        ? AppTypography.supportFaqQuestion
                            .withColor(AppColors.pickabooBlue)
                        : AppTypography.supportFaqQuestion
                            .withColor(AppColors.text),
                  ),
                ),
                AppSpacing.sameGroupWidthGap,
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 22.sp,
                    color: isExpanded
                        ? AppColors.pickabooBlue
                        : AppColors.muted,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded && expandedContent != null) ...[
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.sameGroupItemSpacing.w,
              0,
              AppSpacing.sameGroupItemSpacing.w,
              AppSpacing.sameGroupItemSpacing.h,
            ),
            child: expandedContent!,
          ),
        ],
        if (showDivider)
          Divider(
            height: 1,
            thickness: 1,
            indent: AppSpacing.sameGroupItemSpacing.w,
            endIndent: AppSpacing.sameGroupItemSpacing.w,
            color: AppColors.border,
          ),
      ],
    );
  }
}
