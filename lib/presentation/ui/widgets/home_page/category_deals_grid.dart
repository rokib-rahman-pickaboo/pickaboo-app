// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// ============================================================================
/// 📦 CATEGORY DEALS GRID
/// Standardized with universal 8.w sameGroupItemSpacing and 12.h groupToGroupSpacing.
/// ============================================================================
class CategoryDealsGrid extends StatelessWidget {
  final CategorySliderEntity categorySlider;
  final Function(SliderEntity)? onDealTap;
  final VoidCallback? onViewAll;

  const CategoryDealsGrid({
    super.key,
    required this.categorySlider,
    this.onDealTap,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    final deals = categorySlider.slides.take(4).toList();

    if (deals.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.only(
        left: AppSpacing.sameGroupItemSpacing.w,
        right: AppSpacing.sameGroupItemSpacing.w,
        bottom: AppSpacing.groupToGroupSpacing.h,
      ),
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: BoxDecoration(
        color: AppColors.surfaceBlue,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(
          color: AppColors.border,
          width: 1.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  categorySlider.name,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.titleMedium,
                ),
              ),
              if (onViewAll != null) ...[
                SizedBox(width: 8.w),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onViewAll,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'View All',
                          style: AppTypography.titleSmall,
                        ),
                        SizedBox(width: 2.w),
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 16.sp,
                          color: AppColors.pickabooBlue,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),

          SizedBox(height: AppSpacing.sameGroupItemSpacing.h),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int rowStart = 0;
                  rowStart < deals.length;
                  rowStart += gridColumnsFor(context)) ...[
                if (rowStart > 0)
                  SizedBox(height: AppSpacing.sameGroupItemSpacing.h),
                Row(
                  children: [
                    for (int i = 0; i < gridColumnsFor(context); i++) ...[
                      if (i > 0)
                        SizedBox(width: AppSpacing.sameGroupItemSpacing.w),
                      Expanded(
                        child: (rowStart + i < deals.length)
                            ? AspectRatio(
                                aspectRatio: 0.92,
                                child: _DealCard(
                                  deal: deals[rowStart + i],
                                  onTap: () =>
                                      onDealTap?.call(deals[rowStart + i]),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _DealCard extends StatelessWidget {
  final SliderEntity deal;
  final VoidCallback? onTap;

  const _DealCard({required this.deal, this.onTap});

  @override
  Widget build(BuildContext context) {
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final imageCacheWidth =
        ((screenWidth - 82) / 2 * devicePixelRatio).round();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppRadius.buttonRadius,
          border: Border.all(
            color: AppColors.border,
            width: 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.navy.withValues(alpha: 0.03),
              blurRadius: 4.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppRadius.button - 1),
                ),
                child: AppImage(
                  imageUrl: deal.mobileImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  cacheWidth: imageCacheWidth,
                  placeholder: Container(
                    color: AppColors.pageBg,
                    child: const AppLoader.inline(),
                  ),
                  errorWidget: Container(
                    color: AppColors.pageBg,
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: AppColors.muted,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Container(
              height: 44.h,
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(AppRadius.button - 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    deal.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppTypography.titleSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
