import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/core/utils/product_image_resolver.dart';
import 'package:pickaboo/presentation/ui/widgets/common/product_card_image.dart';
import 'package:pickaboo/presentation/ui/widgets/common/rating_stars.dart';

/// ─────────────────────────────────────────────────────────────
/// 🎠 SLIDER PRODUCT VIEW (Matching Pickaboo-App-UI Design)
/// Proportional, compact product card for horizontal product rails.
/// ─────────────────────────────────────────────────────────────
class SliderProductView extends StatelessWidget {
  final ProductEntity product;
  final Function(ProductEntity) onTap;
  final double width;

  const SliderProductView({
    super.key,
    required this.product,
    required this.onTap,
    this.width = 147.0,
    bool isLast = false,
    bool isFirst = false,
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

  /// Dynamically computes the exact card height needed to cleanly display all
  /// card elements without clipping on any screen size or font scale.
  static double calculateCardHeight(BuildContext context, double cardWidth) {
    final double textScale = MediaQuery.textScalerOf(context).scale(1.0);
    final double actualCardWidth = cardWidth.w;
    final double imageHeight = actualCardWidth; // 1:1 AspectRatio

    final double cardPadTop = 6.0.h;
    const double cardPadBottom = 0.0;
    final double gapSmall = 2.0.h;
    final double gapMedium = 5.0.h;
    final double deliveryPaddingV = 5.5.h;

    final double brandHeight = 24.0.h;
    final double titleHeight = (38.0.h * textScale).clamp(34.0, 44.0);
    final double ratingHeight = 16.0.h;
    final double priceHeight = (24.0.h * textScale).clamp(20.0, 28.0);
    final double dividerHeight = 1.0.h;
    final double deliveryHeight = 14.0.h;

    final double bordersAndShadow = (2 * 1.w) + 6.0;

    return (imageHeight +
            cardPadTop +
            brandHeight +
            gapSmall +
            titleHeight +
            gapSmall +
            ratingHeight +
            gapSmall +
            priceHeight +
            gapMedium +
            dividerHeight +
            (deliveryPaddingV * 2) +
            deliveryHeight +
            cardPadBottom +
            bordersAndShadow)
        .ceilToDouble();
  }

  @override
  Widget build(BuildContext context) {
    final int discount = product.computedDiscountPercentage;
    final bool hasDiscount = discount > 0 && product.originalPrice > product.finalPrice;
    final String brandText = product.brand;
    final double devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final int imageCacheWidth =
        (width.w * devicePixelRatio).round().clamp(180, 300);
    final double availableTitleWidth = (width - 16).w;
    final TextScaler textScaler = MediaQuery.textScalerOf(context);
    final double textScale = textScaler.scale(1.0);
    final bool isSingleLine = _isSingleLineTitle(
      product.productName,
      AppTypography.titleMicro,
      availableTitleWidth,
      textScaler,
    );

    final double cardPadTop = 6.0.h;
    const double cardPadBottom = 0.0;
    final double gapSmall = 2.0.h;
    final double gapMedium = 5.0.h;
    final double deliveryPaddingV = 5.5.h;

    final double brandHeight = 24.0.h;
    final double titleTwoLineHeight = (38.0.h * textScale).clamp(34.0, 44.0);
    final double titleSingleLineHeight = titleTwoLineHeight / 2;
    final double ratingHeight = 16.0.h;
    final double priceHeight = (24.0.h * textScale).clamp(20.0, 28.0);
    final double dividerHeight = 1.0.h;
    final double deliveryHeight = 14.0.h;

    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          final intId = int.tryParse(product.id) ?? 0;
          final cachedImg = ProductImageResolver.getCachedImage(intId);
          final effectiveProduct = (cachedImg != null && !ProductImageResolver.isPlaceholderOrBroken(cachedImg))
              ? product.copyWith(productImg: cachedImg)
              : product;
          onTap.call(effectiveProduct);
        },
        child: Container(
          width: width.w,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: AppRadius.cardRadius,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── 1. Top 1:1 Image ──
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

              // ── 2. Details Container ──
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
                padding: EdgeInsets.fromLTRB(8.w, cardPadTop, 8.w, cardPadBottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Brand Name (Left) & Express Tag (Right)
                    SizedBox(
                      width: double.infinity,
                      height: brandHeight,
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
                              width: 66.w,
                              height: brandHeight,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ],
                      ),
                    ),
                    SizedBox(height: gapSmall),

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
                    SizedBox(height: gapSmall),

                    // Star Rating (Left) & Rating Count
                    SizedBox(
                      width: double.infinity,
                      height: ratingHeight,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RatingStars(
                              rating: product.rating,
                              size: 9.5.sp,
                            ),
                            if (product.ratingCount > 0) ...[
                              SizedBox(width: 3.w),
                              Text(
                                '(${product.ratingCount})',
                                style: AppTypography.bodySmall,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: gapSmall),

                    // Product Price (or Out of Stock Tag)
                    SizedBox(
                      width: double.infinity,
                      height: priceHeight,
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

                    SizedBox(height: gapMedium),

                    // Divider (or empty space when out of stock)
                    product.stockAvailable
                        ? SizedBox(
                            height: dividerHeight,
                            child: Divider(
                              height: dividerHeight,
                              thickness: 0.8.h,
                              color: AppColors.border,
                            ),
                          )
                        : SizedBox(height: dividerHeight),

                    // Delivery Info (or empty space when out of stock)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: deliveryPaddingV),
                      child: SizedBox(
                        width: double.infinity,
                        height: deliveryHeight,
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
