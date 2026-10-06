import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// ============================================================================
/// 🏷️ UNIFIED CHILD CATEGORY CHIPS WIDGET
/// Horizontal scrollable child category bar used across:
/// - SecondaryHomeWidget (Homepage category tab feed)
/// - CategoryProductPage (Category all products page)
///
/// Features:
/// - Image is rendered without a card (clean & direct on surface)
/// - Subcategory name is positioned INSIDE a card styled like sort/filter & product card
///   (narrow border, AppRadius.k8, AppColors.white, subtle shadow)
/// - If subcategory has an icon, it is displayed. If missing, a subtle skeleton shade box
///   is displayed to maintain clean, uniform alignment without repetitive category icons.
/// ============================================================================
class ChildCategoryChipsWidget extends StatelessWidget {
  final List<CategoryEntity> childCategories;
  final String? parentCategoryIcon;
  final String? selectedChildId;
  final ValueChanged<CategoryEntity> onChildSelected;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const ChildCategoryChipsWidget({
    super.key,
    required this.childCategories,
    this.parentCategoryIcon,
    this.selectedChildId,
    required this.onChildSelected,
    this.height,
    this.padding,
  });

  static const double imageSize = 44.0;
  static const double imageToChipGap = 4.0;
  static const double nameChipHeight = 32.0;

  static const double _fontSizeRegular = 10.0;
  static const double _fontSizeSmall = 8.5;

  /// Exactly 2 font sizes:
  /// - Standard [10.0.sp] for single-word short names (e.g. Realme, Xiaomi, Apple, Honor)
  /// - Small [8.5.sp] for 2-line & longer names (e.g. IP Cameras, HDD & SSD, Smartphones, Mouse & Keyboard)
  static double _resolveFontSize(String text) {
    final clean = text.trim();
    if (clean.isEmpty) return _fontSizeRegular.sp;

    final len = clean.length;
    final hasMultipleWords = clean.contains(' ');

    // Single-word short name (e.g. Realme, Xiaomi, Apple) -> fits on 1 line
    if (!hasMultipleWords && len <= 8) {
      return _fontSizeRegular.sp;
    }

    // 2-line or longer names -> comfortable small size
    return _fontSizeSmall.sp;
  }

  @override
  Widget build(BuildContext context) {
    if (childCategories.isEmpty) {
      return const SizedBox.shrink();
    }

    final itemWidth = 72.w;
    final computedHeight = height?.h ?? (imageSize.w + imageToChipGap.h + nameChipHeight.h);

    return SizedBox(
      height: computedHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: AppSpacing.sameGroupItemSpacing.w,
            ),
        itemCount: childCategories.length,
        itemBuilder: (context, index) {
          final child = childCategories[index];
          final fontSize = _resolveFontSize(child.name);
          final isSelected = selectedChildId != null && selectedChildId == child.id;
          final hasImage = child.icon.trim().isNotEmpty;

          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: SizedBox(
              width: itemWidth,
              child: GestureDetector(
                onTap: () => onChildSelected(child),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ── 1. Image without card (or subtle skeleton shade when missing) ──
                    SizedBox(
                      width: imageSize.w,
                      height: imageSize.w,
                      child: Center(
                        child: hasImage
                            ? AppImage(
                                imageUrl: child.icon.trim(),
                                width: imageSize.w,
                                height: imageSize.w,
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                                placeholder: _buildSkeletonShade(isLoading: true),
                                errorWidget: _buildSkeletonShade(isLoading: false),
                              )
                            : _buildSkeletonShade(isLoading: false),
                      ),
                    ),

                    SizedBox(height: imageToChipGap.h),

                    // ── 2. Name inside card (narrow border, AppRadius.k8, white) ──
                    Container(
                      width: itemWidth,
                      height: nameChipHeight.h,
                      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                      decoration: AppDecorations.cardBoxDecoration(
                        backgroundColor: AppColors.white,
                        borderRadius: AppRadius.k8,
                        hasBorder: true,
                        borderColor: isSelected ? AppColors.pickabooBlue : AppColors.border,
                        borderWidth: isSelected ? 1.0.w : 0.8.w,
                      ),
                      child: Center(
                        child: Text(
                          child.name,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.bodySmall.copyWith(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? AppColors.pickabooBlue : AppColors.navy,
                            height: 1.15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSkeletonShade({bool isLoading = false}) {
    final box = Container(
      width: imageSize.w,
      height: imageSize.w,
      decoration: BoxDecoration(
        color: AppColors.skeletonBase.withValues(alpha: 0.5),
        borderRadius: AppRadius.k8,
      ),
    );

    if (isLoading) {
      return Skeletonizer(
        enabled: true,
        effect: AppDecorations.shimmerEffect,
        child: box,
      );
    }
    return box;
  }
}
