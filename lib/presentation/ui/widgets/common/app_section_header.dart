import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';

/// ─────────────────────────────────────────────────────────────
/// 📌 CENTRALIZED REUSABLE SECTION HEADER
/// Unifies Section Title and optional "View All >" Action
/// across Home, PDP, Category, Offers, and Just For You.
/// ─────────────────────────────────────────────────────────────
class AppSectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;
  final String viewAllText;
  final EdgeInsetsGeometry? padding;
  final Widget? trailing;

  const AppSectionHeader({
    super.key,
    required this.title,
    this.onViewAll,
    this.viewAllText = 'View All',
    this.padding,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: AppSpacing.sameGroupItemSpacing.w,
          ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.sectionTitle,
            ),
          ),
          if (trailing != null)
            trailing!
          else if (onViewAll != null) ...[
            SizedBox(width: AppSpacing.sameGroupItemSpacing.w),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onViewAll,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      viewAllText,
                      style: AppTypography.cardTitle,
                    ),
                    SizedBox(width: 2.w),
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 16.sp,
                      color: AppColors.pickabooBlue,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
