import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// ============================================================================
/// 📦 PAYMENT REVIEW SECTION
/// Enhanced container card with icon prefix, accent border, and standardized spacing.
/// ============================================================================
class PaymentReviewSection extends StatelessWidget {
  final String title;
  final Widget child;
  final EdgeInsets? margin;
  final Widget? trailing;
  final IconData? icon;

  const PaymentReviewSection({
    super.key,
    required this.title,
    required this.child,
    this.margin,
    this.trailing,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ??
          EdgeInsets.symmetric(
            horizontal: AppSpacing.sameGroupItemSpacing.w,
          ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(
          color: AppColors.border.withValues(alpha: 0.8),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.navy.withValues(alpha: 0.03),
            blurRadius: 6.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Section Header with Icon ──
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: const BoxDecoration(
              color: AppColors.pageBg,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppRadius.card),
              ),
            ),
            child: Row(
              children: [
                if (icon != null) ...[
                  Container(
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                      color: AppColors.pickabooBlue.withValues(alpha: 0.1),
                      borderRadius: AppRadius.badgeRadius,
                    ),
                    child: Icon(
                      icon,
                      size: 14.sp,
                      color: AppColors.pickabooBlue,
                    ),
                  ),
                  SizedBox(width: 8.w),
                ],
                Expanded(
                  child: Text(
                    title,
                    style: AppTypography.sectionTitle.copyWith(
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
                if (trailing != null) trailing!,
              ],
            ),
          ),

          // ── Content ──
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            child: child,
          ),
        ],
      ),
    );
  }
}
