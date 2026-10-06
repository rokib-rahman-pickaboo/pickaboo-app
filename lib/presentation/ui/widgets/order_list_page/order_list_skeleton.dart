// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// High-fidelity shimmer skeleton loader for [OrderListPage] (My Orders).
/// Matches the visual language, contrast, and structure of [CartPageSkeleton] and [PrimaryHomeSkeletonWidget].
class OrderListSkeleton extends StatelessWidget {
  final int itemCount;

  const OrderListSkeleton({
    super.key,
    this.itemCount = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          itemCount,
          (index) => _buildOrderItemSkeleton(index),
        ),
      ),
    );
  }

  Widget _buildOrderItemSkeleton(int index) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSpacing.groupToGroupSpacing.h),
      decoration: AppDecorations.cardBoxDecoration(),
      child: ClipRRect(
        borderRadius: AppRadius.k8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Top Header Row: Order Number + Calendar/Date vs Status Badge ──
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // "Order #12345678"
                          Container(
                            width: (index.isEven ? 135 : 115).w,
                            height: 15.h,
                            decoration: BoxDecoration(
                              color: AppColors.skeletonBase,
                              borderRadius: AppRadius.k4,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          // Calendar icon + Date string
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 13.sp,
                                color: AppColors.skeletonBase,
                              ),
                              SizedBox(width: 5.w),
                              Container(
                                width: (index % 3 == 0 ? 155 : 135).w,
                                height: 11.h,
                                decoration: BoxDecoration(
                                  color: AppColors.skeletonBase,
                                  borderRadius: AppRadius.k4,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Rounded Status Pill Badge (e.g. "Processing", "Delivered")
                      Container(
                        width: (index.isEven ? 82 : 72).w,
                        height: 22.h,
                        decoration: BoxDecoration(
                          color: AppColors.itemBackground,
                          borderRadius: AppRadius.kFull,
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Center(
                          child: Container(
                            width: 46.w,
                            height: 9.h,
                            decoration: BoxDecoration(
                              color: AppColors.skeletonBase,
                              borderRadius: AppRadius.k4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  // ── Total Section ──
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 34.w,
                            height: 11.h,
                            decoration: BoxDecoration(
                              color: AppColors.skeletonBase,
                              borderRadius: AppRadius.k4,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            width: (index % 2 == 0 ? 85 : 70).w,
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
                ],
              ),
            ),

            // ── Bottom Action Strip (Buy Again & Cancel buttons) ──
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.border, width: 0.5.w),
                ),
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 16.sp,
                              color: AppColors.skeletonBase,
                            ),
                            SizedBox(width: 6.w),
                            Container(
                              width: 64.w,
                              height: 12.h,
                              decoration: BoxDecoration(
                                color: AppColors.skeletonBase,
                                borderRadius: AppRadius.k4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(
                      width: 1.w,
                      indent: 8.h,
                      endIndent: 8.h,
                      color: AppColors.border,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cancel_outlined,
                              size: 16.sp,
                              color: AppColors.skeletonBase,
                            ),
                            SizedBox(width: 6.w),
                            Container(
                              width: 76.w,
                              height: 12.h,
                              decoration: BoxDecoration(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
