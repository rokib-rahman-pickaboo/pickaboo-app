// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// ─────────────────────────────────────────────────────────────
/// ⚡ HIGH-FIDELITY DISCOVER CATEGORY SKELETON WIDGET
/// Shimmer skeleton loader reproducing the exact structure and geometry
/// of [DiscoverCategoryPage]:
///   1. Left Category Sidebar Navigation Rail (88.w width, 7 category tiles)
///   2. Vertical Divider
///   3. Right Category Detail Panel:
///      - Top Header Banner with title + artwork
///      - Primary "In The Spotlight" Subsection Surface Card with 3-column grid
///      - Secondary Category Section Surface Card
/// ─────────────────────────────────────────────────────────────
class DiscoverCategorySkeletonWidget extends StatelessWidget {
  final int sidebarItemCount;

  const DiscoverCategorySkeletonWidget({
    super.key,
    this.sidebarItemCount = 7,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 1. Left Category Sidebar Rail ──
          _buildSidebarSkeleton(context),

          // ── Divider Line ──
          Container(width: 1, color: AppColors.border),

          // ── 2. Right Subcategory Content Panel ──
          Expanded(
            child: _buildContentPanelSkeleton(context),
          ),
        ],
      ),
    );
  }

  // ── Left Navigation Sidebar ──
  Widget _buildSidebarSkeleton(BuildContext context) {
    return Container(
      width: 88.w,
      color: AppColors.white,
      child: ListView.builder(
        itemCount: sidebarItemCount,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(bottom: 110.h),
        itemBuilder: (context, index) {
          final isFirst = index == 0;

          return Container(
            height: 78.h,
            decoration: BoxDecoration(
              color: isFirst ? AppColors.surfaceBlue : AppColors.white,
              border: Border(
                left: BorderSide(
                  color: isFirst
                      ? AppColors.pickabooBlue
                      : AppColors.transparent,
                  width: 3.5.w,
                ),
                bottom: BorderSide(
                  color: AppColors.border.withValues(alpha: 0.6),
                  width: 0.8,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ── Category Icon Box ──
                Flexible(
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: const BoxDecoration(
                      color: AppColors.border,
                      borderRadius: AppRadius.smRadius,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),

                // ── Category Label Placeholder ──
                Container(
                  width: (index % 2 == 0) ? 54.w : 44.w,
                  height: 9.h,
                  decoration: const BoxDecoration(
                    color: AppColors.border,
                    borderRadius: AppRadius.badgeRadius,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ── Right Subcategory Content Panel ──
  Widget _buildContentPanelSkeleton(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        top: 0,
        bottom: 110.h + MediaQuery.of(context).padding.bottom,
      ),
      children: [
        // ── 1. Top Category Header Banner ──
        _buildCategoryBannerSkeleton(context),

        SizedBox(height: 10.h),

        // ── 2. Primary Subcategory Section Card ("In The Spotlight") ──
        _buildSectionCardSkeleton(
          context,
          titleWidth: 110.w,
          itemCount: 6,
        ),

        // ── 3. Secondary Subcategory Section Card ──
        _buildSectionCardSkeleton(
          context,
          titleWidth: 90.w,
          itemCount: 3,
        ),
      ],
    );
  }

  // ── Top Category Banner ──
  Widget _buildCategoryBannerSkeleton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.white, AppColors.surfaceBlue],
          stops: [0.15, 1.0],
        ),
      ),
      child: Row(
        children: [
          // Banner Title Left Flex
          Expanded(
            flex: 55,
            child: Padding(
              padding: EdgeInsets.only(left: 14.w, right: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                      color: AppColors.pickabooBlue.withValues(alpha: 0.15),
                      borderRadius: AppRadius.smRadius,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Container(
                    width: 50.w,
                    height: 10.h,
                    decoration: const BoxDecoration(
                      color: AppColors.border,
                      borderRadius: AppRadius.badgeRadius,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Banner Graphic Right Flex
          Expanded(
            flex: 45,
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Container(
                height: 75.h,
                decoration: const BoxDecoration(
                  color: AppColors.border,
                  borderRadius: AppRadius.cardRadius,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Subcategory Section Card ──
  Widget _buildSectionCardSkeleton(
    BuildContext context, {
    required double titleWidth,
    required int itemCount,
  }) {
    return Container(
      margin: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
        bottom: 10.h,
      ),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(
          color: AppColors.border,
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.navy.withValues(alpha: 0.02),
            blurRadius: 6.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Section Title Header
          Container(
            width: titleWidth,
            height: 13.h,
            decoration: const BoxDecoration(
              color: AppColors.border,
              borderRadius: AppRadius.badgeRadius,
            ),
          ),

          SizedBox(height: 10.h),

          // 3-Column Item Grid
          Column(
            children: [
              for (int i = 0; i < itemCount; i += 3) ...[
                if (i > 0) SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int j = 0; j < 3; j++) ...[
                      if (j > 0) SizedBox(width: 8.w),
                      Expanded(
                        child: (i + j < itemCount)
                            ? _buildItemTileSkeleton(context)
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  // ── Individual Subcategory Item Tile ──
  Widget _buildItemTileSkeleton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.border,
              borderRadius: AppRadius.buttonRadius,
            ),
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          width: 48.w,
          height: 9.h,
          decoration: const BoxDecoration(
            color: AppColors.border,
            borderRadius: AppRadius.badgeRadius,
          ),
        ),
      ],
    );
  }
}
