// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// Atomic product card shimmer skeleton reproducing the exact geometry
/// and visual rhythm of [ProductView] and [SliderProductView].
class ProductCardSkeleton extends StatelessWidget {
  final double? width;
  final bool enabled;

  const ProductCardSkeleton({
    super.key,
    this.width,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final cardContent = Container(
      width: width,
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── 1. Top 1:1 Image Placeholder ──
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.itemBackground,
                borderRadius: AppRadius.top8,
              ),
              child: Center(
                child: Icon(
                  Icons.image_outlined,
                  size: 32.sp,
                  color: AppColors.skeletonBase,
                ),
              ),
            ),
          ),

          // ── 2. Product Info Details Section ──
          Padding(
            padding: EdgeInsets.fromLTRB(8.w, 6.h, 8.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Brand line (left) & Express tag placeholder (right)
                SizedBox(
                  width: double.infinity,
                  height: 24.h,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 150.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 48.w,
                            height: 9.h,
                            decoration: BoxDecoration(
                              color: AppColors.skeletonBase,
                              borderRadius: AppRadius.k4,
                            ),
                          ),
                          Container(
                            width: 52.w,
                            height: 14.h,
                            decoration: BoxDecoration(
                              color: AppColors.skeletonBase,
                              borderRadius: AppRadius.k4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),

                // Title: 2-line placeholder (34.h)
                SizedBox(
                  width: double.infinity,
                  height: 34.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 11.h,
                        decoration: BoxDecoration(
                          color: AppColors.skeletonBase,
                          borderRadius: AppRadius.k4,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        width: 80.w,
                        height: 11.h,
                        decoration: BoxDecoration(
                          color: AppColors.skeletonBase,
                          borderRadius: AppRadius.k4,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),

                // Rating stars placeholder (16.h)
                SizedBox(
                  width: double.infinity,
                  height: 16.h,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (i) => Padding(
                              padding: EdgeInsets.only(right: 2.w),
                              child: Icon(
                                Icons.star_rounded,
                                size: 10.sp,
                                color: AppColors.skeletonBase,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Container(
                          width: 22.w,
                          height: 9.h,
                          decoration: BoxDecoration(
                            color: AppColors.skeletonBase,
                            borderRadius: AppRadius.k4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2.h),

                // Price line placeholder (24.h)
                SizedBox(
                  width: double.infinity,
                  height: 24.h,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 56.w,
                          height: 14.h,
                          decoration: BoxDecoration(
                            color: AppColors.skeletonBase,
                            borderRadius: AppRadius.k4,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Container(
                          width: 38.w,
                          height: 11.h,
                          decoration: BoxDecoration(
                            color: AppColors.skeletonBase,
                            borderRadius: AppRadius.k4,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Container(
                          width: 32.w,
                          height: 14.h,
                          decoration: BoxDecoration(
                            color: AppColors.skeletonBase,
                            borderRadius: AppRadius.k4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5.h),

                // Divider line (1.h)
                Container(
                  width: double.infinity,
                  height: 1.h,
                  color: AppColors.border,
                ),

                // Delivery Info line (14.h + vertical 5.5.h)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.5.h),
                  child: SizedBox(
                    width: double.infinity,
                    height: 14.h,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_shipping_outlined,
                            size: 13.sp,
                            color: AppColors.skeletonBase,
                          ),
                          SizedBox(width: 4.w),
                          Container(
                            width: 80.w,
                            height: 9.h,
                            decoration: BoxDecoration(
                              color: AppColors.skeletonBase,
                              borderRadius: AppRadius.k4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // If Skeletonizer is already provided in the parent tree, avoid nesting another Skeletonizer
    final isAlreadySkeletonized = Skeletonizer.maybeOf(context) != null;
    if (isAlreadySkeletonized || !enabled) {
      return cardContent;
    }

    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: cardContent,
    );
  }
}
