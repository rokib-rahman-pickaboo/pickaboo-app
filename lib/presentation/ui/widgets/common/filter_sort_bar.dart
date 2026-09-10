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

  const FilterSortBar({
    super.key,
    required this.viewModeKey,
    required this.onFilterTap,
    required this.sortOptions,
    required this.onSortSelected,
    this.onViewModeChanged,
    this.activeFilterCount = 0,
    this.activeSortLabel,
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
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
                        style: AppTypography.pageTitle,
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
                                  ? AppTypography.brandActionText.copyWith(
                                      fontWeight: FontWeight.w700,
                                    )
                                  : AppTypography.brandActionText,
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

    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.sameGroupItemSpacing.w,
        right: AppSpacing.sameGroupItemSpacing.w,
        top: AppSpacing.sameGroupItemSpacing.h,
      ),
      child: Row(
        children: [
          // ── Sort Button ──
          Expanded(
            child: OutlinedButton.icon(
              onPressed: _showSortBottomSheet,
              icon: Icon(
                Icons.swap_vert_rounded,
                size: 16.sp,
                color: hasSort ? AppColors.pickabooBlue : AppColors.navy,
              ),
              label: Text(
                hasSort ? widget.activeSortLabel! : 'Sort',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.brandActionText,
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 10.w),
                side: BorderSide(color: AppColors.border, width: 1.2.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),

          SizedBox(width: AppSpacing.sameGroupItemSpacing.w),

          // ── Filter Button ──
          Expanded(
            child: OutlinedButton.icon(
              onPressed: widget.onFilterTap,
              icon: Icon(
                Icons.tune_rounded,
                size: 16.sp,
                color: hasFilters ? AppColors.pickabooBlue : AppColors.navy,
              ),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Filter',
                    style: AppTypography.brandActionText,
                  ),
                  if (hasFilters) ...[
                    SizedBox(width: 5.w),
                    Container(
                      constraints: BoxConstraints(minWidth: 16.w),
                      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                      decoration: BoxDecoration(
                        color: AppColors.pickabooBlue,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        '${widget.activeFilterCount}',
                        textAlign: TextAlign.center,
                        style: AppTypography.buttonPrimary,
                      ),
                    ),
                  ],
                ],
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: hasFilters
                    ? AppColors.pickabooBlue.withValues(alpha: 0.06)
                    : AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 10.w),
                side: BorderSide(
                  color: hasFilters ? AppColors.pickabooBlue : AppColors.border,
                  width: 1.2.w,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              padding: EdgeInsets.all(9.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.border, width: 1.2.w),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.navy.withValues(alpha: 0.02),
                    blurRadius: 4.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              child: Icon(
                _isGridView ? Icons.grid_view_rounded : Icons.view_list_rounded,
                color: AppColors.navy,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
