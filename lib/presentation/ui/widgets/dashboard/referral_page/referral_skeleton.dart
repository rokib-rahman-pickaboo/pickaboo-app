// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// High-contrast animated shimmer skeleton loader for [ReferralPage].
/// Pre-renders visual placeholders for:
/// 1. Referral Link Card:
///    - Share icon badge & title
///    - Link box with "Copy" button pill
///    - Pending & Completed metric cards
/// 2. Referral Journey Card (3 steps with circular number badges)
/// 3. Bottom Sticky "Share Invitation" Button Bar
class ReferralSkeleton extends StatelessWidget {
  const ReferralSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                AppSpacing.sameGroupItemSpacing.w,
                AppSpacing.sameGroupItemSpacing.h,
                AppSpacing.sameGroupItemSpacing.w,
                AppSpacing.sameGroupItemSpacing.h + 16.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── 1. Referral Link & Stats Card ──
                  _buildReferralLinkCard(),

                  AppSpacing.groupToGroupGap,

                  // ── 2. Referral Journey Card ──
                  _buildJourneyCard(),
                ],
              ),
            ),
          ),

          // ── 3. Bottom Sticky Share Button ──
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildReferralLinkCard() {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32.r,
                height: 32.r,
                decoration: BoxDecoration(
                  color: AppColors.itemBackground,
                  borderRadius: AppRadius.k8,
                  border: Border.all(color: AppColors.border),
                ),
                child: Center(
                  child: Icon(
                    Icons.share_outlined,
                    size: 16.sp,
                    color: AppColors.skeletonBase,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                width: 170.w,
                height: 14.h,
                decoration: const BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.k4,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            width: 210.w,
            height: 11.h,
            decoration: const BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k4,
            ),
          ),
          SizedBox(height: 12.h),

          // Link box with Copy pill
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.itemBackground,
              borderRadius: AppRadius.k8,
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 12.h,
                    decoration: const BoxDecoration(
                      color: AppColors.skeletonBase,
                      borderRadius: AppRadius.k4,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  width: 55.w,
                  height: 30.h,
                  decoration: const BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k8,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),

          // Pending & Completed 2 stats cards
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: AppColors.itemBackground,
                    borderRadius: AppRadius.k8,
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 22.r,
                        height: 22.r,
                        decoration: const BoxDecoration(
                          color: AppColors.skeletonBase,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        width: 35.w,
                        height: 16.h,
                        decoration: const BoxDecoration(
                          color: AppColors.skeletonBase,
                          borderRadius: AppRadius.k4,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        width: 50.w,
                        height: 10.h,
                        decoration: const BoxDecoration(
                          color: AppColors.skeletonBase,
                          borderRadius: AppRadius.k4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: AppColors.itemBackground,
                    borderRadius: AppRadius.k8,
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 22.r,
                        height: 22.r,
                        decoration: const BoxDecoration(
                          color: AppColors.skeletonBase,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        width: 35.w,
                        height: 16.h,
                        decoration: const BoxDecoration(
                          color: AppColors.skeletonBase,
                          borderRadius: AppRadius.k4,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        width: 55.w,
                        height: 10.h,
                        decoration: const BoxDecoration(
                          color: AppColors.skeletonBase,
                          borderRadius: AppRadius.k4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildJourneyCard() {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: AppDecorations.cardBoxDecoration(),
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
          SizedBox(height: 14.h),

          for (int i = 0; i < 3; i++) ...[
            if (i > 0) SizedBox(height: 14.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 26.r,
                  height: 26.r,
                  decoration: const BoxDecoration(
                    color: AppColors.skeletonBase,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120.w,
                        height: 12.h,
                        decoration: const BoxDecoration(
                          color: AppColors.skeletonBase,
                          borderRadius: AppRadius.k4,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        width: double.infinity,
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
          ],
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      child: SafeArea(
        top: false,
        child: Container(
          width: double.infinity,
          height: 48.h,
          decoration: const BoxDecoration(
            color: AppColors.skeletonBase,
            borderRadius: AppRadius.k8,
          ),
        ),
      ),
    );
  }
}
