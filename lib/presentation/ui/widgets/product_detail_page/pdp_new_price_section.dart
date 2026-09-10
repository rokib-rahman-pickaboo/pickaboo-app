// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/rating_stars.dart';

/// 💎 REDESIGNED PDP PRODUCT HEADER & UNIFIED PRICING / VALUE CARD
/// Groups Price, Rating, Express Delivery, Savings, Warranty, and EMI into
/// a modern, cohesive card container matching the PDP design language.
class PdpNewPriceSection extends StatelessWidget {
  final ProductDetailEntity product;
  final int currentPrice;
  final int originalPrice;
  final int saving;
  final VoidCallback? onBrandTap;
  final VoidCallback? onRateTap;
  final VoidCallback? onEmiTap;
  final VoidCallback? onExpressDeliveryTap;

  const PdpNewPriceSection({
    super.key,
    required this.product,
    required this.currentPrice,
    required this.originalPrice,
    required this.saving,
    this.onBrandTap,
    this.onRateTap,
    this.onEmiTap,
    this.onExpressDeliveryTap,
  });

  static final RegExp _thousandsSeparator = RegExp(
    r'(\d{1,3})(?=(\d{3})+(?!\d))',
  );

  static String formatPrice(num price) {
    return '৳${price.round().toString().replaceAllMapped(_thousandsSeparator, (Match m) => '${m[1]},')}';
  }

  @override
  Widget build(BuildContext context) {
    final hasDiscount = originalPrice > currentPrice;
    final int discountPct = hasDiscount
        ? (((originalPrice - currentPrice) / originalPrice) * 100).round()
        : product.discount;

    final bool hasReviews = product.reviewsCount > 0 && product.ratingSummaryValue > 0;
    final bool hasWarranty = product.warranty.trim().isNotEmpty;
    final bool hasExpress = product.expressDelivery == 1;
    final bool hasEmi = product.emi > 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── 1. Brand Name (Clickable) ──
        if (product.brand.trim().isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.only(top: 2.h, bottom: 6.h),
            child: GestureDetector(
              onTap: onBrandTap,
              child: Text(
                product.brand.toUpperCase(),
                style: AppTypography.brandTag,
              ),
            ),
          ),
        ],

