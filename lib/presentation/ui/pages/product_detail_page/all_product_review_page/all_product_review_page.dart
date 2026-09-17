// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/domain/entity/review/review_entity.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/review_bloc/review_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/review_image_viewer_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_rating_breakdown_card.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_review_tile.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

import 'package:pickaboo/core/color/app_colors.dart';

class AllProductReviewPage extends StatefulWidget {
  final ProductDetailEntity product;

  const AllProductReviewPage({super.key, required this.product});

  @override
  State<AllProductReviewPage> createState() => _AllProductReviewPageState();
}

class _AllProductReviewPageState extends State<AllProductReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: const PickabooAppBar(
        title: 'All Reviews',
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          final isLoggedIn = authState.maybeWhen(
            authenticated: (token, user) => true,
            orElse: () => false,
          );

          return BlocBuilder<ReviewBloc, ReviewState>(
            builder: (context, state) {
              final summary = state.summary;
              final detailedRatings = summary?.detailedRatings.isNotEmpty == true
                  ? summary!.detailedRatings
                  : widget.product.detailedRatings;

              final detailedSummary = summary != null
                  ? [
                      summary.rating5Count,
                      summary.rating4Count,
                      summary.rating3Count,
                      summary.rating2Count,
                      summary.rating1Count,
                    ]
                  : widget.product.detailedSummary;

              final customerPhotos = summary?.allReviewImages.isNotEmpty == true
                  ? summary!.allReviewImages
                  : widget.product.allReviewImages;

              final totalReviewCount = summary?.totalReviews ?? widget.product.reviewsCount;
              final ratingValue = summary?.averageRating ?? widget.product.ratingSummaryValue;

              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // ── 1. PRODUCT SUMMARY HEADER WITH WRITE A REVIEW BUTTON ──
                  SliverToBoxAdapter(
                    child: _buildProductHeader(isLoggedIn),
                  ),

                  // ── 2. RATINGS & REVIEWS BREAKDOWN CARD ──
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSpacing.sameGroupItemSpacing.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PdpRatingBreakdownCard(
                            rating: ratingValue,
                            totalReviews: totalReviewCount,
                            detailedSummary: detailedSummary,
                            detailedRatings: detailedRatings,
                            customerPhotos: customerPhotos,
                            onPhotoTap: (idx) {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: AppColors.black,
                                useSafeArea: true,
                                builder: (_) => ReviewImageViewerSheet(
                                  imageUrls: customerPhotos,
                                  initialIndex: idx,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'Customer Reviews ($totalReviewCount)',
                            style: AppTypography.titleMedium,
                          ),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                  ),

                  // ── 3. PAGINATED CUSTOMER REVIEWS LIST ──
                  PagedSliverList<int, ReviewEntity>(
                    state: state.pagingState,
                    fetchNextPage: () => context.read<ReviewBloc>().add(
                          ReviewEvent.load(
                            productId: widget.product.id.toString(),
                          ),
                        ),
                    builderDelegate: PagedChildBuilderDelegate<ReviewEntity>(
                      itemBuilder: (context, review, index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.sameGroupItemSpacing.w,
                        ),
                        child: PdpReviewTile(
                          review: review,
                          productId: widget.product.id.toString(),
                          isPdpCompact: false,
                        ),
                      ),
                      firstPageProgressIndicatorBuilder: (context) =>
                          const AppLoader.fullPage(),
                      newPageProgressIndicatorBuilder: (context) =>
                          const AppLoader.pagination(),
                      firstPageErrorIndicatorBuilder: (context) => Padding(
                        padding: EdgeInsets.all(24.w),
                        child: Center(
                          child: Text(
                            state.error?.message ?? 'Failed to load reviews',
                            style: AppTypography.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      newPageErrorIndicatorBuilder: (context) => const SizedBox.shrink(),
                      noItemsFoundIndicatorBuilder: (context) => Padding(
                        padding: EdgeInsets.all(32.w),
                        child: Center(
                          child: Text(
                            'No reviews yet for this product.',
                            style: AppTypography.bodySmall,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 32.h)),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildProductHeader(bool isLoggedIn) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(14.w),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 56.w,
            height: 56.w,
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: AppImage(
              imageUrl: widget.product.images.isNotEmpty
                  ? widget.product.images.first
                  : '',
              fit: BoxFit.contain,
              errorWidget: Icon(
                Icons.image_not_supported_outlined,
                color: AppColors.muted,
                size: 20.sp,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: AppTypography.titleSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () {
                    if (isLoggedIn) {
                      if (widget.product.isEligibleForReview) {
                        context.pushNamed(
                          'writeReview',
                          pathParameters: {'id': widget.product.id.toString()},
                          extra: {
                            'productName': widget.product.name,
                            'productImage': widget.product.images.isNotEmpty
                                ? widget.product.images.first
                                : '',
                          },
                        );
                      } else {
                        SnackBarUtils.showWarning(
                          context,
                          'You are not eligible to write a review for this product',
                        );
                      }
                    } else {
                      context.push(Routes.login);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: AppColors.amberBg,
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Text(
                      'Write a review',
                      style: AppTypography.brandTag,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
