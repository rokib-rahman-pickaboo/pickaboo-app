import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/filter_sort_bar.dart';

class FilterButton extends StatelessWidget {
  static const String viewModeKey = 'search_view_mode_is_grid';

  static Future<bool> getSavedViewMode() =>
      FilterSortBar.getSavedViewMode(viewModeKey);

  static final List<SortOptionItem> sortOptions = [
    SortOptionItem(
      id: '1',
      title: 'Newest First',
      param: 'created',
      orderBy: 'desc',
      isDefault: true,
    ),
    SortOptionItem(
      id: '2',
      title: 'Oldest First',
      param: 'created',
      orderBy: 'asc',
    ),
    SortOptionItem(id: '3', title: 'Name A to Z', param: 'title', orderBy: 'asc'),
    SortOptionItem(
      id: '4',
      title: 'Name Z to A',
      param: 'title',
      orderBy: 'desc',
    ),
    SortOptionItem(
      id: '5',
      title: 'Price High to Low',
      param: 'price',
      orderBy: 'desc',
    ),
    SortOptionItem(
      id: '6',
      title: 'Price Low to High',
      param: 'price',
      orderBy: 'asc',
    ),
    SortOptionItem(
      id: '7',
      title: 'Position',
      param: 'position',
      orderBy: 'asc',
    ),
    SortOptionItem(
      id: '8',
      title: 'Express Delivery',
      param: 'express',
      orderBy: 'desc',
    ),
  ];

  final VoidCallback onFilterTap;
  final ValueChanged<bool>? onViewModeChanged;

  final ValueChanged<SortOptionItem>? onSortSelected;

  final int activeFilterCount;

  final String? activeSortLabel;

  const FilterButton({
    super.key,
    required this.onFilterTap,
    this.onViewModeChanged,
    this.onSortSelected,
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
          FilterSortOption(title: option.title, value: option.id),
      ],
      onSortSelected: (id) {
        final option = sortOptions.firstWhere((option) => option.id == id);
        context.read<SearchBloc>().add(
          SearchEvent.searchSortApplied(
            sortBy: option.param,
            sortOrder: option.orderBy,
          ),
        );
        onSortSelected?.call(option);
      },
      onViewModeChanged: onViewModeChanged,
      activeFilterCount: activeFilterCount,
      activeSortLabel: activeSortLabel,
    );
  }
}

class SortOptionItem {
  final String id;
  final String title;
  final String param;
  final String orderBy;
  final bool isDefault;

  SortOptionItem({
    required this.id,
    required this.title,
    required this.param,
    required this.orderBy,
    this.isDefault = false,
  });
}
