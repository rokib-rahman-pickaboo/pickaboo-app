// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/product_card_skeleton.dart';

/// Full-page or sliver catalog grid shimmer skeleton.
/// Accurately reproduces the visual layout of Category, Brand, Search, and Seller views:
/// 1. Top Action Strip: Sort, Filter, and View Mode Toggle buttons.
/// 2. Optional Featured Product Rail (horizontal shimmer rail).
/// 3. 2-Column Product Grid with 6 [ProductCardSkeleton] cards.
class CatalogGridSkeleton extends StatelessWidget {
  final bool asSliver;
  final bool hasFeaturedRail;
  final bool hasScaffold;

  const CatalogGridSkeleton({
    super.key,
    this.asSliver = false,
    this.hasFeaturedRail = false,
    this.hasScaffold = false,
  });

  const CatalogGridSkeleton.sliver({
    super.key,
    this.hasFeaturedRail = false,
  })  : asSliver = true,
        hasScaffold = false;

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── 1. Top Sort, Filter & View Mode Action Strip ──
        _buildActionStripSkeleton(context),

        // ── 2. Optional Featured Products Horizontal Rail ──
        if (hasFeaturedRail) ...[
          SizedBox(height: AppSpacing.sameGroupItemSpacing.h),
          _buildFeaturedRailSkeleton(context),
        ],

        SizedBox(height: AppSpacing.sameGroupItemSpacing.h),

        // ── 3. 2-Column Product Grid ──
        _buildProductGridSkeleton(context),

        SizedBox(height: 24.h),
      ],
    );

    if (asSliver) {
      return SliverToBoxAdapter(
        child: Skeletonizer(
          enabled: true,
          effect: AppDecorations.shimmerEffect,
          child: content,
        ),
      );
    }

    final body = Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: content,
      ),
    );

    if (hasScaffold) {
      return Scaffold(
        backgroundColor: AppColors.pageBg,
        body: SafeArea(child: body),
      );
    }

    return body;
  }

  /// ── 1. Top Action Strip: Sort, Filter, Toggle ──
  Widget _buildActionStripSkeleton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
        vertical: 8.h,
      ),
      child: Row(
        children: [
          // Sort button pill
          Expanded(
            child: Container(
              height: 38.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: AppRadius.buttonRadius,
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.swap_vert_rounded, size: 16.sp, color: AppColors.skeletonBase),
                  SizedBox(width: 4.w),
                  Container(
                    width: 36.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      color: AppColors.skeletonBase,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.w),

          // Filter button pill
          Expanded(
            child: Container(
              height: 38.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: AppRadius.buttonRadius,
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.tune_rounded, size: 16.sp, color: AppColors.skeletonBase),
                  SizedBox(width: 4.w),
                  Container(
                    width: 36.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      color: AppColors.skeletonBase,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.w),

          // Grid/List toggle square button
          Container(
            width: 38.h,
            height: 38.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppRadius.buttonRadius,
              border: Border.all(color: AppColors.border),
            ),
            child: Center(
              child: Icon(
                Icons.grid_view_rounded,
                size: 18.sp,
                color: AppColors.skeletonBase,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ── 2. Featured Rail Shimmer ──
  Widget _buildFeaturedRailSkeleton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.sameGroupItemSpacing.w,
          ),
          child: Container(
            width: 80.w,
            height: 14.h,
            decoration: BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.sameGroupItemSpacing.w,
          ),
          child: Row(
            children: List.generate(3, (index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index < 2 ? AppSpacing.sameGroupItemSpacing.w : 0,
                ),
                child: SizedBox(
                  width: 140.w,
                  child: const ProductCardSkeleton(enabled: false),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  /// ── 3. 2-Column Product Grid ──
  Widget _buildProductGridSkeleton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
      ),
      child: Column(
        children: [
          for (int row = 0; row < 3; row++) ...[
            if (row > 0) SizedBox(height: AppSpacing.sameGroupItemSpacing.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: ProductCardSkeleton(enabled: false),
                ),
                SizedBox(width: AppSpacing.sameGroupItemSpacing.w),
                const Expanded(
                  child: ProductCardSkeleton(enabled: false),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
