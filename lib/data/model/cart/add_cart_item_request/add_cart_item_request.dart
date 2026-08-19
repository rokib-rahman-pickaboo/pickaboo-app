import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_cart_item_request.freezed.dart';
part 'add_cart_item_request.g.dart';

@freezed
class AddCartItemRequest with _$AddCartItemRequest {
  const factory AddCartItemRequest({
    @JsonKey(name: "cartItem") required CartItem cartItem,
  }) = _AddCartItemRequest;

  factory AddCartItemRequest.fromJson(Map<String, dynamic> json) =>
      _$AddCartItemRequestFromJson(json);
}

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    @JsonKey(name: "quote_id") required String quoteId,
    @JsonKey(name: "sku") required String sku,
    @JsonKey(name: "qty") required int qty,
    @JsonKey(name: "product_type") String? productType,
    @JsonKey(name: "product_option") ProductOption? productOption,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}

@freezed
class ProductOption with _$ProductOption {
  const factory ProductOption({
    @JsonKey(name: "extension_attributes")
    ExtensionAttributes? extensionAttributes,
  }) = _ProductOption;

  factory ProductOption.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionFromJson(json);
}

@freezed
class ExtensionAttributes with _$ExtensionAttributes {
  const factory ExtensionAttributes({
    @JsonKey(name: "configurable_item_options")
    List<MOption>? configurableItemOptions,
    @JsonKey(name: "custom_options") List<MOption>? customOptions,
  }) = _ExtensionAttributes;

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$ExtensionAttributesFromJson(json);
}

@freezed
class MOption with _$MOption {
  const factory MOption({
    @JsonKey(name: "option_id", fromJson: _anyToString) String? optionId,
    @JsonKey(name: "option_value", fromJson: _anyToString) String? optionValue,
  }) = _MOption;

  factory MOption.fromJson(Map<String, dynamic> json) =>
      _$MOptionFromJson(json);
}

String? _anyToString(dynamic value) => value?.toString();
