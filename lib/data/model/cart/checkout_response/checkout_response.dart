import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_response.freezed.dart';
part 'checkout_response.g.dart';

@freezed
class CheckoutResponse with _$CheckoutResponse {
  const factory CheckoutResponse({
    @JsonKey(name: "cart") required Cart cart,
    @JsonKey(name: "cart_totals") required CartTotals cartTotals,
  }) = _CheckoutResponse;

  factory CheckoutResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseFromJson(json);
}

@freezed
class Cart with _$Cart {
  const factory Cart({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "is_active") bool? isActive,
    @JsonKey(name: "is_virtual") bool? isVirtual,
    @JsonKey(name: "items") List<ShippingAssignmentItem>? items,
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
    CartExtensionAttributes? extensionAttributes,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class BillingAddressClass with _$BillingAddressClass {
  const factory BillingAddressClass({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "region") String? region,
    @JsonKey(name: "region_id") int? regionId,
    @JsonKey(name: "region_code") dynamic regionCode,
    @JsonKey(name: "country_id") String? countryId,
    @JsonKey(name: "street") List<String>? street,
    @JsonKey(name: "telephone") String? telephone,
    @JsonKey(name: "postcode") String? postcode,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "firstname") String? firstname,
    @JsonKey(name: "lastname") String? lastname,
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
    @JsonKey(name: "addresses") List<Address>? addresses,
    @JsonKey(name: "disable_auto_group_change") int? disableAutoGroupChange,
    @JsonKey(name: "extension_attributes")
    CustomerExtensionAttributes? extensionAttributes,
    @JsonKey(name: "custom_attributes") List<CustomAttribute>? customAttributes,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
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
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

extension AddressMapper on Address {
  BillingAddressClass toBillingAddress({String? email}) {
    return BillingAddressClass(
      id: id,
      region: region?.region,
      regionId: region?.regionId ?? regionId,
      regionCode: region?.regionCode,
      countryId: countryId,
      street: street,
      telephone: telephone,
      postcode: postcode,
      city: city,
      firstname: firstname,
      lastname: lastname,
      customerId: customerId,
      email: email,
      sameAsBilling: 0,
      saveInAddressBook: 0,
    );
  }
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
class CartExtensionAttributes with _$CartExtensionAttributes {
  const factory CartExtensionAttributes({
    @JsonKey(name: "shipping_assignments")
    List<ShippingAssignment>? shippingAssignments,
  }) = _CartExtensionAttributes;

  factory CartExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$CartExtensionAttributesFromJson(json);
}

@freezed
class ShippingAssignment with _$ShippingAssignment {
  const factory ShippingAssignment({
    @JsonKey(name: "shipping") Shipping? shipping,
    @JsonKey(name: "items") List<ShippingAssignmentItem>? items,
  }) = _ShippingAssignment;

  factory ShippingAssignment.fromJson(Map<String, dynamic> json) =>
      _$ShippingAssignmentFromJson(json);
}

@freezed
class ShippingAssignmentItem with _$ShippingAssignmentItem {
  const factory ShippingAssignmentItem({
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "qty") int? qty,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "product_type") String? productType,
    @JsonKey(name: "quote_id") String? quoteId,
    @JsonKey(name: "extension_attributes")
    CheckoutItemExtensionAttributes? extensionAttributes,
  }) = _ShippingAssignmentItem;

  factory ShippingAssignmentItem.fromJson(Map<String, dynamic> json) =>
      _$ShippingAssignmentItemFromJson(json);
}

@freezed
class CheckoutItemExtensionAttributes with _$CheckoutItemExtensionAttributes {
  const factory CheckoutItemExtensionAttributes({
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
    @JsonKey(name: "item_subtotal") int? itemSubtotal,
    @JsonKey(name: "custom_options") List<CustomOption>? customOptions,
    @JsonKey(name: "config_options") List<ConfigOption>? configOptions,
    @JsonKey(name: "reward_points") ItemRewardPoints? rewardPoints,
  }) = _CheckoutItemExtensionAttributes;

  factory CheckoutItemExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$CheckoutItemExtensionAttributesFromJson(json);
}

@freezed
class ItemRewardPoints with _$ItemRewardPoints {
  const factory ItemRewardPoints({
    @JsonKey(name: "earn_points") num? earnPoints,
  }) = _ItemRewardPoints;

  factory ItemRewardPoints.fromJson(Map<String, dynamic> json) =>
      _$ItemRewardPointsFromJson(json);
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
class ConfigOption with _$ConfigOption {
  const factory ConfigOption({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "value") String? value,
  }) = _ConfigOption;

  factory ConfigOption.fromJson(Map<String, dynamic> json) =>
      _$ConfigOptionFromJson(json);
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

@freezed
class CartTotals with _$CartTotals {
  const factory CartTotals({
    @JsonKey(name: "grand_total") int? grandTotal,
    @JsonKey(name: "base_grand_total") int? baseGrandTotal,
    @JsonKey(name: "subtotal") int? subtotal,
    @JsonKey(name: "base_subtotal") int? baseSubtotal,
    @JsonKey(name: "discount_amount") int? discountAmount,
    @JsonKey(name: "base_discount_amount") int? baseDiscountAmount,
    @JsonKey(name: "subtotal_with_discount") int? subtotalWithDiscount,
    @JsonKey(name: "base_subtotal_with_discount") int? baseSubtotalWithDiscount,
    @JsonKey(name: "shipping_amount") int? shippingAmount,
    @JsonKey(name: "base_shipping_amount") int? baseShippingAmount,
    @JsonKey(name: "shipping_discount_amount") int? shippingDiscountAmount,
    @JsonKey(name: "base_shipping_discount_amount")
    int? baseShippingDiscountAmount,
    @JsonKey(name: "tax_amount") int? taxAmount,
    @JsonKey(name: "base_tax_amount") int? baseTaxAmount,
    @JsonKey(name: "weee_tax_applied_amount") dynamic weeeTaxAppliedAmount,
    @JsonKey(name: "shipping_tax_amount") int? shippingTaxAmount,
    @JsonKey(name: "base_shipping_tax_amount") int? baseShippingTaxAmount,
    @JsonKey(name: "subtotal_incl_tax") int? subtotalInclTax,
    @JsonKey(name: "shipping_incl_tax") int? shippingInclTax,
    @JsonKey(name: "base_shipping_incl_tax") int? baseShippingInclTax,
    @JsonKey(name: "base_currency_code") String? baseCurrencyCode,
    @JsonKey(name: "quote_currency_code") String? quoteCurrencyCode,
    @JsonKey(name: "coupon_code") String? couponCode,
    @JsonKey(name: "items_qty") int? itemsQty,
    @JsonKey(name: "items") List<CartTotalsItem>? items,
    @JsonKey(name: "total_segments") List<TotalSegment>? totalSegments,
  }) = _CartTotals;

  factory CartTotals.fromJson(Map<String, dynamic> json) =>
      _$CartTotalsFromJson(json);
}

@freezed
class CartTotalsItem with _$CartTotalsItem {
  const factory CartTotalsItem({
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "base_price") int? basePrice,
    @JsonKey(name: "qty") int? qty,
    @JsonKey(name: "row_total") int? rowTotal,
    @JsonKey(name: "base_row_total") int? baseRowTotal,
    @JsonKey(name: "row_total_with_discount") int? rowTotalWithDiscount,
    @JsonKey(name: "tax_amount") int? taxAmount,
    @JsonKey(name: "base_tax_amount") int? baseTaxAmount,
    @JsonKey(name: "tax_percent") int? taxPercent,
    @JsonKey(name: "discount_amount") int? discountAmount,
    @JsonKey(name: "base_discount_amount") int? baseDiscountAmount,
    @JsonKey(name: "discount_percent") int? discountPercent,
    @JsonKey(name: "price_incl_tax") int? priceInclTax,
    @JsonKey(name: "base_price_incl_tax") int? basePriceInclTax,
    @JsonKey(name: "row_total_incl_tax") int? rowTotalInclTax,
    @JsonKey(name: "base_row_total_incl_tax") int? baseRowTotalInclTax,
    @JsonKey(name: "options") String? options,
    @JsonKey(name: "weee_tax_applied_amount") dynamic weeeTaxAppliedAmount,
    @JsonKey(name: "weee_tax_applied") dynamic weeeTaxApplied,
    @JsonKey(name: "extension_attributes")
    FluffyExtensionAttributes? extensionAttributes,
    @JsonKey(name: "name") String? name,
  }) = _CartTotalsItem;

  factory CartTotalsItem.fromJson(Map<String, dynamic> json) =>
      _$CartTotalsItemFromJson(json);
}

@freezed
class FluffyExtensionAttributes with _$FluffyExtensionAttributes {
  const factory FluffyExtensionAttributes({
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "image_url") String? imageUrl,
  }) = _FluffyExtensionAttributes;

  factory FluffyExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$FluffyExtensionAttributesFromJson(json);
}

@freezed
class TotalSegment with _$TotalSegment {
  const factory TotalSegment({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "value") num? value,
    @JsonKey(name: "extension_attributes")
    TotalSegmentExtensionAttributes? extensionAttributes,
    @JsonKey(name: "area") String? area,
  }) = _TotalSegment;

  factory TotalSegment.fromJson(Map<String, dynamic> json) =>
      _$TotalSegmentFromJson(json);
}

@freezed
class TotalSegmentExtensionAttributes with _$TotalSegmentExtensionAttributes {
  const factory TotalSegmentExtensionAttributes({
    @JsonKey(name: "tax_grandtotal_details")
    List<dynamic>? taxGrandtotalDetails,
  }) = _TotalSegmentExtensionAttributes;

  factory TotalSegmentExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$TotalSegmentExtensionAttributesFromJson(json);
}
