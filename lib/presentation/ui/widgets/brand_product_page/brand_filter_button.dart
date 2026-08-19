import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/brand_products/brand_products_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BrandFilterButton extends StatefulWidget {
  static const String viewModeKey = 'category_view_mode_is_grid';

  static Future<bool> getSavedViewMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(viewModeKey) ?? true;
  }

  final VoidCallback onFilterTap;
  final List<SortOptionEntity> sortOptions;
  final Function(String sortValue) onSortSelected;
  final ValueChanged<bool>? onViewModeChanged;

  final int activeFilterCount;

  final String? activeSortLabel;

  const BrandFilterButton({
    super.key,
    required this.onFilterTap,
    required this.sortOptions,
    required this.onSortSelected,
    this.onViewModeChanged,
    this.activeFilterCount = 0,
    this.activeSortLabel,
  });

  @override
  State<BrandFilterButton> createState() => _BrandFilterButtonState();
}

class _BrandFilterButtonState extends State<BrandFilterButton> {
  bool _isGridView = true;

  @override
  void initState() {
    super.initState();
    _loadViewMode();
  }

  Future<void> _loadViewMode() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getBool(BrandFilterButton.viewModeKey) ?? true;
    if (saved != _isGridView) {
      if (mounted) {
        setState(() {
          _isGridView = saved;
        });
        widget.onViewModeChanged?.call(_isGridView);
      }
    }
  }

  Future<void> _saveViewMode(bool isGrid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(BrandFilterButton.viewModeKey, isGrid);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;
    final hasFilters = widget.activeFilterCount > 0;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: PopupMenuButton<String>(
              offset: Offset(0, 48.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              color: colors.white,
              elevation: 8,
              itemBuilder: (context) {
                return widget.sortOptions.map((option) {
                  return PopupMenuItem<String>(
                    value: option.value,
                    padding: EdgeInsets.zero,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.w,
                      ),
                      child: Text(
                        option.title,
                        style: textStyles.bodyMedium.copyWith(
                          color: colors.text,
                        ),
                      ),
                    ),
                  );
                }).toList();
              },
              onSelected: (String value) {
                widget.onSortSelected(value);
              },
              child: Container(
                height: 38.h,
                decoration: BoxDecoration(
                  color: colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: colors.gray.withValues(alpha: 0.3),
                    width: 1.w,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/new/svg/short_icon.svg',
                      width: 14.w,
                      height: 14.h,
                      colorFilter: ColorFilter.mode(
                        colors.text,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Flexible(
                      child: Text(
                        widget.activeSortLabel ?? "Sort",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textStyles.bodyMedium.copyWith(
                          color: widget.activeSortLabel != null
                              ? colors.primary
                              : colors.text,
                          fontWeight: widget.activeSortLabel != null
                              ? FontWeight.w600
                              : null,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: colors.text,
                      size: 20.sp,
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: InkWell(
              onTap: widget.onFilterTap,
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                height: 38.h,
                decoration: BoxDecoration(
                  color: hasFilters
                      ? colors.primary.withValues(alpha: 0.08)
                      : colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: hasFilters
                        ? colors.primary
                        : colors.gray.withValues(alpha: 0.3),
                    width: 1.w,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/new/svg/filter_icon.svg',
                      width: 14.w,
                      height: 14.h,
                      colorFilter: ColorFilter.mode(
                        hasFilters ? colors.primary : colors.text,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "Filter",
                      style: textStyles.bodyMedium.copyWith(
                        color: hasFilters ? colors.primary : colors.text,
                        fontWeight: hasFilters ? FontWeight.w600 : null,
                      ),
                    ),
                    if (hasFilters) ...[
                      SizedBox(width: 6.w),
                      Container(
                        constraints: BoxConstraints(minWidth: 18.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 1.h,
                        ),
                        decoration: BoxDecoration(
                          color: colors.primary,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          '${widget.activeFilterCount}',
                          textAlign: TextAlign.center,
                          style: textStyles.caption.copyWith(
                            color: colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),

          SizedBox(width: 12.w),

          GestureDetector(
            onTap: () {
              setState(() {
                _isGridView = !_isGridView;
              });
              _saveViewMode(_isGridView);
              widget.onViewModeChanged?.call(_isGridView);
            },
            child: Center(
              child: SvgPicture.asset(
                _isGridView
                    ? 'assets/new/svg/grid_icon.svg'
                    : 'assets/new/svg/list_icon.svg',
                width: 30.w,
                height: 30.h,
                colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
