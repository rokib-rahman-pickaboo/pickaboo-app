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

/// 3. PRODUCT TITLE, STOCK STATUS, PRICE, DISCOUNT & EMI SECTION
class PdpHeaderPriceSection extends StatelessWidget {
  final ProductDetailEntity product;
  final int currentPrice;
  final int originalPrice;
  final int saving;
  final VoidCallback? onBrandTap;
  final VoidCallback? onRateTap;
  final VoidCallback? onEmiTap;
  final VoidCallback? onExpressDeliveryTap;

  const PdpHeaderPriceSection({
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
    final bool hasEmi = product.emi > 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Brand Name (Clickable) ──
        if (product.brand.trim().isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.only(top: 4.h, bottom: 6.h),
            child: GestureDetector(
              onTap: onBrandTap,
              child: Text(
                product.brand.toUpperCase(),
                style: AppTypography.brandTag,
              ),
            ),
          ),
        ],

        // ── Product Title + In-Stock Badge ──
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

        // ── Rating Stars & Reviews Count (Only displayed when reviews exist) ──
        if (hasReviews) ...[
          AppSpacing.sameGroupHeightGap,
          GestureDetector(
            onTap: onRateTap,
            child: Row(
              children: [
                RatingStars(rating: product.ratingSummaryValue, size: 12.sp),
                const SizedBox(width: AppSpacing.sameGroupItemSpacing / 2),
                Text(
                  '${product.ratingSummaryValue.toStringAsFixed(1)} ',
                  style: AppTypography.bodyLarge,
                ),
                Text(
                  '(${product.reviewsCount} reviews)',
                  style: AppTypography.bodyMuted,
                ),
              ],
            ),
          ),
        ],

        // ── Price Row, Savings & EMI (Hidden when out of stock) ──
        if (product.stockAvailable) ...[
          AppSpacing.sameGroupHeightGap,
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
                          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
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
              if (product.expressDelivery == 1) ...[
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: onExpressDeliveryTap,
                  child: SvgPicture.asset(
                    'assets/new/svg/express_icon_pdp.svg',
                    width: 72.w,
                    height: 16.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ],
          ),

          if (saving > 0) ...[
            SizedBox(height: 4.h),
            Text(
              'You save ${formatPrice(saving)} today',
              style: AppTypography.savingsText,
            ),
          ],

          // ── Official Warranty Info ──
          if (product.warranty.trim().isNotEmpty) ...[
            SizedBox(height: 6.h),
            Text(
              'Warranty: ${product.warranty.trim()}',
              style: AppTypography.bodyRegular
                  .extraBold()
                  .withColor(AppColors.navy),
            ),
          ],

          // ── EMI Banner Card ──
          if (hasEmi) ...[
            AppSpacing.sameGroupHeightGap,
            GestureDetector(
              onTap: onEmiTap,
              child: Container(
                padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
                decoration: BoxDecoration(
                  color: AppColors.pageBg,
                  borderRadius: BorderRadius.circular(AppRadius.button),
                  border: Border.all(color: AppColors.border, width: 1.w),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.credit_card_outlined,
                      size: 16.sp,
                      color: AppColors.pickabooBlue,
                    ),
                    AppSpacing.sameGroupWidthGap,
                    Expanded(
                      child: Text(
                        "EMI's From: ৳${product.emi} / month",
                        style: AppTypography.cardTitle,
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded, size: 18.sp, color: AppColors.navy),
                  ],
                ),
              ),
            ),
          ],
        ],
      ],
    );
  }
}
