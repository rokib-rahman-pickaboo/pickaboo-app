import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// Reusable skeleton widget that mimics [PdpReviewTile] cards while reviews load.
class PdpReviewSkeletonWidget extends StatelessWidget {
  final int itemCount;

  const PdpReviewSkeletonWidget({
    super.key,
    this.itemCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      key: const ValueKey('pdp_reviews_list_skeleton'),
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: Column(
        children: List.generate(
          itemCount,
          (index) => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.sameGroupItemSpacing.w,
            ),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: AppSpacing.sameGroupItemSpacing.h),
              padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
              decoration: AppDecorations.cardBoxDecoration(
                borderRadius: AppRadius.k8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Top row: Avatar + Name/Date + Rating Badge
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 36.r,
                        height: 36.r,
                        decoration: BoxDecoration(
                          color: AppColors.skeletonBase,
                          shape: BoxShape.circle,
                        ),
                      ),
                      AppSpacing.sameGroupWidthGap,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 110.w,
                              height: 14.h,
                              decoration: BoxDecoration(
                                color: AppColors.skeletonBase,
                                borderRadius: AppRadius.k8,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Container(
                              width: 80.w,
                              height: 10.h,
                              decoration: BoxDecoration(
                                color: AppColors.skeletonBase,
                                borderRadius: AppRadius.k8,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 46.w,
                        height: 22.h,
                        decoration: BoxDecoration(
                          color: AppColors.skeletonBase,
                          borderRadius: AppRadius.k8,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),

                  // 2. Review title
                  Container(
                    width: 160.w,
                    height: 13.h,
                    decoration: BoxDecoration(
                      color: AppColors.skeletonBase,
                      borderRadius: AppRadius.k8,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // 3. Review text lines
                  Container(
                    width: double.infinity,
                    height: 11.h,
                    decoration: BoxDecoration(
                      color: AppColors.skeletonBase,
                      borderRadius: AppRadius.k8,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    width: 220.w,
                    height: 11.h,
                    decoration: BoxDecoration(
                      color: AppColors.skeletonBase,
                      borderRadius: AppRadius.k8,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  // 4. Action buttons placeholder
                  Row(
                    children: [
                      Container(
                        width: 52.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: AppColors.skeletonBase,
                          borderRadius: AppRadius.k8,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 52.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: AppColors.skeletonBase,
                          borderRadius: AppRadius.k8,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
