// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/user_review/user_review_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// Modern Review Row Item matching Pickaboo-App-UI prototype.
class ReviewRowItem extends StatelessWidget {
  final UserReviewEntity review;
  final bool isLast;

  const ReviewRowItem({super.key, required this.review, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Product Header Row: Thumbnail + Details ──
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Product Thumbnail Container ──
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                width: 64.w,
                height: 64.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.border),
                ),
                child: review.productImage.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: review.productImage,
                        fit: BoxFit.contain,
                        placeholder: (context, url) =>
                            const AppLoader.inline(size: 20),
                        errorWidget: (context, url, error) => Center(
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: AppColors.pickabooBlue,
                            size: 28.sp,
                          ),
                        ),
                      )
                    : Center(
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: AppColors.pickabooBlue,
                          size: 28.sp,
                        ),
                      ),
              ),
            ),
            SizedBox(width: 12.w),

            // ── Product Info & Rating ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.cardTitle,
                  ),
                  SizedBox(height: 4.h),

                  // ── Star Rating Row ──
                  Row(
                    children: List.generate(
                      5,
                      (starIndex) => Icon(
                        Icons.star_rounded,
                        size: 15.sp,
                        color: starIndex < review.reviwerRating
                            ? AppColors.amber
                            : AppColors.border,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),

                  // ── Posted Date ──
                  Text(
                    'Posted on ${_formatDate(review.postedOn)}',
                    style: AppTypography.bodyTiny,
                  ),
                ],
              ),
            ),
          ],
        ),

        // ── Review Comment Box ──
        if (review.detail.isNotEmpty) ...[
          SizedBox(height: 10.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.border),
            ),
            child: Text(
              review.detail,
              style: AppTypography.bodyRegular,
            ),
          ),
        ],

        // ── Review Images ──
        if (review.images.isNotEmpty) ...[
          SizedBox(height: 10.h),
          SizedBox(
            height: 60.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: review.images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CachedNetworkImage(
                      imageUrl: review.images[index],
                      height: 60.h,
                      width: 60.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],

        // ── Divider ──
        if (!isLast) ...[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            child: Divider(
              height: 1.h,
              thickness: 1.h,
              color: AppColors.border,
            ),
          ),
        ],
      ],
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('d MMM yyyy').format(date.toLocal());
  }
}
