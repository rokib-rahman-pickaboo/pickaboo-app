// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';

class AddonItem {
  final String id;
  final String name;
  final int price;
  final String? details;

  AddonItem({
    required this.id,
    required this.name,
    required this.price,
    this.details,
  });
}

class ProductAddonSubsection extends StatefulWidget {
  final String title;
  final List<AddonItem> items;
  final String? selectedItemId;
  final Function(String?) onItemSelected;
  final bool initiallyExpanded;
  final bool showError;

  const ProductAddonSubsection({
    super.key,
    required this.title,
    required this.items,
    this.selectedItemId,
    required this.onItemSelected,
    this.initiallyExpanded = true,
    this.showError = false,
  });

  @override
  State<ProductAddonSubsection> createState() => _ProductAddonSubsectionState();
}

class _ProductAddonSubsectionState extends State<ProductAddonSubsection> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded || widget.showError || widget.selectedItemId != null;
  }

  @override
  void didUpdateWidget(ProductAddonSubsection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showError && !oldWidget.showError) {
      setState(() => _isExpanded = true);
    }
  }

  String _cleanTitle(String rawTitle) {
    return rawTitle.replaceAll(RegExp(r'[-–—:]\s*$'), '').trim();
  }

  AddonItem? get _selectedItem {
    if (widget.selectedItemId == null) return null;
    try {
      return widget.items.firstWhere((i) => i.id == widget.selectedItemId);
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cleanTitle = _cleanTitle(widget.title);
    final selected = _selectedItem;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: widget.showError
              ? AppColors.red
              : (selected != null ? AppColors.pickabooBlue.withValues(alpha: 0.4) : AppColors.border),
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── COMPACT HEADER ──
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            borderRadius: BorderRadius.circular(10.r),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: Row(
                children: [
                  Container(
                    width: 7.w,
                    height: 7.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected != null
                          ? AppColors.pickabooBlue
                          : AppColors.mutedLight,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          cleanTitle,
                          style: AppTypography.cardTitle.copyWith(
                            fontSize: 12.5.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.navy,
                          ),
                        ),
                        if (selected != null) ...[
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.5.h),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceBlue,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              '৳${selected.price}',
                              style: AppTypography.brandActionText.copyWith(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: AppColors.muted,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          ),

          // ── COMPACT MICRO-CHIPS LIST ──
          if (_isExpanded) ...[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 8.h),
              child: Row(
                children: [
                  for (int i = 0; i < widget.items.length; i++) ...[
                    if (i > 0) SizedBox(width: 8.w),
                    _buildMicroChip(widget.items[i]),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMicroChip(AddonItem item) {
    final isSelected = widget.selectedItemId == item.id;
    final hasItemError = widget.showError && !isSelected;

    return GestureDetector(
      onTap: () {
        widget.onItemSelected(isSelected ? null : item.id);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.surfaceBlue : AppColors.pageBg,
          border: Border.all(
            color: isSelected
                ? AppColors.pickabooBlue
                : hasItemError
                    ? AppColors.red
                    : AppColors.border,
            width: isSelected || hasItemError ? 1.3.w : 1.w,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected
                  ? Icons.check_circle_rounded
                  : Icons.radio_button_unchecked_rounded,
              color: isSelected ? AppColors.green : AppColors.mutedLight,
              size: 14.sp,
            ),
            SizedBox(width: 6.w),
            Text(
              item.name,
              style: isSelected
                  ? AppTypography.cardTitle.copyWith(
                      fontSize: 11.5.sp,
                      color: AppColors.pickabooBlue,
                      fontWeight: FontWeight.w600,
                    )
                  : AppTypography.bodyRegular.copyWith(
                      fontSize: 11.5.sp,
                      color: AppColors.navy,
                    ),
            ),
            SizedBox(width: 6.w),
            Text(
              '${item.price} ৳',
              style: AppTypography.brandActionText.copyWith(
                fontSize: 11.sp,
                fontWeight: FontWeight.w700,
                color: isSelected ? AppColors.pickabooBlue : AppColors.navy,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
