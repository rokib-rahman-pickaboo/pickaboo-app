// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterSortOption {
  final String title;
  final String value;

  const FilterSortOption({required this.title, required this.value});
}

/// Sort + Filter + Grid/List Toggle Control Bar
/// Design matches Pickaboo-App-UI: OutlinedButton.icon cards with
/// border: AppColors.border 1.2, borderRadius: 12, padding: 9v/10h
class FilterSortBar extends StatefulWidget {
  final String viewModeKey;

  final VoidCallback onFilterTap;
  final List<FilterSortOption> sortOptions;
  final ValueChanged<String> onSortSelected;
  final ValueChanged<bool>? onViewModeChanged;

  final int activeFilterCount;

  final String? activeSortLabel;

  final EdgeInsetsGeometry? padding;

  const FilterSortBar({
    super.key,
    required this.viewModeKey,
    required this.onFilterTap,
    required this.sortOptions,
    required this.onSortSelected,
    this.onViewModeChanged,
    this.activeFilterCount = 0,
    this.activeSortLabel,
    this.padding,
  });

  static Future<bool> getSavedViewMode(String viewModeKey) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(viewModeKey) ?? true;
  }

  @override
  State<FilterSortBar> createState() => _FilterSortBarState();
}

class _FilterSortBarState extends State<FilterSortBar> {
  bool _isGridView = true;

  @override
  void initState() {
    super.initState();
    _loadViewMode();
  }

  Future<void> _loadViewMode() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getBool(widget.viewModeKey) ?? true;
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
    await prefs.setBool(widget.viewModeKey, isGrid);
  }

  void _showSortBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.top16,
      ),
      builder: (ctx) {
        return SafeArea(
          top: false,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(ctx).size.height * 0.75,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Header ──
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sort Products By',
                        style: AppTypography.titleLarge,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(ctx),
                        child: Icon(
                          Icons.close_rounded,
                          color: AppColors.navy,
                          size: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1.h, thickness: 1.h, color: AppColors.border),

                // ── Scrollable Sort Options ──
                Flexible(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...widget.sortOptions.map((option) {
                          final isSelected =
                              widget.activeSortLabel == option.title;
                          return ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 0,
                            ),
                            title: Text(
                              option.title,
                              style: isSelected
                                  ? AppTypography.brandAction.copyWith(
                                      fontWeight: FontWeight.w700,
                                    )
                                  : AppTypography.brandAction,
                            ),
                            trailing: isSelected
                                ? Icon(
                                    Icons.check,
                                    color: AppColors.pickabooBlue,
                                    size: 20.sp,
                                  )
                                : null,
                            onTap: () {
                              widget.onSortSelected(option.value);
                              Navigator.pop(ctx);
                            },
                          );
                        }),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasFilters = widget.activeFilterCount > 0;
    final hasSort = widget.activeSortLabel != null;

    const buttonHeight = 31.5;

    return Padding(
      padding: widget.padding ??
          EdgeInsets.only(
            left: AppSpacing.sameGroupItemSpacing.w,
            right: AppSpacing.sameGroupItemSpacing.w,
            top: 0,
          ),
      child: Row(
        children: [
          // ── Sort Button ──
          Expanded(
            child: InkWell(
              onTap: _showSortBottomSheet,
              borderRadius: AppRadius.k8,
              child: Container(
                height: buttonHeight.h,
                decoration: AppDecorations.cardBoxDecoration(
                  borderRadius: AppRadius.k8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.swap_vert_rounded,
                      size: 14.sp,
                      color: hasSort ? AppColors.pickabooBlue : AppColors.navy,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      hasSort ? widget.activeSortLabel! : 'Sort',
                      style: AppTypography.button.copyWith(
                        fontSize: 11.sp,
                        color: hasSort ? AppColors.pickabooBlue : AppColors.navy,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          AppSpacing.sameGroupWidthGap,

          // ── Filter Button ──
          Expanded(
            child: InkWell(
              onTap: widget.onFilterTap,
              borderRadius: AppRadius.k8,
              child: Container(
                height: buttonHeight.h,
                decoration: AppDecorations.cardBoxDecoration(
                  borderRadius: AppRadius.k8,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.tune_rounded,
                      size: 14.sp,
                      color: hasFilters ? AppColors.pickabooBlue : AppColors.navy,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      AppStrings.filter,
                      style: AppTypography.button.copyWith(
                        fontSize: 11.sp,
                        color: hasFilters ? AppColors.pickabooBlue : AppColors.navy,
                      ),
                    ),
                    if (hasFilters) ...[
                      SizedBox(width: 4.w),
                      Container(
                        width: widget.activeFilterCount < 10 ? 16.r : null,
                        height: 16.r,
                        constraints: widget.activeFilterCount < 10
                            ? null
                            : BoxConstraints(minWidth: 16.r),
                        padding: widget.activeFilterCount < 10
                            ? EdgeInsets.zero
                            : EdgeInsets.symmetric(horizontal: 4.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.pickabooBlue,
                          shape: widget.activeFilterCount < 10
                              ? BoxShape.circle
                              : BoxShape.rectangle,
                          borderRadius: widget.activeFilterCount < 10
                              ? null
                              : AppRadius.kFull,
                        ),
                        child: Text(
                          '${widget.activeFilterCount}',
                          textAlign: TextAlign.center,
                          style: AppTypography.bodyTiny.bold().copyWith(
                            color: AppColors.white,
                            fontSize: 9.sp,
                            height: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),

          SizedBox(width: AppSpacing.sameGroupItemSpacing.w),

          // ── Grid/List View Toggle Button ──
          InkWell(
            onTap: () {
              setState(() {
                _isGridView = !_isGridView;
              });
              _saveViewMode(_isGridView);
              widget.onViewModeChanged?.call(_isGridView);
            },
            borderRadius: AppRadius.k8,
            child: Container(
              height: buttonHeight.h,
              width: buttonHeight.h,
              alignment: Alignment.center,
              decoration: AppDecorations.cardBoxDecoration(
                borderRadius: AppRadius.k8,
              ),
              child: Icon(
                _isGridView ? Icons.grid_view_rounded : Icons.view_list_rounded,
                color: AppColors.navy,
                size: 17.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
