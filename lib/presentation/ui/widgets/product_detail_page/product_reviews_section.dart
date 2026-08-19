import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/presentation/bloc/review_bloc/review_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/review_item.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/review_image_viewer_sheet.dart';

class ProductReviewsSection extends StatelessWidget {
  final ProductDetailEntity product;
  final VoidCallback onRate;
  final bool showViewAll;
  const ProductReviewsSection({
    super.key,
    required this.product,
    required this.onRate,
    this.showViewAll = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewBloc, ReviewState>(
      builder: (context, state) => _build(context, state),
    );
  }

  Widget _build(BuildContext context, ReviewState state) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    final summary = state.summary;
    final displayReviews = state.reviews.isNotEmpty
        ? state.reviews
        : product.reviewsCollection;
    final detailedRatings =
        summary?.detailedRatings ?? product.detailedRatings;
    final reviewImages = summary?.allReviewImages ?? product.allReviewImages;
    final totalReviewCount = summary?.totalReviews ?? product.reviewsCount;

    return Container(
      color: colors.white,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ratings & Reviews',
                style: textStyle.subheading.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colors.text,
                ),
              ),
              ElevatedButton(
                onPressed: onRate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  foregroundColor: colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  minimumSize: Size(0, 36.h),
                ),
                child: Text(
                  'Rate Product',
                  style: textStyle.buttonSmall.copyWith(color: colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${summary?.averageRating ?? product.ratingSummaryValue}',
                          style: textStyle.headingMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colors.text,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(Icons.star, color: colors.text, size: 20.sp),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${summary?.ratingSummary ?? product.ratingSummary} Ratings &',
                      style: textStyle.bodySmall.copyWith(
                        color: colors.textMedium,
                      ),
                    ),
                    Text(
                      '$totalReviewCount Reviews',
                      style: textStyle.bodySmall.copyWith(
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
                    final totalReviews =
                        summary?.totalReviews ?? displayReviews.length;

                    if (totalReviews == 0) {
                      return _buildStarBar(context, star, 0, '0');
                    }

                    final count =
                        summary?.ratingCount(star) ??
                        displayReviews
                            .where((r) => r.reviwerRating.round() == star)
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
          if (detailedRatings.isNotEmpty) ...[
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
          ],
          if (reviewImages.isNotEmpty) ...[
            SizedBox(height: 16.h),
            SizedBox(
              height: 80.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: reviewImages.take(5).length,
                itemBuilder: (context, index) {
                  final imageUrl = reviewImages[index];

                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: colors.black,
                        useSafeArea: true,
                        builder: (context) => ReviewImageViewerSheet(
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
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: colors.borderColor),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                              color: colors.primary,
                              strokeWidth: 2,
                            ),
                          ),
                          errorWidget: (context, url, error) => Icon(
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
          ],
          if (displayReviews.isNotEmpty) ...[
            SizedBox(height: 24.h),
            Column(
              children: displayReviews.take(3).map((review) {
                return Column(
                  children: [
                    Container(height: 1.w, color: colors.borderColor),
                    ReviewItem(
                      review: review,
                      productId: product.id.toString(),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],

          if (showViewAll && displayReviews.isNotEmpty) ...[
            SizedBox(height: 16.h),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  context.pushNamed(
                    'allProductReviews',
                    pathParameters: {'id': product.sku},
                    extra: product,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                child: Text(
                  'View All $totalReviewCount Reviews',
                  style: textStyle.buttonMedium.copyWith(color: colors.white),
                ),
              ),
            ),
          ],
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
    final ratingValue = double.tryParse(rating) ?? 0.0;
    final percent = (ratingValue / 5).clamp(0.0, 1.0);

    return SizedBox(
      width: 70.w,
      child: Column(
        children: [
          CircularPercentIndicator(
            radius: 25.w,
            lineWidth: 3.w,
            percent: percent,
            center: Text(
              rating,
              style: textStyle.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: colors.textMedium,
              ),
            ),
            progressColor: color,
            backgroundColor: colors.borderColor,
            circularStrokeCap: CircularStrokeCap.round,
            animation: true,
            animationDuration: 800,
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
