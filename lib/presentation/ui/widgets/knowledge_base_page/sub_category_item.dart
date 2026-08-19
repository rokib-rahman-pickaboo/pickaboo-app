import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/support_category/support_child_entity.dart';

class SubCategoryItem extends StatelessWidget {
  final SupportChildEntity subCategory;
  final AppColors colors;
  final VoidCallback onTap;

  const SubCategoryItem({
    super.key,
    required this.subCategory,
    required this.colors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colors.black.withValues(alpha: 0.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
          margin: EdgeInsets.only(bottom: 8.h),
          decoration: BoxDecoration(
            color: colors.grayLight.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Icon(Icons.article_outlined, size: 16.sp, color: colors.gray),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  subCategory.name,
                  style: context.textStyle.bodySmall.copyWith(
                    color: colors.text,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, size: 16.sp, color: colors.gray),
            ],
          ),
        ),
      ),
    );
  }
}
