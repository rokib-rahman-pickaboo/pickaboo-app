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
import 'package:pickaboo/core/utils/delivery_time_utils.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/ui/widgets/common/rating_stars.dart';

/// 💎 REDESIGNED PDP PRODUCT HEADER & UNIFIED PRICING / VALUE CARD
/// Groups Price, Rating, Express Delivery, Savings, Warranty, and EMI into
/// a modern, cohesive card container matching the PDP design language.
class PdpNewPriceSection extends StatelessWidget {
  final ProductDetailEntity product;
  final int currentPrice;
  final int originalPrice;
  final int saving;
  final bool showTrustRibbon;
  final VoidCallback? onBrandTap;
  final VoidCallback? onRateTap;
  final VoidCallback? onEmiTap;
  final VoidCallback? onExpressDeliveryTap;
  final VoidCallback? onSellerTap;

  const PdpNewPriceSection({
    super.key,
    required this.product,
    required this.currentPrice,
    required this.originalPrice,
    required this.saving,
    this.showTrustRibbon = false,
    this.onBrandTap,
    this.onRateTap,
    this.onEmiTap,
    this.onExpressDeliveryTap,
    this.onSellerTap,
  });

  static final RegExp _thousandsSeparator = RegExp(
    r'(\d{1,3})(?=(\d{3})+(?!\d))',
  );

  static String formatPrice(num price) {
    return '৳${price.round().toString().replaceAllMapped(_thousandsSeparator, (Match m) => '${m[1]},')}';
  }

