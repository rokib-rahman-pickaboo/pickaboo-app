import 'package:pickaboo/core/color/app_colors.dart';
// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/utils/html_extensions.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

/// ============================================================================
/// 🏷️ SPECIAL CATEGORY FILTER BOTTOM SHEET
/// 2-Column split layout:
/// - Header: "Filters" title (left) & "Clear All" action (right)
/// - Left Sidebar: Filter Attribute Categories (strict itemExtent: 48.h)
/// - Middle Section Height = Attributes Count * 48.h (zero clipping & zero extra whitespace)
/// - Right Pane: Options Checkbox list with persistent visible scrollbar
/// - Bottom Bar: Full-width "Apply Filters" button directly below middle section
/// ============================================================================
class CategoryFilterBottomSheet extends StatefulWidget {
  final List<FilterAttributeEntity> filterableAttributes;
  final Function(Map<String, List<String>>) onApply;
  final Map<String, List<String>>? initialFilters;
  final String? initialExpandedFilterCode;

  const CategoryFilterBottomSheet({
    super.key,
    required this.filterableAttributes,
    required this.onApply,
    this.initialFilters,
    this.initialExpandedFilterCode,
  });

  @override
  State<CategoryFilterBottomSheet> createState() =>
      _CategoryFilterBottomSheetState();
}

class _CategoryFilterBottomSheetState extends State<CategoryFilterBottomSheet> {
  late final Map<String, List<String>> _selectedFilters;
  int _selectedTabIndex = 0;

  late final List<FilterAttributeEntity> _validAttributes;
  final ScrollController _optionsScrollController = ScrollController();
  final ScrollController _categoryScrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _validAttributes = widget.filterableAttributes
        .where((a) => a.items.isNotEmpty && a.filterCode.trim().isNotEmpty)
        .toList();

    _selectedFilters = {};
    if (widget.initialFilters != null) {
      widget.initialFilters!.forEach((key, value) {
        if (value.isNotEmpty) {
          _selectedFilters[key] = List.from(value);
        }
      });
    }

