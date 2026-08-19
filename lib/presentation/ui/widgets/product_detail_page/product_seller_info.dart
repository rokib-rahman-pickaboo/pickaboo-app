import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class ProductSellerInfo extends StatelessWidget {
  final String sellerName;
  final double rating;
  final VoidCallback? onTap;

  const ProductSellerInfo({
    super.key,
    required this.sellerName,
    required this.rating,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (sellerName.trim().isEmpty) return const SizedBox.shrink();

    final colors = context.colors;
    final textStyle = context.textStyle;

    final seller = sellerName;
    final sellerRating = rating;

    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.w,
            child: Row(
              children: [
                Text(
                  'Seller',
                  style: textStyle.bodyMediumBold.copyWith(color: colors.text),
                ),
                SizedBox(width: 8.w),
                Text(
                  ':',
                  style: textStyle.bodyMediumBold.copyWith(color: colors.text),
                ),
              ],
            ),
          ),

          Expanded(
            child: GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        seller,
                        style: textStyle.bodyMediumMedium.copyWith(
                          color: colors.primary,
                        ),
                      ),
                    ],
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