  static String _formatEmiPrice(num price) {
    final isWhole = price % 1 == 0;
    final formatted = isWhole
        ? price.toInt().toString().replaceAllMapped(_thousandsSeparator, (Match m) => '${m[1]},')
        : price.toStringAsFixed(2).replaceAllMapped(_thousandsSeparator, (Match m) => '${m[1]},');
    return '৳$formatted';
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
        // ── 1. Brand Name (Left) & Sold By (Right) Row ──
        if (product.brand.trim().isNotEmpty || product.soldBy.trim().isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.only(top: 2.h, bottom: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (product.brand.trim().isNotEmpty)
                  Flexible(
                    child: GestureDetector(
                      onTap: onBrandTap,
                      child: Text(
                        product.brand.toUpperCase(),
                        style: AppTypography.brandTag,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                else
                  const SizedBox.shrink(),
                if (product.soldBy.trim().isNotEmpty) ...[
                  SizedBox(width: 8.w),
                  Flexible(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: onSellerTap ??
                          () {
                            final shopUrl = product.soldByVendorUrlKey.trim().isNotEmpty
                                ? product.soldByVendorUrlKey.trim()
                                : product.soldBy.trim();
                            if (shopUrl.isNotEmpty) {
                              context.pushToSellerProduct(
                                shopUrl: shopUrl,
                                sellerName: product.soldBy.trim(),
                              );
                            }
                          },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Sold by ',
                              style: AppTypography.bodySmall,
                            ),
                            TextSpan(
                              text: product.soldBy.trim(),
                              style: AppTypography.bodySmall.bold().blue,
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],

        // ── 2. Product Title + In-Stock Badge ──
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${product.name}  ',
                style: AppTypography.titleLarge,
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
                            ? AppTypography.bodyTiny.extraBold().green
                            : AppTypography.bodyTiny.extraBold().red,
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
                    AppAssets.expressPdp,
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
                        style: AppTypography.bodySmall,
                      ),
                    ],
                  ),
                );
              }

              // Row 2 Widgets (Save & Rating):
              Widget? row2LeftWidget;
              Widget? row2RightWidget;

              // Temporarily commented out as requested: "You save X amount today"
              // if (saving > 0) {
              //   row2LeftWidget = Text(
              //     'You save ${formatPrice(saving)} today',
              //     style: AppTypography.savingsText,
              //   );
              // }

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
                        style: AppTypography.bodySmall,
                      ),
                    ],
                  ),
                );

                // Rating stays on the right (under express in Row 1):
                // If saving is re-enabled in future, saving sits on left (row2LeftWidget) and rating on right (row2RightWidget)
                row2RightWidget = ratingWidget;
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
                                    style: AppTypography.priceStrike,
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
                                      style: AppTypography.bodyLarge.extraBold().white,
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

                    // ── Row 2: Save amount (left) / Rating (right under express) ──
                    // ignore: unnecessary_null_comparison
                    if (row2LeftWidget != null || row2RightWidget != null) ...[
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          row2LeftWidget ?? const SizedBox.shrink(),
                          if (row2RightWidget != null) row2RightWidget,
                        ],
                      ),
                    ],

                    // ── Shop With Confidence (Warranty & Trust Section) ──
                    if (showTrustRibbon) ...[
                      // When trust ribbon is true:
                      // If warranty exists, show only the warranty box (no 3-item row, no extra header).
                      if (hasWarranty) ...[
                        Padding(
                          padding: EdgeInsets.only(top: 8.h, bottom: 6.h),
                          child: Divider(
                            height: 1.h,
                            thickness: 0.8.h,
                            color: AppColors.border,
                          ),
                        ),
                        _buildWarrantyBox(product.warranty),
                      ],
                    ] else ...[
                      // When trust ribbon is false:
                      // Show "Shop with confidence" + warranty (if present) + 3-item trust row
                      Padding(
                        padding: EdgeInsets.only(top: 8.h, bottom: 6.h),
                        child: Divider(
                          height: 1.h,
                          thickness: 0.8.h,
                          color: AppColors.border,
                        ),
                      ),
                      Text(
                        'Shop with confidence',
                        style: AppTypography.titleSmall,
                      ),
                      if (hasWarranty) ...[
                        SizedBox(height: 8.h),
                        _buildWarrantyBox(product.warranty),
                      ],
                      SizedBox(height: 10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Col 1: 100% Authentic (decreased by ~20% from 22 to 17.5)
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 26.h,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    AppAssets.authentic,
                                    width: 16.w,
                                    height: 17.5.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  '100% Authentic',
                                  textAlign: TextAlign.center,
                                  style: AppTypography.bodyTiny.bold().navy,
                                ),
                              ],
                            ),
                          ),
                          // Col 2: Dynamic Delivery Info (increased to match visual presence)
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 26.h,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    AppAssets.fastDelivery,
                                    width: 34.w,
                                    height: 26.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  DeliveryTimeUtils.getDeliveryTag(
                                    isExpress: hasExpress,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: AppTypography.bodyTiny.bold().navy,
                                ),
                              ],
                            ),
                          ),
                          // Col 3: Easy Return (decreased by ~20% from 22 to 17.5)
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 26.h,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    AppAssets.easyReturn,
                                    width: 16.w,
                                    height: 16.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  'Easy Return',
                                  textAlign: TextAlign.center,
                                  style: AppTypography.bodyTiny.bold().navy,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],

                    // ── EMI Row (Inside unified card) ──
                    if (hasEmi) ...[
                      Padding(
                        padding: EdgeInsets.only(top: 8.h, bottom: 6.h),
                        child: Divider(
                          height: 1.h,
                          thickness: 0.8.h,
                          color: AppColors.border,
                        ),
                      ),
                      GestureDetector(
                        onTap: onEmiTap,
                        behavior: HitTestBehavior.opaque,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppAssets.pdpEmi,
                              width: 22.w,
                              height: 18.h,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "EMI available from ${_formatEmiPrice(product.emi)}/month",
                                    style: AppTypography.titleSmall,
                                  ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    'Compare 36 banks & tenures',
                                    style: AppTypography.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              size: 18.sp,
                              color: AppColors.pickabooBlue,
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

  Widget _buildWarrantyBox(String warranty) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceBlue,
        borderRadius: BorderRadius.circular(AppRadius.badge),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.warrantySvg,
            width: 18.w,
            height: 18.h,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Warranty: ',
                    style: AppTypography.titleSmall.extraBold(),
                  ),
                  TextSpan(
                    text: warranty.trim(),
                    style: AppTypography.titleSmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
