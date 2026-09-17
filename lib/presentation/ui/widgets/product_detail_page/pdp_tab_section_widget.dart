// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/bloc/review_bloc/review_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_html.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_rating_breakdown_card.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_review_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:pickaboo/core/color/app_colors.dart';

/// 10. TABBED SPECIFICATIONS, OVERVIEW, REVIEWS & Q&A
class PdpTabSectionWidget extends StatefulWidget {
  final ProductDetailEntity product;
  final int initialTabIndex;
  final VoidCallback? onWriteReviewTap;
  final VoidCallback? onViewAllReviewsTap;
  final Function(int imageIndex)? onReviewPhotoTap;

  const PdpTabSectionWidget({
    super.key,
    required this.product,
    this.initialTabIndex = 0,
    this.onWriteReviewTap,
    this.onViewAllReviewsTap,
    this.onReviewPhotoTap,
  });

  @override
  State<PdpTabSectionWidget> createState() => PdpTabSectionWidgetState();
}

class PdpTabSectionWidgetState extends State<PdpTabSectionWidget> {
  late int _selectedTab;
  bool _isSpecificationsExpanded = false;
  bool _isOverviewExpanded = false;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTabIndex;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAndLoadReviews();
    });
  }

  @override
  void didUpdateWidget(covariant PdpTabSectionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.product.id > 0 && widget.product.id != oldWidget.product.id) {
      _checkAndLoadReviews();
    }
  }

  void _checkAndLoadReviews() {
    if (!mounted || widget.product.id <= 0) return;
    try {
      final reviewBloc = context.read<ReviewBloc>();
      if (reviewBloc.state.pagingState.pages == null &&
          !reviewBloc.state.pagingState.isLoading) {
        reviewBloc.add(ReviewEvent.load(productId: widget.product.id.toString()));
      }
    } catch (_) {
      // ReviewBloc may not be available in all test contexts
    }
  }

  void selectTab(int index) {
    if (_selectedTab != index && mounted) {
      setState(() {
        _selectedTab = index;
      });
      if (index == 2) {
        _checkAndLoadReviews();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    final int reviewCount = p.reviewsCount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Clean Header TabBar (3 Parts: Specifications, Overview, Reviews) ──
        Container(
          color: AppColors.white,
          child: Row(
            children: [
              _buildTabItem(0, 'Specifications'),
              _buildTabItem(1, 'Overview'),
              _buildTabItem(2, 'Reviews ($reviewCount)'),
            ],
          ),
        ),
        const Divider(height: 1, color: AppColors.border),

        // ── Active Tab Body ──
        _buildActiveTabContent(p),
      ],
    );
  }

  Widget _buildTabItem(int index, String title) {
    final isSel = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => _selectedTab = index);
          if (index == 2) {
            _checkAndLoadReviews();
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSel ? AppColors.pickabooBlue : AppColors.transparent,
                width: 2.w,
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.titleSmall.copyWith(
                fontSize: 11.5.sp,
                fontWeight: isSel ? FontWeight.w800 : FontWeight.w600,
                color: isSel ? AppColors.pickabooBlue : AppColors.muted,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActiveTabContent(ProductDetailEntity p) {
    switch (_selectedTab) {
      case 0: // Specifications
        final groups = p.specificationGroups;
        if (groups.isEmpty) {
          if (p.isPartial) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: const Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.pickabooBlue,
                  ),
                ),
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
            child: Center(
              child: Text(
                'No additional specifications available.',
                style:
                    AppTypography.bodyMedium.copyWith(color: AppColors.muted),
              ),
            ),
          );
        }

        final int totalAttrs =
            groups.fold<int>(0, (sum, g) => sum + g.attrList.length);
        final bool isLong = totalAttrs > 5;

        final Widget specificationsContent = Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppRadius.card.r),
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.card.r),
            border: Border.all(
              color: AppColors.border,
              width: 1.w,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.card.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (int gIdx = 0; gIdx < groups.length; gIdx++) ...[
                  // ── Group Header (Surface Blue + Bold Title + Bottom Divider) ──
                  if (groups[gIdx].groupLabel.trim().isNotEmpty) ...[
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceBlue,
                        border: Border(
                          top: gIdx > 0
                              ? BorderSide(
                                  color: AppColors.border,
                                  width: 1.w,
                                )
                              : BorderSide.none,
                          bottom: BorderSide(
                            color: AppColors.border,
                            width: 0.8.w,
                          ),
                        ),
                      ),
                      child: Text(
                        groups[gIdx].groupLabel,
                        style: AppTypography.titleSmall
                            .extraBold()
                            .withColor(AppColors.navy),
                      ),
                    ),
                  ],

                  // ── Attribute Rows (Alternating White & PageBg, No Inner Divider) ──
                  for (int i = 0; i < groups[gIdx].attrList.length; i++) ...[
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 9.h,
                      ),
                      decoration: BoxDecoration(
                        color: i % 2 == 0
                            ? AppColors.white
                            : AppColors.pageBg,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 120.w,
                            child: Text(
                              groups[gIdx].attrList[i].label,
                              style: AppTypography.bodySmall.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          AppSpacing.sameGroupWidthGap,
                          Expanded(
                            child: Text(
                              groups[gIdx].attrList[i].value,
                              style: AppTypography.titleSmall.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ],
            ),
          ),
        );

        return Padding(
          padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isLong && !_isSpecificationsExpanded)
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 240.h),
                  child: ClipRect(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.black,
                            AppColors.black,
                            AppColors.black.withValues(alpha: 0.1),
                            AppColors.transparent,
                          ],
                          stops: const [0.0, 0.65, 0.9, 1.0],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn,
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: specificationsContent,
                      ),
                    ),
                  ),
                )
              else
                specificationsContent,

              if (isLong) ...[
                SizedBox(height: 8.h),
                Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _isSpecificationsExpanded = !_isSpecificationsExpanded;
                      });
                    },
                    borderRadius: AppRadius.smRadius,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 6.h,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _isSpecificationsExpanded
                                ? AppStrings.viewLess
                                : AppStrings.viewAll,
                            style: AppTypography.titleSmall.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.pickabooBlue,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            _isSpecificationsExpanded
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            color: AppColors.pickabooBlue,
                            size: 18.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        );

      case 1: // Overview
        if (p.productDetails.isEmpty) {
          if (p.isPartial) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: const Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.pickabooBlue,
                  ),
                ),
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Text(
                  'No product overview provided.',
                  style: AppTypography.bodySmall,
                ),
              ),
            ),
          );
        }

        final bool isLong = p.productDetails.length > 400;

        return Padding(
          padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isLong && !_isOverviewExpanded)
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 220.h),
                  child: ClipRect(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.black,
                            AppColors.black,
                            AppColors.black.withValues(alpha: 0.1),
                            AppColors.transparent,
                          ],
                          stops: const [0.0, 0.65, 0.9, 1.0],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn,
                      child: AppHtml(data: p.productDetails),
                    ),
                  ),
                )
              else
                AppHtml(data: p.productDetails),

              if (isLong) ...[
                SizedBox(height: 8.h),
                Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _isOverviewExpanded = !_isOverviewExpanded;
                      });
                    },
                    borderRadius: AppRadius.smRadius,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 6.h,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _isOverviewExpanded ? AppStrings.viewLess : AppStrings.viewMore,
                            style: AppTypography.titleSmall.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.pickabooBlue,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            _isOverviewExpanded
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            color: AppColors.pickabooBlue,
                            size: 18.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        );

      case 2: // Reviews
      default:
        return Padding(
          padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
          child: BlocBuilder<ReviewBloc, ReviewState>(
          builder: (context, reviewState) {
            final summary = reviewState.summary;
            final displayReviews = reviewState.reviews.isNotEmpty
                ? reviewState.reviews
                : p.reviewsCollection;

            final detailedSummary = summary != null
                ? [
                    summary.rating5Count,
                    summary.rating4Count,
                    summary.rating3Count,
                    summary.rating2Count,
                    summary.rating1Count,
                  ]
                : p.detailedSummary;

            final detailedRatings = summary?.detailedRatings.isNotEmpty == true
                ? summary!.detailedRatings
                : p.detailedRatings;

            final customerPhotos = summary?.allReviewImages.isNotEmpty == true
                ? summary!.allReviewImages
                : (p.allReviewImages.isNotEmpty
                    ? p.allReviewImages
                    : displayReviews.expand((r) => r.images).toList());

            final totalReviewCount = p.reviewsCount > 0
                ? p.reviewsCount
                : (summary?.totalReviews ?? displayReviews.length);

            final ratingValue = summary?.averageRating ?? p.ratingSummaryValue;
            final bool hasReviews = displayReviews.isNotEmpty;
            final bool isReviewsLoading = !hasReviews &&
                (reviewState.isFirstPageLoading ||
                 reviewState.pagingState.isLoading ||
                 (p.isPartial && totalReviewCount > 0) ||
                 (totalReviewCount > 0 && reviewState.pagingState.pages == null));

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PdpRatingBreakdownCard(
                  rating: ratingValue,
                  totalReviews: totalReviewCount,
                  detailedSummary: detailedSummary,
                  detailedRatings: detailedRatings,
                  customerPhotos: customerPhotos,
                  onPhotoTap: widget.onReviewPhotoTap,
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Customer Reviews ($totalReviewCount)',
                      style: AppTypography.titleMedium,
                    ),
                    if (widget.onWriteReviewTap != null)
                      GestureDetector(
                        onTap: widget.onWriteReviewTap,
                        child: Text(
                          'WRITE A REVIEW',
                          style: AppTypography.brandAction.copyWith(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 10.h),
                if (isReviewsLoading) ...[
                  Skeletonizer(
                    key: const ValueKey('pdp_reviews_loading_skeleton'),
                    enabled: true,
                    child: Column(
                      children: List.generate(
                        2,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: AppRadius.cardRadius,
                              border: Border.all(color: AppColors.border),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 32.r,
                                      height: 32.r,
                                      decoration: const BoxDecoration(
                                        color: AppColors.pageBg,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100.w,
                                          height: 14.h,
                                          decoration: const BoxDecoration(
                                            color: AppColors.pageBg,
                                            borderRadius: AppRadius.smRadius,
                                          ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Container(
                                          width: 60.w,
                                          height: 10.h,
                                          decoration: const BoxDecoration(
                                            color: AppColors.pageBg,
                                            borderRadius: AppRadius.smRadius,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Container(
                                  width: double.infinity,
                                  height: 12.h,
                                  decoration: const BoxDecoration(
                                    color: AppColors.pageBg,
                                    borderRadius: AppRadius.smRadius,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Container(
                                  width: 180.w,
                                  height: 12.h,
                                  decoration: const BoxDecoration(
                                    color: AppColors.pageBg,
                                    borderRadius: AppRadius.smRadius,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ] else if (hasReviews) ...[
                  ...displayReviews.take(5).map((r) => PdpReviewTile(
                        review: r,
                        productId: p.id.toString(),
                        isPdpCompact: true,
                      )),
                  if (displayReviews.length > 5 || totalReviewCount > 5) ...[
                    AppSpacing.gapV8,
                    AppButton.outline(
                      text: '${AppStrings.pdpAllReviews} ($totalReviewCount)',
                      icon: Icon(Icons.rate_review_outlined, size: 16.sp, color: AppColors.pickabooBlue),
                      textColor: AppColors.pickabooBlue,
                      borderColor: AppColors.pickabooBlue,
                      isFullWidth: true,
                      height: 42.h,
                      borderRadius: AppRadius.buttonRadius,
                      onPressed: widget.onViewAllReviewsTap,
                    ),
                  ],
                ] else ...[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Center(
                      child: Text(
                        AppStrings.pdpNoReviews,
                        style: AppTypography.bodyMedium.copyWith(color: AppColors.muted),
                      ),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      );
    }
  }
}
