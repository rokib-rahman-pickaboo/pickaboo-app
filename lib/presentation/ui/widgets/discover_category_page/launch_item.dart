// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_typography.dart';
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
    final size = DiscoverMetrics.squareTile;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Padding(
              padding: EdgeInsets.all(6.w),
              child: AppImage(
                imageUrl: imageUrl,
                width: size,
                height: size,
                fit: BoxFit.contain,
                errorWidget: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.pageTitle,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: DiscoverMetrics.tileLabelGap),

          DiscoverTileLabel(text: title),

          SizedBox(height: 2.h),

          DiscoverTileAction(text: actionText),
        ],
      ),
    );
  }
}
