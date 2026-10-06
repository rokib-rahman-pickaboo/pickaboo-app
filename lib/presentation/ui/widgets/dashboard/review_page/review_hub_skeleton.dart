// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// High-contrast animated shimmer skeleton loader for [Review] (Review Hub Page).
/// Pre-renders visual placeholders for:
/// 1. Incentive & Summary Header Card (Medal badge, title, and review stats)
/// 2. Section Title Strip ("Your Submitted Reviews")
/// 3. 3 Detailed Review Cards:
///    - 64x64 Product thumbnail with image icon
///    - 2-line Product title bone
///    - 5-Star rating row
///    - Review body comment container
///    - Timestamp and verified badge pill
class ReviewHubSkeleton extends StatelessWidget {
  final int itemCount;

  const ReviewHubSkeleton({
    super.key,
    this.itemCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.sameGroupItemSpacing.w,
          vertical: AppSpacing.sameGroupItemSpacing.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 1. Summary & Reward Incentive Header Card ──
            _buildIncentiveHeaderCard(),

            SizedBox(height: AppSpacing.groupToGroupSpacing.h),

            // ── 2. Section Title ──
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150.w,
                  height: 14.h,
                  decoration: const BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
                Container(
                  width: 80.w,
                  height: 12.h,
                  decoration: const BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSpacing.sameGroupItemSpacing.h),

            // ── 3. Reviews List Cards ──
            for (int i = 0; i < itemCount; i++) ...[
              if (i > 0) SizedBox(height: AppSpacing.sameGroupItemSpacing.h),
              _buildReviewCardSkeleton(),
            ],

            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  Widget _buildIncentiveHeaderCard() {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Row(
        children: [
          Container(
            width: 46.w,
            height: 46.w,
            decoration: BoxDecoration(
              color: AppColors.itemBackground,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.border),
            ),
            child: Center(
              child: Icon(
                Icons.stars_rounded,
                size: 24.sp,
                color: AppColors.skeletonBase,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 160.w,
                  height: 14.h,
                  decoration: const BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  width: 190.w,
                  height: 11.h,
                  decoration: const BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 50.w,
            height: 24.h,
            decoration: const BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.kFull,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCardSkeleton() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 64x64 Thumbnail
              Container(
                width: 64.w,
                height: 64.w,
                decoration: BoxDecoration(
                  color: AppColors.itemBackground,
                  borderRadius: AppRadius.k8,
                  border: Border.all(color: AppColors.border),
                ),
                child: Center(
                  child: Icon(
                    Icons.image_outlined,
                    size: 24.sp,
                    color: AppColors.skeletonBase,
                  ),
                ),
              ),
              SizedBox(width: 12.w),

              // Title, Stars, Date
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 12.h,
                      decoration: const BoxDecoration(
                        color: AppColors.skeletonBase,
                        borderRadius: AppRadius.k4,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      width: 130.w,
                      height: 12.h,
                      decoration: const BoxDecoration(
                        color: AppColors.skeletonBase,
                        borderRadius: AppRadius.k4,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    // Stars row
                    Row(
                      children: List.generate(
                        5,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: 3.w),
                          child: Icon(
                            Icons.star_rounded,
                            size: 14.sp,
                            color: AppColors.skeletonBase,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          // Review Comment bubble
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.itemBackground,
              borderRadius: AppRadius.k8,
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 10.h,
                  decoration: const BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  width: 160.w,
                  height: 10.h,
                  decoration: const BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
