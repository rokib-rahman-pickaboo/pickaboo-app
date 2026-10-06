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
  final bool hasChildCategories;
  final bool hasInterleavedQuestion;
  final double? actionStripTopPadding;
  final double? childCategoriesTopPadding;

  const CatalogGridSkeleton({
    super.key,
    this.asSliver = false,
    this.hasFeaturedRail = false,
    this.hasScaffold = false,
    this.hasChildCategories = false,
    this.hasInterleavedQuestion = false,
    this.actionStripTopPadding,
    this.childCategoriesTopPadding,
  });

  const CatalogGridSkeleton.sliver({
    super.key,
    this.hasFeaturedRail = false,
    this.hasChildCategories = false,
    this.hasInterleavedQuestion = false,
    this.actionStripTopPadding,
    this.childCategoriesTopPadding,
  })  : asSliver = true,
        hasScaffold = false;

  /// Dedicated realistic skeleton for Brand catalog page:
  /// - Action strip (Sort, Filter, Grid toggle) with top: 0
  /// - 1 Row of 2 Product Cards
  /// - Interleaved Question / Budget Filter strip shimmer
  /// - 2 Rows of 4 Product Cards
  const CatalogGridSkeleton.brand({
    super.key,
    this.asSliver = false,
    this.hasScaffold = false,
  })  : hasFeaturedRail = false,
        hasChildCategories = false,
        hasInterleavedQuestion = true,
        actionStripTopPadding = 0.0,
        childCategoriesTopPadding = null;

  /// Dedicated realistic skeleton for Category catalog page:
  /// - Subcategory chips rail with top: 0 (or 8.h if embedded in SecondaryHomeWidget)
  /// - 8.h gap before Sort/Filter action strip
  /// - 1 Row of 2 Product Cards
  /// - Interleaved Question Filter strip shimmer
  /// - 2 Rows of 4 Product Cards
  const CatalogGridSkeleton.category({
    super.key,
    this.asSliver = false,
    this.hasScaffold = false,
    bool isEmbedded = false,
    this.hasChildCategories = true,
  })  : hasFeaturedRail = false,
        hasInterleavedQuestion = true,
        actionStripTopPadding = 0.0,
        childCategoriesTopPadding = isEmbedded ? 8.0 : 0.0;

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── 0. Optional Child Categories Rail ──
        if (hasChildCategories) ...[
          _buildChildCategoriesSkeleton(context),
        ],

        // ── 1. Top Sort, Filter & View Mode Action Strip ──
        _buildActionStripSkeleton(context),

        // ── 2. Optional Featured Products Horizontal Rail ──
        if (hasFeaturedRail) ...[
          SizedBox(height: AppSpacing.sameGroupItemSpacing.h),
          _buildFeaturedRailSkeleton(context),
        ],

        SizedBox(height: AppSpacing.sameGroupItemSpacing.h),

        // ── 3. 2-Column Product Grid (with optional interleaved question) ──
        if (hasInterleavedQuestion) ...[
          // Row 1 (2 products)
          _buildProductRowSkeleton(context),
          SizedBox(height: AppSpacing.sameGroupItemSpacing.h),
          // Interleaved Question / Budget strip
          _buildInterleavedQuestionSkeleton(context),
          SizedBox(height: AppSpacing.sameGroupItemSpacing.h),
          // Rows 2 & 3 (4 products)
          _buildProductGridSkeleton(context, rowCount: 2),
        ] else ...[
          _buildProductGridSkeleton(context),
        ],

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
        backgroundColor: AppColors.white,
        body: SafeArea(child: body),
      );
    }

    return body;
  }

  /// ── 0. Subcategory Chips Rail Shimmer ──
  Widget _buildChildCategoriesSkeleton(BuildContext context) {
    const itemWidth = 72.0;
    const imageSize = 44.0;
    const imageToChipGap = 4.0;
    const nameChipHeight = 28.0;
    final totalHeight = imageSize.w + imageToChipGap.h + nameChipHeight.h;

    return Padding(
      padding: EdgeInsets.only(
        top: (childCategoriesTopPadding ?? 0.0).h,
        bottom: 8.h,
      ),
      child: SizedBox(
        height: totalHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.sameGroupItemSpacing.w,
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: SizedBox(
                width: itemWidth.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Floating 1:1 image without card
                    Container(
                      width: imageSize.w,
                      height: imageSize.w,
                      decoration: BoxDecoration(
                        color: AppColors.border.withValues(alpha: 0.5),
                        borderRadius: AppRadius.k8,
                      ),
                    ),
                    SizedBox(height: imageToChipGap.h),
                    // Name inside card
                    Container(
                      width: itemWidth.w,
                      height: nameChipHeight.h,
                      decoration: AppDecorations.cardBoxDecoration(
                        backgroundColor: AppColors.white,
                        borderRadius: AppRadius.k8,
                        hasBorder: true,
                        borderColor: AppColors.border,
                        borderWidth: 0.8.w,
                      ),
                      child: Center(
                        child: Container(
                          width: (index % 2 == 0) ? 46.w : 38.w,
                          height: 9.h,
                          decoration: const BoxDecoration(
                            color: AppColors.border,
                            borderRadius: AppRadius.k4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// ── 1. Top Action Strip: Sort, Filter, Toggle ──
  Widget _buildActionStripSkeleton(BuildContext context) {
    const buttonHeight = 31.5;

    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.sameGroupItemSpacing.w,
        right: AppSpacing.sameGroupItemSpacing.w,
        top: actionStripTopPadding ?? 0.0,
        bottom: 0,
      ),
      child: Row(
        children: [
          // Sort button pill
          Expanded(
            child: Container(
              height: buttonHeight.h,
              decoration: AppDecorations.cardBoxDecoration(
                borderRadius: AppRadius.k8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.swap_vert_rounded, size: 14.sp, color: AppColors.skeletonBase),
                  SizedBox(width: 6.w),
                  Container(
                    width: 32.w,
                    height: 9.h,
                    decoration: const BoxDecoration(
                      color: AppColors.border,
                      borderRadius: AppRadius.k4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppSpacing.sameGroupWidthGap,

          // Filter button pill
          Expanded(
            child: Container(
              height: buttonHeight.h,
              decoration: AppDecorations.cardBoxDecoration(
                borderRadius: AppRadius.k8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.tune_rounded, size: 14.sp, color: AppColors.skeletonBase),
                  SizedBox(width: 6.w),
                  Container(
                    width: 36.w,
                    height: 9.h,
                    decoration: const BoxDecoration(
                      color: AppColors.border,
                      borderRadius: AppRadius.k4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppSpacing.sameGroupWidthGap,

          // Grid/List toggle square button
          Container(
            width: buttonHeight.h,
            height: buttonHeight.h,
            decoration: AppDecorations.cardBoxDecoration(
              borderRadius: AppRadius.k8,
            ),
            child: Center(
              child: Icon(
                Icons.grid_view_rounded,
                size: 16.sp,
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
            decoration: const BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k4,
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
  Widget _buildProductGridSkeleton(BuildContext context, {int rowCount = 3}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
      ),
      child: Column(
        children: [
          for (int row = 0; row < rowCount; row++) ...[
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

  /// ── 4. Single Product Row Shimmer (2 columns) ──
  Widget _buildProductRowSkeleton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
      ),
      child: Row(
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
    );
  }

  /// ── 5. Interleaved Question / Budget Filter Strip Shimmer ──
  Widget _buildInterleavedQuestionSkeleton(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.surfaceBlue,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Centered Question Title shimmer
          Container(
            width: 170.w,
            height: 12.h,
            decoration: const BoxDecoration(
              color: AppColors.border,
              borderRadius: AppRadius.k4,
            ),
          ),
          SizedBox(height: 8.h),
          // Question Chips Row
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.sameGroupItemSpacing.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildQuestionChipSkeleton(width: 110.w),
                SizedBox(width: 8.w),
                _buildQuestionChipSkeleton(width: 130.w),
                SizedBox(width: 8.w),
                _buildQuestionChipSkeleton(width: 32.w, isIcon: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionChipSkeleton({
    required double width,
    bool isIcon = false,
  }) {
    return Container(
      width: width,
      height: 28.h,
      decoration: AppDecorations.cardBoxDecoration(
        backgroundColor: AppColors.white,
        borderRadius: AppRadius.k8,
        hasBorder: true,
        borderColor: AppColors.border,
        borderWidth: 0.8.w,
      ),
      child: Center(
        child: isIcon
            ? Icon(
                Icons.chevron_right_rounded,
                size: 16.sp,
                color: AppColors.skeletonBase,
              )
            : Container(
                width: width * 0.65,
                height: 9.h,
                decoration: const BoxDecoration(
                  color: AppColors.border,
                  borderRadius: AppRadius.k4,
                ),
              ),
      ),
    );
  }
}
