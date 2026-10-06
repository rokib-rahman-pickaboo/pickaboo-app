// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// High-contrast animated shimmer skeleton loader for [AddressPage].
/// Pre-renders visual placeholders for:
/// 1. 3 Saved Address Cards
///    - Status pill ("Default Shipping" capsule) + Edit action button
///    - Contact name bone & phone number bone with phone icon
///    - Pin icon + 2-line street address lines
/// 2. Bottom Sticky "Add New Address" Button Strip
class AddressListSkeleton extends StatelessWidget {
  final int itemCount;

  const AddressListSkeleton({
    super.key,
    this.itemCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.sameGroupItemSpacing.w,
                vertical: AppSpacing.sameGroupItemSpacing.h,
              ),
              itemCount: itemCount,
              itemBuilder: (context, index) => _buildAddressCard(index == 0),
            ),
          ),
          _buildBottomButtonSkeleton(),
        ],
      ),
    );
  }

  Widget _buildAddressCard(bool isDefault) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSpacing.groupToGroupSpacing.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.k8,
        border: Border.all(
          color: isDefault ? AppColors.skeletonBase : AppColors.border,
          width: 1.2.w,
        ),
        boxShadow: AppDecorations.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Top Header Row: Status Badge & Edit/Delete Icons ──
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Badge Pill ("Default Shipping")
              Container(
                width: isDefault ? 115.w : 85.w,
                height: 22.h,
                decoration: const BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.k4,
                ),
              ),

              // Edit / Remove icons
              Row(
                children: [
                  Container(
                    width: 28.w,
                    height: 28.w,
                    decoration: BoxDecoration(
                      color: AppColors.itemBackground,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.edit_outlined,
                        size: 14.sp,
                        color: AppColors.skeletonBase,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    width: 28.w,
                    height: 28.w,
                    decoration: BoxDecoration(
                      color: AppColors.itemBackground,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.delete_outline,
                        size: 14.sp,
                        color: AppColors.skeletonBase,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // ── Contact Name & Phone ──
          Row(
            children: [
              Icon(Icons.person_outline, size: 15.sp, color: AppColors.skeletonBase),
              SizedBox(width: 6.w),
              Container(
                width: 120.w,
                height: 13.h,
                decoration: const BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.k4,
                ),
              ),
              SizedBox(width: 14.w),
              Icon(Icons.phone_outlined, size: 14.sp, color: AppColors.skeletonBase),
              SizedBox(width: 6.w),
              Container(
                width: 95.w,
                height: 13.h,
                decoration: const BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.k4,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          // ── Street Address ──
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on_outlined, size: 16.sp, color: AppColors.skeletonBase),
              SizedBox(width: 6.w),
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
                      width: 170.w,
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
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtonSkeleton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.border, width: 1.w),
        ),
      ),
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
