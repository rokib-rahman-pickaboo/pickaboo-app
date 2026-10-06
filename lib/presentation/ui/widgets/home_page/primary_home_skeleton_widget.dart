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
/// ⚡ HIGH-FIDELITY PRIMARY HOME SKELETON WIDGET
/// Shimmer skeleton loader reproducing the exact structure and geometry
/// of [PrimaryHomeWidget] and [HomePage]:
///   1. Category Quick Nav Strip (Icons + labels)
///   2. Main Hero Carousel Banner (1116x725 aspect ratio + dots indicator)
///   3. Dual Hero Sub-Banners Row
///   4. Horizontal Category / Flash Sale Product Rail
///   5. Promotional Campaign Offer Banner
///   6. "Just For You" 2-Column Product Grid Cards
///
/// Can be rendered as a standalone scrollable widget or inside CustomScrollView slivers.
/// ─────────────────────────────────────────────────────────────
class PrimaryHomeSkeletonWidget extends StatelessWidget {
  final bool asSliver;

  const PrimaryHomeSkeletonWidget({
    super.key,
    this.asSliver = false,
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── 1. Category Quick Nav Bar Skeleton ──
        _buildCategoryNavSkeleton(context),

        SizedBox(height: AppSpacing.sameGroupItemSpacing.h),

        // ── 2. Main Hero Carousel Banner Skeleton ──
        _buildMainBannerSkeleton(context),

        SizedBox(height: AppSpacing.sameGroupItemSpacing.h),

        // ── 3. Dual Hero Sub-Banners Row Skeleton ──
        _buildHeroBannersSkeleton(context),

        SizedBox(height: AppSpacing.sameGroupItemSpacing.h),

        // ── 4. Flash Sale / Featured Category Product Slider Skeleton ──
        _buildCategorySliderSkeleton(context),

        SizedBox(height: AppSpacing.groupToGroupSpacing.h),

        // ── 5. Campaign Offer Banner Skeleton ──
        _buildOfferBannerSkeleton(context),

        SizedBox(height: AppSpacing.groupToGroupSpacing.h),

        // ── 6. "Just For You" 2-Column Product Grid Skeleton ──
        _buildJustForYouGridSkeleton(context),

        SizedBox(height: 32.h),
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

    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: content,
      ),
    );
  }

  /// ── 1. Horizontal Category Quick Nav Bar ──
  Widget _buildCategoryNavSkeleton(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
            width: 1.w,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          children: List.generate(6, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: AppRadius.k8,
                      border: Border.all(color: AppColors.border),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Container(
                    width: 48.w,
                    height: 9.h,
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: AppRadius.k4,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  /// ── 2. Main Hero Banner Carousel (Matches 1116x725 intrinsic resolution) ──
  Widget _buildMainBannerSkeleton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 1116.0 / 725.0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: AppRadius.k8,
                border: Border.all(color: AppColors.border),
              ),
              child: Center(
                child: Icon(
                  Icons.image_outlined,
                  size: 48.sp,
                  color: AppColors.border,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          // Carousel dot indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 16.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.pickabooBlue,
                  borderRadius: AppRadius.k4,
                ),
              ),
              SizedBox(width: 4.w),
              Container(
                width: 6.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: AppRadius.k4,
                ),
              ),
              SizedBox(width: 4.w),
              Container(
                width: 6.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: AppRadius.k4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// ── 3. Dual Hero Sub-Banners Row ──
  Widget _buildHeroBannersSkeleton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 76.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: AppRadius.k8,
                border: Border.all(color: AppColors.border),
              ),
            ),
          ),
          SizedBox(width: AppSpacing.sameGroupItemSpacing.w),
          Expanded(
            child: Container(
              height: 76.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: AppRadius.k8,
                border: Border.all(color: AppColors.border),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ── 4. Horizontal Category / Flash Sale Product Rail ──
  Widget _buildCategorySliderSkeleton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Section Header Row
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.sameGroupItemSpacing.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 130.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: AppRadius.k4,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    width: 48.w,
                    height: 14.h,
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: AppRadius.k4,
                    ),
                  ),
                ],
              ),
              Container(
                width: 54.w,
                height: 14.h,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: AppRadius.k4,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        // Horizontal cards rail
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
                child: _buildProductCardSkeleton(context, width: 140.w),
              );
            }),
          ),
        ),
      ],
    );
  }

  /// ── 5. Promotional Campaign Offer Banner ──
  Widget _buildOfferBannerSkeleton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
      ),
      child: Container(
        width: double.infinity,
        height: 96.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppRadius.k8,
          border: Border.all(color: AppColors.border),
        ),
        child: Center(
          child: Icon(
            Icons.local_offer_outlined,
            size: 32.sp,
            color: AppColors.border,
          ),
        ),
      ),
    );
  }

  /// ── 6. "Just For You" 2-Column Product Grid ──
  Widget _buildJustForYouGridSkeleton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Section Title
          Container(
            width: 110.w,
            height: 16.h,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: AppRadius.k4,
            ),
          ),
          SizedBox(height: AppSpacing.sameGroupItemSpacing.h),
          // Row 1
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildProductCardSkeleton(context)),
              SizedBox(width: AppSpacing.sameGroupItemSpacing.w),
              Expanded(child: _buildProductCardSkeleton(context)),
            ],
          ),
          SizedBox(height: AppSpacing.sameGroupItemSpacing.h),
          // Row 2
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildProductCardSkeleton(context)),
              SizedBox(width: AppSpacing.sameGroupItemSpacing.w),
              Expanded(child: _buildProductCardSkeleton(context)),
            ],
          ),
        ],
      ),
    );
  }

  /// ── Reusable Product Card Skeleton (Matches ProductView geometry) ──
  Widget _buildProductCardSkeleton(BuildContext context, {double? width}) {
    final cardContent = Container(
      width: width,
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1:1 Image placeholder
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
          // Details section
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Brand bar
                Container(
                  width: 44.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: AppRadius.k4,
                  ),
                ),
                SizedBox(height: 5.h),
                // Title line 1
                Container(
                  width: double.infinity,
                  height: 11.h,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: AppRadius.k4,
                  ),
                ),
                SizedBox(height: 4.h),
                // Title line 2
                Container(
                  width: 75.w,
                  height: 11.h,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: AppRadius.k4,
                  ),
                ),
                SizedBox(height: 6.h),
                // Rating stars placeholder
                Row(
                  children: [
                    for (int s = 0; s < 5; s++)
                      Padding(
                        padding: EdgeInsets.only(right: 2.w),
                        child: Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.border,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 6.h),
                // Price row
                Row(
                  children: [
                    Container(
                      width: 54.w,
                      height: 13.h,
                      decoration: BoxDecoration(
                        color: AppColors.border,
                        borderRadius: AppRadius.k4,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Container(
                      width: 36.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: AppColors.border,
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

    return cardContent;
  }
}
