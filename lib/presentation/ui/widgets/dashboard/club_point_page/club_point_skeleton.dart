// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// High-contrast animated shimmer skeleton loader for [ClubPointPage].
/// Pre-renders visual placeholders for:
/// 1. Hero Club Points Header Card
///    - Lifetime points counter & balance box
///    - Tier progression bar & points needed message
/// 2. "Point History" Section Header
/// 3. 4 Point History Timeline Items (Point badge pill, title, and timestamp)
class ClubPointSkeleton extends StatelessWidget {
  final int itemCount;

  const ClubPointSkeleton({
    super.key,
    this.itemCount = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(
            AppSpacing.sameGroupItemSpacing.w,
            AppSpacing.sameGroupItemSpacing.h,
            AppSpacing.sameGroupItemSpacing.w,
            AppSpacing.sameGroupItemSpacing.h + 20.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── 1. Hero Points Header Card ──
              _buildPointsHeaderCard(),

              SizedBox(height: AppSpacing.groupToGroupSpacing.h),

              // ── 2. Point History Title ──
              Container(
                width: 120.w,
                height: 16.h,
                decoration: const BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.k4,
                ),
              ),

              SizedBox(height: 12.h),

              // ── 3. Point History Timeline Items ──
              for (int i = 0; i < itemCount; i++) ...[
                _buildHistoryTimelineItem(isLast: i == itemCount - 1),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPointsHeaderCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.k16,
        border: Border.all(color: AppColors.border, width: 1.2.w),
        boxShadow: AppDecorations.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 110.w,
                      height: 12.h,
                      decoration: const BoxDecoration(
                        color: AppColors.skeletonBase,
                        borderRadius: AppRadius.k4,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 80.w,
                      height: 28.h,
                      decoration: const BoxDecoration(
                        color: AppColors.skeletonBase,
                        borderRadius: AppRadius.k4,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.itemBackground,
                  borderRadius: AppRadius.k8,
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 45.w,
                      height: 10.h,
                      decoration: const BoxDecoration(
                        color: AppColors.skeletonBase,
                        borderRadius: AppRadius.k4,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Container(
                      width: 55.w,
                      height: 16.h,
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
          SizedBox(height: 18.h),

          // Progress Bar
          Container(
            width: double.infinity,
            height: 6.h,
            decoration: const BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k8,
            ),
          ),
          SizedBox(height: 10.h),

          // Next Level hint
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
    );
  }

  Widget _buildHistoryTimelineItem({required bool isLast}) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12.h),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: AppDecorations.cardBoxDecoration(),
        child: Row(
          children: [
            // Points pill badge
            Container(
              width: 65.w,
              height: 26.h,
              decoration: const BoxDecoration(
                color: AppColors.skeletonBase,
                borderRadius: AppRadius.kFull,
              ),
            ),
            SizedBox(width: 14.w),

            // Description and Date
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
                  SizedBox(height: 6.h),
                  Container(
                    width: 100.w,
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
      ),
    );
  }
}
