import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/user_review/user_review_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/your_review_page/star_rating.dart';

class ReviewRowItem extends StatelessWidget {
  final UserReviewEntity review;
  final bool isLast;

  const ReviewRowItem({super.key, required this.review, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80.w,
              width: 80.w,
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                border: Border.all(color: colors.borderColor),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: review.productImage.isNotEmpty
                  ? Image.network(
                      review.productImage,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.image_not_supported, color: colors.gray),
                    )
                  : Icon(Icons.image, color: colors.gray),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle.bodyMedium.copyWith(
                      fontWeight: FontWeight.w500,
                      color: colors.text,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  StarRating(score: review.reviwerRating.toDouble(), size: 12.sp),
                  SizedBox(height: 6.h),
                  Text(
                    'Posted on ${_formatDate(review.postedOn)}',
                    style: textStyle.caption.copyWith(
                      color: colors.gray,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (review.detail.isNotEmpty) ...[
          SizedBox(height: 12.h),
          Text(
            review.detail,
            style: textStyle.bodySmall.copyWith(
              color: colors.text.withValues(alpha: 0.8),
              height: 1.4.h,
            ),
          ),
        ],
        if (review.images.isNotEmpty) ...[
          SizedBox(height: 15.h),
          SizedBox(
            height: 65.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: review.images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.network(
                      review.images[index],
                      height: 65.w,
                      width: 65.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
        if (!isLast)
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
            height: 1.h,
            color: colors.borderColor.withValues(alpha: 0.5),
          ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('d MMMM yyyy').format(date.toLocal());
  }
}
