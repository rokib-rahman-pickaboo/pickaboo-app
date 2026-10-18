import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/filter_sort_bar.dart';

class CategoryFilterButton extends StatelessWidget {
  static const String viewModeKey = 'special_category_view_mode_is_grid';

  static Future<bool> getSavedViewMode() =>
      FilterSortBar.getSavedViewMode(viewModeKey);

  final VoidCallback onFilterTap;
  final List<SortOptionEntity> sortOptions;
  final Function(String sortValue) onSortSelected;
  final ValueChanged<bool>? onViewModeChanged;

  final int activeFilterCount;

  final String? activeSortLabel;

  final bool hasTopBanner;

  const CategoryFilterButton({
    super.key,
    required this.onFilterTap,
    required this.sortOptions,
    required this.onSortSelected,
    this.onViewModeChanged,
    this.activeFilterCount = 0,
    this.activeSortLabel,
    this.hasTopBanner = false,
  });

  @override
  Widget build(BuildContext context) {
    return FilterSortBar(
      viewModeKey: viewModeKey,
      onFilterTap: onFilterTap,
      sortOptions: [
        for (final option in sortOptions)
          FilterSortOption(title: option.title, value: option.value),
      ],
      onSortSelected: onSortSelected,
      onViewModeChanged: onViewModeChanged,
      activeFilterCount: activeFilterCount,
      activeSortLabel: activeSortLabel,
      padding: EdgeInsets.only(
        left: AppSpacing.sameGroupItemSpacing.w,
        right: AppSpacing.sameGroupItemSpacing.w,
        top: hasTopBanner ? AppSpacing.groupToGroupSpacing.h : 0,
      ),
    );
  }
}
