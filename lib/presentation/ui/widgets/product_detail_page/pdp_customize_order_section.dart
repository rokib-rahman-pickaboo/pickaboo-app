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

/// 4.5. PDP CUSTOMIZE ORDER SECTION
/// Inline PDP section for customizable order options (e.g. Installation Charge).
/// Matches the mobile app bottom sheet design tokens and options selection logic.
class PdpCustomizeOrderSection extends StatelessWidget {
  final List<ExtraOptionEntity> extraOptions;
  final List<ConfigurableItemOptionEntity> selectedAddons;
  final int totalAddonPrice;
  final int? mainPrice;
  final void Function(List<ConfigurableItemOptionEntity> addons, int totalPrice) onAddonsChanged;
  final bool showError;
  final bool showHeader;
  final VoidCallback? onHeaderTap;
  final bool isEnabled;

  const PdpCustomizeOrderSection({
    super.key,
    required this.extraOptions,
    required this.selectedAddons,
    required this.totalAddonPrice,
    this.mainPrice,
    required this.onAddonsChanged,
    this.showError = false,
    this.showHeader = true,
    this.onHeaderTap,
    this.isEnabled = true,
  });

  String _formatPrice(num amount) {
    return amount.toInt().toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
  }

  void _onAddonTap(
    ExtraOptionEntity option,
    ExtraOptionValueEntity val,
    bool isSelected,
  ) {
    final currentSelections = List<ConfigurableItemOptionEntity>.from(selectedAddons);
    currentSelections.removeWhere(
      (e) => e.optionId == option.optionId.toString(),
    );
    if (!isSelected) {
      currentSelections.add(
        ConfigurableItemOptionEntity(
          optionId: option.optionId.toString(),
          optionValue: val.optionTypeId.toString(),
          isCustomOption: true,
        ),
      );
    }

    int newTotalAddonPrice = 0;
    for (var sel in currentSelections) {
      try {
        final opt = extraOptions.firstWhere(
          (o) => o.optionId.toString() == sel.optionId,
        );
        final v = opt.values.firstWhere(
          (v) => v.optionTypeId.toString() == sel.optionValue,
        );
        newTotalAddonPrice += v.price;
      } catch (_) {}
    }

    onAddonsChanged(currentSelections, newTotalAddonPrice);
  }

