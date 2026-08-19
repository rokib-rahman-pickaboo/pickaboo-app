import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_response.freezed.dart';
part 'banner_response.g.dart';

String? _toStringSafe(dynamic value) => value?.toString();

int? _toIntSafe(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return num.tryParse(value)?.toInt();
  return null;
}

@freezed
class BannerResponse with _$BannerResponse {
  const factory BannerResponse({
    @JsonKey(name: "entity_id", fromJson: _toIntSafe)
    int? entityId,
    @JsonKey(name: "title", fromJson: _toStringSafe)
    String? title,
    @JsonKey(name: "image", fromJson: _toStringSafe)
    String? image,
    @JsonKey(name: "image_url", fromJson: _toStringSafe)
    String? imageUrl,
    @JsonKey(name: "responsive_image", fromJson: _toStringSafe)
    String? responsiveImage,
    @JsonKey(name: "responsive_image_url", fromJson: _toStringSafe)
    String? responsiveImageUrl,
    @JsonKey(name: "link", fromJson: _toStringSafe)
    String? link,
    @JsonKey(name: "link_type", fromJson: _toStringSafe)
    String? linkType,
    @JsonKey(name: "link_value", fromJson: _toStringSafe)
    String? linkValue,
    @JsonKey(name: "resolved_link", fromJson: _toStringSafe)
    String? resolvedLink,
    @JsonKey(name: "is_active", fromJson: _toStringSafe)
    String? isActive,
    @JsonKey(name: "identifier", fromJson: _toStringSafe)
    String? identifier,
    @JsonKey(name: "category_id", fromJson: _toIntSafe)
    int? categoryId,
    @JsonKey(name: "is_category", fromJson: _toStringSafe)
    String? isCategory,
    @JsonKey(name: "sort_order", fromJson: _toIntSafe)
    int? sortOrder,
    @JsonKey(name: "column_count", fromJson: _toIntSafe)
    int? columnCount,
    @JsonKey(name: "image_position", fromJson: _toStringSafe)
    String? imagePosition,
    @JsonKey(name: "for_homepage", fromJson: _toStringSafe)
    String? forHomepage,
    @JsonKey(name: "category")
    Category? category,
  }) = _BannerResponse;

  factory BannerResponse.fromJson(Map<String, dynamic> json) => _$BannerResponseFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: "id", fromJson: _toIntSafe)
    int? id,
    @JsonKey(name: "name", fromJson: _toStringSafe)
    String? name,
    @JsonKey(name: "slug", fromJson: _toStringSafe)
    String? slug,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
