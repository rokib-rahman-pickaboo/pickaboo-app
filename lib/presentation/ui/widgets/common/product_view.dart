import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/product_card_image.dart';
import 'package:pickaboo/core/utils/product_image_resolver.dart';
import 'package:pickaboo/presentation/ui/widgets/common/rating_stars.dart';

/// ─────────────────────────────────────────────────────────────
/// 🛍️ PRODUCT CARD WIDGET (Matching Pickaboo-App-UI Design)
///
/// Layout:
///   1. Top 1:1 Aspect Ratio Image with rounded top corners + Optional Favorite Heart
///   2. Left-aligned Product Details:
///      - Top Row: BRAND NAME (Left) & Express Tag (Right)
///      - Product Title (Max 2 lines, Navy)
///      - Rating Stars (Amber) + (Review Count) / Sold count
///      - Price Row: ৳Current  ৳Original(strike)  [-Discount%]
/// ─────────────────────────────────────────────────────────────
class ProductView extends StatelessWidget {
  final ProductEntity product;
  final Function(ProductEntity) onTap;
  final VoidCallback? onFavoriteTap;
  final bool isFavorite;

  const ProductView({
    super.key,
    required this.product,
    required this.onTap,
    this.onFavoriteTap,
    this.isFavorite = false,
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

  static final Map<String, bool> _singleLineCache = <String, bool>{};

  static bool _isSingleLineTitle(
    String text,
    TextStyle style,
    double maxWidth,
    TextScaler textScaler,
  ) {
    if (text.isEmpty || maxWidth <= 0 || maxWidth.isInfinite) return true;
    final key = '$text|${maxWidth.toInt()}|${textScaler.scale(1.0)}';
    final cached = _singleLineCache[key];
    if (cached != null) return cached;

    if (_singleLineCache.length > 500) {
      _singleLineCache.clear();
    }

    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 2,
      textDirection: TextDirection.ltr,
      textScaler: textScaler,
    )..layout(maxWidth: maxWidth);
    final result = textPainter.computeLineMetrics().length <= 1;
    _singleLineCache[key] = result;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final intId = int.tryParse(product.id);
    if (intId != null && product.productImg.isNotEmpty) {
      ProductImageResolver.cacheImage(intId, product.productImg);
    }

    final int discount = product.computedDiscountPercentage;
    final bool hasDiscount =
        discount > 0 && product.originalPrice > product.finalPrice;
    final String brandText = product.brand;
    final double devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final int imageCacheWidth =
        ((screenWidth / 2) * devicePixelRatio).round().clamp(240, 360);

    final double approxCardWidth =
        (screenWidth - 3 * AppSpacing.sameGroupItemSpacing.w) / 2;
    final double availableTitleWidth =
        (approxCardWidth - 16.w).clamp(120.0, 500.0);
    final TextScaler textScaler = MediaQuery.textScalerOf(context);
    final double textScale = textScaler.scale(1.0);
    final bool isSingleLine = _isSingleLineTitle(
      product.productName,
      AppTypography.titleMicro,
      availableTitleWidth,
      textScaler,
    );

    final double titleTwoLineHeight = (34.0.h * textScale).clamp(32.0, 44.0);
    final double titleSingleLineHeight = titleTwoLineHeight / 2;

    return GestureDetector(
        onTap: () {
          final intId = int.tryParse(product.id) ?? 0;
          final cachedImg = ProductImageResolver.getCachedImage(intId);
          final effectiveProduct = (cachedImg != null && !ProductImageResolver.isPlaceholderOrBroken(cachedImg))
              ? product.copyWith(productImg: cachedImg)
              : product;
          onTap.call(effectiveProduct);
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: AppRadius.cardRadius,
            border: Border.all(
              color: AppColors.border,
              width: 1.2.w,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.navy.withValues(alpha: 0.03),
                blurRadius: 6.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ── 1. Top 1:1 Image Container (Clean image with optional favorite button only) ──
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: AppRadius.cardTop,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        color: AppColors.pageBg,
                        child: ProductCardImage(
                          productId: int.tryParse(product.id) ?? 0,
                          imageUrl: product.productImg,
                          fit: BoxFit.cover,
                          cacheWidth: imageCacheWidth,
                        ),
                      ),
                    ),
                  ),

                  // Top-Right Favorite Heart Button
                  if (onFavoriteTap != null)
                    Positioned(
                      top: 4.h,
                      right: 4.w,
                      child: GestureDetector(
                        onTap: onFavoriteTap,
                        child: Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: AppColors.white.withValues(alpha: 0.85),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color:
                                isFavorite ? AppColors.red : AppColors.muted,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              // ── 2. Product Info Details Container ──
              // ============================================================================
              // ⚠️ MANDATORY CARD HEIGHT INVARIANT — MUST BE PRESERVED ACROSS ALL STATES
              //
              // Every product card MUST render with the EXACT same total height regardless
              // of which of the 4 design states it is in:
              //
              // 1. [2-line name, in stock]:
              //    1x1 Image -> Brand & Express -> Title (2 lines) -> Rating -> Price
              //    -> Divider -> Delivery Info
              //
              // 2. [1-line name, in stock]:
              //    1x1 Image -> Brand & Express -> Title (1 line) -> Rating -> Price
              //    -> Empty Space (compensates for missing line 2) -> Divider -> Delivery Info
              //
              // 3. [2-line name, out of stock]:
              //    1x1 Image -> Brand & Express -> Title (2 lines) -> Rating -> Out of Stock Tag
              //    -> Empty Space (compensates for Divider) -> Empty Space (compensates for Delivery Info)
              //
              // 4. [1-line name, out of stock]:
              //    1x1 Image -> Brand & Express -> Title (1 line) -> Rating -> Out of Stock Tag
              //    -> Empty Space (compensates for missing line 2)
              //    -> Empty Space (compensates for Divider) -> Empty Space (compensates for Delivery Info)
              // ============================================================================
              Padding(
                padding: EdgeInsets.fromLTRB(8.w, 6.h, 8.w, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Brand Name (Left) & Express Tag (Right)
                      SizedBox(
                        width: double.infinity,
                        height: 24.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (brandText.isNotEmpty)
                              Expanded(
                                child: Text(
                                  brandText.toUpperCase(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTypography.brandTag,
                                ),
                              )
                            else
                              const Spacer(),
                            if (product.expressDelivery) ...[
                              SizedBox(width: 4.w),
                              SvgPicture.asset(
                                AppAssets.express,
                                width: 72.w,
                                height: 24.h,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h),

                      // Product Title: 1 line or 2 lines
                      SizedBox(
                        width: double.infinity,
                        height: isSingleLine ? titleSingleLineHeight : titleTwoLineHeight,
                        child: Text(
                          product.productName,
                          maxLines: isSingleLine ? 1 : 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.titleMicro.copyWith(
                            height: 1.2,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h),

                      // Rating Bar & Review Count
                      SizedBox(
                        width: double.infinity,
                        height: 14.h,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RatingStars(rating: product.rating, size: 10.sp),
                              SizedBox(width: 3.w),
                              Text(
                                '(${product.ratingCount})',
                                style: AppTypography.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h),

                      // Price Row:
                      // In Stock: Price + Strikethrough + Discount Badge
                      // Out of Stock: Price + Out of Stock Tag
                      SizedBox(
                        width: double.infinity,
                        height: 20.h,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: product.stockAvailable
                              ? (product.finalPrice > 0
                                  ? Row(
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
                                            style: AppTypography.priceStrike,
                                          ),
                                          SizedBox(width: 4.w),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 5.w,
                                              vertical: 2.h,
                                            ),
                                            decoration: const BoxDecoration(
                                              color: AppColors.redBg,
                                              borderRadius: AppRadius.badgeRadius,
                                            ),
                                            child: Text(
                                              AppStrings.discountTag(discount),
                                              style: AppTypography.bodyMedium.extraBold().red,
                                            ),
                                          ),
                                        ],
                                      ],
                                    )
                                  : Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6.w,
                                        vertical: 2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary.withValues(alpha: 0.08),
                                        borderRadius: AppRadius.badgeRadius,
                                      ),
                                      child: Text(
                                        AppStrings.viewPrice,
                                        style: AppTypography.brandTag.copyWith(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ))
                              : Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.w,
                                    vertical: 1.5.h,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: AppColors.redBg,
                                    borderRadius: AppRadius.badgeRadius,
                                  ),
                                  child: Text(
                                    AppStrings.outOfStock,
                                    style: AppTypography.bodyTiny.extraBold().red,
                                  ),
                                ),
                        ),
                      ),

                      // Empty space for adjusting same height with 2-line named product
                      // If title is 1 line, empty space sits after price
                      // so rating and price stay naturally under the title
                      if (isSingleLine)
                        SizedBox(height: titleSingleLineHeight),

                      SizedBox(height: 5.h),

                      // Divider (or empty space when out of stock)
                      product.stockAvailable
                          ? Divider(
                              height: 1.h,
                              thickness: 0.8.h,
                              color: AppColors.border,
                            )
                          : SizedBox(height: 1.h),

                      // Delivery Info (or empty space when out of stock)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.5.h),
                        child: SizedBox(
                          width: double.infinity,
                          height: 14.h,
                          child: product.stockAvailable
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.fastDelivery,
                                      width: 14.w,
                                      height: 12.h,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(width: 4.w),
                                    Expanded(
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: product.deliveryLabelText,
                                              style: AppTypography.bodyTiny,
                                            ),
                                            TextSpan(
                                              text: product.deliveryTargetText,
                                              style: AppTypography.bodyTiny.bold().navy,
                                            ),
                                          ],
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ),
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