  Widget _buildAddonItem({
    required ExtraOptionEntity option,
    required ExtraOptionValueEntity val,
    required bool hasOptionError,
  }) {
    final isSelected = selectedAddons.any(
      (e) =>
          e.optionId == option.optionId.toString() &&
          e.optionValue == val.optionTypeId.toString(),
    );

    return GestureDetector(
      onTap: isEnabled ? () => _onAddonTap(option, val, isSelected) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.surfaceBlue : AppColors.white,
          border: Border.all(
            color: isSelected
                ? AppColors.pickabooBlue
                : hasOptionError
                    ? AppColors.red
                    : AppColors.border,
            width: isSelected || hasOptionError ? 1.4.w : 1.w,
          ),
          borderRadius: AppRadius.k8,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.pickabooBlue.withValues(alpha: 0.08),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : hasOptionError
                  ? [
                      BoxShadow(
                        color: AppColors.red.withValues(alpha: 0.06),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected ? AppColors.surfaceBlue : AppColors.white,
                      border: Border.all(
                        color: isSelected ? AppColors.pickabooBlue : AppColors.border,
                        width: 1.w,
                      ),
                    ),
                    child: Icon(
                      Icons.settings_outlined,
                      color: isSelected ? AppColors.pickabooBlue : AppColors.mutedLight,
                      size: 12.sp,
                    ),
                  ),
                  if (isSelected)
                    Positioned(
                      right: -2.w,
                      bottom: -2.h,
                      child: Container(
                        padding: EdgeInsets.all(1.5.w),
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.white, width: 1.w),
                        ),
                        child: Icon(
                          Icons.check,
                          color: AppColors.white,
                          size: 7.sp,
                        ),
                      ),
                    ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                width: 1.2.w,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.pickabooBlue : AppColors.border,
                  borderRadius: AppRadius.k4,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${val.price} ৳',
                      style: AppTypography.bodyMedium.bold().copyWith(
                        color: isSelected ? AppColors.pickabooBlue : AppColors.navy,
                        fontSize: 11.5.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      val.title,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.navy,
                        fontSize: 10.5.sp,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (extraOptions.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header Row ──
        if (showHeader) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Customize your order',
                style: AppTypography.titleMedium,
              ),
              if (onHeaderTap != null && isEnabled)
                GestureDetector(
                  onTap: onHeaderTap,
                  child: Text(
                    selectedAddons.isNotEmpty ? 'CHANGE' : 'SELECT',
                    style: AppTypography.brandAction.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 10.h),
        ],

        // ── Error Banner (if required option skipped) ──
        if (showError && isEnabled) ...[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
              color: AppColors.redBg,
              borderRadius: AppRadius.k8,
              border: Border.all(color: AppColors.red.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, size: 14.sp, color: AppColors.red),
                SizedBox(width: 6.w),
                Text(
                  'Please select all required options',
                  style: AppTypography.bodyTiny.extraBold().red,
                ),
              ],
            ),
          ),
        ],

        // ── Options Groups (Disabled with 60% opacity if out of stock) ──
        IgnorePointer(
          ignoring: !isEnabled,
          child: Opacity(
            opacity: isEnabled ? 1.0 : 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int optIdx = 0; optIdx < extraOptions.length; optIdx++) ...[
                  (() {
                    final option = extraOptions[optIdx];
                    final hasOptionSelected = selectedAddons.any(
                      (e) => e.optionId == option.optionId.toString(),
                    );
                    final hasOptionError = showError && option.isRequire && !hasOptionSelected && isEnabled;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (optIdx > 0) SizedBox(height: 10.h),
                        // Title
                        Row(
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: option.title,
                                    style: AppTypography.bodyMedium.medium().copyWith(
                                      color: hasOptionError ? AppColors.red : AppColors.navy,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  if (option.isRequire)
                                    TextSpan(
                                      text: ' *',
                                      style: AppTypography.bodyLarge.red.bold(),
                                    )
                                  else
                                    TextSpan(
                                      text: ' (Optional)',
                                      style: AppTypography.bodySmall.copyWith(
                                        color: AppColors.muted,
                                        fontSize: 11.5.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  TextSpan(
                                    text: ':',
                                    style: AppTypography.bodyMedium.medium().copyWith(
                                      color: hasOptionError ? AppColors.red : AppColors.navy,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (hasOptionError) ...[
                              SizedBox(width: 6.w),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.5.h),
                                decoration: const BoxDecoration(
                                  color: AppColors.redBg,
                                  borderRadius: AppRadius.k4,
                                ),
                                child: Text(
                                  'Required',
                                  style: AppTypography.bodySmall.copyWith(
                                    color: AppColors.red,
                                    fontSize: 10.5.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        SizedBox(height: 8.h),

                        // Grid of Values (2 items per row)
                        for (int i = 0; i < option.values.length; i += 2) ...[
                          if (i > 0) SizedBox(height: 8.h),
                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: _buildAddonItem(
                                    option: option,
                                    val: option.values[i],
                                    hasOptionError: hasOptionError,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Expanded(
                                  child: i + 1 < option.values.length
                                      ? _buildAddonItem(
                                          option: option,
                                          val: option.values[i + 1],
                                          hasOptionError: hasOptionError,
                                        )
                                      : const SizedBox.shrink(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    );
                  })(),
                ],
              ],
            ),
          ),
        ),

        // ── Main Price + Add-ons Total Summary Line ──
        // Only visible when enabled AND an add-on item has actually modified the total price
        if (isEnabled && totalAddonPrice > 0) ...[
          SizedBox(height: 12.h),
          const Divider(color: AppColors.border, height: 1, thickness: 1),
          SizedBox(height: 10.h),
          if (mainPrice != null && mainPrice! > 0)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.surfaceBlue,
                borderRadius: AppRadius.k8,
                border: Border.all(
                  color: AppColors.pickabooBlue.withValues(alpha: 0.2),
                  width: 1.w,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '৳${_formatPrice(mainPrice!)}',
                            style: AppTypography.bodySmall.bold().copyWith(
                              color: AppColors.navy,
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            ' (Item) + ',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.muted,
                              fontSize: 11.sp,
                            ),
                          ),
                          Text(
                            '৳${_formatPrice(totalAddonPrice)}',
                            style: AppTypography.bodySmall.bold().copyWith(
                              color: AppColors.pickabooBlue,
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            ' (Add-on)',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.muted,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '= ',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.muted,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '৳${_formatPrice(mainPrice! + totalAddonPrice)}',
                        style: AppTypography.titleSmall.copyWith(
                          color: AppColors.pickabooBlue,
                          fontWeight: FontWeight.w800,
                          fontSize: 13.5.sp,
                        ),
                      ),
                      Text(
                        ' Total',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.muted,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add-ons total',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.navy,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '৳${_formatPrice(totalAddonPrice)}',
                  style: AppTypography.bodyLarge.bold().copyWith(
                    color: AppColors.pickabooBlue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
        ],
      ],
    );
  }
}
