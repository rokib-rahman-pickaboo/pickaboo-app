import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class BillingAddressToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const BillingAddressToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            "Same as shipping address",
            style: context.textStyle.bodyMedium,
          ),
        ),
        SizedBox(width: 8.w),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: colors.primary,
        ),
      ],
    );
  }
}
