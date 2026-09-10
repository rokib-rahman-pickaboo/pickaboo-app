import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/support_category/support_category_entity.dart';
import 'package:pickaboo/domain/entity/support_category/support_child_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/knowledge_base_page/faq_design.dart';

class CategoryItem extends StatelessWidget {
  final SupportCategoryEntity category;
  final bool isExpanded;
  final IconData icon;
  final AppColors colors;
  final VoidCallback onTap;
  final Function(SupportChildEntity) onSubCategoryTap;
  final VoidCallback? onCategoryTap;

  const CategoryItem({
    super.key,
    required this.category,
    required this.isExpanded,
    required this.icon,
    required this.colors,
    required this.onTap,
    required this.onSubCategoryTap,
    this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasChildren = category.children.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
          onTap: hasChildren ? onTap : onCategoryTap,
          borderRadius: BorderRadius.circular(FaqTheme.radiusSmall),
          child: Container(
            margin: EdgeInsets.only(bottom: 2.h),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 9.h),
            decoration: BoxDecoration(
              color: isExpanded ? FaqTheme.primaryTint : null,
              borderRadius: BorderRadius.circular(FaqTheme.radiusSmall),
            ),
            child: Row(
              children: [
                Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(
                    color: isExpanded ? AppColors.white : AppColors.pageBg,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 16.sp,
                    color: isExpanded ? AppColors.pickabooBlue : AppColors.muted,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    category.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyle.bodySmall.copyWith(
                      fontSize: 14.sp,
                      fontWeight: isExpanded
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: isExpanded
                          ? FaqTheme.primaryDeep
                          : AppColors.text,
                    ),
                  ),
                ),
                if (hasChildren)
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 200),
                    turns: isExpanded ? 0.5 : 0,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 18.sp,
                      color: isExpanded ? AppColors.pickabooBlue : AppColors.muted,
                    ),
                  )
                else
                  Icon(Icons.chevron_right, size: 18.sp, color: AppColors.muted),
              ],
            ),
          ),
          ),
        ),

        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          alignment: Alignment.topCenter,
          child: !isExpanded || !hasChildren
              ? const SizedBox(width: double.infinity)
              : Container(
                  margin: EdgeInsets.only(left: 26.w, bottom: 4.h),
                  padding: EdgeInsets.only(left: 6.w),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: FaqTheme.hairline,
                        width: 1.w,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final subCategory in category.children)
                        InkWell(
                          onTap: () => onSubCategoryTap(subCategory),
                          borderRadius: BorderRadius.circular(
                            FaqTheme.radiusSmall,
                          ),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 1.h),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 8.h,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 5.w,
                                  height: 5.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.muted.withValues(alpha: 0.4),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Expanded(
                                  child: Text(
                                    subCategory.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textStyle.bodySmall.copyWith(
                                      fontSize: 13.sp,
                                      color: AppColors.text,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
