import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_cart_item_request.freezed.dart';
part 'update_cart_item_request.g.dart';

@freezed
class UpdateCartItemRequest with _$UpdateCartItemRequest {
  const factory UpdateCartItemRequest({
    @JsonKey(name: "cartItem") required CartItemUpdateRequest cartItem,
  }) = _UpdateCartItemRequest;

  factory UpdateCartItemRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCartItemRequestFromJson(json);
}

@freezed
class CartItemUpdateRequest with _$CartItemUpdateRequest {
  const factory CartItemUpdateRequest({
    @JsonKey(name: "item_id") required int itemId,
    @JsonKey(name: "qty") required int qty,
    @JsonKey(name: "quote_id") required String quoteId,
  }) = _CartItemUpdateRequest;

  factory CartItemUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$CartItemUpdateRequestFromJson(json);
}
