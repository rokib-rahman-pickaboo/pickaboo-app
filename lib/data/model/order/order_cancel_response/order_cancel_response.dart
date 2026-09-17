import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/core/utils/date_time_utils.dart';

part 'order_cancel_response.freezed.dart';
part 'order_cancel_response.g.dart';

@freezed
class OrderCancelResponse with _$OrderCancelResponse {
  const factory OrderCancelResponse({
    @JsonKey(name: "base_currency_code") String? baseCurrencyCode,
    @JsonKey(name: "base_discount_amount") int? baseDiscountAmount,
    @JsonKey(name: "base_discount_canceled") int? baseDiscountCanceled,
    @JsonKey(name: "base_grand_total") int? baseGrandTotal,
    @JsonKey(name: "base_discount_tax_compensation_amount")
    int? baseDiscountTaxCompensationAmount,
    @JsonKey(name: "base_shipping_amount") int? baseShippingAmount,
    @JsonKey(name: "base_shipping_canceled") int? baseShippingCanceled,
    @JsonKey(name: "base_shipping_discount_amount")
    int? baseShippingDiscountAmount,
    @JsonKey(name: "base_shipping_discount_tax_compensation_amnt")
    int? baseShippingDiscountTaxCompensationAmnt,
    @JsonKey(name: "base_shipping_incl_tax") int? baseShippingInclTax,
    @JsonKey(name: "base_shipping_tax_amount") int? baseShippingTaxAmount,
    @JsonKey(name: "base_subtotal") int? baseSubtotal,
    @JsonKey(name: "base_subtotal_canceled") int? baseSubtotalCanceled,
    @JsonKey(name: "base_subtotal_incl_tax") int? baseSubtotalInclTax,
    @JsonKey(name: "base_tax_amount") int? baseTaxAmount,
    @JsonKey(name: "base_tax_canceled") int? baseTaxCanceled,
    @JsonKey(name: "base_total_canceled") int? baseTotalCanceled,
    @JsonKey(name: "base_total_due") int? baseTotalDue,
    @JsonKey(name: "base_to_global_rate") int? baseToGlobalRate,
    @JsonKey(name: "base_to_order_rate") int? baseToOrderRate,
    @JsonKey(name: "billing_address_id") int? billingAddressId,
    @JsonKey(name: "created_at", fromJson: safeDateTimeFromJson, toJson: safeDateTimeToJson) DateTime? createdAt,
    @JsonKey(name: "customer_dob", fromJson: safeDateTimeFromJson, toJson: safeDateTimeToJson) DateTime? customerDob,
    @JsonKey(name: "customer_email") String? customerEmail,
    @JsonKey(name: "customer_firstname") String? customerFirstname,
    @JsonKey(name: "customer_gender") int? customerGender,
    @JsonKey(name: "customer_group_id") int? customerGroupId,
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(name: "customer_is_guest") int? customerIsGuest,
    @JsonKey(name: "customer_lastname") String? customerLastname,
    @JsonKey(name: "customer_note_notify") int? customerNoteNotify,
    @JsonKey(name: "discount_amount") int? discountAmount,
    @JsonKey(name: "discount_canceled") int? discountCanceled,
    @JsonKey(name: "email_sent") int? emailSent,
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "global_currency_code") String? globalCurrencyCode,
    @JsonKey(name: "grand_total") int? grandTotal,
    @JsonKey(name: "discount_tax_compensation_amount")
    int? discountTaxCompensationAmount,
    @JsonKey(name: "increment_id") String? incrementId,
    @JsonKey(name: "is_virtual") int? isVirtual,
    @JsonKey(name: "order_currency_code") String? orderCurrencyCode,
    @JsonKey(name: "protect_code") String? protectCode,
    @JsonKey(name: "quote_id") int? quoteId,
    @JsonKey(name: "remote_ip") String? remoteIp,
    @JsonKey(name: "shipping_amount") int? shippingAmount,
    @JsonKey(name: "shipping_canceled") int? shippingCanceled,
    @JsonKey(name: "shipping_description") String? shippingDescription,
    @JsonKey(name: "shipping_discount_amount") int? shippingDiscountAmount,
    @JsonKey(name: "shipping_discount_tax_compensation_amount")
    int? shippingDiscountTaxCompensationAmount,
    @JsonKey(name: "shipping_incl_tax") int? shippingInclTax,
    @JsonKey(name: "shipping_tax_amount") int? shippingTaxAmount,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "store_currency_code") String? storeCurrencyCode,
    @JsonKey(name: "store_id") int? storeId,
    @JsonKey(name: "store_name") String? storeName,
    @JsonKey(name: "store_to_base_rate") int? storeToBaseRate,
    @JsonKey(name: "store_to_order_rate") int? storeToOrderRate,
    @JsonKey(name: "subtotal") int? subtotal,
    @JsonKey(name: "subtotal_canceled") int? subtotalCanceled,
    @JsonKey(name: "subtotal_incl_tax") int? subtotalInclTax,
    @JsonKey(name: "tax_amount") int? taxAmount,
    @JsonKey(name: "tax_canceled") int? taxCanceled,
    @JsonKey(name: "total_canceled") int? totalCanceled,
    @JsonKey(name: "total_due") int? totalDue,
    @JsonKey(name: "total_item_count") int? totalItemCount,
    @JsonKey(name: "total_qty_ordered") int? totalQtyOrdered,
    @JsonKey(name: "updated_at", fromJson: safeDateTimeFromJson, toJson: safeDateTimeToJson) DateTime? updatedAt,
    @JsonKey(name: "weight") double? weight,
    @JsonKey(name: "x_forwarded_for") String? xForwardedFor,
    @JsonKey(name: "items") List<Item>? items,
    @JsonKey(name: "billing_address") Address? billingAddress,
    @JsonKey(name: "payment") Payment? payment,
    @JsonKey(name: "status_histories") List<StatusHistory>? statusHistories,
    @JsonKey(name: "extension_attributes")
    ExtensionAttributes? extensionAttributes,
  }) = _OrderCancelResponse;

  factory OrderCancelResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderCancelResponseFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    @JsonKey(name: "address_type") String? addressType,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "country_id") String? countryId,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "firstname") String? firstname,
    @JsonKey(name: "lastname") String? lastname,
    @JsonKey(name: "parent_id") int? parentId,
    @JsonKey(name: "postcode") String? postcode,
    @JsonKey(name: "region") String? region,
    @JsonKey(name: "region_code") String? regionCode,
    @JsonKey(name: "region_id") int? regionId,
    @JsonKey(name: "street") List<String>? street,
    @JsonKey(name: "telephone") String? telephone,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
