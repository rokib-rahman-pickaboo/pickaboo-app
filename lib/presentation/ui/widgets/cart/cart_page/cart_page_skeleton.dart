// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// Full-page shimmer skeleton loader for [CartPage].
/// Pre-renders visual placeholders for:
/// 1. 2 Cart Item Cards (Thumbnail, title, price, and quantity stepper pill)
/// 2. Promo Code Voucher Input Strip
/// 3. Price Summary Breakdown Card (Subtotal, Shipping, Discount, Total)
/// 4. Bottom Sticky Checkout CTA
class CartPageSkeleton extends StatelessWidget {
  final int itemCount;

  const CartPageSkeleton({
    super.key,
    this.itemCount = 2,
  });

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
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.sameGroupItemSpacing.w,
                vertical: AppSpacing.sameGroupItemSpacing.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── 1. Cart Item Cards ──
                  for (int i = 0; i < itemCount; i++) ...[
                    if (i > 0) SizedBox(height: AppSpacing.sameGroupItemSpacing.h),
                    _buildCartItemSkeleton(context),
                  ],

                  SizedBox(height: AppSpacing.groupToGroupSpacing.h),

                  // ── 2. Promo / Voucher Code Input Strip ──
                  _buildPromoCodeSkeleton(context),

                  SizedBox(height: AppSpacing.groupToGroupSpacing.h),

                  // ── 3. Price Summary Breakdown Card ──
                  _buildPriceSummarySkeleton(context),

                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),

          // ── 4. Bottom Sticky Checkout Button Strip ──
          _buildBottomCheckoutSkeleton(context),
        ],
      ),
    );
  }

  /// ── 1. Single Cart Item Card Skeleton ──
  Widget _buildCartItemSkeleton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 64x64 Image Thumbnail
          Container(
            width: 68.w,
            height: 68.w,
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

          // Title, Price, and Stepper Row
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product title line 1
                Container(
                  width: double.infinity,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
                SizedBox(height: 5.h),

                // Product title line 2
                Container(
                  width: 120.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
                SizedBox(height: 10.h),

                // Price & Quantity Stepper
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Price
                    Container(
                      width: 65.w,
                      height: 16.h,
                      decoration: BoxDecoration(
                        color: AppColors.skeletonBase,
                        borderRadius: AppRadius.k4,
                      ),
                    ),

                    // Stepper Pill
                    Container(
                      width: 80.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                        color: AppColors.itemBackground,
                        borderRadius: AppRadius.kFull,
                        border: Border.all(color: AppColors.border),
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

  /// ── 2. Promo / Voucher Input Strip ──
  Widget _buildPromoCodeSkeleton(BuildContext context) {
    return Container(
      height: 46.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.k8,
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(Icons.discount_outlined, size: 18.sp, color: AppColors.skeletonBase),
          SizedBox(width: 8.w),
          Expanded(
            child: Container(
              height: 12.h,
              decoration: BoxDecoration(
                color: AppColors.skeletonBase,
                borderRadius: AppRadius.k4,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Container(
            width: 50.w,
            height: 26.h,
            decoration: BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k8,
            ),
          ),
        ],
      ),
    );
  }

  /// ── 3. Price Summary Breakdown Card ──
  Widget _buildPriceSummarySkeleton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header title
          Container(
            width: 110.w,
            height: 14.h,
            decoration: BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k4,
            ),
          ),
          SizedBox(height: 12.h),

          // Subtotal row
          _buildSummaryRow(),
          SizedBox(height: 8.h),

          // Delivery fee row
          _buildSummaryRow(),
          SizedBox(height: 8.h),

          // Discount row
          _buildSummaryRow(),
          SizedBox(height: 10.h),

          // Divider
          Container(
            width: double.infinity,
            height: 1.h,
            color: AppColors.border,
          ),
          SizedBox(height: 10.h),

          // Total Payable row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 90.w,
                height: 15.h,
                decoration: BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.k4,
                ),
              ),
              Container(
                width: 80.w,
                height: 18.h,
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

  Widget _buildSummaryRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 70.w,
          height: 11.h,
          decoration: BoxDecoration(
            color: AppColors.skeletonBase,
            borderRadius: AppRadius.k4,
          ),
        ),
        Container(
          width: 50.w,
          height: 11.h,
          decoration: BoxDecoration(
            color: AppColors.skeletonBase,
            borderRadius: AppRadius.k4,
          ),
        ),
      ],
    );
  }

  /// ── 4. Bottom Sticky Checkout Button Strip ──
  Widget _buildBottomCheckoutSkeleton(BuildContext context) {
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
          decoration: BoxDecoration(
            color: AppColors.skeletonBase,
            borderRadius: AppRadius.k8,
          ),
        ),
      ),
    );
  }
}
