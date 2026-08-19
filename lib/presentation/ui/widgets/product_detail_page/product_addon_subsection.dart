import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

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
    this.initiallyExpanded = false,
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
    _isExpanded = widget.initiallyExpanded || widget.showError;
  }

  @override
  void didUpdateWidget(ProductAddonSubsection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showError && !oldWidget.showError) {
      setState(() => _isExpanded = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Container(
      decoration: BoxDecoration(
        color: colors.white,
        border: Border.all(color: colors.borderColor, width: 1.w),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12.r),
              bottom: _isExpanded ? Radius.zero : Radius.circular(12.r),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12.r),
                  bottom: _isExpanded ? Radius.zero : Radius.circular(12.r),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: colors.white,
                    ),
                    child: Icon(
                      Icons.settings_suggest_outlined,
                      size: 16.sp,
                      color: colors.primary,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: textStyle.bodyMediumBold.copyWith(
                        color: colors.white,
                      ),
                    ),
                  ),
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: colors.white,
                    size: 24.sp,
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded)
            Divider(color: colors.borderColor, height: 1.h, thickness: 1.h),

          if (_isExpanded)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (int i = 0; i < widget.items.length; i++) ...[
                      if (i > 0) SizedBox(width: 8.w),
                      SizedBox(
                        width: 200.w,
                        child: _buildGridCell(i, colors, textStyle),
                      ),
                    ],
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildGridCell(
    int index,
    AppColors colors,
    AppTextStyles textStyle,
  ) {
    final item = widget.items[index];
    final isSelected = widget.selectedItemId == item.id;

    return _buildAddonItem(
      item: item,
      isSelected: isSelected,
      onTap: () {
        widget.onItemSelected(isSelected ? null : item.id);
      },
      colors: colors,
      textStyle: textStyle,
    );
  }

  Widget _buildAddonItem({
    required AddonItem item,
    required bool isSelected,
    required VoidCallback onTap,
    required AppColors colors,
    required AppTextStyles textStyle,
  }) {
    final hasItemError = widget.showError && !isSelected;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected
              ? colors.linkBlue.withValues(alpha: 0.03)
              : colors.white,
          border: Border.all(
            color: isSelected
                ? colors.linkBlue
                : hasItemError
                    ? colors.red
                    : colors.borderColor,
            width: isSelected || hasItemError ? 1.2.w : 1.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: colors.linkBlue.withValues(alpha: 0.08),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : hasItemError
                  ? [
                      BoxShadow(
                        color: colors.red.withValues(alpha: 0.06),
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
                children: [
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.white,
                      border: Border.all(
                        color: isSelected
                            ? colors.linkBlue
                            : colors.borderColor,
                        width: 1.w,
                      ),
                    ),
                    child: Icon(
                      Icons.settings_outlined,
                      color: isSelected
                          ? colors.linkBlue
                          : colors.graySmallLight,
                      size: 12.sp,
                    ),
                  ),
                  if (isSelected)
                    Positioned(
                      right: -1.w,
                      bottom: -1.h,
                      child: Container(
                        padding: EdgeInsets.all(1.5.w),
                        decoration: BoxDecoration(
                          color: colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: colors.white, width: 1.w),
                        ),
                        child: Icon(
                          Icons.check,
                          color: colors.white,
                          size: 8.sp,
                        ),
                      ),
                    ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                width: 1.2.w,
                decoration: BoxDecoration(
                  color: isSelected ? colors.linkBlue : colors.borderColor,
                  borderRadius: BorderRadius.circular(1.w),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+${item.price} ৳',
                      style: textStyle.bodyMediumBold.copyWith(
                        color: isSelected ? colors.linkBlue : colors.textMedium,
                        fontSize: 11.sp,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      item.name,
                      style: textStyle.bodySmall.copyWith(
                        color: colors.text,
                        fontSize: 10.sp,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (item.details != null && item.details!.isNotEmpty) ...[
                      SizedBox(height: 2.h),
                      Text(
                        item.details!,
                        style: textStyle.bodyTiny.copyWith(
                          color: colors.textLight,
                          fontSize: 9.sp,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
