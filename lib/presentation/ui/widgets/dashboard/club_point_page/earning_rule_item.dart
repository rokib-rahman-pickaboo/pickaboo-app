import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/club_point/club_point_entity.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class EarningRuleItem extends StatelessWidget {
  final GeneralEarningRuleEntity rule;
  final int index;

  const EarningRuleItem({super.key, required this.rule, required this.index});

  Color _getBackgroundColor(AppColors colors) {
    if (index % 3 == 0) return colors.primary.withAlpha(25);
    if (index % 3 == 1) return colors.shamrock.withAlpha(25);
    return colors.salmon.withAlpha(25);
  }

  Color _getIconColor(AppColors colors) {
    if (index % 3 == 0) return colors.primary;
    if (index % 3 == 1) return colors.shamrock;
    return colors.salmon;
  }

  IconData _getIcon() {
    if (index % 3 == 0) return Icons.card_giftcard;
    if (index % 3 == 1) return Icons.account_balance_wallet;
    return Icons.login;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42.w,
          height: 42.h,
          decoration: BoxDecoration(
            color: _getBackgroundColor(colors),
            shape: BoxShape.circle,
          ),
          child: Icon(_getIcon(), size: 24.sp, color: _getIconColor(colors)),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                rule.title,
                style: textTheme.bodyMediumMedium.copyWith(
                  color: colors.text,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                rule.message,
                style: textTheme.bodyMedium.copyWith(
                  color: colors.gray,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
