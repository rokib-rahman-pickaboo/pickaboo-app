// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// High-contrast animated shimmer skeleton loader for [WishListPage].
/// Pre-renders visual placeholders for:
/// 1. 4 Wishlist Item Cards
///    - 80x80 Product Thumbnail with border and image icon
///    - 2-Line Product Title bones
///    - "Sold by Pickaboo" merchant tag bone
///    - Price, strike-through regular price, and discount badge
///    - In-stock availability pill
///    - Delete trash icon & "Add to Cart" CTA pill
class WishListSkeleton extends StatelessWidget {
  final int itemCount;

  const WishListSkeleton({
    super.key,
    this.itemCount = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.sameGroupItemSpacing.w,
          vertical: AppSpacing.sameGroupItemSpacing.h,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) => _buildWishlistItemCard(),
      ),
    );
  }

  Widget _buildWishlistItemCard() {
    return Container(
      margin: EdgeInsets.only(bottom: AppSpacing.groupToGroupSpacing.h),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── 80x80 Thumbnail ──
                Container(
                  width: 80.w,
                  height: 80.w,
                  decoration: BoxDecoration(
                    color: AppColors.itemBackground,
                    borderRadius: AppRadius.k8,
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.image_outlined,
                      size: 28.sp,
                      color: AppColors.skeletonBase,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),

                // ── Product Info ──
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Title line 1
                      Container(
                        width: double.infinity,
                        height: 13.h,
                        decoration: const BoxDecoration(
                          color: AppColors.skeletonBase,
                          borderRadius: AppRadius.k4,
                        ),
                      ),
                      SizedBox(height: 5.h),

                      // Product Title line 2
                      Container(
                        width: 140.w,
                        height: 13.h,
                        decoration: const BoxDecoration(
                          color: AppColors.skeletonBase,
                          borderRadius: AppRadius.k4,
                        ),
                      ),
                      SizedBox(height: 6.h),

                      // "Sold by..."
                      Container(
                        width: 85.w,
                        height: 10.h,
                        decoration: const BoxDecoration(
                          color: AppColors.skeletonBase,
                          borderRadius: AppRadius.k4,
                        ),
                      ),
                      SizedBox(height: 8.h),

                      // Price Row
                      Row(
                        children: [
                          // Current Price
                          Container(
                            width: 65.w,
                            height: 16.h,
                            decoration: const BoxDecoration(
                              color: AppColors.skeletonBase,
                              borderRadius: AppRadius.k4,
                            ),
                          ),
                          SizedBox(width: 8.w),

                          // Regular Price
                          Container(
                            width: 45.w,
                            height: 12.h,
                            decoration: const BoxDecoration(
                              color: AppColors.skeletonBase,
                              borderRadius: AppRadius.k4,
                            ),
                          ),
                          SizedBox(width: 8.w),

                          // Discount Tag Pill
                          Container(
                            width: 32.w,
                            height: 16.h,
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

          // Divider
          const Divider(height: 1, thickness: 1, color: AppColors.border),

          // ── Bottom Action Row (Delete & Add to Cart) ──
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.sameGroupItemSpacing.w,
              vertical: 8.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // In-Stock Status Pill
                Container(
                  width: 60.w,
                  height: 20.h,
                  decoration: const BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.kFull,
                  ),
                ),

                Row(
                  children: [
                    // Delete Icon Button
                    Container(
                      width: 32.w,
                      height: 32.w,
                      decoration: BoxDecoration(
                        color: AppColors.itemBackground,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.delete_outline,
                          size: 16.sp,
                          color: AppColors.skeletonBase,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),

                    // Add to Cart Pill
                    Container(
                      width: 105.w,
                      height: 32.h,
                      decoration: const BoxDecoration(
                        color: AppColors.skeletonBase,
                        borderRadius: AppRadius.k8,
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
}
