import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/review/review_entity.dart';
import 'package:pickaboo/presentation/bloc/review_bloc/review_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/review_image_viewer_sheet.dart';

class ReviewItem extends StatefulWidget {
  final ReviewEntity review;

  final String? productId;

  const ReviewItem({super.key, required this.review, this.productId});

  @override
  State<ReviewItem> createState() => _ReviewItemState();
}

class _ReviewItemState extends State<ReviewItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAvatar(colors),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.review.reviwerName,
                  style: textStyle.reviewAuthor.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.text,
                  ),
                ),
                SizedBox(height: 8.h),

                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Row(
                        children: [
                          Text(
                            widget.review.reviwerRating.toString(),
                            style: textStyle.bodySmall.copyWith(
                              color: colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Icon(Icons.star, color: colors.white, size: 10.sp),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        widget.review.title,
                        style: textStyle.reviewText.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colors.text,
                          fontSize: 14.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),

                Text(
                  'Posted on ${DateFormat('d MMMM y').format(widget.review.postedOn)}',
                  style: textStyle.reviewDate.copyWith(
                    color: colors.textMedium,
                  ),
                ),
                SizedBox(height: 8.h),

                LayoutBuilder(
                  builder: (context, constraints) {
                    final span = TextSpan(
                      text: widget.review.detail,
                      style: textStyle.reviewText.copyWith(color: colors.text),
                    );

                    final tp = TextPainter(
                      text: span,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      textDirection: ui.TextDirection.ltr,
                    );

                    tp.layout(maxWidth: constraints.maxWidth);
                    final isOverflowing = tp.didExceedMaxLines;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.review.detail,
                          style: textStyle.bodyMedium.copyWith(
                            color: colors.text,
                            fontSize: 13.sp,
                            height: 1.4.h,
                          ),
                          maxLines: _isExpanded ? null : 2,
                          overflow: _isExpanded
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                        ),
                        if (isOverflowing) ...[
                          SizedBox(height: 4.h),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _isExpanded = !_isExpanded;
                              });
                            },
                            child: Text(
                              _isExpanded ? "Show Less" : "More",
                              style: textStyle.bodySmall.copyWith(
                                color: colors.primary,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                decorationColor: colors.primary,
                              ),
                            ),
                          ),
                        ],
                      ],
                    );
                  },
                ),

                if (widget.review.images.isNotEmpty) ...[
                  SizedBox(height: 12.h),
                  _buildReviewImages(colors),
                ],

                SizedBox(height: 12.h),

                _buildReviewActions(colors, textStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(AppColors colors) {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors.backgroundGray,
      ),
      child: ClipOval(
        child: widget.review.reviwerImage.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: widget.review.reviwerImage,
                fit: BoxFit.cover,
                placeholder: (context, url) => SvgPicture.asset(
                  'assets/new/svg/detail/review_avatar_icon.svg',
                  width: 30.w,
                  height: 30.w,
                  fit: BoxFit.contain,
                ),
                errorWidget: (context, url, error) => SvgPicture.asset(
                  'assets/new/svg/detail/review_avatar_icon.svg',
                  width: 30.w,
                  height: 30.w,
                  fit: BoxFit.contain,
                ),
              )
            : Container(
                padding: EdgeInsets.all(8.w),
                child: SvgPicture.asset(
                  'assets/new/svg/detail/review_avatar_icon.svg',
                  fit: BoxFit.contain,
                ),
              ),
      ),
    );
  }

  Widget _buildReviewImages(AppColors colors) {
    return SizedBox(
      height: 60.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.review.images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: colors.black,
                useSafeArea: true,
                builder: (context) => ReviewImageViewerSheet(
                  imageUrls: widget.review.images,
                  initialIndex: index,
                ),
              );
            },
            child: Container(
              width: 60.w,
              height: 60.w,
              margin: EdgeInsets.only(right: 8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: colors.borderColor),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.r),
                child: CachedNetworkImage(
                  imageUrl: widget.review.images[index],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colors.primary,
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.broken_image, color: colors.gray, size: 20.sp),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildReviewActions(AppColors colors, AppTextStyles textStyle) {
    final productId = widget.productId;

    final isVoting = productId == null
        ? false
        : context.select<ReviewBloc, bool>(
            (bloc) => bloc.state.votingReviewId == widget.review.reviewId,
          );

    void vote({required bool helpful}) {
      if (productId == null || isVoting) return;
      if (helpful && widget.review.doLike) return;
      if (!helpful && widget.review.doDislike) return;
      final bloc = context.read<ReviewBloc>();
      bloc.add(
        helpful
            ? ReviewEvent.voteHelpful(
                productId: productId,
                reviewId: widget.review.reviewId,
              )
            : ReviewEvent.voteNotHelpful(
                productId: productId,
                reviewId: widget.review.reviewId,
              ),
      );
    }

    return Row(
      children: [
        _buildActionButton(
          icon: 'assets/new/svg/detail/thum_up_icon.svg',
          count: widget.review.likeCount,
          isActive: widget.review.doLike,
          colors: colors,
          textStyle: textStyle,
          onTap: (productId == null || widget.review.doLike)
              ? null
              : () => vote(helpful: true),
        ),
        SizedBox(width: 24.w),
        _buildActionButton(
          icon: 'assets/new/svg/detail/thum_down.svg',
          count: widget.review.dislikesCount,
          isActive: widget.review.doDislike,
          colors: colors,
          textStyle: textStyle,
          onTap: (productId == null || widget.review.doDislike)
              ? null
              : () => vote(helpful: false),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String icon,
    required int count,
    required bool isActive,
    required AppColors colors,
    required AppTextStyles textStyle,
    VoidCallback? onTap,
  }) {
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          icon,
          width: 16.w,
          colorFilter: ColorFilter.mode(
            isActive ? colors.primary : colors.textMedium,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 6.w),
        Text(
          count.toString(),
          style: textStyle.bodySmall.copyWith(
            color: isActive ? colors.primary : colors.textMedium,
            fontSize: 12.sp,
          ),
        ),
      ],
    );

    if (onTap == null) return content;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
        child: content,
      ),
    );
  }
}
