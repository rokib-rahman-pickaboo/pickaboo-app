import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_banner_response.freezed.dart';
part 'product_banner_response.g.dart';

@freezed
class ProductBannerResponse with _$ProductBannerResponse {
  const factory ProductBannerResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "sort_order") int? sortOrder,
    @JsonKey(name: "status") int? status,
  }) = _ProductBannerResponse;

  factory ProductBannerResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductBannerResponseFromJson(json);
}
