import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/search/search_facet_entity.dart';

class SearchResultEntity {
  final String? correctedQuery;
  final int totalItems;
  final List<ProductEntity> products;
  final List<SearchFacetEntity> facets;
  final List<String> suggestions;
  final List<SearchCategoryEntity> categories;

  const SearchResultEntity({
    this.correctedQuery,
    required this.totalItems,
    required this.products,
    required this.facets,
    required this.suggestions,
    required this.categories,
  });
}

class SearchCategoryEntity {
  final String id;
  final String title;
  final String link;
  final String? imageLink;
  final String? description;

  const SearchCategoryEntity({
    required this.id,
    required this.title,
    required this.link,
    this.imageLink,
    this.description,
  });
}
