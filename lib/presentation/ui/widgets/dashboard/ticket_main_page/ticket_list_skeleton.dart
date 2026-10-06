// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// High-contrast animated shimmer skeleton loader for [TicketMainPage].
/// Pre-renders visual placeholders for:
/// 1. 4 Support Ticket Cards:
///    - Subject line & ticket code bone (#TCK-...)
///    - Department icon & text bone
///    - Priority flag & priority badge
///    - Date timestamp & status capsule pill
class TicketListSkeleton extends StatelessWidget {
  final int itemCount;

  const TicketListSkeleton({
    super.key,
    this.itemCount = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(
          AppSpacing.sameGroupItemSpacing.w,
          AppSpacing.sameGroupItemSpacing.h,
          AppSpacing.sameGroupItemSpacing.w,
          AppSpacing.sameGroupItemSpacing.h + 80.h,
        ),
        itemCount: itemCount,
        separatorBuilder: (_, __) => SizedBox(height: AppSpacing.sameGroupItemSpacing.h),
        itemBuilder: (context, index) => _buildTicketCard(),
      ),
    );
  }

  Widget _buildTicketCard() {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Subject & Code ──
          Container(
            width: double.infinity,
            height: 14.h,
            decoration: const BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k4,
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            width: 140.w,
            height: 14.h,
            decoration: const BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k4,
            ),
          ),
          SizedBox(height: 6.h),
          Container(
            width: 90.w,
            height: 11.h,
            decoration: const BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k4,
            ),
          ),

          SizedBox(height: 12.h),

          // ── Department & Priority ──
          Row(
            children: [
              Icon(Icons.apps_rounded, size: 15.sp, color: AppColors.skeletonBase),
              SizedBox(width: 6.w),
              Container(
                width: 90.w,
                height: 11.h,
                decoration: const BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.k4,
                ),
              ),
              SizedBox(width: 16.w),
              Icon(Icons.flag_outlined, size: 15.sp, color: AppColors.skeletonBase),
              SizedBox(width: 6.w),
              Container(
                width: 60.w,
                height: 11.h,
                decoration: const BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.k4,
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),
          const Divider(height: 1, thickness: 1, color: AppColors.border),
          SizedBox(height: 10.h),

          // ── Date & Status Pill ──
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined, size: 13.sp, color: AppColors.skeletonBase),
                  SizedBox(width: 6.w),
                  Container(
                    width: 80.w,
                    height: 11.h,
                    decoration: const BoxDecoration(
                      color: AppColors.skeletonBase,
                      borderRadius: AppRadius.k4,
                    ),
                  ),
                ],
              ),
              Container(
                width: 65.w,
                height: 22.h,
                decoration: const BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.kFull,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
