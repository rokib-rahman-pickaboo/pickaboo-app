import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/discover_grid.dart';

class ViewAllCircle extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final double topInset;

  const ViewAllCircle({
    super.key,
    required this.icon,
    this.label = 'View All',
    this.onTap,
    this.topInset = 0,
  });

  @override
  Widget build(BuildContext context) {
    final size = DiscoverMetrics.circleTile;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.only(top: topInset),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: AppColors.surfaceBlue,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.pickabooBlue.withValues(alpha: 0.25),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.pickabooBlue.withValues(alpha: 0.08),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: AppColors.pickabooBlue,
                  size: 24.sp,
                ),
              ),
            ),

            SizedBox(height: DiscoverMetrics.tileLabelGap),

            DiscoverTileLabel(text: label, maxLines: 1),

            SizedBox(height: 2.h),

            const DiscoverTileAction(text: 'Explore'),
          ],
        ),
      ),
    );
  }
}
