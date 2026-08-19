import 'package:flutter/material.dart';
import 'package:pickaboo/domain/entity/search/search_facet_entity.dart';
import 'package:pickaboo/domain/entity/search/search_result_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/filter_chip_row.dart';
import 'package:pickaboo/core/utils/html_extensions.dart';

class SearchFilterChips extends StatelessWidget {
  final Map<String, List<String>> appliedFilters;

  final List<SearchFacetEntity> facets;

  final List<SearchCategoryEntity> searchCategories;

  final ValueChanged<Map<String, List<String>>> onChanged;

  const SearchFilterChips({
    super.key,
    required this.appliedFilters,
    required this.facets,
    required this.onChanged,
    this.searchCategories = const [],
  });

  static const Set<String> _categoryAttributes = {
    'category_ids',
    'category_id',
    'categories',
  };

  String _labelFor(String filterCode, String value) {
    if (_categoryAttributes.contains(filterCode.toLowerCase())) {
      for (final category in searchCategories) {
        if (category.id == value && category.title.isNotEmpty) {
          return category.title.removeHtmlTags;
        }
      }
    }

    for (final facet in facets) {
      if (facet.attribute != filterCode) continue;
      for (final bucket in facet.buckets) {
        if (bucket.value == value) {
          return (bucket.label.isNotEmpty ? bucket.label : value).removeHtmlTags;
        }
      }
    }
    return value.removeHtmlTags;
  }

  Map<String, List<String>> _without(String filterCode, String value) {
    final remaining = <String, List<String>>{
      for (final entry in appliedFilters.entries)
        entry.key: List<String>.from(entry.value),
    };
    remaining[filterCode]?.remove(value);
    if (remaining[filterCode]?.isEmpty ?? false) {
      remaining.remove(filterCode);
    }
    return remaining;
  }

  @override
  Widget build(BuildContext context) {
    if (appliedFilters.isEmpty) {
      return const SizedBox.shrink();
    }

    return FilterChipRow(
      chips: [
        for (final entry in appliedFilters.entries)
          for (final value in entry.value)
            FilterChipData(
              label: _labelFor(entry.key, value),
              isSelected: true,
              trailingIcon: Icons.close,
              onTap: () => onChanged(_without(entry.key, value)),
            ),
        FilterChipData(
          label: 'Clear all',
          isSelected: false,
          onTap: () => onChanged(const {}),
        ),
      ],
    );
  }
}
