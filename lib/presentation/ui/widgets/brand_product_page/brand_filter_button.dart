import 'package:flutter/material.dart';
import 'package:pickaboo/domain/entity/brand_products/brand_products_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/filter_sort_bar.dart';

class BrandFilterButton extends StatelessWidget {
  static const String viewModeKey = 'brand_view_mode_is_grid';

  static Future<bool> getSavedViewMode() =>
      FilterSortBar.getSavedViewMode(viewModeKey);

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
    );
  }
}
