import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';

/// 8. WHY SHOP ON PICKABOO (ASSURED GUARANTEE, EXPRESS DELIVERY & CLUB POINTS REWARDS)
class PdpPickabooAssuredCard extends StatelessWidget {
  final ProductDetailEntity product;
  final VoidCallback? onAssuredTap;
  final VoidCallback? onExpressDeliveryTap;
  final VoidCallback? onClubPointsTap;

  const PdpPickabooAssuredCard({
    super.key,
    required this.product,
    this.onAssuredTap,
    this.onExpressDeliveryTap,
    this.onClubPointsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Why Shop on Pickaboo',
          style: AppTypography.sectionTitle,
        ),
        AppSpacing.sameGroupHeightGap,
        Container(
          padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
          decoration: BoxDecoration(
            color: AppColors.pageBg,
            borderRadius: BorderRadius.circular(AppRadius.card),
            border: Border.all(color: AppColors.border, width: 1.w),
          ),
          child: Column(
            children: [
              // ── 1. Pickaboo Assured Row (Tappable -> Opens Verified CMS Bottom Sheet) ──
              GestureDetector(
                onTap: onAssuredTap,
                behavior: HitTestBehavior.opaque,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w * 0.75),
                      decoration: const BoxDecoration(
                        color: AppColors.surfaceBlue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.verified_user_outlined,
                        color: AppColors.pickabooBlue,
                        size: 16.sp,
                      ),
                    ),
                    AppSpacing.sameGroupWidthGap,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                AppStrings.pdpPickabooAssured,
                                style: AppTypography.cardTitle,
                              ),
                              SizedBox(width: 4.w),
                              Icon(
                                Icons.chevron_right_rounded,
                                size: 16.sp,
                                color: AppColors.navy,
                              ),
                            ],
                          ),
                          SizedBox(height: AppSpacing.sameGroupItemSpacing.h * 0.25),
                          Text(
                            '100% Authentic, quality checked & securely packed',
                            style: AppTypography.bodyMuted,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ── 2. Sold By Merchant Row (Transferred from Trust Ribbon) ──
              if (product.soldBy.trim().isNotEmpty) ...[
                Divider(height: 20.h, thickness: 1.w, color: AppColors.border),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w * 0.75),
                      decoration: const BoxDecoration(
                        color: AppColors.surfaceBlue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.store_mall_directory_outlined,
                        color: AppColors.pickabooBlue,
                        size: 16.sp,
                      ),
                    ),
                    AppSpacing.sameGroupWidthGap,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sold by ${product.soldBy.trim()}',
                            style: AppTypography.cardTitle,
                          ),
                          SizedBox(height: AppSpacing.sameGroupItemSpacing.h * 0.25),
                          Text(
                            'Authorized & verified merchant on Pickaboo',
                            style: AppTypography.bodyMuted,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],

              // ── 3. Club Points Reward Banner ──
              if (product.clubPoints > 0) ...[
                SizedBox(height: 12.h),
                GestureDetector(
                  onTap: onClubPointsTap,
                  child: Container(
                    padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
                    decoration: BoxDecoration(
                      color: AppColors.greenBg,
                      borderRadius: BorderRadius.circular(AppRadius.button),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.stars_rounded, color: AppColors.green, size: 18.sp),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Earn ${product.clubPoints.toInt()} Club Points',
                                style: AppTypography.cardTitle.copyWith(
                                  color: AppColors.green,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                '≈ ৳${(product.clubPoints * 0.10).toStringAsFixed(2)} reward towards your next order',
                                style: AppTypography.bodyMuted.copyWith(
                                  color: AppColors.green,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
