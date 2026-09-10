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
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/common/rating_stars.dart';

/// ─────────────────────────────────────────────────────────────
/// 📋 LIST VIEW PRODUCT CARD (Matching Pickaboo-App-UI Design)
/// Horizontal layout representation for product catalog list view:
/// - Left: Full-bleed square image fitting the full height of the card
/// - Right: Brand Name (Left) & Express Tag (Right), Title, Rating, Price
/// ─────────────────────────────────────────────────────────────
class ListProductView extends StatelessWidget {
  final ProductEntity product;
  final Function(ProductEntity) onTap;
  final VoidCallback? onAddToCart;

  const ListProductView({
    super.key,
    required this.product,
    required this.onTap,
    this.onAddToCart,
  });

  static final RegExp _thousandsSeparator = RegExp(
    r'(\d{1,3})(?=(\d{3})+(?!\d))',
  );

  String _formatPrice(num price) {
    return price.round().toString().replaceAllMapped(
      _thousandsSeparator,
      (Match m) => '${m[1]},',
    );
  }

  @override
  Widget build(BuildContext context) {
    final int discount = product.computedDiscountPercentage;
    final bool hasDiscount =
        discount > 0 && product.originalPrice > product.finalPrice;
    final String brandText = product.brand;
    final displayAttributes = () {
      final uniqueLabels = <String>{};
      return product.attributes
          .where((attr) =>
              attr.label.trim().isNotEmpty &&
              attr.value.trim().isNotEmpty &&
              uniqueLabels.add(attr.label.trim()))
          .toList();
    }();
    final bool hasAttributes = displayAttributes.isNotEmpty;

    return GestureDetector(
      onTap: () => onTap.call(product),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppSpacing.sameGroupItemSpacing.w,
          vertical: 4.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppRadius.cardRadius,
          border: Border.all(
            color: AppColors.border,
            width: 1.2.w,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.navy.withValues(alpha: 0.02),
              blurRadius: 4.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Left Square Image (Full bleed, fit to full card height) ──
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(AppRadius.card - 1),
                    bottomLeft: Radius.circular(
                      hasAttributes ? 0 : (AppRadius.card - 1),
                    ),
                  ),
                  child: SizedBox(
                    width: 115.w,
                    height: 115.w,
                    child: Container(
                      color: AppColors.pageBg,
                      child: AppImage(
                        imageUrl: product.productImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // ── Right Product Details ──
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.w, 8.h, 10.w, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Top Row: Brand Name (Left) & Express Tag (Right)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (brandText.isNotEmpty)
                              Expanded(
                                child: Text(
                                  brandText.toUpperCase(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTypography.brandActionText,
                                ),
                              )
                            else
                              const Spacer(),
                            if (product.expressDelivery) ...[
                              SizedBox(width: 4.w),
                              SvgPicture.asset(
                                'assets/new/svg/express_icon.svg',
                                width: 72.w,
                                height: 24.h,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ],
                        ),
                        SizedBox(height: 2.h),

                        // Product Title
                        Text(
                          product.productName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.cardTitle,
                        ),

                        SizedBox(height: 4.h),

                        // Rating Bar & Review Count (Left) + Sponsored Tag (Right)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RatingStars(rating: product.rating, size: 10.sp),
                            SizedBox(width: 3.w),
                            Text(
                              '(${product.ratingCount})',
                              style: AppTypography.bodyTiny,
                            ),
                            if (product.isAd) ...[
                              const Spacer(),
                              Text(
                                'Sponsored',
                                style: AppTypography.sponsoredLabel,
                              ),
                            ],
                          ],
                        ),

                        SizedBox(height: 3.h),

                        // Price Row
                        if (product.stockAvailable)
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '৳${_formatPrice(product.finalPrice)}',
                                  style: AppTypography.priceStandard,
                                ),
                                if (hasDiscount) ...[
                                  SizedBox(width: 4.w),
                                  Text(
                                    '৳${_formatPrice(product.originalPrice)}',
                                    style: AppTypography.priceStrikethrough,
                                  ),
                                  SizedBox(width: 4.w),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5.w,
                                      vertical: 2.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.redBg,
                                      borderRadius: BorderRadius.circular(3.r),
                                    ),
                                    child: Text(
                                      '-$discount%',
                                      style: AppTypography.badgeDiscountItem,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          )
                        else
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 1.5.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.redBg,
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                            child: Text(
                              'Out of Stock',
                              style: AppTypography.badgeStockOut,
                            ),
                          ),

                        if (product.stockAvailable) ...[
                          // Delivery Info (Green truck icon + light "Delivery by " + bold date)
                          Padding(
                            padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.local_shipping_outlined,
                                  size: 11.5.sp,
                                  color: AppColors.green,
                                ),
                                SizedBox(width: 3.5.w),
                                Expanded(
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: product.deliveryLabelText,
                                          style: AppTypography.deliveryByLabel,
                                        ),
                                        TextSpan(
                                          text: product.deliveryTargetText,
                                          style: AppTypography.deliveryByDate,
                                        ),
                                      ],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ] else ...[
                          SizedBox(height: 8.h),
                        ],
                      ],
                    ),
                  ),
                ),

                // Optional Add to Cart Button
                if (onAddToCart != null)
                  IconButton(
                    onPressed: onAddToCart,
                    icon: Icon(
                      Icons.add_shopping_cart_rounded,
                      color: AppColors.pickabooBlue,
                      size: 20.sp,
                    ),
                  ),
              ],
            ),

            // ── Product Attributes / Specification Chips ──
            if (hasAttributes) ...[
              Divider(
                height: 1.h,
                thickness: 0.8.h,
                color: AppColors.border,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.w, 6.h, 10.w, 8.h),
                child: SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 6.w,
                    runSpacing: 6.h,
                    children: displayAttributes
                        .map(
                          (attr) => _buildSpecTag(
                            attr.label.trim(),
                            attr.value.trim(),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSpecTag(
    String label,
    String value,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.border.withValues(alpha: 0.8),
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(3.r),
      ),
      child: Text.rich(
        TextSpan(
          style: AppTypography.bodyTiny.withColor(AppColors.muted),
          children: [
            TextSpan(
              text: '$label : ',
              style: AppTypography.bodyTiny.semiBold().withColor(AppColors.navy),
            ),
            TextSpan(
              text: value,
            ),
          ],
        ),
      ),
    );
  }
}
