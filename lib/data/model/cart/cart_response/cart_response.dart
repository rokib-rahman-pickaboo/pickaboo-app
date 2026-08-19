import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_response.freezed.dart';
part 'cart_response.g.dart';

@freezed
class CartResponse with _$CartResponse {
  const factory CartResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "is_active") bool? isActive,
    @JsonKey(name: "is_virtual") bool? isVirtual,
    @JsonKey(name: "items") List<Item>? items,
    @JsonKey(name: "items_count") int? itemsCount,
    @JsonKey(name: "items_qty") int? itemsQty,
    @JsonKey(name: "customer") Customer? customer,
    @JsonKey(name: "billing_address") BillingAddressClass? billingAddress,
    @JsonKey(name: "orig_order_id") int? origOrderId,
    @JsonKey(name: "currency") Currency? currency,
    @JsonKey(name: "customer_is_guest") bool? customerIsGuest,
    @JsonKey(name: "customer_note_notify") bool? customerNoteNotify,
    @JsonKey(name: "customer_tax_class_id") int? customerTaxClassId,
    @JsonKey(name: "store_id") int? storeId,
    @JsonKey(name: "extension_attributes")
    CartResponseExtensionAttributes? extensionAttributes,
  }) = _CartResponse;

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}

@freezed
class BillingAddressClass with _$BillingAddressClass {
  const factory BillingAddressClass({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "region") dynamic region,
    @JsonKey(name: "region_id") dynamic regionId,
    @JsonKey(name: "region_code") dynamic regionCode,
    @JsonKey(name: "country_id") dynamic countryId,
    @JsonKey(name: "street") List<String>? street,
    @JsonKey(name: "telephone") dynamic telephone,
    @JsonKey(name: "postcode") dynamic postcode,
    @JsonKey(name: "city") dynamic city,
    @JsonKey(name: "firstname") dynamic firstname,
    @JsonKey(name: "lastname") dynamic lastname,
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "same_as_billing") int? sameAsBilling,
    @JsonKey(name: "save_in_address_book") int? saveInAddressBook,
  }) = _BillingAddressClass;

  factory BillingAddressClass.fromJson(Map<String, dynamic> json) =>
      _$BillingAddressClassFromJson(json);
}

@freezed
class Currency with _$Currency {
  const factory Currency({
    @JsonKey(name: "global_currency_code") String? globalCurrencyCode,
    @JsonKey(name: "base_currency_code") String? baseCurrencyCode,
    @JsonKey(name: "store_currency_code") String? storeCurrencyCode,
    @JsonKey(name: "quote_currency_code") String? quoteCurrencyCode,
    @JsonKey(name: "store_to_base_rate") int? storeToBaseRate,
    @JsonKey(name: "store_to_quote_rate") int? storeToQuoteRate,
    @JsonKey(name: "base_to_global_rate") int? baseToGlobalRate,
    @JsonKey(name: "base_to_quote_rate") int? baseToQuoteRate,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}

@freezed
class Customer with _$Customer {
  const factory Customer({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "group_id") int? groupId,
    @JsonKey(name: "default_shipping") String? defaultShipping,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "created_in") String? createdIn,
    @JsonKey(name: "dob") DateTime? dob,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "firstname") String? firstname,
    @JsonKey(name: "lastname") String? lastname,
    @JsonKey(name: "gender") int? gender,
    @JsonKey(name: "store_id") int? storeId,
    @JsonKey(name: "website_id") int? websiteId,
    @JsonKey(name: "addresses") List<AddressElement>? addresses,
    @JsonKey(name: "disable_auto_group_change") int? disableAutoGroupChange,
    @JsonKey(name: "extension_attributes")
    CustomerExtensionAttributes? extensionAttributes,
    @JsonKey(name: "custom_attributes") List<CustomAttribute>? customAttributes,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}

@freezed
class AddressElement with _$AddressElement {
  const factory AddressElement({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(name: "region") Region? region,
    @JsonKey(name: "region_id") int? regionId,
    @JsonKey(name: "country_id") String? countryId,
    @JsonKey(name: "street") List<String>? street,
    @JsonKey(name: "telephone") String? telephone,
    @JsonKey(name: "postcode") String? postcode,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "firstname") String? firstname,
    @JsonKey(name: "lastname") String? lastname,
    @JsonKey(name: "default_shipping") bool? defaultShipping,
    @JsonKey(name: "default_billing") bool? defaultBilling,
  }) = _AddressElement;

