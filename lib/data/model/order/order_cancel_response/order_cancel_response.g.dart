// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_cancel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderCancelResponseImpl _$$OrderCancelResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OrderCancelResponseImpl(
  baseCurrencyCode: json['base_currency_code'] as String?,
  baseDiscountAmount: (json['base_discount_amount'] as num?)?.toInt(),
  baseDiscountCanceled: (json['base_discount_canceled'] as num?)?.toInt(),
  baseGrandTotal: (json['base_grand_total'] as num?)?.toInt(),
  baseDiscountTaxCompensationAmount:
      (json['base_discount_tax_compensation_amount'] as num?)?.toInt(),
  baseShippingAmount: (json['base_shipping_amount'] as num?)?.toInt(),
  baseShippingCanceled: (json['base_shipping_canceled'] as num?)?.toInt(),
  baseShippingDiscountAmount:
      (json['base_shipping_discount_amount'] as num?)?.toInt(),
  baseShippingDiscountTaxCompensationAmnt:
      (json['base_shipping_discount_tax_compensation_amnt'] as num?)?.toInt(),
  baseShippingInclTax: (json['base_shipping_incl_tax'] as num?)?.toInt(),
  baseShippingTaxAmount: (json['base_shipping_tax_amount'] as num?)?.toInt(),
  baseSubtotal: (json['base_subtotal'] as num?)?.toInt(),
  baseSubtotalCanceled: (json['base_subtotal_canceled'] as num?)?.toInt(),
  baseSubtotalInclTax: (json['base_subtotal_incl_tax'] as num?)?.toInt(),
  baseTaxAmount: (json['base_tax_amount'] as num?)?.toInt(),
  baseTaxCanceled: (json['base_tax_canceled'] as num?)?.toInt(),
  baseTotalCanceled: (json['base_total_canceled'] as num?)?.toInt(),
  baseTotalDue: (json['base_total_due'] as num?)?.toInt(),
  baseToGlobalRate: (json['base_to_global_rate'] as num?)?.toInt(),
  baseToOrderRate: (json['base_to_order_rate'] as num?)?.toInt(),
  billingAddressId: (json['billing_address_id'] as num?)?.toInt(),
  createdAt: safeDateTimeFromJson(json['created_at']),
  customerDob: safeDateTimeFromJson(json['customer_dob']),
  customerEmail: json['customer_email'] as String?,
  customerFirstname: json['customer_firstname'] as String?,
  customerGender: (json['customer_gender'] as num?)?.toInt(),
  customerGroupId: (json['customer_group_id'] as num?)?.toInt(),
  customerId: (json['customer_id'] as num?)?.toInt(),
  customerIsGuest: (json['customer_is_guest'] as num?)?.toInt(),
  customerLastname: json['customer_lastname'] as String?,
  customerNoteNotify: (json['customer_note_notify'] as num?)?.toInt(),
  discountAmount: (json['discount_amount'] as num?)?.toInt(),
  discountCanceled: (json['discount_canceled'] as num?)?.toInt(),
  emailSent: (json['email_sent'] as num?)?.toInt(),
  entityId: (json['entity_id'] as num?)?.toInt(),
  globalCurrencyCode: json['global_currency_code'] as String?,
  grandTotal: (json['grand_total'] as num?)?.toInt(),
  discountTaxCompensationAmount:
      (json['discount_tax_compensation_amount'] as num?)?.toInt(),
  incrementId: json['increment_id'] as String?,
  isVirtual: (json['is_virtual'] as num?)?.toInt(),
  orderCurrencyCode: json['order_currency_code'] as String?,
  protectCode: json['protect_code'] as String?,
  quoteId: (json['quote_id'] as num?)?.toInt(),
  remoteIp: json['remote_ip'] as String?,
  shippingAmount: (json['shipping_amount'] as num?)?.toInt(),
  shippingCanceled: (json['shipping_canceled'] as num?)?.toInt(),
  shippingDescription: json['shipping_description'] as String?,
  shippingDiscountAmount: (json['shipping_discount_amount'] as num?)?.toInt(),
  shippingDiscountTaxCompensationAmount:
      (json['shipping_discount_tax_compensation_amount'] as num?)?.toInt(),
  shippingInclTax: (json['shipping_incl_tax'] as num?)?.toInt(),
  shippingTaxAmount: (json['shipping_tax_amount'] as num?)?.toInt(),
  state: json['state'] as String?,
  status: json['status'] as String?,
  storeCurrencyCode: json['store_currency_code'] as String?,
  storeId: (json['store_id'] as num?)?.toInt(),
  storeName: json['store_name'] as String?,
  storeToBaseRate: (json['store_to_base_rate'] as num?)?.toInt(),
  storeToOrderRate: (json['store_to_order_rate'] as num?)?.toInt(),
  subtotal: (json['subtotal'] as num?)?.toInt(),
  subtotalCanceled: (json['subtotal_canceled'] as num?)?.toInt(),
  subtotalInclTax: (json['subtotal_incl_tax'] as num?)?.toInt(),
  taxAmount: (json['tax_amount'] as num?)?.toInt(),
  taxCanceled: (json['tax_canceled'] as num?)?.toInt(),
  totalCanceled: (json['total_canceled'] as num?)?.toInt(),
  totalDue: (json['total_due'] as num?)?.toInt(),
  totalItemCount: (json['total_item_count'] as num?)?.toInt(),
  totalQtyOrdered: (json['total_qty_ordered'] as num?)?.toInt(),
  updatedAt: safeDateTimeFromJson(json['updated_at']),
  weight: (json['weight'] as num?)?.toDouble(),
  xForwardedFor: json['x_forwarded_for'] as String?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
  billingAddress:
      json['billing_address'] == null
          ? null
          : Address.fromJson(json['billing_address'] as Map<String, dynamic>),
  payment:
      json['payment'] == null
          ? null
          : Payment.fromJson(json['payment'] as Map<String, dynamic>),
  statusHistories:
      (json['status_histories'] as List<dynamic>?)
          ?.map((e) => StatusHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
  extensionAttributes:
      json['extension_attributes'] == null
          ? null
          : ExtensionAttributes.fromJson(
            json['extension_attributes'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$$OrderCancelResponseImplToJson(
  _$OrderCancelResponseImpl instance,
) => <String, dynamic>{
  'base_currency_code': instance.baseCurrencyCode,
  'base_discount_amount': instance.baseDiscountAmount,
  'base_discount_canceled': instance.baseDiscountCanceled,
  'base_grand_total': instance.baseGrandTotal,
  'base_discount_tax_compensation_amount':
      instance.baseDiscountTaxCompensationAmount,
  'base_shipping_amount': instance.baseShippingAmount,
  'base_shipping_canceled': instance.baseShippingCanceled,
  'base_shipping_discount_amount': instance.baseShippingDiscountAmount,
  'base_shipping_discount_tax_compensation_amnt':
      instance.baseShippingDiscountTaxCompensationAmnt,
  'base_shipping_incl_tax': instance.baseShippingInclTax,
  'base_shipping_tax_amount': instance.baseShippingTaxAmount,
  'base_subtotal': instance.baseSubtotal,
  'base_subtotal_canceled': instance.baseSubtotalCanceled,
  'base_subtotal_incl_tax': instance.baseSubtotalInclTax,
  'base_tax_amount': instance.baseTaxAmount,
  'base_tax_canceled': instance.baseTaxCanceled,
  'base_total_canceled': instance.baseTotalCanceled,
  'base_total_due': instance.baseTotalDue,
  'base_to_global_rate': instance.baseToGlobalRate,
  'base_to_order_rate': instance.baseToOrderRate,
  'billing_address_id': instance.billingAddressId,
  'created_at': instance.createdAt?.toIso8601String(),
  'customer_dob': instance.customerDob?.toIso8601String(),
  'customer_email': instance.customerEmail,
  'customer_firstname': instance.customerFirstname,
  'customer_gender': instance.customerGender,
  'customer_group_id': instance.customerGroupId,
  'customer_id': instance.customerId,
  'customer_is_guest': instance.customerIsGuest,
  'customer_lastname': instance.customerLastname,
  'customer_note_notify': instance.customerNoteNotify,
  'discount_amount': instance.discountAmount,
  'discount_canceled': instance.discountCanceled,
  'email_sent': instance.emailSent,
  'entity_id': instance.entityId,
  'global_currency_code': instance.globalCurrencyCode,
  'grand_total': instance.grandTotal,
  'discount_tax_compensation_amount': instance.discountTaxCompensationAmount,
  'increment_id': instance.incrementId,
  'is_virtual': instance.isVirtual,
  'order_currency_code': instance.orderCurrencyCode,
  'protect_code': instance.protectCode,
  'quote_id': instance.quoteId,
  'remote_ip': instance.remoteIp,
  'shipping_amount': instance.shippingAmount,
  'shipping_canceled': instance.shippingCanceled,
  'shipping_description': instance.shippingDescription,
  'shipping_discount_amount': instance.shippingDiscountAmount,
  'shipping_discount_tax_compensation_amount':
      instance.shippingDiscountTaxCompensationAmount,
  'shipping_incl_tax': instance.shippingInclTax,
  'shipping_tax_amount': instance.shippingTaxAmount,
  'state': instance.state,
  'status': instance.status,
  'store_currency_code': instance.storeCurrencyCode,
  'store_id': instance.storeId,
  'store_name': instance.storeName,
  'store_to_base_rate': instance.storeToBaseRate,
  'store_to_order_rate': instance.storeToOrderRate,
  'subtotal': instance.subtotal,
  'subtotal_canceled': instance.subtotalCanceled,
  'subtotal_incl_tax': instance.subtotalInclTax,
  'tax_amount': instance.taxAmount,
  'tax_canceled': instance.taxCanceled,
  'total_canceled': instance.totalCanceled,
  'total_due': instance.totalDue,
  'total_item_count': instance.totalItemCount,
  'total_qty_ordered': instance.totalQtyOrdered,
  'updated_at': instance.updatedAt?.toIso8601String(),
  'weight': instance.weight,
  'x_forwarded_for': instance.xForwardedFor,
  'items': instance.items,
  'billing_address': instance.billingAddress,
  'payment': instance.payment,
  'status_histories': instance.statusHistories,
  'extension_attributes': instance.extensionAttributes,
};

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      addressType: json['address_type'] as String?,
      city: json['city'] as String?,
      countryId: json['country_id'] as String?,
      email: json['email'] as String?,
      entityId: (json['entity_id'] as num?)?.toInt(),
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      parentId: (json['parent_id'] as num?)?.toInt(),
      postcode: json['postcode'] as String?,
      region: json['region'] as String?,
      regionCode: json['region_code'] as String?,
      regionId: (json['region_id'] as num?)?.toInt(),
      street:
          (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
      telephone: json['telephone'] as String?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'address_type': instance.addressType,
      'city': instance.city,
      'country_id': instance.countryId,
      'email': instance.email,
      'entity_id': instance.entityId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'parent_id': instance.parentId,
      'postcode': instance.postcode,
      'region': instance.region,
      'region_code': instance.regionCode,
      'region_id': instance.regionId,
      'street': instance.street,
      'telephone': instance.telephone,
    };

_$ExtensionAttributesImpl _$$ExtensionAttributesImplFromJson(
  Map<String, dynamic> json,
) => _$ExtensionAttributesImpl(
  shippingAssignments:
      (json['shipping_assignments'] as List<dynamic>?)
          ?.map((e) => ShippingAssignment.fromJson(e as Map<String, dynamic>))
          .toList(),
  paymentAdditionalInfo:
      (json['payment_additional_info'] as List<dynamic>?)
          ?.map(
            (e) => PaymentAdditionalInfo.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  appliedTaxes: json['applied_taxes'] as List<dynamic>?,
  itemAppliedTaxes: json['item_applied_taxes'] as List<dynamic>?,
  rewardsDiscount: (json['rewards_discount'] as num?)?.toInt(),
  rewardsSpend: (json['rewards_spend'] as num?)?.toInt(),
  rewardsEarn: (json['rewards_earn'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ExtensionAttributesImplToJson(
  _$ExtensionAttributesImpl instance,
) => <String, dynamic>{
  'shipping_assignments': instance.shippingAssignments,
  'payment_additional_info': instance.paymentAdditionalInfo,
  'applied_taxes': instance.appliedTaxes,
  'item_applied_taxes': instance.itemAppliedTaxes,
  'rewards_discount': instance.rewardsDiscount,
  'rewards_spend': instance.rewardsSpend,
  'rewards_earn': instance.rewardsEarn,
};

_$PaymentAdditionalInfoImpl _$$PaymentAdditionalInfoImplFromJson(
  Map<String, dynamic> json,
) => _$PaymentAdditionalInfoImpl(
  key: json['key'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$$PaymentAdditionalInfoImplToJson(
  _$PaymentAdditionalInfoImpl instance,
) => <String, dynamic>{'key': instance.key, 'value': instance.value};

_$ShippingAssignmentImpl _$$ShippingAssignmentImplFromJson(
  Map<String, dynamic> json,
) => _$ShippingAssignmentImpl(
  shipping:
      json['shipping'] == null
          ? null
          : Shipping.fromJson(json['shipping'] as Map<String, dynamic>),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$ShippingAssignmentImplToJson(
  _$ShippingAssignmentImpl instance,
) => <String, dynamic>{'shipping': instance.shipping, 'items': instance.items};

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
  amountRefunded: (json['amount_refunded'] as num?)?.toInt(),
  baseAmountRefunded: (json['base_amount_refunded'] as num?)?.toInt(),
  baseDiscountAmount: (json['base_discount_amount'] as num?)?.toInt(),
  baseDiscountInvoiced: (json['base_discount_invoiced'] as num?)?.toInt(),
  baseDiscountTaxCompensationAmount:
      (json['base_discount_tax_compensation_amount'] as num?)?.toInt(),
  baseOriginalPrice: (json['base_original_price'] as num?)?.toInt(),
  basePrice: (json['base_price'] as num?)?.toInt(),
  basePriceInclTax: (json['base_price_incl_tax'] as num?)?.toInt(),
  baseRowInvoiced: (json['base_row_invoiced'] as num?)?.toInt(),
  baseRowTotal: (json['base_row_total'] as num?)?.toInt(),
  baseRowTotalInclTax: (json['base_row_total_incl_tax'] as num?)?.toInt(),
  baseTaxAmount: (json['base_tax_amount'] as num?)?.toInt(),
  baseTaxInvoiced: (json['base_tax_invoiced'] as num?)?.toInt(),
  createdAt: safeDateTimeFromJson(json['created_at']),
  discountAmount: (json['discount_amount'] as num?)?.toInt(),
  discountInvoiced: (json['discount_invoiced'] as num?)?.toInt(),
  discountPercent: (json['discount_percent'] as num?)?.toInt(),
  freeShipping: (json['free_shipping'] as num?)?.toInt(),
  discountTaxCompensationAmount:
      (json['discount_tax_compensation_amount'] as num?)?.toInt(),
  isQtyDecimal: (json['is_qty_decimal'] as num?)?.toInt(),
  isVirtual: (json['is_virtual'] as num?)?.toInt(),
  itemId: (json['item_id'] as num?)?.toInt(),
  name: json['name'] as String?,
  noDiscount: (json['no_discount'] as num?)?.toInt(),
  orderId: (json['order_id'] as num?)?.toInt(),
  originalPrice: (json['original_price'] as num?)?.toInt(),
  price: (json['price'] as num?)?.toInt(),
  priceInclTax: (json['price_incl_tax'] as num?)?.toInt(),
  productId: (json['product_id'] as num?)?.toInt(),
  productType: json['product_type'] as String?,
  qtyCanceled: (json['qty_canceled'] as num?)?.toInt(),
  qtyInvoiced: (json['qty_invoiced'] as num?)?.toInt(),
  qtyOrdered: (json['qty_ordered'] as num?)?.toInt(),
  qtyRefunded: (json['qty_refunded'] as num?)?.toInt(),
  qtyShipped: (json['qty_shipped'] as num?)?.toInt(),
  quoteItemId: (json['quote_item_id'] as num?)?.toInt(),
  rowInvoiced: (json['row_invoiced'] as num?)?.toInt(),
  rowTotal: (json['row_total'] as num?)?.toInt(),
  rowTotalInclTax: (json['row_total_incl_tax'] as num?)?.toInt(),
  rowWeight: (json['row_weight'] as num?)?.toDouble(),
  sku: json['sku'] as String?,
  storeId: (json['store_id'] as num?)?.toInt(),
  taxAmount: (json['tax_amount'] as num?)?.toInt(),
  taxInvoiced: (json['tax_invoiced'] as num?)?.toInt(),
  taxPercent: (json['tax_percent'] as num?)?.toInt(),
  updatedAt: safeDateTimeFromJson(json['updated_at']),
  weight: (json['weight'] as num?)?.toDouble(),
  discountTaxCompensationCanceled:
      (json['discount_tax_compensation_canceled'] as num?)?.toInt(),
  taxCanceled: (json['tax_canceled'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ItemImplToJson(
  _$ItemImpl instance,
) => <String, dynamic>{
  'amount_refunded': instance.amountRefunded,
  'base_amount_refunded': instance.baseAmountRefunded,
  'base_discount_amount': instance.baseDiscountAmount,
  'base_discount_invoiced': instance.baseDiscountInvoiced,
  'base_discount_tax_compensation_amount':
      instance.baseDiscountTaxCompensationAmount,
  'base_original_price': instance.baseOriginalPrice,
  'base_price': instance.basePrice,
  'base_price_incl_tax': instance.basePriceInclTax,
  'base_row_invoiced': instance.baseRowInvoiced,
  'base_row_total': instance.baseRowTotal,
  'base_row_total_incl_tax': instance.baseRowTotalInclTax,
  'base_tax_amount': instance.baseTaxAmount,
  'base_tax_invoiced': instance.baseTaxInvoiced,
  'created_at': instance.createdAt?.toIso8601String(),
  'discount_amount': instance.discountAmount,
  'discount_invoiced': instance.discountInvoiced,
  'discount_percent': instance.discountPercent,
  'free_shipping': instance.freeShipping,
  'discount_tax_compensation_amount': instance.discountTaxCompensationAmount,
  'is_qty_decimal': instance.isQtyDecimal,
  'is_virtual': instance.isVirtual,
  'item_id': instance.itemId,
  'name': instance.name,
  'no_discount': instance.noDiscount,
  'order_id': instance.orderId,
  'original_price': instance.originalPrice,
  'price': instance.price,
  'price_incl_tax': instance.priceInclTax,
  'product_id': instance.productId,
  'product_type': instance.productType,
  'qty_canceled': instance.qtyCanceled,
  'qty_invoiced': instance.qtyInvoiced,
  'qty_ordered': instance.qtyOrdered,
  'qty_refunded': instance.qtyRefunded,
  'qty_shipped': instance.qtyShipped,
  'quote_item_id': instance.quoteItemId,
  'row_invoiced': instance.rowInvoiced,
  'row_total': instance.rowTotal,
  'row_total_incl_tax': instance.rowTotalInclTax,
  'row_weight': instance.rowWeight,
  'sku': instance.sku,
  'store_id': instance.storeId,
  'tax_amount': instance.taxAmount,
  'tax_invoiced': instance.taxInvoiced,
  'tax_percent': instance.taxPercent,
  'updated_at': instance.updatedAt?.toIso8601String(),
  'weight': instance.weight,
  'discount_tax_compensation_canceled':
      instance.discountTaxCompensationCanceled,
  'tax_canceled': instance.taxCanceled,
};

_$ShippingImpl _$$ShippingImplFromJson(Map<String, dynamic> json) =>
    _$ShippingImpl(
      address:
          json['address'] == null
              ? null
              : Address.fromJson(json['address'] as Map<String, dynamic>),
      method: json['method'] as String?,
      total:
          json['total'] == null
              ? null
              : Total.fromJson(json['total'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ShippingImplToJson(_$ShippingImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'method': instance.method,
      'total': instance.total,
    };

_$TotalImpl _$$TotalImplFromJson(Map<String, dynamic> json) => _$TotalImpl(
  baseShippingAmount: (json['base_shipping_amount'] as num?)?.toInt(),
  baseShippingDiscountAmount:
      (json['base_shipping_discount_amount'] as num?)?.toInt(),
  baseShippingDiscountTaxCompensationAmnt:
      (json['base_shipping_discount_tax_compensation_amnt'] as num?)?.toInt(),
  baseShippingInclTax: (json['base_shipping_incl_tax'] as num?)?.toInt(),
  baseShippingTaxAmount: (json['base_shipping_tax_amount'] as num?)?.toInt(),
  shippingAmount: (json['shipping_amount'] as num?)?.toInt(),
  shippingDiscountAmount: (json['shipping_discount_amount'] as num?)?.toInt(),
  shippingDiscountTaxCompensationAmount:
      (json['shipping_discount_tax_compensation_amount'] as num?)?.toInt(),
  shippingInclTax: (json['shipping_incl_tax'] as num?)?.toInt(),
  shippingTaxAmount: (json['shipping_tax_amount'] as num?)?.toInt(),
);

Map<String, dynamic> _$$TotalImplToJson(_$TotalImpl instance) =>
    <String, dynamic>{
      'base_shipping_amount': instance.baseShippingAmount,
      'base_shipping_discount_amount': instance.baseShippingDiscountAmount,
      'base_shipping_discount_tax_compensation_amnt':
          instance.baseShippingDiscountTaxCompensationAmnt,
      'base_shipping_incl_tax': instance.baseShippingInclTax,
      'base_shipping_tax_amount': instance.baseShippingTaxAmount,
      'shipping_amount': instance.shippingAmount,
      'shipping_discount_amount': instance.shippingDiscountAmount,
      'shipping_discount_tax_compensation_amount':
          instance.shippingDiscountTaxCompensationAmount,
      'shipping_incl_tax': instance.shippingInclTax,
      'shipping_tax_amount': instance.shippingTaxAmount,
    };

_$PaymentImpl _$$PaymentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentImpl(
      accountStatus: json['account_status'],
      additionalInformation:
          (json['additional_information'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      amountOrdered: (json['amount_ordered'] as num?)?.toInt(),
      baseAmountOrdered: (json['base_amount_ordered'] as num?)?.toInt(),
      baseShippingAmount: (json['base_shipping_amount'] as num?)?.toInt(),
      ccExpYear: json['cc_exp_year'] as String?,
      ccLast4: json['cc_last4'],
      ccSsStartMonth: json['cc_ss_start_month'] as String?,
      ccSsStartYear: json['cc_ss_start_year'] as String?,
      entityId: (json['entity_id'] as num?)?.toInt(),
      method: json['method'] as String?,
      parentId: (json['parent_id'] as num?)?.toInt(),
      shippingAmount: (json['shipping_amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      'account_status': instance.accountStatus,
      'additional_information': instance.additionalInformation,
      'amount_ordered': instance.amountOrdered,
      'base_amount_ordered': instance.baseAmountOrdered,
      'base_shipping_amount': instance.baseShippingAmount,
      'cc_exp_year': instance.ccExpYear,
      'cc_last4': instance.ccLast4,
      'cc_ss_start_month': instance.ccSsStartMonth,
      'cc_ss_start_year': instance.ccSsStartYear,
      'entity_id': instance.entityId,
      'method': instance.method,
      'parent_id': instance.parentId,
      'shipping_amount': instance.shippingAmount,
    };

_$StatusHistoryImpl _$$StatusHistoryImplFromJson(Map<String, dynamic> json) =>
    _$StatusHistoryImpl(
      comment: json['comment'] as String?,
      createdAt: safeDateTimeFromJson(json['created_at']),
      entityId: (json['entity_id'] as num?)?.toInt(),
      entityName: json['entity_name'] as String?,
      isCustomerNotified: (json['is_customer_notified'] as num?)?.toInt(),
      isVisibleOnFront: (json['is_visible_on_front'] as num?)?.toInt(),
      parentId: (json['parent_id'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$StatusHistoryImplToJson(_$StatusHistoryImpl instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'created_at': instance.createdAt?.toIso8601String(),
      'entity_id': instance.entityId,
      'entity_name': instance.entityName,
      'is_customer_notified': instance.isCustomerNotified,
      'is_visible_on_front': instance.isVisibleOnFront,
      'parent_id': instance.parentId,
      'status': instance.status,
    };