class ExtensionAttributes with _$ExtensionAttributes {
  const factory ExtensionAttributes({
    @JsonKey(name: "shipping_assignments")
    List<ShippingAssignment>? shippingAssignments,
    @JsonKey(name: "payment_additional_info")
    List<PaymentAdditionalInfo>? paymentAdditionalInfo,
    @JsonKey(name: "applied_taxes") List<dynamic>? appliedTaxes,
    @JsonKey(name: "item_applied_taxes") List<dynamic>? itemAppliedTaxes,
    @JsonKey(name: "rewards_discount") int? rewardsDiscount,
    @JsonKey(name: "rewards_spend") int? rewardsSpend,
    @JsonKey(name: "rewards_earn") int? rewardsEarn,
  }) = _ExtensionAttributes;

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$ExtensionAttributesFromJson(json);
}

@freezed
class PaymentAdditionalInfo with _$PaymentAdditionalInfo {
  const factory PaymentAdditionalInfo({
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "value") String? value,
  }) = _PaymentAdditionalInfo;

  factory PaymentAdditionalInfo.fromJson(Map<String, dynamic> json) =>
      _$PaymentAdditionalInfoFromJson(json);
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
    @JsonKey(name: "amount_refunded") int? amountRefunded,
    @JsonKey(name: "base_amount_refunded") int? baseAmountRefunded,
    @JsonKey(name: "base_discount_amount") int? baseDiscountAmount,
    @JsonKey(name: "base_discount_invoiced") int? baseDiscountInvoiced,
    @JsonKey(name: "base_discount_tax_compensation_amount")
    int? baseDiscountTaxCompensationAmount,
    @JsonKey(name: "base_original_price") int? baseOriginalPrice,
    @JsonKey(name: "base_price") int? basePrice,
    @JsonKey(name: "base_price_incl_tax") int? basePriceInclTax,
    @JsonKey(name: "base_row_invoiced") int? baseRowInvoiced,
    @JsonKey(name: "base_row_total") int? baseRowTotal,
    @JsonKey(name: "base_row_total_incl_tax") int? baseRowTotalInclTax,
    @JsonKey(name: "base_tax_amount") int? baseTaxAmount,
    @JsonKey(name: "base_tax_invoiced") int? baseTaxInvoiced,
    @JsonKey(name: "created_at", fromJson: safeDateTimeFromJson, toJson: safeDateTimeToJson) DateTime? createdAt,
    @JsonKey(name: "discount_amount") int? discountAmount,
    @JsonKey(name: "discount_invoiced") int? discountInvoiced,
    @JsonKey(name: "discount_percent") int? discountPercent,
    @JsonKey(name: "free_shipping") int? freeShipping,
    @JsonKey(name: "discount_tax_compensation_amount")
    int? discountTaxCompensationAmount,
    @JsonKey(name: "is_qty_decimal") int? isQtyDecimal,
    @JsonKey(name: "is_virtual") int? isVirtual,
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "no_discount") int? noDiscount,
    @JsonKey(name: "order_id") int? orderId,
    @JsonKey(name: "original_price") int? originalPrice,
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "price_incl_tax") int? priceInclTax,
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "product_type") String? productType,
    @JsonKey(name: "qty_canceled") int? qtyCanceled,
    @JsonKey(name: "qty_invoiced") int? qtyInvoiced,
    @JsonKey(name: "qty_ordered") int? qtyOrdered,
    @JsonKey(name: "qty_refunded") int? qtyRefunded,
    @JsonKey(name: "qty_shipped") int? qtyShipped,
    @JsonKey(name: "quote_item_id") int? quoteItemId,
    @JsonKey(name: "row_invoiced") int? rowInvoiced,
    @JsonKey(name: "row_total") int? rowTotal,
    @JsonKey(name: "row_total_incl_tax") int? rowTotalInclTax,
    @JsonKey(name: "row_weight") double? rowWeight,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "store_id") int? storeId,
    @JsonKey(name: "tax_amount") int? taxAmount,
    @JsonKey(name: "tax_invoiced") int? taxInvoiced,
    @JsonKey(name: "tax_percent") int? taxPercent,
    @JsonKey(name: "updated_at", fromJson: safeDateTimeFromJson, toJson: safeDateTimeToJson) DateTime? updatedAt,
    @JsonKey(name: "weight") double? weight,
    @JsonKey(name: "discount_tax_compensation_canceled")
    int? discountTaxCompensationCanceled,
    @JsonKey(name: "tax_canceled") int? taxCanceled,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class Shipping with _$Shipping {
  const factory Shipping({
    @JsonKey(name: "address") Address? address,
    @JsonKey(name: "method") String? method,
    @JsonKey(name: "total") Total? total,
  }) = _Shipping;

  factory Shipping.fromJson(Map<String, dynamic> json) =>
      _$ShippingFromJson(json);
}

