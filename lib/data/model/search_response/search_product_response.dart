import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_product_response.freezed.dart';
part 'search_product_response.g.dart';

@freezed
class SearchProductResponse with _$SearchProductResponse {
  const factory SearchProductResponse({
    @JsonKey(name: 'product_id') String? productId,
    @JsonKey(name: 'original_product_id') String? originalProductId,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'link') String? link,
    @JsonKey(name: 'price') String? price,
    @JsonKey(name: 'list_price') String? listPrice,
    @JsonKey(name: 'quantity') String? quantity,
    @JsonKey(name: 'product_code') String? productCode,
    @JsonKey(name: 'image_link') String? imageLink,
    @JsonKey(name: 'total_reviews') String? totalReviews,
    @JsonKey(name: 'reviews_average_score') String? reviewsAverageScore,
    @JsonKey(name: 'url_key') String? urlKey,
    @JsonKey(name: 'type_id') String? typeId,
    @JsonKey(name: 'emi_available') String? emiAvailable,
    @JsonKey(name: 'express_delivery') String? expressDelivery,
  }) = _SearchProductResponse;

  factory SearchProductResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchProductResponseFromJson(json);
}