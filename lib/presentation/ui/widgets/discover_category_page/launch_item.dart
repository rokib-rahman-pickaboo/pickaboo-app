import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/discover_grid.dart';

class LaunchItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String actionText;
  final VoidCallback? onTap;

  const LaunchItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.actionText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = DiscoverMetrics.squareTile;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: colors.spotlightBlueLight,
              borderRadius: BorderRadius.circular(14.r),
              boxShadow: [
                BoxShadow(
                  color: colors.spotlightBlueShadow,
                  offset: const Offset(0, 3),
                  blurRadius: 0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: AppImage(
                imageUrl: imageUrl,
                width: size,
                height: size,
                fit: BoxFit.cover,
                errorWidget: Padding(
                  padding: EdgeInsets.all(6.w),
                  child: Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: context.textStyle.bodyLarge.copyWith(
                        color: colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 11.sp,
                        height: 1.15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: DiscoverMetrics.tileLabelGap + 3.h),

          DiscoverTileLabel(text: title),

          DiscoverTileAction(text: actionText),
        ],
      ),
    );
  }
}
