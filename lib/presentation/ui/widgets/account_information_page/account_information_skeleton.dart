// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// High-contrast animated shimmer skeleton loader for [AccountInformationPage].
/// Pre-renders visual placeholders for:
/// 1. Profile Header Card (80x80 circular avatar, name, email/phone, verified badge)
/// 2. Personal Information Card (4 label + value field rows)
/// 3. Contact & Security Card (Phone row, email row, password row)
/// 4. Logout Action Button
class AccountInformationSkeleton extends StatelessWidget {
  const AccountInformationSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(
          AppSpacing.sameGroupItemSpacing.w,
          0,
          AppSpacing.sameGroupItemSpacing.w,
          AppSpacing.sameGroupItemSpacing.h + 20.h,
        ),
        child: Column(
          children: [
            // ── 1. Profile Header Card ──
            _buildProfileHeaderCard(),

            AppSpacing.groupToGroupGap,

            // ── 2. Personal Information Card ──
            _buildPersonalInfoCard(),

            AppSpacing.groupToGroupGap,

            // ── 3. Contact & Security Card ──
            _buildContactSecurityCard(),

            AppSpacing.groupToGroupGap,

            // ── 4. Logout Button ──
            Container(
              width: double.infinity,
              height: 46.h,
              decoration: const BoxDecoration(
                color: AppColors.skeletonBase,
                borderRadius: AppRadius.k8,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeaderCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        children: [
          // 80x80 Avatar circle with camera icon
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 80.r,
                height: 80.r,
                decoration: const BoxDecoration(
                  color: AppColors.skeletonBase,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 26.r,
                height: 26.r,
                decoration: BoxDecoration(
                  color: AppColors.itemBackground,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.border),
                ),
                child: Center(
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 14.sp,
                    color: AppColors.skeletonBase,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // User Full Name
          Container(
            width: 150.w,
            height: 16.h,
            decoration: const BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k4,
            ),
          ),
          SizedBox(height: 6.h),

          // Email / Phone
          Container(
            width: 180.w,
            height: 12.h,
            decoration: const BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k4,
            ),
          ),
          SizedBox(height: 8.h),

          // Verified Pill Badge
          Container(
            width: 70.w,
            height: 20.h,
            decoration: const BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.kFull,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoCard() {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 140.w,
            height: 14.h,
            decoration: const BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k4,
            ),
          ),
          SizedBox(height: 14.h),

          for (int i = 0; i < 4; i++) ...[
            if (i > 0)
              const Divider(height: 1, thickness: 1, color: AppColors.border),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 90.w,
                    height: 12.h,
                    decoration: const BoxDecoration(
                      color: AppColors.skeletonBase,
                      borderRadius: AppRadius.k4,
                    ),
                  ),
                  Container(
                    width: 110.w,
                    height: 12.h,
                    decoration: const BoxDecoration(
                      color: AppColors.skeletonBase,
                      borderRadius: AppRadius.k4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildContactSecurityCard() {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150.w,
            height: 14.h,
            decoration: const BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k4,
            ),
          ),
          SizedBox(height: 14.h),

          for (int i = 0; i < 3; i++) ...[
            if (i > 0)
              const Divider(height: 1, thickness: 1, color: AppColors.border),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24.w,
                        height: 24.w,
                        decoration: BoxDecoration(
                          color: AppColors.itemBackground,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.border),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 120.w,
                        height: 12.h,
                        decoration: const BoxDecoration(
                          color: AppColors.skeletonBase,
                          borderRadius: AppRadius.k4,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 55.w,
                    height: 24.h,
                    decoration: const BoxDecoration(
                      color: AppColors.skeletonBase,
                      borderRadius: AppRadius.kFull,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
