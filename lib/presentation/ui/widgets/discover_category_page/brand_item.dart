import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/discover_grid.dart';

class BrandItem extends StatelessWidget {
  final String brandName;
  final String imageUrl;
  final String actionText;
  final VoidCallback? onTap;

  const BrandItem({
    super.key,
    required this.brandName,
    required this.imageUrl,
    required this.actionText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = DiscoverMetrics.circleTile;

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
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: colors.black.withValues(alpha: 0.08),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipOval(
              child: AppImage(
                imageUrl: imageUrl,
                width: size,
                height: size,
                fit: BoxFit.cover,
                errorWidget: Padding(
                  padding: EdgeInsets.all(6.w),
                  child: Center(
                    child: Text(
                      brandName.toUpperCase(),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.textStyle.bodyMediumBold.copyWith(
                        color: colors.white,
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

          SizedBox(height: DiscoverMetrics.tileLabelGap),

          DiscoverTileLabel(text: brandName, maxLines: 1),

          DiscoverTileAction(text: actionText),
        ],
      ),
    );
  }
}