    if (widget.initialExpandedFilterCode != null) {
      final index = _validAttributes.indexWhere(
        (a) => a.filterCode == widget.initialExpandedFilterCode,
      );
      if (index != -1) {
        _selectedTabIndex = index;
      }
    }
  }

  @override
  void dispose() {
    _optionsScrollController.dispose();
    _categoryScrollController.dispose();
    super.dispose();
  }

  void _apply() {
    widget.onApply({
      for (final entry in _selectedFilters.entries)
        entry.key: List<String>.from(entry.value),
    });
    Navigator.of(context).pop();
  }

  void _clearAll() {
    setState(() {
      _selectedFilters.clear();
    });
  }

  void _toggleOption(String filterCode, String value) {
    setState(() {
      final list = _selectedFilters.putIfAbsent(filterCode, () => []);
      if (list.contains(value)) {
        list.remove(value);
        if (list.isEmpty) {
          _selectedFilters.remove(filterCode);
        }
      } else {
        list.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_validAttributes.isEmpty) {
      return Material(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        child: SizedBox(
          height: 180.h,
          child: Center(
            child: Text('No filters available', style: AppTypography.titleSmall),
          ),
        ),
      );
    }

    if (_selectedTabIndex >= _validAttributes.length) {
      _selectedTabIndex = 0;
    }

    final activeAttribute = _validAttributes[_selectedTabIndex];
    final activeSelectedValues =
        _selectedFilters[activeAttribute.filterCode] ?? const [];

    final int attributesCount = _validAttributes.length;
    final double itemHeight = 48.h;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double nonMiddleHeight = 118.h;
    final double minMiddleHeight =
        (screenHeight * 0.40 - nonMiddleHeight)
            .clamp(itemHeight, screenHeight * 0.40);
    final double maxMiddleHeight =
        (screenHeight * 0.80 - nonMiddleHeight)
            .clamp(minMiddleHeight, screenHeight * 0.80);
    final double computedMiddleHeight = attributesCount * itemHeight;
    final double middleSectionHeight =
        computedMiddleHeight.clamp(minMiddleHeight, maxMiddleHeight);
    final bool isClamped = computedMiddleHeight > maxMiddleHeight;

    final totalSelected = _selectedFilters.values.fold<int>(
      0,
      (sum, list) => sum + list.length,
    );

    return Material(
      color: AppColors.white,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── 1. HEADER (Filters / Clear All) ──
            _buildHeader(context, totalSelected),

            // ── 2. MIDDLE TWO-COLUMN SECTION (Attributes Count * 48.h) ──
            SizedBox(
              height: middleSectionHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── LEFT SIDEBAR (Tabs with itemExtent: 48.h) ──
                  _buildLeftSidebar(context, isClamped),

                  // Divider between columns
                  Container(
                    width: 1.w,
                    color: AppColors.border,
                  ),

                  // ── RIGHT PANE (Checkboxes with persistent visible scrollbar) ──
                  Expanded(
                    child: _buildRightOptionsPane(
                      activeAttribute,
                      activeSelectedValues,
                    ),
                  ),
                ],
              ),
            ),

            // ── 3. BOTTOM BAR (Apply Filters Button) ──
            _buildBottomBar(context, totalSelected),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, int totalSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Filters', style: AppTypography.titleLarge),
          if (totalSelected > 0)
            GestureDetector(
              onTap: _clearAll,
              behavior: HitTestBehavior.opaque,
              child: Text('Clear All', style: AppTypography.brandAction),
            ),
        ],
      ),
    );
  }

  Widget _buildLeftSidebar(BuildContext context, bool isClamped) {
    return Container(
      width: 125.w,
      color: AppColors.white,
      child: ListView.builder(
        controller: _categoryScrollController,
        padding: EdgeInsets.zero,
        itemExtent: 48.h,
        itemCount: _validAttributes.length,
        physics: isClamped
            ? const ClampingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final attr = _validAttributes[index];
          final isSelected = index == _selectedTabIndex;
          final count = _selectedFilters[attr.filterCode]?.length ?? 0;

          final bool isWhite = (_validAttributes.length - 1 - index).isEven;
          final Color backgroundColor = isSelected
              ? AppColors.surfaceBlue
              : (isWhite ? AppColors.white : AppColors.pageBg);

          return InkWell(
            onTap: () {
              setState(() {
                _selectedTabIndex = index;
              });
              if (_optionsScrollController.hasClients) {
                _optionsScrollController.jumpTo(0);
              }
            },
            child: Container(
              height: 48.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border(
                  left: BorderSide(
                    color: isSelected
                        ? AppColors.pickabooBlue
                        : AppColors.transparent,
                    width: 3.5.w,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      attr.filterName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: isSelected
                          ? AppTypography.titleSmall.withColor(AppColors.pickabooBlue)
                          : AppTypography.bodyMedium.withColor(AppColors.navy),
                    ),
                  ),
                  if (count > 0)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.pickabooBlue,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        '$count',
                        style: AppTypography.button,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRightOptionsPane(
    FilterAttributeEntity activeAttribute,
    List<String> activeSelectedValues,
  ) {
    return Container(
      color: AppColors.white,
      child: RawScrollbar(
        controller: _optionsScrollController,
        thumbVisibility: true,
        trackVisibility: false,
        thickness: 4.w,
        radius: Radius.circular(3.r),
        thumbColor: AppColors.pickabooBlue,
        child: ListView.builder(
          controller: _optionsScrollController,
          padding: EdgeInsets.zero,
          itemCount: activeAttribute.items.length,
          itemBuilder: (context, index) {
            final item = activeAttribute.items[index];
            final isChecked =
                activeSelectedValues.contains(item.value.toString());
            final bool isWhite =
                (activeAttribute.items.length - 1 - index).isEven;
            final Color itemBg =
                isWhite ? AppColors.white : AppColors.pageBg;

            return InkWell(
              onTap: () => _toggleOption(
                activeAttribute.filterCode,
                item.value.toString(),
              ),
              child: Container(
                color: itemBg,
                padding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 12.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Checkbox
                    Container(
                      width: 18.w,
                      height: 18.w,
                      decoration: BoxDecoration(
                        color: isChecked
                            ? AppColors.pickabooBlue
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(3.r),
                        border: Border.all(
                          color: isChecked
                              ? AppColors.pickabooBlue
                              : AppColors.border,
                          width: 1.4.w,
                        ),
                      ),
                      child: isChecked
                          ? Icon(
                              Icons.check,
                              size: 13.sp,
                              color: AppColors.white,
                            )
                          : null,
                    ),
                    SizedBox(width: 12.w),
                    // Option label
                    Expanded(
                      child: Text(
                        item.label.removeHtmlTags,
                        style: isChecked
                            ? AppTypography.titleSmall.withColor(AppColors.pickabooBlue)
                            : AppTypography.bodyMedium.withColor(AppColors.navy),
                      ),
                    ),
                    if (item.count.toString().isNotEmpty &&
                        item.count.toString() != '0')
                      Text(
                        '(${item.count})',
                        style: AppTypography.bodyTiny,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, int totalSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      ),
      child: AppButton.primary(
        text: totalSelected > 0
            ? 'Apply Filters ($totalSelected)'
            : 'Apply Filters',
        isFullWidth: true,
        height: 46.h,
        onPressed: _apply,
      ),
    );
  }
}
