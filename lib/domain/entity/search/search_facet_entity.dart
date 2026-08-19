class SearchFacetEntity {
  final String attribute;
  final String label;
  final List<FacetBucketEntity> buckets;

  const SearchFacetEntity({
    required this.attribute,
    required this.label,
    required this.buckets,
  });
}

class FacetBucketEntity {
  final String value;
  final String label;
  final int count;

  const FacetBucketEntity({
    required this.value,
    required this.label,
    required this.count,
  });
}
