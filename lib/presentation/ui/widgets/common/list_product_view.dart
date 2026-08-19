import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/star_rating_bar.dart';

class ListProductView extends StatelessWidget {
  final ProductEntity product;
  final Function(ProductEntity) onTap;

  const ListProductView({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return GestureDetector(
      onTap: () => onTap.call(product),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 105.w,
                      decoration: BoxDecoration(
                        color: colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: AppImage(
                        imageUrl: product.productImg,
                        fit: BoxFit.fill,
                      ),
                    ),

                    if (product.isAd == true)
                      Positioned(
                        top: 4.h,
                        left: 4.w,
                        child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: colors.primary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            color: colors.primary,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          'Ads',
                          style: textStyle.caption.copyWith(
                            color: colors.primary,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

                SizedBox(width: 12.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productName,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: textStyle.productName.withColor(colors.text),
                      ),

                      SizedBox(height: 4.h),

                      Text(
                        'Sponsored',
                        style: textStyle.caption.copyWith(color: colors.textMedium, fontWeight: FontWeight.bold),
                      ),

                      SizedBox(height: 4.h),

                      Row(
                        children: [
                          StarRatingBar(rating: product.rating, starSize: 10),
                          SizedBox(width: 4.w),
                          Text(
                            product.rating > 0 ? '${product.rating}' : '0',
                            style: textStyle.bodySmallBold.withColor(
                              colors.linkBlue,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '(${product.ratingCount})',
                            style: textStyle.caption.withColor(colors.text),
                          ),
                          if (product.expressDelivery || true) ...[
                            SizedBox(width: 8.w),
                            SvgPicture.asset(
                              "assets/new/svg/express_icon.svg",
                              width: 60.w,
                              height: 28.h,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ],
                      ),

                      SizedBox(height: 8.h),

                      if (product.stockAvailable == true)
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 6.w,
                          runSpacing: 4.h,
                          children: [
                            if (product.productDiscount > 0)
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                  vertical: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF6B3D),
                                  borderRadius: BorderRadius.circular(2.r),
                                ),
                                child: Text(
                                  '-${product.productDiscount}%',
                                  style: textStyle.productDiscount.withColor(
                                    colors.white,
                                  ),
                                ),
                              ),
                            if (product.productSpecialPrice > 0)
                              Text(
                                '৳${_formatPrice(product.productPrice)}',
                                style: textStyle.productPriceStrike.withColor(
                                  colors.gray,
                                ),
                              ),
                            Text(
                              product.productSpecialPrice > 0
                                  ? '৳${_formatPrice(product.productSpecialPrice)}'
                                  : '৳${_formatPrice(product.productPrice)}',
                              style: textStyle.productPrice.withColor(
                                colors.primary,
                              ),
                            ),
                          ],
                        )
                      else
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: colors.salmon,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            "Out of Stock",
                            style: textStyle.badgeSmall.withColor(colors.white),
                          ),
                        ),

                      SizedBox(height: 8.h),

                      Text(
                        'Earn ${product.clubPoint.toInt()} Club Points',
                        style: textStyle.bodySmallBold.withColor(
                          colors.primary,
                        ),
                      ),

                      SizedBox(height: 6.h),

                      Text(
                        '1 year warranty by Hisense',
                        style: textStyle.caption.copyWith(
                          color: colors.textMedium,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ...[
            SizedBox(height: 8.h),

            if (product.attributes.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 6.w,
                    runSpacing: 6.h,
                    children: () {
                      final uniqueLabels = <String>{};
                      return product.attributes
                          .where((attr) => uniqueLabels.add(attr.label))
                          .map(
                            (attr) => _buildSpecTag(
                              attr.label,
                              attr.value,
                              colors,
                              textStyle,
                            ),
                          )
                          .toList();
                    }(),
                  ),
                ),
              ),
            SizedBox(height: 4.h),
          ],
          Divider(height: 1.h, color: colors.borderColor),
        ],
      ),
    );
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  Widget _buildSpecTag(
    String label,
    String value,
    AppColors colors,
    AppTextStyles textStyle,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: colors.white,
        border: Border.all(color: colors.borderColor.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(2.r),
      ),
      child: RichText(
        text: TextSpan(
          style: textStyle.caption.copyWith(
            color: colors.textMedium,
            fontSize: 9.sp,
          ),
          children: [
            TextSpan(
              text: '$label : ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: colors.text,
              ),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
