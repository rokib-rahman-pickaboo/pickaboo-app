// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

/// 4. VARIANT SELECTOR SECTION (Color Swatches • Size/Storage Chips • Custom Options)
class PdpVariantSelectorSection extends StatelessWidget {
  final ProductDetailEntity product;
  final List<ConfigurableItemOptionEntity> selectedVariants;
  final bool showError;
  final ValueChanged<List<ConfigurableItemOptionEntity>> onVariantsChanged;
  final VoidCallback? onVariantTapOverride;
  final VoidCallback? onHeaderTap;

  const PdpVariantSelectorSection({
    super.key,
    required this.product,
    required this.selectedVariants,
    this.showError = false,
    required this.onVariantsChanged,
    this.onVariantTapOverride,
    this.onHeaderTap,
  });

  @override
  Widget build(BuildContext context) {
    final variantGroups = product.variantGroups;
    if (variantGroups.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showError) ...[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
              color: AppColors.redBg,
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(color: AppColors.red.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, size: 14.sp, color: AppColors.red),
                SizedBox(width: 6.w),
                Text(
                  'Please select all variant options to proceed',
                  style: AppTypography.badgeStockOut,
                ),
              ],
            ),
          ),
        ],
        for (int g = 0; g < variantGroups.length; g++) ...[
          _buildVariantGroup(context, variantGroups[g]),
          if (g < variantGroups.length - 1) ...[
            SizedBox(height: 10.h),
            const Divider(height: 1, color: AppColors.border),
            SizedBox(height: 10.h),
          ],
        ],
      ],
    );
  }

  Map<String, String> get _selectedOptionsMap => {
    for (final v in selectedVariants)
      if (v.optionValue.isNotEmpty) v.optionId: v.optionValue,
  };

  VariantMatrixEntity? get _matrix {
    final matrix = product.variantMatrix;
    return matrix.isNotEmpty ? matrix : null;
  }

  List<VariantOptionEntity> _visibleOptions(VariantEntity variant) {
    final matrix = _matrix;
    if (matrix == null) return variant.options;

    final allowed = matrix.selectableValues(variant.optionId, _selectedOptionsMap);
    return variant.options
        .where((option) => allowed.contains(option.optionValue))
        .toList();
  }

  Widget _buildVariantGroup(BuildContext context, VariantEntity group) {
    final String optionId = group.optionId;
    final String groupTitle = group.optionName;
    final options = _visibleOptions(group);
    if (options.isEmpty) return const SizedBox.shrink();

    final isColor = groupTitle.toLowerCase().contains('color') ||
        groupTitle.toLowerCase().contains('colour');

    // Check if options have images
    final bool hasImages = isColor ||
        options.any(
          (opt) =>
              opt.configurableProduct?.productImages != null &&
              opt.configurableProduct!.productImages.isNotEmpty,
        );

    // Find current selected value
    final selectedOption = selectedVariants.firstWhere(
      (v) => v.optionId == optionId,
      orElse: () => ConfigurableItemOptionEntity(optionId: optionId, optionValue: ''),
    );

    final isOptionSelected = selectedOption.optionValue.isNotEmpty;

    final selectedVariantOption = isOptionSelected
        ? options.cast<VariantOptionEntity?>().firstWhere(
            (o) => o?.optionValue == selectedOption.optionValue,
            orElse: () => null,
          )
        : null;

    final currentSelectedLabel = selectedVariantOption?.optionText ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$groupTitle:',
              style: AppTypography.cardTitle,
            ),
            GestureDetector(
              onTap: onHeaderTap,
              child: Text(
                isOptionSelected
                    ? currentSelectedLabel
                    : 'Select $groupTitle',
                style: AppTypography.brandActionText,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        if (hasImages)
          Wrap(
            spacing: 12.w,
            runSpacing: 10.h,
            children: options.map((opt) {
              final isSel = selectedOption.optionValue == opt.optionValue;
              final isOutOfStock = opt.configurableProduct?.stockAvailable == false;
              final imageUrl = opt.configurableProduct?.productImages.isNotEmpty == true
                  ? opt.configurableProduct!.productImages.first
                  : (product.images.isNotEmpty ? product.images.first : '');

              return GestureDetector(
                onTap: isOutOfStock
                    ? null
                    : () {
                        if (onVariantTapOverride != null) {
                          onVariantTapOverride!();
                          return;
                        }
                        _selectOption(group.optionId, opt.optionValue);
                      },
                child: Opacity(
                  opacity: isOutOfStock ? 0.4 : 1.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                              color: isSel ? AppColors.surfaceBlue : AppColors.white,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                color: isSel ? AppColors.pickabooBlue : AppColors.border,
                                width: isSel ? 1.5.w : 1.w,
                              ),
                              boxShadow: isSel
                                  ? [
                                      BoxShadow(
                                        color: AppColors.pickabooBlue.withValues(alpha: 0.1),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ]
                                  : null,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.r),
                              child: SizedBox(
                                width: 52.w,
                                height: 52.w,
                                child: imageUrl.isNotEmpty
                                    ? AppImage(imageUrl: imageUrl, fit: BoxFit.contain)
                                    : Container(
                                        color: AppColors.pageBg,
                                        alignment: Alignment.center,
                                        child: Text(
                                          opt.optionText.isNotEmpty
                                              ? opt.optionText.substring(0, 1).toUpperCase()
                                              : 'C',
                                          style: AppTypography.sectionTitle,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          if (isSel)
                            Positioned(
                              right: -3.w,
                              bottom: -3.h,
                              child: Container(
                                padding: EdgeInsets.all(1.5.w),
                                decoration: BoxDecoration(
                                  color: AppColors.pickabooBlue,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.white, width: 1.w),
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: AppColors.white,
                                  size: 8.sp,
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        opt.optionText,
                        style: isSel
                            ? AppTypography.brandActionText
                            : AppTypography.brandActionText.withColor(AppColors.navy),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          )
        else
          Wrap(
            spacing: AppSpacing.sameGroupItemSpacing.w,
            runSpacing: AppSpacing.sameGroupItemSpacing.h,
            children: options.map((opt) {
              final isSel = selectedOption.optionValue == opt.optionValue;
              final isOutOfStock = opt.configurableProduct?.stockAvailable == false;

              return GestureDetector(
                onTap: isOutOfStock
                    ? null
                    : () {
                        if (onVariantTapOverride != null) {
                          onVariantTapOverride!();
                          return;
                        }
                        _selectOption(group.optionId, opt.optionValue);
                      },
                child: Opacity(
                  opacity: isOutOfStock ? 0.4 : 1.0,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: isSel ? AppColors.surfaceBlue : AppColors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: isSel ? AppColors.pickabooBlue : AppColors.border,
                            width: isSel ? 1.5.w : 1.w,
                          ),
                          boxShadow: isSel
                              ? [
                                  BoxShadow(
                                    color: AppColors.pickabooBlue.withValues(alpha: 0.08),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ]
                              : null,
                        ),
                        child: Text(
                          opt.optionText,
                          style: isSel
                              ? AppTypography.brandActionText
                              : AppTypography.brandActionText.withColor(AppColors.navy),
                        ),
                      ),
                      if (isSel)
                        Positioned(
                          right: -3.w,
                          top: -3.h,
                          child: Container(
                            padding: EdgeInsets.all(1.5.w),
                            decoration: BoxDecoration(
                              color: AppColors.pickabooBlue,
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.white, width: 1.w),
                            ),
                            child: Icon(
                              Icons.check,
                              color: AppColors.white,
                              size: 8.sp,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  void _selectOption(String optionId, String optionValue) {
    final currentMap = Map<String, String>.from(_selectedOptionsMap);
    final isSelected = currentMap[optionId] == optionValue;

    if (isSelected) {
      currentMap.remove(optionId);
    } else {
      currentMap[optionId] = optionValue;

      // Prune any now-incompatible selections in other groups
      final matrix = _matrix;
      if (matrix != null) {
        final keys = currentMap.keys.toList();
        for (final key in keys) {
          if (key == optionId) continue;
          final allowed = matrix.selectableValues(key, currentMap);
          if (!allowed.contains(currentMap[key])) {
            currentMap.remove(key);
          }
        }
      }
    }

    final updated = currentMap.entries
        .map(
          (e) => ConfigurableItemOptionEntity(
            optionId: e.key,
            optionValue: e.value,
          ),
        )
        .toList();

    onVariantsChanged(updated);
  }
}
