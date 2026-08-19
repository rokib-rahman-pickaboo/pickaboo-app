import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';

class SubcategoryCard extends StatelessWidget {
  final CategoryEntity subcategory;
  final VoidCallback onTap;

  const SubcategoryCard({
    super.key,
    required this.subcategory,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        decoration: BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: colors.borderColor, width: 1.w),
          boxShadow: [
            BoxShadow(
              color: colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (subcategory.icon.isNotEmpty)
                Flexible(
                  child: AppImage(
                    imageUrl: subcategory.icon,
                    width: 40.w,
                    height: 40.h,
                    fit: BoxFit.cover,
                    placeholder: SizedBox(
                      width: 40.w,
                      height: 40.h,
                      child: Center(
                        child: SizedBox(
                          width: 16.w,
                          height: 16.h,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: colors.primary,
                          ),
                        ),
                      ),
                    ),
                    errorWidget: Icon(
                      Icons.category_outlined,
                      size: 30.sp,
                      color: colors.primary,
                    ),
                  ),
                )
              else
                Flexible(
                  child: Icon(
                    Icons.category_outlined,
                    size: 30.sp,
                    color: colors.primary,
                  ),
                ),

              SizedBox(height: 6.h),

              Flexible(
                child: Text(
                  subcategory.name,
                  style: textStyles.bodySmall.withColor(colors.text),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              if (subcategory.children.isNotEmpty) ...[
                SizedBox(height: 2.h),
                Text(
                  'Shop Now',
                  style: textStyles.caption.copyWith(
                    color: colors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