  factory AddressElement.fromJson(Map<String, dynamic> json) =>
      _$AddressElementFromJson(json);
}

@freezed
class Region with _$Region {
  const factory Region({
    @JsonKey(name: "region_code") String? regionCode,
    @JsonKey(name: "region") String? region,
    @JsonKey(name: "region_id") int? regionId,
  }) = _Region;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
}

@freezed
class CustomAttribute with _$CustomAttribute {
  const factory CustomAttribute({
    @JsonKey(name: "attribute_code") String? attributeCode,
    @JsonKey(name: "value") String? value,
  }) = _CustomAttribute;

  factory CustomAttribute.fromJson(Map<String, dynamic> json) =>
      _$CustomAttributeFromJson(json);
}

@freezed
class CustomerExtensionAttributes with _$CustomerExtensionAttributes {
  const factory CustomerExtensionAttributes({
    @JsonKey(name: "is_subscribed") bool? isSubscribed,
  }) = _CustomerExtensionAttributes;

  factory CustomerExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$CustomerExtensionAttributesFromJson(json);
}

@freezed
class CartResponseExtensionAttributes with _$CartResponseExtensionAttributes {
  const factory CartResponseExtensionAttributes({
    @JsonKey(name: "shipping_assignments")
    List<ShippingAssignment>? shippingAssignments,
  }) = _CartResponseExtensionAttributes;

  factory CartResponseExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$CartResponseExtensionAttributesFromJson(json);
}

@freezed
class ShippingAssignment with _$ShippingAssignment {
  const factory ShippingAssignment({
    @JsonKey(name: "shipping") Shipping? shipping,
    @JsonKey(name: "items") List<Item>? items,
  }) = _ShippingAssignment;

  factory ShippingAssignment.fromJson(Map<String, dynamic> json) =>
      _$ShippingAssignmentFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "qty") int? qty,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "product_type") String? productType,
    @JsonKey(name: "quote_id") String? quoteId,
    @JsonKey(name: "extension_attributes")
    ItemExtensionAttributes? extensionAttributes,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class ItemExtensionAttributes with _$ItemExtensionAttributes {
  const factory ItemExtensionAttributes({
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "product_url_key") String? productUrlKey,
    @JsonKey(name: "category_ids") List<String>? categoryIds,
    @JsonKey(name: "category_names") List<String>? categoryNames,
    @JsonKey(name: "stock_available") bool? stockAvailable,
    @JsonKey(name: "brand_id") String? brandId,
    @JsonKey(name: "brand") String? brand,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "sold_by") String? soldBy,
    @JsonKey(name: "regular_price") int? regularPrice,
    @JsonKey(name: "spacial_price") int? spacialPrice,
    @JsonKey(name: "discount") String? discount,
    @JsonKey(name: "custom_options") List<CustomOption>? customOptions,
    @JsonKey(name: "item_subtotal") int? itemSubtotal,
    @JsonKey(name: "config_options") List<ConfigOption>? configOptions,
    @JsonKey(name: "reward_points") CartItemRewardPoints? rewardPoints,
  }) = _ItemExtensionAttributes;

  factory ItemExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$ItemExtensionAttributesFromJson(json);
}

@freezed
class CartItemRewardPoints with _$CartItemRewardPoints {
  const factory CartItemRewardPoints({
    @JsonKey(name: "earn_points") num? earnPoints,
  }) = _CartItemRewardPoints;

  factory CartItemRewardPoints.fromJson(Map<String, dynamic> json) =>
      _$CartItemRewardPointsFromJson(json);
}

@freezed
class ConfigOption with _$ConfigOption {
  const factory ConfigOption({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "value") String? value,
  }) = _ConfigOption;

  factory ConfigOption.fromJson(Map<String, dynamic> json) =>
      _$ConfigOptionFromJson(json);
}

@freezed
class CustomOption with _$CustomOption {
  const factory CustomOption({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "value") String? value,
    @JsonKey(name: "price") String? price,
  }) = _CustomOption;

  factory CustomOption.fromJson(Map<String, dynamic> json) =>
      _$CustomOptionFromJson(json);
}

@freezed
class Shipping with _$Shipping {
  const factory Shipping({
    @JsonKey(name: "address") BillingAddressClass? address,
    @JsonKey(name: "method") dynamic method,
  }) = _Shipping;

  factory Shipping.fromJson(Map<String, dynamic> json) =>
      _$ShippingFromJson(json);
}
