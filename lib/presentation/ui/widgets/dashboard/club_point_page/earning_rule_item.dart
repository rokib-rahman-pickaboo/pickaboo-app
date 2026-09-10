import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/club_point/club_point_entity.dart';

class EarningRuleItem extends StatelessWidget {
  final GeneralEarningRuleEntity rule;
  final int index;

  const EarningRuleItem({super.key, required this.rule, required this.index});

  Color _getBackgroundColor() {
    if (index % 3 == 0) return AppColors.pickabooBlue.withAlpha(25);
    if (index % 3 == 1) return AppColors.green.withAlpha(25);
    return AppColors.orange.withAlpha(25);
  }

  Color _getIconColor() {
    if (index % 3 == 0) return AppColors.pickabooBlue;
    if (index % 3 == 1) return AppColors.green;
    return AppColors.orange;
  }

  IconData _getIcon() {
    if (index % 3 == 0) return Icons.card_giftcard;
    if (index % 3 == 1) return Icons.account_balance_wallet;
    return Icons.login;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textStyle;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42.w,
          height: 42.h,
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            shape: BoxShape.circle,
          ),
          child: Icon(_getIcon(), size: 24.sp, color: _getIconColor()),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                rule.title,
                style: textTheme.bodyMediumMedium.copyWith(
                  color: AppColors.text,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                rule.message,
                style: textTheme.bodyMedium.copyWith(
                  color: AppColors.muted,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
