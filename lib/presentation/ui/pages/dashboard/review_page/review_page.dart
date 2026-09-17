// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & DESIGN TOKENS ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/user_review/user_review_entity.dart';
import 'package:pickaboo/presentation/bloc/review_bloc/review_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';

/// Reviews & Ratings Hub Page
/// Redesigned to strictly match Pickaboo-App-UI design system tokens.
class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  void initState() {
    super.initState();
    _loadReviews();
  }

  void _loadReviews() {
    context.read<ReviewBloc>().add(const ReviewEvent.getUserReviews());
  }

  Future<void> _onRefresh() async {
    _loadReviews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: const PickabooAppBar(
        title: 'Reviews & Ratings',
      ),
      body: BlocBuilder<ReviewBloc, ReviewState>(
        builder: (context, state) {
          if (state.userReviewsError != null) {
            final isOffline = ConnectivityUtils.isNoInternet(state.userReviewsError, context);
            return AppErrorView(
              type: isOffline ? AppErrorType.noInternet : AppErrorType.generic,
              title: isOffline ? 'No Internet Connection' : null,
              message: isOffline ? null : state.userReviewsError!.message,
              onRetry: _loadReviews,
            );
          }

          if (state.isUserReviewsLoading || state.userReviews == null) {
            return const AppLoader.fullPage();
          }

          final reviews = state.userReviews!;
          if (reviews.isEmpty) {
            return _buildEmptyState(context);
          }

          return RefreshIndicator(
            onRefresh: _onRefresh,
            color: AppColors.pickabooBlue,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.sameGroupItemSpacing.w,
                vertical: AppSpacing.sameGroupItemSpacing.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── 1. Summary & Reward Points Incentive Header ──
                  _buildSummaryHeader(reviews),
                  SizedBox(height: AppSpacing.groupToGroupSpacing.h),

                  // ── 2. Section Title ──
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.sameGroupItemSpacing.w / 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Submitted Reviews',
                          style: AppTypography.titleMedium,
                        ),
                        Text(
                          'Verified Purchases',
                          style: AppTypography.bodyTiny.extraBold().green,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.sameGroupItemSpacing.h),

                  // ── 3. Reviews List ──
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: reviews.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: AppSpacing.sameGroupItemSpacing.h),
                    itemBuilder: (context, index) {
                      return _buildReviewCard(context, reviews[index]);
                    },
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Summary header showcasing overall reviews stats and reward motivation
  Widget _buildSummaryHeader(List<UserReviewEntity> reviews) {
    final double avgRating = reviews.isNotEmpty
        ? reviews.map((r) => r.reviwerRating).reduce((a, b) => a + b) /
            reviews.length
        : 0.0;

    return AppCard(
      padding: EdgeInsets.all(12.w),
      child: Column(
        children: [
          Row(
            children: [
              // Rating Score Badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.surfaceBlue,
                  borderRadius: AppRadius.cardRadius,
                  border: Border.all(
                    color: AppColors.pickabooBlue.withValues(alpha: 0.2),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          avgRating.toStringAsFixed(1),
                          style: AppTypography.titleLarge.copyWith(
                            color: AppColors.pickabooBlue,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.star_rounded,
                          color: AppColors.amber,
                          size: 20.sp,
                        ),
                      ],
                    ),
                    Text(
                      'Avg Rating',
                      style: AppTypography.bodyTiny,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 14.w),

              // Rewards & Contribution message
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reviewer Community',
                      style: AppTypography.titleSmall,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Your authentic reviews help fellow buyers make informed decisions and earn you Club Points!',
                      style: AppTypography.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          const Divider(height: 1, color: AppColors.border),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.stars_rounded,
                    size: 16.sp,
                    color: AppColors.green,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    '${reviews.length} Products Reviewed',
                    style: AppTypography.savingsText,
                  ),
                ],
              ),
              Text(
                '100% Verified Buyer',
                style: AppTypography.bodyTiny.copyWith(
                  color: AppColors.navy,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Individual Review Card matching Pickaboo Design Language
  Widget _buildReviewCard(BuildContext context, UserReviewEntity review) {
    final String formattedDate =
        DateFormat('dd MMM, yyyy').format(review.postedOn);

    return AppCard(
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Product Header Row (Clickable) ──
          InkWell(
            onTap: () {
              context.goToProductDetail(
                review.productId.toString(),
                slug: review.productUrlKey.isNotEmpty
                    ? review.productUrlKey
                    : null,
                productName: review.productName,
              );
            },
            borderRadius: AppRadius.buttonRadius,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Product Thumbnail
                ClipRRect(
                  borderRadius: AppRadius.buttonRadius,
                  child: Container(
                    width: 56.w,
                    height: 56.w,
                    decoration: BoxDecoration(
                      color: AppColors.pageBg,
                      borderRadius: AppRadius.buttonRadius,
                      border: Border.all(color: AppColors.border),
                    ),
                    child: review.productImage.isNotEmpty
                        ? AppImage(
                            imageUrl: review.productImage,
                            fit: BoxFit.contain,
                            placeholder:
                                const AppLoader.inline(size: 18),
                            errorWidget: Center(
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                color: AppColors.mutedLight,
                                size: 24.sp,
                              ),
                            ),
                          )
                        : Center(
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: AppColors.mutedLight,
                              size: 24.sp,
                            ),
                          ),
                  ),
                ),
                SizedBox(width: 12.w),

                // Product Title & View Link
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.productName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.titleMicro,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Text(
                            'View Product',
                            style: AppTypography.brandAction,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 10,
                            color: AppColors.pickabooBlue,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.h),
          const Divider(height: 1, color: AppColors.border),
          SizedBox(height: 10.h),

          // ── Rating Stars & Date Row ──
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Rating Stars
              Row(
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (starIndex) => Icon(
                        starIndex < review.reviwerRating
                            ? Icons.star_rounded
                            : Icons.star_border_rounded,
                        size: 16.sp,
                        color: starIndex < review.reviwerRating
                            ? AppColors.amber
                            : AppColors.border,
                      ),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Container(
                    padding: AppSpacing.badgePadding,
                    decoration: AppDecorations.tintBoxDecoration(
                      backgroundColor: AppColors.amberBg,
                    ),
                    child: Text(
                      '${review.reviwerRating}.0',
                      style: AppTypography.bodyTiny.copyWith(
                        color: AppColors.amber,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),

              // Date
              Text(
                formattedDate,
                style: AppTypography.bodyTiny,
              ),
            ],
          ),

          // ── Review Title (if present) ──
          if (review.title.isNotEmpty) ...[
            SizedBox(height: 8.h),
            Text(
              review.title,
              style: AppTypography.titleSmall,
            ),
          ],

          // ── Review Description Detail ──
          if (review.detail.isNotEmpty) ...[
            SizedBox(height: 4.h),
            Text(
              review.detail,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.navy,
                height: 1.35,
              ),
            ),
          ],

          // ── User Uploaded Review Images (if any) ──
          if (review.images.isNotEmpty) ...[
            SizedBox(height: 10.h),
            SizedBox(
              height: 60.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: review.images.length,
                separatorBuilder: (context, index) => SizedBox(width: 8.w),
                itemBuilder: (context, imgIndex) {
                  return ClipRRect(
                    borderRadius: AppRadius.badgeRadius,
                    child: Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.border),
                        borderRadius: AppRadius.badgeRadius,
                      ),
                      child: AppImage(
                        imageUrl: review.images[imgIndex],
                        fit: BoxFit.cover,
                        placeholder:
                            const AppLoader.inline(size: 16),
                        errorWidget: Icon(
                          Icons.image_not_supported_outlined,
                          color: AppColors.mutedLight,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],

          // ── Verified Buyer Tag ──
          SizedBox(height: 10.h),
          Row(
            children: [
              Container(
                padding: AppSpacing.badgePadding,
                decoration: AppDecorations.tintBoxDecoration(
                  backgroundColor: AppColors.greenBg,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.verified_rounded,
                      size: 12,
                      color: AppColors.green,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Verified Purchase',
                      style: AppTypography.bodyTiny.extraBold().green,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Empty state when no reviews exist
  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w * 3),
        child: AppCard(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 36.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.pickabooBlue.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.rate_review_outlined,
                  size: 44.sp,
                  color: AppColors.pickabooBlue,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'No Reviews Yet',
                style: AppTypography.titleLarge,
              ),
              SizedBox(height: 6.h),
              Text(
                'You haven\'t submitted any product reviews yet. Leave reviews on your purchased products to help the community and win Club Points!',
                textAlign: TextAlign.center,
                style: AppTypography.bodySmall,
              ),
              AppSpacing.gapV20,
              AppButton.primary(
                text: 'View Your Orders',
                icon: Icon(Icons.shopping_bag_outlined, size: 18.sp, color: AppColors.white),
                isFullWidth: false,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 10.h,
                ),
                borderRadius: AppRadius.buttonRadius,
                onPressed: () => context.push(Routes.orderList),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Convenience alias
typedef ReviewPage = Review;
