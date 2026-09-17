import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
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
      color: AppColors.black.withValues(alpha: 0.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.buttonRadius,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
          margin: EdgeInsets.only(bottom: 8.h),
          decoration: BoxDecoration(
            color: AppColors.pageBg.withValues(alpha: 0.5),
            borderRadius: AppRadius.buttonRadius,
          ),
          child: Row(
            children: [
              Icon(Icons.article_outlined, size: 16.sp, color: AppColors.muted),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  subCategory.name,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.text,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, size: 16.sp, color: AppColors.muted),
            ],
          ),
        ),
      ),
    );
  }
}
