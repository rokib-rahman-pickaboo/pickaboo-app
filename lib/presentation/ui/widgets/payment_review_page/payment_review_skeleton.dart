// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// High-contrast animated shimmer skeleton loader for [PaymentReviewPage].
/// Pre-renders visual placeholders for:
/// 1. Shipping Address Card (Tag pill, receiver info, address lines, change CTA)
/// 2. Billing Address Toggle Card
/// 3. Order Items Preview Card (Thumbnail, title, price, quantity)
/// 4. Delivery Method Options Card (Radio option, timeline, price)
/// 5. Price Summary Breakdown Card (Subtotal, shipping, discount, grand total)
/// 6. Bottom Sticky Place Order Bar
class PaymentReviewSkeleton extends StatelessWidget {
  const PaymentReviewSkeleton({super.key});

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
                  // ── 1. Shipping Address Section ──
                  _buildSectionHeader('Shipping Address'),
                  SizedBox(height: 8.h),
                  _buildAddressCardSkeleton(),

                  SizedBox(height: AppSpacing.groupToGroupSpacing.h),

                  // ── 2. Billing Address Toggle Card ──
                  _buildSectionHeader('Billing Address'),
                  SizedBox(height: 8.h),
                  _buildBillingToggleSkeleton(),

                  SizedBox(height: AppSpacing.groupToGroupSpacing.h),

                  // ── 3. Cart Items Review Card ──
                  _buildSectionHeader('Order Items'),
                  SizedBox(height: 8.h),
                  _buildItemsReviewCardSkeleton(),

                  SizedBox(height: AppSpacing.groupToGroupSpacing.h),

                  // ── 4. Delivery Method Options Card ──
                  _buildSectionHeader('Delivery Options'),
                  SizedBox(height: 8.h),
                  _buildDeliveryMethodSkeleton(),

                  SizedBox(height: AppSpacing.groupToGroupSpacing.h),

                  // ── 5. Price Summary Breakdown Card ──
                  _buildPriceSummarySkeleton(),

                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),

          // ── 6. Bottom Sticky Place Order Bar ──
          _buildBottomBarSkeleton(),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      width: 130.w,
      height: 14.h,
      decoration: const BoxDecoration(
        color: AppColors.skeletonBase,
        borderRadius: AppRadius.k4,
      ),
    );
  }

  /// ── 1. Shipping Address Card ──
  Widget _buildAddressCardSkeleton() {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tag Pill ("Home") + "Change" Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 65.w,
                height: 22.h,
                decoration: const BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.kFull,
                ),
              ),
              Container(
                width: 60.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: AppColors.itemBackground,
                  borderRadius: AppRadius.kFull,
                  border: Border.all(color: AppColors.border),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          // Contact Name & Phone
          Row(
            children: [
              Icon(Icons.person_outline, size: 16.sp, color: AppColors.skeletonBase),
              SizedBox(width: 8.w),
              Container(
                width: 120.w,
                height: 13.h,
                decoration: const BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.k4,
                ),
              ),
              SizedBox(width: 12.w),
              Icon(Icons.phone_outlined, size: 14.sp, color: AppColors.skeletonBase),
              SizedBox(width: 6.w),
              Container(
                width: 90.w,
                height: 13.h,
                decoration: const BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.k4,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          // Address Line 1
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on_outlined, size: 16.sp, color: AppColors.skeletonBase),
              SizedBox(width: 8.w),
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
                      width: 180.w,
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

  /// ── 2. Billing Address Toggle Card ──
  Widget _buildBillingToggleSkeleton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 18.w,
                height: 18.w,
                decoration: const BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.k4,
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                width: 170.w,
                height: 13.h,
                decoration: const BoxDecoration(
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

  /// ── 3. Cart Items Review Card ──
  Widget _buildItemsReviewCardSkeleton() {
    return Container(
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        children: [
          for (int i = 0; i < 2; i++) ...[
            if (i > 0)
              const Divider(height: 1, thickness: 1, color: AppColors.border),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Row(
                children: [
                  // Image thumbnail
                  Container(
                    width: 56.w,
                    height: 56.w,
                    decoration: BoxDecoration(
                      color: AppColors.itemBackground,
                      borderRadius: AppRadius.k8,
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.image_outlined,
                        size: 20.sp,
                        color: AppColors.skeletonBase,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),

                  // Title, price, qty
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
                          width: 110.w,
                          height: 12.h,
                          decoration: const BoxDecoration(
                            color: AppColors.skeletonBase,
                            borderRadius: AppRadius.k4,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 60.w,
                              height: 14.h,
                              decoration: const BoxDecoration(
                                color: AppColors.skeletonBase,
                                borderRadius: AppRadius.k4,
                              ),
                            ),
                            Container(
                              width: 40.w,
                              height: 12.h,
                              decoration: const BoxDecoration(
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
            ),
          ],
        ],
      ),
    );
  }

  /// ── 4. Delivery Method Options Card ──
  Widget _buildDeliveryMethodSkeleton() {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Row(
        children: [
          Container(
            width: 20.w,
            height: 20.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.skeletonBase, width: 2),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120.w,
                  height: 13.h,
                  decoration: const BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  width: 90.w,
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
            height: 14.h,
            decoration: const BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k4,
            ),
          ),
        ],
      ),
    );
  }

  /// ── 5. Price Summary Breakdown Card ──
  Widget _buildPriceSummarySkeleton() {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 110.w,
            height: 14.h,
            decoration: const BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k4,
            ),
          ),
          SizedBox(height: 12.h),

          _buildSummaryRow(70, 50),
          SizedBox(height: 8.h),
          _buildSummaryRow(80, 45),
          SizedBox(height: 8.h),
          _buildSummaryRow(65, 55),
          SizedBox(height: 10.h),

          Container(
            width: double.infinity,
            height: 1.h,
            color: AppColors.border,
          ),
          SizedBox(height: 10.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 90.w,
                height: 15.h,
                decoration: const BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.k4,
                ),
              ),
              Container(
                width: 75.w,
                height: 18.h,
                decoration: const BoxDecoration(
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

  Widget _buildSummaryRow(double titleWidth, double valueWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: titleWidth.w,
          height: 11.h,
          decoration: const BoxDecoration(
            color: AppColors.skeletonBase,
            borderRadius: AppRadius.k4,
          ),
        ),
        Container(
          width: valueWidth.w,
          height: 11.h,
          decoration: const BoxDecoration(
            color: AppColors.skeletonBase,
            borderRadius: AppRadius.k4,
          ),
        ),
      ],
    );
  }

  /// ── 6. Bottom Sticky Place Order Bar ──
  Widget _buildBottomBarSkeleton() {
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
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50.w,
                  height: 11.h,
                  decoration: const BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  width: 80.w,
                  height: 18.h,
                  decoration: const BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
              ],
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Container(
                height: 48.h,
                decoration: const BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.k8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
