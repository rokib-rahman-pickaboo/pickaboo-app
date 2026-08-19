import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/star_rating_bar.dart';

class ProductInfoSection extends StatelessWidget {
  final ProductDetailEntity product;
  final VoidCallback? onBrandTap;
  final VoidCallback? onAddReviewTap;
  final int addonPrice;

  const ProductInfoSection({
    super.key,
    required this.product,
    this.onBrandTap,
    this.onAddReviewTap,
    this.addonPrice = 0,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    final name = product.name;
    final brand = product.brand;
    final rating = product.ratingSummaryValue;
    final reviewCount = product.reviewsCount;

    final hasDiscount = product.discount > 0;
    final currentPrice =
        (product.discount > 0 ? product.spacialPrice : product.regularPrice) +
        addonPrice;
    final originalPrice = product.regularPrice + addonPrice;
    final discountPercent = product.discount;
    final showDiscount = hasDiscount;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      color: colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'Brand : ',
                style: textStyle.productBrand.copyWith(
                  color: colors.text,
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (brand.trim().isNotEmpty && onBrandTap != null)
                InkWell(
                  onTap: onBrandTap,
                  borderRadius: BorderRadius.circular(4.r),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: Text(
                      brand,
                      style: textStyle.productBrand.copyWith(
                        color: const Color(0xFF0094CF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              else
                Text(
                  brand,
                  style: textStyle.productBrand.copyWith(
                    color: colors.text,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.h),

          Text(
            name,
            style: textStyle.productNameLarge.copyWith(color: colors.text),
          ),
          SizedBox(height: 8.h),

          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              StarRatingBar(rating: rating, starSize: 15),
              SizedBox(width: 4.w),
              Text(
                '(${rating.toStringAsFixed(1)})',
                style: textStyle.ratingCount.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colors.primary,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                '$reviewCount Reviews',
                style: textStyle.reviewText.withColor(colors.text),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                height: 12.h,
                width: 1.5.w,
                color: colors.textMedium,
              ),
              TextButton(
                onPressed: onAddReviewTap,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.w),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Add your Review',
                  style: textStyle.buttonSmall.copyWith(color: colors.primary),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            runSpacing: 4.h,
            children: [
              Text(
                '৳ ${currentPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                style: textStyle.productPriceLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colors.primary,
                ),
              ),
              if (showDiscount) ...[
                SizedBox(width: 12.w),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: Text(
                    '৳ ${originalPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                    style: textStyle.reviewText
                        .withColor(colors.textMedium)
                        .copyWith(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: colors.textMedium,
                        ),
                  ),
                ),
                SizedBox(width: 12.w),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: Text(
                    '$discountPercent% off',
                    style: textStyle.ratingValue.copyWith(
                      color: colors.discountColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
