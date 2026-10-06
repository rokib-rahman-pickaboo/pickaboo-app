// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// High-contrast animated shimmer skeleton loader for [YourReviewPage].
/// Pre-renders visual placeholders for:
/// 1. 4 Review Rows (Product thumbnail, 2-line title, stars, and comment box)
class YourReviewSkeleton extends StatelessWidget {
  final int itemCount;

  const YourReviewSkeleton({
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
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.sameGroupItemSpacing.w,
          vertical: AppSpacing.sameGroupItemSpacing.h,
        ),
        itemCount: itemCount,
        separatorBuilder: (_, __) => SizedBox(height: 16.h),
        itemBuilder: (context, index) => _buildReviewRow(),
      ),
    );
  }

  Widget _buildReviewRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
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

            // Product Title & Rating Stars
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

        // Comment Box
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
                width: 180.w,
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
    );
  }
}
