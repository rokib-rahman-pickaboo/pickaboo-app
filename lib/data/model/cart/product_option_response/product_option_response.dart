import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_option_response.freezed.dart';
part 'product_option_response.g.dart';

@freezed
class ProductOptionResponse with _$ProductOptionResponse {
  const factory ProductOptionResponse({
    @JsonKey(name: "extension_attributes")
    ExtensionAttributesResponse? extensionAttributes,
  }) = _ProductOptionResponse;

  factory ProductOptionResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionResponseFromJson(json);
}

@freezed
class ExtensionAttributesResponse with _$ExtensionAttributesResponse {
  const factory ExtensionAttributesResponse({
    @JsonKey(name: "configurable_item_options")
    List<ConfigurableItemOptionResponse>? configurableItemOptions,
    @JsonKey(name: "custom_options")
    List<ConfigurableItemOptionResponse>? customOptions,
  }) = _ExtensionAttributesResponse;

  factory ExtensionAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$ExtensionAttributesResponseFromJson(json);
}

@freezed
class ConfigurableItemOptionResponse with _$ConfigurableItemOptionResponse {
  const factory ConfigurableItemOptionResponse({
    @JsonKey(name: "option_id", fromJson: _anyToString) String? optionId,
    @JsonKey(name: "option_value", fromJson: _anyToString) String? optionValue,
  }) = _ConfigurableItemOptionResponse;

  factory ConfigurableItemOptionResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfigurableItemOptionResponseFromJson(json);
}

String? _anyToString(dynamic value) => value?.toString();
