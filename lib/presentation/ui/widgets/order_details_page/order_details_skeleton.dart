// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// High-contrast shimmer skeleton loader for [OrderDetailsPage].
/// Matches the visual language, contrast, and structure of [CartPageSkeleton].
class OrderDetailsSkeleton extends StatelessWidget {
  const OrderDetailsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.sameGroupItemSpacing.w,
          vertical: 8.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 1. Order Header Card ──
            _buildHeaderCard(),

            SizedBox(height: AppSpacing.sameGroupItemSpacing.h),

            // ── 2. Order Items Skeleton Cards (2 items) ──
            _buildItemCard(),
            SizedBox(height: AppSpacing.sameGroupItemSpacing.h),
            _buildItemCard(),

            SizedBox(height: AppSpacing.sameGroupItemSpacing.h),

            // ── 3. Address & Payment Info Card ──
            _buildInfoCard(),

            SizedBox(height: AppSpacing.sameGroupItemSpacing.h),

            // ── 4. Order Summary Card ──
            _buildSummaryCard(),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 140.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.k4,
                ),
              ),
              Container(
                width: 80.w,
                height: 22.h,
                decoration: BoxDecoration(
                  color: AppColors.itemBackground,
                  borderRadius: AppRadius.kFull,
                  border: Border.all(color: AppColors.border),
                ),
                child: Center(
                  child: Container(
                    width: 44.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      color: AppColors.skeletonBase,
                      borderRadius: AppRadius.k4,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 13.sp,
                color: AppColors.skeletonBase,
              ),
              SizedBox(width: 5.w),
              Container(
                width: 150.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.k4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItemCard() {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail placeholder (matches CartPageSkeleton)
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
                SizedBox(height: 6.h),
                Container(
                  width: 100.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 70.w,
                      height: 14.h,
                      decoration: BoxDecoration(
                        color: AppColors.skeletonBase,
                        borderRadius: AppRadius.k4,
                      ),
                    ),
                    Container(
                      width: 40.w,
                      height: 14.h,
                      decoration: BoxDecoration(
                        color: AppColors.skeletonBase,
                        borderRadius: AppRadius.k4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120.w,
            height: 14.h,
            decoration: BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k4,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            height: 12.h,
            decoration: BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k4,
            ),
          ),
          SizedBox(height: 4.h),
          Container(
            width: 180.w,
            height: 12.h,
            decoration: BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSummaryRow(width: 100.w, valWidth: 60.w),
          SizedBox(height: 8.h),
          _buildSummaryRow(width: 80.w, valWidth: 50.w),
          SizedBox(height: 8.h),
          _buildSummaryRow(width: 70.w, valWidth: 50.w),
          SizedBox(height: 10.h),
          Divider(color: AppColors.border, height: 1.h),
          SizedBox(height: 10.h),
          _buildSummaryRow(width: 90.w, valWidth: 80.w, isTotal: true),
        ],
      ),
    );
  }

  Widget _buildSummaryRow({
    required double width,
    required double valWidth,
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width,
          height: isTotal ? 16.h : 13.h,
          decoration: BoxDecoration(
            color: AppColors.skeletonBase,
            borderRadius: AppRadius.k4,
          ),
        ),
        Container(
          width: valWidth,
          height: isTotal ? 16.h : 13.h,
          decoration: BoxDecoration(
            color: AppColors.skeletonBase,
            borderRadius: AppRadius.k4,
          ),
        ),
      ],
    );
  }
}
