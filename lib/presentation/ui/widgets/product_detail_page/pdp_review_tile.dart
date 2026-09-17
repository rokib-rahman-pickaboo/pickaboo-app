import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/review/review_entity.dart';
import 'package:pickaboo/presentation/bloc/review_bloc/review_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/review_image_viewer_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

import 'package:pickaboo/core/color/app_colors.dart';

/// POLISHED NEW-UI PDP CUSTOMER REVIEW TILE
/// Matches Pickaboo-App-UI design system:
/// - Top Row: Reviewer Avatar + Name & Posted Date (left) + Rating Badge (right)
/// - Title & Comment with clean typography & inline "see more"
/// - Customer photos (48x48 rounded thumbnails opening this review's photos only)
/// - Bottom Row: Like & Dislike voting action buttons
class PdpReviewTile extends StatefulWidget {
  final ReviewEntity review;
  final String? productId;
  final bool isPdpCompact;

  const PdpReviewTile({
    super.key,
    required this.review,
    this.productId,
    this.isPdpCompact = false,
  });

  @override
  State<PdpReviewTile> createState() => _PdpReviewTileState();
}

class _PdpReviewTileState extends State<PdpReviewTile> {
  bool _isExpanded = false;

  String _cleanHtml(String text) {
    return text
        .replaceAll('&quot;', '"')
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&#039;', "'")
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    final title = _cleanHtml(widget.review.title);
    final detail = _cleanHtml(widget.review.detail);
    final reviewerName = widget.review.reviwerName.trim().isNotEmpty
        ? widget.review.reviwerName.trim()
        : 'Pickaboo Customer';

    final ratingVal = widget.review.reviwerRating > 0
        ? widget.review.reviwerRating.toStringAsFixed(1)
        : '5.0';

    final formattedDate = 'Posted on ${DateFormat('d MMMM y').format(widget.review.postedOn)}';

    return Container(
      margin: EdgeInsets.only(bottom: AppSpacing.sameGroupItemSpacing.h),
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: BoxDecoration(
        color: AppColors.pageBg,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 1. Top Header: Avatar + (Name & Date) [Left] | Rating Badge [Right] ──
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAvatar(),
              AppSpacing.sameGroupWidthGap,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reviewerName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.titleSmall,
                    ),
                    const SizedBox(height: AppSpacing.sameGroupItemSpacing / 4),
                    Text(
                      formattedDate,
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
              ),
              Container(
                padding: AppSpacing.badgePadding,
                decoration: BoxDecoration(
                  color: AppColors.pickabooBlue,
                  borderRadius: BorderRadius.circular(AppRadius.badge),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      ratingVal,
                      style: AppTypography.bodyTiny.extraBold().red.copyWith(
                        color: AppColors.white,
                        fontSize: 10.5.sp,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Icon(Icons.star, color: AppColors.white, size: 9.5.sp),
                  ],
                ),
              ),
            ],
          ),

          // ── 2. Review Title (if present) ──
          if (title.isNotEmpty) ...[
            SizedBox(height: 8.h),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.titleSmall,
            ),
          ],

          SizedBox(height: 6.h),

          // ── 3. Review Comment (Expandable) ──
          if (detail.isNotEmpty)
            LayoutBuilder(
              builder: (context, constraints) {
                final span = TextSpan(
                  text: detail,
                  style: AppTypography.bodyMedium,
                );

                final tp = TextPainter(
                  text: span,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  textDirection: ui.TextDirection.ltr,
                )..layout(maxWidth: constraints.maxWidth);

                final isOverflowing = tp.didExceedMaxLines;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detail,
                      style: AppTypography.bodyMedium,
                      maxLines: _isExpanded ? null : 3,
                      overflow: _isExpanded
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                    ),
                    if (isOverflowing) ...[
                      SizedBox(height: 4.h),
                      GestureDetector(
                        onTap: () => setState(() => _isExpanded = !_isExpanded),
                        child: Text(
                          _isExpanded ? 'Show Less' : 'More',
                          style: AppTypography.brandAction,
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),

          // ── 4. Customer Review Photos (Only for THIS review) ──
          if (widget.review.images.isNotEmpty) ...[
            SizedBox(height: 8.h),
            SizedBox(
              height: 48.w,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.review.images.length,
                separatorBuilder: (_, __) => SizedBox(width: 6.w),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: AppColors.black,
                        useSafeArea: true,
                        builder: (_) => ReviewImageViewerSheet(
                          imageUrls: widget.review.images,
                          initialIndex: index,
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: AppRadius.badgeRadius,
                      child: Container(
                        width: 48.w,
                        height: 48.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.border),
                          borderRadius: AppRadius.badgeRadius,
                        ),
                        child: AppImage(
                          imageUrl: widget.review.images[index],
                          fit: BoxFit.cover,
                          placeholder: const AppLoader.inline(),
                          errorWidget: Icon(
                            Icons.broken_image,
                            color: AppColors.muted,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],

          SizedBox(height: 10.h),

          // ── 5. Bottom Actions: Like & Dislike Voting ──
          _buildReviewActions(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 32.w,
      height: 32.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.pickabooBlue.withValues(alpha: 0.1),
      ),
      child: ClipOval(
        child: widget.review.reviwerImage.isNotEmpty
            ? AppImage(
                imageUrl: widget.review.reviwerImage,
                fit: BoxFit.cover,
                placeholder: SvgPicture.asset(
                  AppAssets.detailReviewAvatar,
                  fit: BoxFit.contain,
                ),
                errorWidget: SvgPicture.asset(
                  AppAssets.detailReviewAvatar,
                  fit: BoxFit.contain,
                ),
              )
            : Padding(
                padding: EdgeInsets.all(6.w),
                child: SvgPicture.asset(
                  AppAssets.detailReviewAvatar,
                  fit: BoxFit.contain,
                ),
              ),
      ),
    );
  }

  Widget _buildReviewActions() {
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

    final likeColor = widget.review.doLike ? AppColors.pickabooBlue : AppColors.muted;
    final dislikeColor = widget.review.doDislike ? AppColors.pickabooBlue : AppColors.muted;

    return Row(
      children: [
        // Like Button
        GestureDetector(
          onTap: (productId == null || widget.review.doLike)
              ? null
              : () => vote(helpful: true),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppAssets.detailThumbUp,
                width: 15.w,
                height: 15.h,
                colorFilter: ColorFilter.mode(likeColor, BlendMode.srcIn),
              ),
              SizedBox(width: 5.w),
              Text(
                '${widget.review.likeCount}',
                style: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.w700,
                  color: likeColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16.w),

        // Dislike Button
        GestureDetector(
          onTap: (productId == null || widget.review.doDislike)
              ? null
              : () => vote(helpful: false),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppAssets.detailThumbDown,
                width: 15.w,
                height: 15.h,
                colorFilter: ColorFilter.mode(dislikeColor, BlendMode.srcIn),
              ),
              SizedBox(width: 5.w),
              Text(
                '${widget.review.dislikesCount}',
                style: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.w700,
                  color: dislikeColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
