// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_subsection_item_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

/// ============================================================================
/// 📦 DISCOVER SECTION CARD
/// White elevated surface card encapsulating Section Title + 3-Column Item Grid
/// ============================================================================
class DiscoverSectionCard extends StatelessWidget {
  final String title;
  final List<DiscoverSubsectionItemEntity> items;
  final void Function(DiscoverSubsectionItemEntity item)? onItemTap;

  const DiscoverSectionCard({
    super.key,
    required this.title,
    required this.items,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
        bottom: 10.h,
      ),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(
          color: AppColors.border,
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.navy.withValues(alpha: 0.02),
            blurRadius: 6.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Header: Section Title ──
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.sectionTitle.copyWith(
              fontSize: 13.5.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.navy,
            ),
          ),

          SizedBox(height: 10.h),

          // ── 3-Column Item Grid ──
          Column(
            children: [
              for (int i = 0; i < items.length; i += 3) ...[
                if (i > 0) SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int j = 0; j < 3; j++) ...[
                      if (j > 0) SizedBox(width: 8.w),
                      Expanded(
                        child: (i + j < items.length)
                            ? DiscoverItemTile(
                                item: items[i + j],
                                onTap: () => onItemTap?.call(items[i + j]),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// ============================================================================
/// 🏷️ DISCOVER ITEM TILE
/// Uniform tile with a full-sized square image and 2-line title underneath.
/// ============================================================================
class DiscoverItemTile extends StatelessWidget {
  final DiscoverSubsectionItemEntity item;
  final VoidCallback? onTap;

  const DiscoverItemTile({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Image Container (Full Sized Square 1:1 Aspect Ratio) ──
          AspectRatio(
            aspectRatio: 1.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: AppImage(
                imageUrl: item.imageUrl,
                fit: BoxFit.cover,
                errorWidget: Center(
                  child: Icon(
                    Icons.category_outlined,
                    size: 24.sp,
                    color: AppColors.mutedLight,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 6.h),

          // ── Title Label (Max 2 lines, Navy) ──
          SizedBox(
            height: 28.h,
            child: Center(
              child: Text(
                item.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.bodyTiny,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
