import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/domain/entity/review/review_entity.dart';
import 'package:pickaboo/presentation/bloc/review_bloc/review_bloc.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/review_image_viewer_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/review_item.dart';

class AllProductReviewPage extends StatefulWidget {
  final ProductDetailEntity product;

  const AllProductReviewPage({super.key, required this.product});

  @override
  State<AllProductReviewPage> createState() => _AllProductReviewPageState();
}

class _AllProductReviewPageState extends State<AllProductReviewPage> {

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Scaffold(
      backgroundColor: colors.white,
      appBar: AppBar(
        leading: AppBarButton(
          iconPath: 'assets/new/svg/back_nav_icon.svg',
          width: 7.w,
          height: 14.h,
          onPressed: () => Navigator.of(context).pop(),
          iconColor: colors.text,
        ),
        title: const Text('All Reviews'),
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
              final detailedRatings =
                  summary?.detailedRatings ?? widget.product.detailedRatings;
              final reviewImages =
                  summary?.allReviewImages ?? widget.product.allReviewImages;

              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: _buildProductHeader(colors, textStyle, isLoggedIn),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ratings & Reviews',
                            style: textStyle.headingMedium.copyWith(
                              fontWeight: FontWeight.w700,
                              color: colors.text,
                            ),
                          ),
                          SizedBox(height: 16.h),

                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${summary?.averageRating ?? widget.product.ratingSummaryValue}',
                                          style: textStyle.headingLarge
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: colors.text,
                                                fontSize: 32.sp,
                                              ),
                                        ),
                                        SizedBox(width: 4.w),
                                        Icon(
                                          Icons.star,
                                          color: colors.text,
                                          size: 24.sp,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      '${summary?.ratingSummary ?? widget.product.ratingSummary} Ratings &',
                                      style: textStyle.bodyMedium.copyWith(
                                        color: colors.textMedium,
                                      ),
                                    ),
                                    Text(
                                      '${summary?.totalReviews ?? widget.product.reviewsCount} Reviews',
                                      style: textStyle.bodyMedium.copyWith(
                                        color: colors.textMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 80.h,
                                width: 1.w,
                                color: colors.borderColor,
                                margin: EdgeInsets.symmetric(horizontal: 16.w),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: List.generate(5, (index) {
                                    final star = 5 - index;

                                    final int totalReviews =
                                        summary?.totalReviews ??
                                        widget.product.reviewsCollection.length;

                                    if (totalReviews == 0) {
                                      return _buildStarBar(
                                        context,
                                        star,
                                        0,
                                        '0',
                                      );
                                    }

                                    final count =
                                        summary?.ratingCount(star) ??
                                        widget.product.reviewsCollection
                                            .where(
                                              (r) =>
                                                  r.reviwerRating.round() ==
                                                  star,
                                            )
                                            .length;
                                    final percent = count / totalReviews;

                                    return _buildStarBar(
                                      context,
                                      star,
                                      percent,
                                      count.toString(),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: detailedRatings.map((rate) {
                              return _buildFeatureRating(
                                context,
                                '${rate.avgValue}',
                                rate.rating,
                                colors.green,
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 24.h),

                          if (reviewImages.isNotEmpty) ...[
                            SizedBox(
                              height: 80.w,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: reviewImages.length,
                                itemBuilder: (context, index) {
                                  final imageUrl = reviewImages[index];

                                  return GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: colors.black,
                                        useSafeArea: true,
                                        builder: (context) =>
                                            ReviewImageViewerSheet(
                                              imageUrls: reviewImages,
                                              initialIndex: index,
                                            ),
                                      );
                                    },
                                    child: Container(
                                      width: 80.w,
                                      height: 80.w,
                                      margin: EdgeInsets.only(right: 12.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                        border: Border.all(
                                          color: colors.borderColor,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: imageUrl,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(
                                              color: colors.primary,
                                              strokeWidth: 2,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(
                                                Icons.image_not_supported,
                                                size: 24.sp,
                                                color: colors.gray,
                                              ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 24.h),
                          ],
                        ],
                      ),
                    ),
                  ),

                  PagedSliverList<int, ReviewEntity>(
                    state: state.pagingState,
                    fetchNextPage: () => context.read<ReviewBloc>().add(
                      ReviewEvent.load(
                        productId: widget.product.id.toString(),
                      ),
                    ),
                    builderDelegate: PagedChildBuilderDelegate<ReviewEntity>(
                      itemBuilder: (context, review, index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            Container(height: 1.w, color: colors.borderColor),
                            ReviewItem(
                              review: review,
                              productId: widget.product.id.toString(),
                            ),
                          ],
                        ),
                      ),
                      firstPageProgressIndicatorBuilder: (context) => Center(
                        child: CircularProgressIndicator(color: colors.primary),
                      ),
                      newPageProgressIndicatorBuilder: (context) => Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: colors.primary,
                          ),
                        ),
                      ),
                      firstPageErrorIndicatorBuilder: (context) => Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Center(
                          child: Text(
                            state.error?.message ?? 'Failed to load reviews',
                            style: textStyle.bodyMedium.copyWith(
                              color: colors.textMedium,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      newPageErrorIndicatorBuilder: (context) =>
                          const SizedBox(),
                      noItemsFoundIndicatorBuilder: (context) => Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Center(
                          child: Text(
                            'No reviews yet',
                            style: textStyle.bodyMedium.copyWith(
                              color: colors.textMedium,
                            ),
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

  Widget _buildProductHeader(
    AppColors colors,
    AppTextStyles textStyle,
    bool isLoggedIn,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.white,
        border: Border(bottom: BorderSide(color: colors.borderColor)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: colors.white,
              border: Border.all(color: colors.borderColor),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: CachedNetworkImage(
              imageUrl: widget.product.images.isNotEmpty
                  ? widget.product.images.first
                  : '',
              fit: BoxFit.contain,
              errorWidget: (context, url, error) => Icon(
                Icons.image_not_supported_outlined,
                color: colors.textMedium,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: textStyle.bodyLargeBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12.h),
                ElevatedButton(
                  onPressed: () {
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('You are not eligible to write a review for this product'),
                            backgroundColor: colors.red,
                          ),
                        );
                      }
                    } else {
                      context.push(Routes.login);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFF1E6),
                    foregroundColor: colors.orange,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 8.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Write a review',
                    style: textStyle.bodyMedium.copyWith(
                      color: colors.orange,
                      fontWeight: FontWeight.w600,
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

  Widget _buildStarBar(
    BuildContext context,
    int star,
    double percent,
    String count,
  ) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    Color barColor;
    if (star >= 4) {
      barColor = colors.green;
    } else if (star == 3) {
      barColor = colors.greenlight;
    } else if (star == 2) {
      barColor = colors.orange;
    } else {
      barColor = colors.red;
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          Text('$star', style: textStyle.bodySmall),
          SizedBox(width: 4.w),
          Icon(Icons.star, size: 10.sp, color: colors.text),
          SizedBox(width: 8.w),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2.r),
              child: LinearProgressIndicator(
                value: percent,
                backgroundColor: colors.borderColor,
                color: barColor,
                minHeight: 4.h,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            count,
            style: textStyle.bodySmall.copyWith(color: colors.textMedium),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRating(
    BuildContext context,
    String rating,
    String label,
    Color color,
  ) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return SizedBox(
      width: 70.w,
      child: Column(
        children: [
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 3.w),
            ),
            alignment: Alignment.center,
            child: Text(
              rating,
              style: textStyle.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: colors.textMedium,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: textStyle.caption.copyWith(
              color: colors.textMedium,
              fontSize: 10.sp,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
