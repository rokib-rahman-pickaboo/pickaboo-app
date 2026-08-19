import 'package:pickaboo/data/model/filter/filter_models.dart';
import 'package:pickaboo/domain/entity/search/search_facet_entity.dart';
import 'package:pickaboo/domain/entity/search/search_result_entity.dart';
import 'package:flutter/foundation.dart';

class FilterConverter {
  static const Set<String> _categoryAttributes = {
    'category_ids',
    'category_id',
    'categories',
  };

  static List<FilterCategory> fromSearchFacets(
    List<SearchFacetEntity> facets, {
    List<SearchCategoryEntity> categories = const [],
  }) {
    final titlesById = <String, String>{
      for (final c in categories)
        if (c.id.isNotEmpty && c.title.isNotEmpty) c.id: c.title,
    };
    return facets.map((facet) => _convertFacet(facet, titlesById)).toList();
  }

  static FilterCategory _convertFacet(
    SearchFacetEntity facet,
    Map<String, String> titlesById,
  ) {
    final resolveTitles =
        titlesById.isNotEmpty &&
        _categoryAttributes.contains(facet.attribute.toLowerCase());

    return FilterCategory(
      filterCode: facet.attribute,
      filterName: facet.label.isNotEmpty ? facet.label : facet.attribute,
      items: facet.buckets
          .map((bucket) => _convertBucket(bucket, resolveTitles, titlesById))
          .toList(),
    );
  }

  static FilterOption _convertBucket(
    FacetBucketEntity bucket,
    bool resolveTitles,
    Map<String, String> titlesById,
  ) {
    final fallback = bucket.label.isNotEmpty ? bucket.label : bucket.value;
    return FilterOption(
      value: bucket.value,
      label: resolveTitles ? (titlesById[bucket.value] ?? fallback) : fallback,
      count: bucket.count,
      isSelected: false,
    );
  }

  static Map<String, String> toSearchaniseFilters(
    Map<String, List<String>> selectedFilters,
  ) {
    debugPrint('🔧 [CONVERTER] Input filters: $selectedFilters');
    final searchaniseFilters = <String, String>{};

    selectedFilters.forEach((key, values) {
      if (values.isNotEmpty) {
        final joinedValues = values.join('|');
        searchaniseFilters['restrictBy[$key]'] = joinedValues;
        debugPrint(
          '🔧 [CONVERTER] Converted $key: ${values.length} values -> restrictBy[$key]=$joinedValues',
        );
      }
    });

    debugPrint('🔧 [CONVERTER] Output: $searchaniseFilters');
    return searchaniseFilters;
  }

  static final RegExp _restrictByPattern = RegExp(r'^restrictBy\[(.+)\]$');

  static Map<String, List<String>> fromSearchaniseFilters(
    Map<String, String> filters,
  ) {
    final selectedFilters = <String, List<String>>{};

    filters.forEach((key, value) {
      final code = _restrictByPattern.firstMatch(key)?.group(1) ?? key;
      final values = value.split('|').where((v) => v.isNotEmpty).toList();
      if (values.isNotEmpty) {
        selectedFilters[code] = values;
      }
    });

    return selectedFilters;
  }
}
