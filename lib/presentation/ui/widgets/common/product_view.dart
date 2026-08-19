import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/common/star_rating_bar.dart';

class ProductView extends StatelessWidget {
  final ProductEntity product;
  final Function(ProductEntity) onTap;

  const ProductView({super.key, required this.product, required this.onTap});

  static final RegExp _thousandsSeparator = RegExp(
    r'(\d{1,3})(?=(\d{3})+(?!\d))',
  );

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    return GestureDetector(
      onTap: () => onTap.call(product),
      child: Container(
          width: (screenWidth - 64).clamp(0.0, 400.0),
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: colors.gray.withValues(alpha: 0.2), width: 1.w),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1.6,
                    child: Container(
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: AppImage(
                        imageUrl: product.productImg,
                        fit: BoxFit.fitHeight,
                        cacheWidth:
                            ((screenWidth - 44) / 2 * devicePixelRatio).round(),
                      ),
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product.productName,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: textStyle.productName.withColor(colors.text),
                        ),

                        SizedBox(height: 3.h),

                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              StarRatingBar(
                                rating: product.rating,
                                starSize: 10,
                              ),
                              ...[
                                SizedBox(width: 3.w),
                                Text(
                                  '${product.rating}',
                                  style: textStyle.bodySmallBold.withColor(
                                    colors.linkBlue,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Text(
                                  '(${product.ratingCount})',
                                  style: textStyle.caption.withColor(
                                    colors.gray,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),

                        SizedBox(height: 3.h),

                        if (product.stockAvailable == true)
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (product.productSpecialPrice > 0) ...[
                                  Text(
                                    '৳${_formatPrice(product.productPrice)}',
                                    style: textStyle.productPriceStrike
                                        .withColor(colors.gray),
                                  ),
                                  SizedBox(width: 6.w),
                                ],
                                Text(
                                  product.productSpecialPrice > 0
                                      ? '৳${_formatPrice(product.productSpecialPrice)}'
                                      : '৳${_formatPrice(product.productPrice)}',
                                  style: textStyle.productPrice.withColor(
                                    colors.primary,
                                  ),
                                ),
                              ],
                            ),
                          )
                        else
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 3.h,
                            ),
                            decoration: BoxDecoration(
                              color: colors.salmon,
                              borderRadius: BorderRadius.circular(4.r),
                              boxShadow: [
                                BoxShadow(
                                  color: colors.salmon.withValues(alpha: 0.3),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              "Out of Stock",
                              style: textStyle.badgeSmall.withColor(
                                colors.white,
                              ),
                            ),
                          ),
                        if (product.clubPoint > 0)
                          Text(
                            'Earn ${product.clubPoint.toInt()} club Points',
                            style: textStyle.bodySmallBold.withColor(
                              colors.primary,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),

              if (product.expressDelivery)
                Positioned(
                  top: -8.w,
                  left: 12.w,
                  child: SvgPicture.asset(
                    "assets/new/svg/express_icon.svg",
                    width: 42.w,
                    height: 28.h,
                    fit: BoxFit.fill,
                  ),
                ),

              if (product.productDiscount > 0)
                Positioned(
                  top: 4.h,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 2.h,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF6B3D),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.r),
                        bottomLeft: Radius.circular(4.r),
                      ),
                    ),
                    child: Text(
                      '-${product.productDiscount}%',
                      style: textStyle.productDiscount.withColor(colors.white),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      _thousandsSeparator,
          (Match m) => '${m[1]},',
    );
  }
}
