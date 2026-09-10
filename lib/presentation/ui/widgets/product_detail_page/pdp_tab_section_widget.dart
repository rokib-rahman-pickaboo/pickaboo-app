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
import 'package:pickaboo/presentation/ui/widgets/common/app_html.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_rating_breakdown_card.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_review_tile.dart';

/// 10. TABBED SPECIFICATIONS, OVERVIEW, REVIEWS & Q&A
class PdpTabSectionWidget extends StatefulWidget {
  final ProductDetailEntity product;
  final VoidCallback? onWriteReviewTap;
  final VoidCallback? onViewAllReviewsTap;
  final Function(int imageIndex)? onReviewPhotoTap;

  const PdpTabSectionWidget({
    super.key,
    required this.product,
    this.onWriteReviewTap,
    this.onViewAllReviewsTap,
    this.onReviewPhotoTap,
  });

  @override
  State<PdpTabSectionWidget> createState() => _PdpTabSectionWidgetState();
}

class _PdpTabSectionWidgetState extends State<PdpTabSectionWidget> {
  int _selectedTab = 0;
  int _selectedSpecGroupIndex = 0;
  bool _isOverviewExpanded = false;

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
        onTap: () => setState(() => _selectedTab = index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSel ? AppColors.pickabooBlue : Colors.transparent,
                width: 2.w,
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.cardTitle.copyWith(
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
        if (p.moreInformation.isEmpty) {
          return Padding(
            padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
            child: Center(
              child: Text(
                'No additional specifications available.',
                style:
                    AppTypography.bodyRegular.copyWith(color: AppColors.muted),
              ),
            ),
          );
        }

        final groups = p.moreInformation;
        final safeIndex = _selectedSpecGroupIndex.clamp(0, groups.length - 1);
        final activeGroup = groups[safeIndex];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Horizontal Chip List (Matching Child Category Chip UI) ──
            if (groups.length > 1) ...[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.sameGroupItemSpacing.w,
                  vertical: 10.h,
                ),
                child: Row(
                  children: List.generate(groups.length, (index) {
                    final group = groups[index];
                    final isSelected = index == safeIndex;
                    final label = group.groupLabel.isNotEmpty
                        ? group.groupLabel
                        : 'Group ${index + 1}';

                    return Padding(
                      padding: EdgeInsets.only(
                        right: AppSpacing.sameGroupItemSpacing.w,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedSpecGroupIndex = index;
                          });
                        },
                        borderRadius: BorderRadius.circular(6.r),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.pickabooBlue
                                : AppColors.white,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.pickabooBlue
                                  : AppColors.border,
                              width: 1.w,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              label,
                              style: AppTypography.bodyMuted.copyWith(
                                fontSize: 11.sp,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w600,
                                color: isSelected
                                    ? AppColors.white
                                    : AppColors.navy,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ] else
              SizedBox(height: 10.h),

            // ── Active Group Attributes Table ──
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.sameGroupItemSpacing.w,
                0,
                AppSpacing.sameGroupItemSpacing.w,
                AppSpacing.sameGroupItemSpacing.h,
              ),
              child: activeGroup.attrList.isNotEmpty
                  ? Container(
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
                            for (int i = 0; i < activeGroup.attrList.length; i++) ...[
                              Builder(
                                builder: (context) {
                                  final bool isFirst = i == 0;
                                  final bool isLast =
                                      i == activeGroup.attrList.length - 1;
                                  final BorderRadius? rowRadius = (isFirst && isLast)
                                      ? BorderRadius.circular(AppRadius.card.r)
                                      : isFirst
                                          ? BorderRadius.vertical(
                                              top: Radius.circular(
                                                  AppRadius.card.r),
                                            )
                                          : isLast
                                              ? BorderRadius.vertical(
                                                  bottom: Radius.circular(
                                                      AppRadius.card.r),
                                                )
                                              : null;

                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14.w,
                                      vertical: 9.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: i % 2 == 0
                                          ? AppColors.white
                                          : AppColors.pageBg,
                                      borderRadius: rowRadius,
                                      border: !isLast
                                          ? Border(
                                              bottom: BorderSide(
                                                color: AppColors.border
                                                    .withValues(alpha: 0.6),
                                                width: 0.8.w,
                                              ),
                                            )
                                          : null,
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 120.w,
                                          child: Text(
                                            activeGroup.attrList[i].label,
                                            style: AppTypography.bodyMuted.copyWith(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        AppSpacing.sameGroupWidthGap,
                                        Expanded(
                                          child: Text(
                                            activeGroup.attrList[i].value,
                                            style: AppTypography.cardTitle.copyWith(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Text(
                        'No specifications in this category.',
                        style: AppTypography.bodyMuted,
                      ),
                    ),
            ),
          ],
        );

      case 1: // Overview
        if (p.productDetails.isEmpty) {
          return Padding(
            padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Text(
                  'No product overview provided.',
                  style: AppTypography.bodyMuted,
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
                            Colors.black,
                            Colors.black,
                            Colors.black.withValues(alpha: 0.1),
                            Colors.transparent,
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
                    borderRadius: BorderRadius.circular(6.r),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 6.h,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _isOverviewExpanded ? 'View Less' : 'View More',
                            style: AppTypography.cardTitle.copyWith(
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

            final totalReviewCount = summary?.totalReviews ??
                (displayReviews.isNotEmpty ? displayReviews.length : p.reviewsCount);

            final ratingValue = summary?.averageRating ?? p.ratingSummaryValue;
            final bool hasReviews = displayReviews.isNotEmpty;

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
                      style: AppTypography.sectionTitle,
                    ),
                    if (widget.onWriteReviewTap != null)
                      GestureDetector(
                        onTap: widget.onWriteReviewTap,
                        child: Text(
                          'WRITE A REVIEW',
                          style: AppTypography.brandActionText.copyWith(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 10.h),
                if (hasReviews) ...[
                  ...displayReviews.take(5).map((r) => PdpReviewTile(
                        review: r,
                        productId: p.id.toString(),
                        isPdpCompact: true,
                      )),
                  if (displayReviews.length > 5 || totalReviewCount > 5) ...[
                    SizedBox(height: 8.h),
                    SizedBox(
                      width: double.infinity,
                      height: 42.h,
                      child: OutlinedButton.icon(
                        onPressed: widget.onViewAllReviewsTap,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.pickabooBlue,
                          side: BorderSide(
                            color: AppColors.pickabooBlue,
                            width: 1.2.w,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        icon: Icon(Icons.rate_review_outlined, size: 16.sp),
                        label: Text(
                          'View All Reviews ($totalReviewCount)',
                          style: AppTypography.buttonPrimary.copyWith(
                            color: AppColors.pickabooBlue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ] else ...[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Center(
                      child: Text(
                        'No reviews yet for this product.',
                        style: AppTypography.bodyRegular.copyWith(color: AppColors.muted),
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
