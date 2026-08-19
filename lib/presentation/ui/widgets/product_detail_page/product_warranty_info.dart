import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class ProductWarrantyInfo extends StatelessWidget {
  final String warranty;

  const ProductWarrantyInfo({
    super.key,
    required this.warranty,
  });

  @override
  Widget build(BuildContext context) {
    if (warranty.isEmpty) return const SizedBox.shrink();

    final colors = context.colors;
    final textStyle = context.textStyle;

    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.w,
            child: Row(
              children: [
                Text(
                  'Warranty',
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
            child: Text(
              warranty,
              style: textStyle.bodyMediumMedium.copyWith(
                color: colors.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