@freezed
class Total with _$Total {
  const factory Total({
    @JsonKey(name: "base_shipping_amount") int? baseShippingAmount,
    @JsonKey(name: "base_shipping_discount_amount")
    int? baseShippingDiscountAmount,
    @JsonKey(name: "base_shipping_discount_tax_compensation_amnt")
    int? baseShippingDiscountTaxCompensationAmnt,
    @JsonKey(name: "base_shipping_incl_tax") int? baseShippingInclTax,
    @JsonKey(name: "base_shipping_tax_amount") int? baseShippingTaxAmount,
    @JsonKey(name: "shipping_amount") int? shippingAmount,
    @JsonKey(name: "shipping_discount_amount") int? shippingDiscountAmount,
    @JsonKey(name: "shipping_discount_tax_compensation_amount")
    int? shippingDiscountTaxCompensationAmount,
    @JsonKey(name: "shipping_incl_tax") int? shippingInclTax,
    @JsonKey(name: "shipping_tax_amount") int? shippingTaxAmount,
  }) = _Total;

  factory Total.fromJson(Map<String, dynamic> json) => _$TotalFromJson(json);
}

@freezed
class Payment with _$Payment {
  const factory Payment({
    @JsonKey(name: "account_status") dynamic accountStatus,
    @JsonKey(name: "additional_information")
    List<String>? additionalInformation,
    @JsonKey(name: "amount_ordered") int? amountOrdered,
    @JsonKey(name: "base_amount_ordered") int? baseAmountOrdered,
    @JsonKey(name: "base_shipping_amount") int? baseShippingAmount,
    @JsonKey(name: "cc_exp_year") String? ccExpYear,
    @JsonKey(name: "cc_last4") dynamic ccLast4,
    @JsonKey(name: "cc_ss_start_month") String? ccSsStartMonth,
    @JsonKey(name: "cc_ss_start_year") String? ccSsStartYear,
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "method") String? method,
    @JsonKey(name: "parent_id") int? parentId,
    @JsonKey(name: "shipping_amount") int? shippingAmount,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}

@freezed
class StatusHistory with _$StatusHistory {
  const factory StatusHistory({
    @JsonKey(name: "comment") String? comment,
    @JsonKey(name: "created_at", fromJson: safeDateTimeFromJson, toJson: safeDateTimeToJson) DateTime? createdAt,
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "entity_name") String? entityName,
    @JsonKey(name: "is_customer_notified") int? isCustomerNotified,
    @JsonKey(name: "is_visible_on_front") int? isVisibleOnFront,
    @JsonKey(name: "parent_id") int? parentId,
    @JsonKey(name: "status") String? status,
  }) = _StatusHistory;

  factory StatusHistory.fromJson(Map<String, dynamic> json) =>
      _$StatusHistoryFromJson(json);
}
