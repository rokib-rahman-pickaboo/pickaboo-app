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
        bottom: 8.h,
      ),
      padding: EdgeInsets.all(8.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Header: Section Title ──
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.titleMedium.copyWith(
              fontSize: 13.5.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.navy,
            ),
          ),

          SizedBox(height: 8.h),

          // ── 3-Column Item Grid ──
          Column(
            children: [
              for (int i = 0; i < items.length; i += 3) ...[
                if (i > 0) SizedBox(height: 8.h),
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
/// Uniform tile with name inside the card and prominent 1:1 square icon area.
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
    final hasImage = item.imageUrl.trim().isNotEmpty;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── 1. Image without card (floating directly on surface) ──
          AspectRatio(
            aspectRatio: 1.0,
            child: Center(
              child: hasImage
                  ? AppImage(
                      imageUrl: item.imageUrl,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                      placeholder: const SizedBox.shrink(),
                      errorWidget: const SizedBox.shrink(),
                    )
                  : const SizedBox.shrink(),
            ),
          ),

          SizedBox(height: 4.h),

          // ── 2. Name inside card (narrow border, AppRadius.k8, white) ──
          Container(
            width: double.infinity,
            height: 28.h,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            decoration: AppDecorations.cardBoxDecoration(
              backgroundColor: AppColors.white,
              borderRadius: AppRadius.k8,
              hasBorder: true,
              borderColor: AppColors.border,
              borderWidth: 0.8.w,
            ),
            child: Center(
              child: Text(
                item.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.bodyTiny.copyWith(
                  color: AppColors.navy,
                  fontWeight: FontWeight.w600,
                  height: 1.15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
