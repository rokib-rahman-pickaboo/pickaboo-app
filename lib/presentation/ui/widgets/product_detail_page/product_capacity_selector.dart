import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class ProductCapacitySelector extends StatefulWidget {
  const ProductCapacitySelector({super.key});

  @override
  State<ProductCapacitySelector> createState() =>
      _ProductCapacitySelectorState();
}

class _ProductCapacitySelectorState extends State<ProductCapacitySelector> {
  int _selectedIndex = 1;

  final List<String> _capacities = ['398 L', '240 L', '260 L'];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 80.w,
            child: Row(
              children: [
                Text(
                  'Capacity',
                  style: textStyle.robotoBlack.copyWith(color: colors.text),
                ),
                SizedBox(width: 8.w),
                Text(
                  ':',
                  style: textStyle.robotoBlack.copyWith(color: colors.text),
                ),
              ],
            ),
          ),

          Expanded(
            child: Wrap(
              spacing: 12.w,
              runSpacing: 8.h,
              children: List.generate(_capacities.length, (index) {
                final isSelected = _selectedIndex == index;
                final capacity = _capacities[index];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: colors.white,
                      border: Border.all(
                        color: isSelected ? colors.primary : colors.borderColor,
                        width: isSelected ? 2.w : 1.w,
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      capacity,
                      style: textStyle.bodyMedium.copyWith(
                        color: isSelected ? colors.primary : colors.text,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