        // ── 2. Product Title + In-Stock Badge ──
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${product.name}  ',
                style: AppTypography.mainHeaderTitle,
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Container(
                  padding: AppSpacing.badgePadding,
                  decoration: BoxDecoration(
                    color: product.stockAvailable
                        ? AppColors.greenBg
                        : AppColors.redBg,
                    borderRadius: BorderRadius.circular(AppRadius.badge),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        product.stockAvailable
                            ? Icons.check_circle_rounded
                            : Icons.cancel_rounded,
                        size: 11.sp,
                        color: product.stockAvailable
                            ? AppColors.green
                            : AppColors.red,
                      ),
                      const SizedBox(width: AppSpacing.sameGroupItemSpacing / 2),
                      Text(
                        product.stockAvailable ? 'In Stock' : 'Stock Out',
                        style: product.stockAvailable
                            ? AppTypography.badgeInStock
                            : AppTypography.badgeStockOut,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // ── 3. Unified Price, Rating, Express, Savings & Warranty Card ──
        if (product.stockAvailable) ...[
          SizedBox(height: 8.h),
          Builder(
            builder: (context) {
              // Row 1 Right: Express takes priority, otherwise Rating
              Widget? row1RightWidget;
              if (hasExpress) {
                row1RightWidget = GestureDetector(
                  onTap: onExpressDeliveryTap,
                  child: SvgPicture.asset(
                    'assets/new/svg/express_icon_pdp.svg',
                    width: 67.2.w,
                    height: 14.4.h,
                    fit: BoxFit.contain,
                  ),
                );
              } else if (hasReviews) {
                row1RightWidget = GestureDetector(
                  onTap: onRateTap,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RatingStars(
                        rating: product.ratingSummaryValue,
                        size: 11.sp,
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        '${product.ratingSummaryValue.toStringAsFixed(1)} ',
                        style: AppTypography.bodyLarge.bold(),
                      ),
                      Text(
                        '(${product.reviewsCount})',
                        style: AppTypography.bodyMuted,
                      ),
                    ],
                  ),
                );
              }

              // Row 2 Widgets (Save & Rating):
              Widget? row2LeftWidget;
              Widget? row2RightWidget;

              if (saving > 0) {
                row2LeftWidget = Text(
                  'You save ${formatPrice(saving)} today',
                  style: AppTypography.savingsText,
                );
              }

              // If rating exists and was not consumed in Row 1 (because Express was in Row 1):
              if (hasReviews && hasExpress) {
                final ratingWidget = GestureDetector(
                  onTap: onRateTap,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RatingStars(
                        rating: product.ratingSummaryValue,
                        size: 11.sp,
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        '${product.ratingSummaryValue.toStringAsFixed(1)} ',
                        style: AppTypography.bodyLarge.bold(),
                      ),
                      Text(
                        '(${product.reviewsCount})',
                        style: AppTypography.bodyMuted,
                      ),
                    ],
                  ),
                );

                if (row2LeftWidget != null) {
                  row2RightWidget = ratingWidget;
                } else {
                  row2LeftWidget = ratingWidget;
                }
              }

              return Container(
                decoration: BoxDecoration(
                  color: AppColors.pageBg,
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  border: Border.all(color: AppColors.border, width: 1.w),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ── Row 1: Price (- Regular & Discount) + Express or Rating ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  formatPrice(currentPrice),
                                  style: AppTypography.priceLarge,
                                ),
                                if (hasDiscount) ...[
                                  AppSpacing.sameGroupWidthGap,
                                  Text(
                                    formatPrice(originalPrice),
                                    style: AppTypography.priceStrikethrough,
                                  ),
                                  AppSpacing.sameGroupWidthGap,
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                      vertical: 2.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.red,
                                      borderRadius: BorderRadius.circular(AppRadius.badge),
                                    ),
                                    child: Text(
                                      '-$discountPct%',
                                      style: AppTypography.badgeDiscount,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                        if (row1RightWidget != null) ...[
                          SizedBox(width: 8.w),
                          row1RightWidget,
                        ],
                      ],
                    ),

                    // ── Row 2: Save amount / Rating ──
                    if (row2LeftWidget != null) ...[
                      SizedBox(height: 4.h),
                      if (row2RightWidget != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            row2LeftWidget,
                            row2RightWidget,
                          ],
                        )
                      else
                        row2LeftWidget,
                    ],

                    // ── Warranty Row (Bold label, regular value) ──
                    if (hasWarranty) ...[
                      Padding(
                        padding: EdgeInsets.only(top: 6.h, bottom: 4.h),
                        child: Divider(
                          height: 1.h,
                          thickness: 0.8.h,
                          color: AppColors.border,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Warranty: ',
                              style: AppTypography.cardTitleBold
                                  .extraBold()
                                  .withColor(AppColors.navy),
                            ),
                            TextSpan(
                              text: product.warranty.trim(),
                              style: AppTypography.cardTitle
                                  .withColor(AppColors.navy),
                            ),
                          ],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],

                    // ── EMI Row (Inside unified card) ──
                    if (hasEmi) ...[
                      Padding(
                        padding: EdgeInsets.only(top: 6.h, bottom: 4.h),
                        child: Divider(
                          height: 1.h,
                          thickness: 0.8.h,
                          color: AppColors.border,
                        ),
                      ),
                      GestureDetector(
                        onTap: onEmiTap,
                        child: Row(
                          children: [
                            Icon(
                              Icons.credit_card_outlined,
                              size: 15.sp,
                              color: AppColors.pickabooBlue,
                            ),
                            SizedBox(width: 6.w),
                            Expanded(
                              child: Text(
                                "EMI's From: ৳${product.emi % 1 == 0 ? product.emi.toInt() : product.emi} / month",
                                style: AppTypography.cardTitle,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              size: 16.sp,
                              color: AppColors.navy,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
        ],
      ],
    );
  }
}
