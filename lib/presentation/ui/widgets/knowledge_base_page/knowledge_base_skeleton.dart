// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';

/// Shimmer skeleton loader matching the geometry of [KnowledgeBasePage].
///
/// Reproduces:
/// 1. Top Modern Search Bar placeholder (36.h rounded search input)
/// 2. White Card containing 6 Category Menu Tile skeletons (icon + title + subtitle + chevron)
/// 3. Bottom floating navigation bar clearance (90.h)
class KnowledgeBaseSkeleton extends StatelessWidget {
  final int itemCount;

  const KnowledgeBaseSkeleton({
    super.key,
    this.itemCount = 6,
  });

  static const List<double> _titleWidths = [140.0, 110.0, 160.0, 125.0, 150.0, 135.0];
  static const List<double> _subtitleWidths = [210.0, 180.0, 230.0, 190.0, 220.0, 175.0];

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 1. Search Bar Skeleton (matches AppSearchBar) ──
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.sameGroupItemSpacing.w,
                0,
                AppSpacing.sameGroupItemSpacing.w,
                AppSpacing.sameGroupItemSpacing.h,
              ),
              child: Container(
                height: 36.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: AppRadius.k8,
                  border: Border.all(color: AppColors.border, width: 1.w),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_rounded,
                      size: 18.sp,
                      color: AppColors.skeletonBase,
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      width: 170.w,
                      height: 11.h,
                      decoration: BoxDecoration(
                        color: AppColors.skeletonBase,
                        borderRadius: AppRadius.k4,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── 2. Category Menu Tiles Card (matches AppMenuTile in AppCard) ──
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.sameGroupItemSpacing.w,
                0,
                AppSpacing.sameGroupItemSpacing.w,
                AppSpacing.sameGroupItemSpacing.h,
              ),
              child: AppCard(
                padding: EdgeInsets.zero,
                child: Column(
                  children: List.generate(itemCount, (index) {
                    final isLast = index == itemCount - 1;
                    final titleWidth = _titleWidths[index % _titleWidths.length];
                    final subtitleWidth = _subtitleWidths[index % _subtitleWidths.length];

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildTileSkeleton(
                          titleWidth: titleWidth,
                          subtitleWidth: subtitleWidth,
                        ),
                        if (!isLast)
                          Container(
                            width: double.infinity,
                            height: 1.h,
                            color: AppColors.border,
                          ),
                      ],
                    );
                  }),
                ),
              ),
            ),

            // ── 3. Bottom clearance for floating bottom navigation bar ──
            SizedBox(
              height: 90.h + MediaQuery.paddingOf(context).bottom,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTileSkeleton({
    required double titleWidth,
    required double subtitleWidth,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
        vertical: 10.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Icon Container (matches AppMenuTile 34x34 rounded box)
          Container(
            width: 34.w,
            height: 34.w,
            decoration: BoxDecoration(
              color: AppColors.itemBackground,
              borderRadius: AppRadius.k8,
              border: Border.all(color: AppColors.border, width: 1.w),
            ),
            child: Center(
              child: Icon(
                Icons.help_outline_rounded,
                size: 18.sp,
                color: AppColors.skeletonBase,
              ),
            ),
          ),
          SizedBox(width: 12.w),

          // Title & Subtitle lines
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: titleWidth.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  width: subtitleWidth.w,
                  height: 9.h,
                  decoration: BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),

          // Right Chevron
          Icon(
            Icons.chevron_right_rounded,
            size: 20.sp,
            color: AppColors.skeletonBase,
          ),
        ],
      ),
    );
  }
}
