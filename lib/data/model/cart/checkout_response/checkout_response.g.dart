// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckoutResponseImpl _$$CheckoutResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CheckoutResponseImpl(
  cart: Cart.fromJson(json['cart'] as Map<String, dynamic>),
  cartTotals: CartTotals.fromJson(json['cart_totals'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$CheckoutResponseImplToJson(
  _$CheckoutResponseImpl instance,
) => <String, dynamic>{
  'cart': instance.cart,
  'cart_totals': instance.cartTotals,
};

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
  id: (json['id'] as num?)?.toInt(),
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
  isActive: json['is_active'] as bool?,
  isVirtual: json['is_virtual'] as bool?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => ShippingAssignmentItem.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  itemsCount: (json['items_count'] as num?)?.toInt(),
  itemsQty: (json['items_qty'] as num?)?.toInt(),
  customer:
      json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
  billingAddress:
      json['billing_address'] == null
          ? null
          : BillingAddressClass.fromJson(
            json['billing_address'] as Map<String, dynamic>,
          ),
  origOrderId: (json['orig_order_id'] as num?)?.toInt(),
  currency:
      json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
  customerIsGuest: json['customer_is_guest'] as bool?,
  customerNoteNotify: json['customer_note_notify'] as bool?,
  customerTaxClassId: (json['customer_tax_class_id'] as num?)?.toInt(),
  storeId: (json['store_id'] as num?)?.toInt(),
  extensionAttributes:
      json['extension_attributes'] == null
          ? null
          : CartExtensionAttributes.fromJson(
            json['extension_attributes'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
      'is_virtual': instance.isVirtual,
      'items': instance.items,
      'items_count': instance.itemsCount,
      'items_qty': instance.itemsQty,
      'customer': instance.customer,
      'billing_address': instance.billingAddress,
      'orig_order_id': instance.origOrderId,
      'currency': instance.currency,
      'customer_is_guest': instance.customerIsGuest,
      'customer_note_notify': instance.customerNoteNotify,
      'customer_tax_class_id': instance.customerTaxClassId,
      'store_id': instance.storeId,
      'extension_attributes': instance.extensionAttributes,
    };

_$BillingAddressClassImpl _$$BillingAddressClassImplFromJson(
  Map<String, dynamic> json,
) => _$BillingAddressClassImpl(
  id: (json['id'] as num?)?.toInt(),
  region: json['region'] as String?,
  regionId: (json['region_id'] as num?)?.toInt(),
  regionCode: json['region_code'],
  countryId: json['country_id'] as String?,
  street: (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
  telephone: json['telephone'] as String?,
  postcode: json['postcode'] as String?,
  city: json['city'] as String?,
  firstname: json['firstname'] as String?,
  lastname: json['lastname'] as String?,
  customerId: (json['customer_id'] as num?)?.toInt(),
  email: json['email'] as String?,
  sameAsBilling: (json['same_as_billing'] as num?)?.toInt(),
  saveInAddressBook: (json['save_in_address_book'] as num?)?.toInt(),
);

Map<String, dynamic> _$$BillingAddressClassImplToJson(
  _$BillingAddressClassImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'region': instance.region,
  'region_id': instance.regionId,
  'region_code': instance.regionCode,
  'country_id': instance.countryId,
  'street': instance.street,
  'telephone': instance.telephone,
  'postcode': instance.postcode,
  'city': instance.city,
  'firstname': instance.firstname,
  'lastname': instance.lastname,
  'customer_id': instance.customerId,
  'email': instance.email,
  'same_as_billing': instance.sameAsBilling,
  'save_in_address_book': instance.saveInAddressBook,
};

_$CurrencyImpl _$$CurrencyImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyImpl(
      globalCurrencyCode: json['global_currency_code'] as String?,
      baseCurrencyCode: json['base_currency_code'] as String?,
      storeCurrencyCode: json['store_currency_code'] as String?,
      quoteCurrencyCode: json['quote_currency_code'] as String?,
      storeToBaseRate: (json['store_to_base_rate'] as num?)?.toInt(),
      storeToQuoteRate: (json['store_to_quote_rate'] as num?)?.toInt(),
      baseToGlobalRate: (json['base_to_global_rate'] as num?)?.toInt(),
      baseToQuoteRate: (json['base_to_quote_rate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CurrencyImplToJson(_$CurrencyImpl instance) =>
    <String, dynamic>{
      'global_currency_code': instance.globalCurrencyCode,
      'base_currency_code': instance.baseCurrencyCode,
      'store_currency_code': instance.storeCurrencyCode,
      'quote_currency_code': instance.quoteCurrencyCode,
      'store_to_base_rate': instance.storeToBaseRate,
      'store_to_quote_rate': instance.storeToQuoteRate,
      'base_to_global_rate': instance.baseToGlobalRate,
      'base_to_quote_rate': instance.baseToQuoteRate,
    };

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      id: (json['id'] as num?)?.toInt(),
      groupId: (json['group_id'] as num?)?.toInt(),
      defaultShipping: json['default_shipping'] as String?,
      createdAt:
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
      updatedAt:
          json['updated_at'] == null
              ? null
              : DateTime.parse(json['updated_at'] as String),
      createdIn: json['created_in'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      storeId: (json['store_id'] as num?)?.toInt(),
      websiteId: (json['website_id'] as num?)?.toInt(),
      addresses:
          (json['addresses'] as List<dynamic>?)
              ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
              .toList(),
      disableAutoGroupChange:
          (json['disable_auto_group_change'] as num?)?.toInt(),
      extensionAttributes:
          json['extension_attributes'] == null
              ? null
              : CustomerExtensionAttributes.fromJson(
                json['extension_attributes'] as Map<String, dynamic>,
              ),
      customAttributes:
          (json['custom_attributes'] as List<dynamic>?)
              ?.map((e) => CustomAttribute.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$CustomerImplToJson(_$CustomerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_id': instance.groupId,
      'default_shipping': instance.defaultShipping,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_in': instance.createdIn,
      'dob': instance.dob?.toIso8601String(),
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'gender': instance.gender,
      'store_id': instance.storeId,
      'website_id': instance.websiteId,
      'addresses': instance.addresses,
      'disable_auto_group_change': instance.disableAutoGroupChange,
      'extension_attributes': instance.extensionAttributes,
      'custom_attributes': instance.customAttributes,
    };

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      id: (json['id'] as num?)?.toInt(),
      customerId: (json['customer_id'] as num?)?.toInt(),
      region:
          json['region'] == null
              ? null
              : Region.fromJson(json['region'] as Map<String, dynamic>),
      regionId: (json['region_id'] as num?)?.toInt(),
      countryId: json['country_id'] as String?,
      street:
          (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
      telephone: json['telephone'] as String?,
      postcode: json['postcode'] as String?,
      city: json['city'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      defaultShipping: json['default_shipping'] as bool?,
      defaultBilling: json['default_billing'] as bool?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'region': instance.region,
      'region_id': instance.regionId,
      'country_id': instance.countryId,
      'street': instance.street,
      'telephone': instance.telephone,
      'postcode': instance.postcode,
      'city': instance.city,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'default_shipping': instance.defaultShipping,
      'default_billing': instance.defaultBilling,
    };

_$RegionImpl _$$RegionImplFromJson(Map<String, dynamic> json) => _$RegionImpl(
  regionCode: json['region_code'] as String?,
  region: json['region'] as String?,
  regionId: (json['region_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$$RegionImplToJson(_$RegionImpl instance) =>
    <String, dynamic>{
      'region_code': instance.regionCode,
      'region': instance.region,
      'region_id': instance.regionId,
    };

_$CustomAttributeImpl _$$CustomAttributeImplFromJson(
  Map<String, dynamic> json,
) => _$CustomAttributeImpl(
  attributeCode: json['attribute_code'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$$CustomAttributeImplToJson(
  _$CustomAttributeImpl instance,
) => <String, dynamic>{
  'attribute_code': instance.attributeCode,
  'value': instance.value,
};

_$CustomerExtensionAttributesImpl _$$CustomerExtensionAttributesImplFromJson(
  Map<String, dynamic> json,
) => _$CustomerExtensionAttributesImpl(
  isSubscribed: json['is_subscribed'] as bool?,
);

Map<String, dynamic> _$$CustomerExtensionAttributesImplToJson(
  _$CustomerExtensionAttributesImpl instance,
) => <String, dynamic>{'is_subscribed': instance.isSubscribed};

_$CartExtensionAttributesImpl _$$CartExtensionAttributesImplFromJson(
  Map<String, dynamic> json,
) => _$CartExtensionAttributesImpl(
  shippingAssignments:
      (json['shipping_assignments'] as List<dynamic>?)
          ?.map((e) => ShippingAssignment.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$CartExtensionAttributesImplToJson(
  _$CartExtensionAttributesImpl instance,
) => <String, dynamic>{'shipping_assignments': instance.shippingAssignments};

_$ShippingAssignmentImpl _$$ShippingAssignmentImplFromJson(
  Map<String, dynamic> json,
) => _$ShippingAssignmentImpl(
  shipping:
      json['shipping'] == null
          ? null
          : Shipping.fromJson(json['shipping'] as Map<String, dynamic>),
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => ShippingAssignmentItem.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$$ShippingAssignmentImplToJson(
  _$ShippingAssignmentImpl instance,
) => <String, dynamic>{'shipping': instance.shipping, 'items': instance.items};

_$ShippingAssignmentItemImpl _$$ShippingAssignmentItemImplFromJson(
  Map<String, dynamic> json,
) => _$ShippingAssignmentItemImpl(
  itemId: (json['item_id'] as num?)?.toInt(),
  sku: json['sku'] as String?,
  qty: (json['qty'] as num?)?.toInt(),
  name: json['name'] as String?,
  price: (json['price'] as num?)?.toInt(),
  productType: json['product_type'] as String?,
  quoteId: json['quote_id'] as String?,
  extensionAttributes:
      json['extension_attributes'] == null
          ? null
          : CheckoutItemExtensionAttributes.fromJson(
            json['extension_attributes'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$$ShippingAssignmentItemImplToJson(
  _$ShippingAssignmentItemImpl instance,
) => <String, dynamic>{
  'item_id': instance.itemId,
  'sku': instance.sku,
  'qty': instance.qty,
  'name': instance.name,
  'price': instance.price,
  'product_type': instance.productType,
  'quote_id': instance.quoteId,
  'extension_attributes': instance.extensionAttributes,
};

_$CheckoutItemExtensionAttributesImpl
_$$CheckoutItemExtensionAttributesImplFromJson(Map<String, dynamic> json) =>
    _$CheckoutItemExtensionAttributesImpl(
      productId: (json['product_id'] as num?)?.toInt(),
      productUrlKey: json['product_url_key'] as String?,
      categoryIds:
          (json['category_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      categoryNames:
          (json['category_names'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      stockAvailable: json['stock_available'] as bool?,
      brandId: json['brand_id'] as String?,
      brand: json['brand'] as String?,
      imageUrl: json['image_url'] as String?,
      soldBy: json['sold_by'] as String?,
      regularPrice: (json['regular_price'] as num?)?.toInt(),
      spacialPrice: (json['spacial_price'] as num?)?.toInt(),
      discount: json['discount'] as String?,
      itemSubtotal: (json['item_subtotal'] as num?)?.toInt(),
      customOptions:
          (json['custom_options'] as List<dynamic>?)
              ?.map((e) => CustomOption.fromJson(e as Map<String, dynamic>))
              .toList(),
      configOptions:
          (json['config_options'] as List<dynamic>?)
              ?.map((e) => ConfigOption.fromJson(e as Map<String, dynamic>))
              .toList(),
      rewardPoints:
          json['reward_points'] == null
              ? null
              : ItemRewardPoints.fromJson(
                json['reward_points'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$$CheckoutItemExtensionAttributesImplToJson(
  _$CheckoutItemExtensionAttributesImpl instance,
) => <String, dynamic>{
  'product_id': instance.productId,
  'product_url_key': instance.productUrlKey,
  'category_ids': instance.categoryIds,
  'category_names': instance.categoryNames,
  'stock_available': instance.stockAvailable,
  'brand_id': instance.brandId,
  'brand': instance.brand,
  'image_url': instance.imageUrl,
  'sold_by': instance.soldBy,
  'regular_price': instance.regularPrice,
  'spacial_price': instance.spacialPrice,
  'discount': instance.discount,
  'item_subtotal': instance.itemSubtotal,
  'custom_options': instance.customOptions,
  'config_options': instance.configOptions,
  'reward_points': instance.rewardPoints,
};

_$ItemRewardPointsImpl _$$ItemRewardPointsImplFromJson(
  Map<String, dynamic> json,
) => _$ItemRewardPointsImpl(earnPoints: json['earn_points'] as num?);

Map<String, dynamic> _$$ItemRewardPointsImplToJson(
  _$ItemRewardPointsImpl instance,
) => <String, dynamic>{'earn_points': instance.earnPoints};

_$CustomOptionImpl _$$CustomOptionImplFromJson(Map<String, dynamic> json) =>
    _$CustomOptionImpl(
      title: json['title'] as String?,
      value: json['value'] as String?,
      price: json['price'] as String?,
    );

Map<String, dynamic> _$$CustomOptionImplToJson(_$CustomOptionImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'value': instance.value,
      'price': instance.price,
    };

_$ConfigOptionImpl _$$ConfigOptionImplFromJson(Map<String, dynamic> json) =>
    _$ConfigOptionImpl(
      title: json['title'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$$ConfigOptionImplToJson(_$ConfigOptionImpl instance) =>
    <String, dynamic>{'title': instance.title, 'value': instance.value};

_$ShippingImpl _$$ShippingImplFromJson(Map<String, dynamic> json) =>
    _$ShippingImpl(
      address:
          json['address'] == null
              ? null
              : BillingAddressClass.fromJson(
                json['address'] as Map<String, dynamic>,
              ),
      method: json['method'],
    );

Map<String, dynamic> _$$ShippingImplToJson(_$ShippingImpl instance) =>
    <String, dynamic>{'address': instance.address, 'method': instance.method};

_$CartTotalsImpl _$$CartTotalsImplFromJson(
  Map<String, dynamic> json,
) => _$CartTotalsImpl(
  grandTotal: (json['grand_total'] as num?)?.toInt(),
  baseGrandTotal: (json['base_grand_total'] as num?)?.toInt(),
  subtotal: (json['subtotal'] as num?)?.toInt(),
  baseSubtotal: (json['base_subtotal'] as num?)?.toInt(),
  discountAmount: (json['discount_amount'] as num?)?.toInt(),
  baseDiscountAmount: (json['base_discount_amount'] as num?)?.toInt(),
  subtotalWithDiscount: (json['subtotal_with_discount'] as num?)?.toInt(),
  baseSubtotalWithDiscount:
      (json['base_subtotal_with_discount'] as num?)?.toInt(),
  shippingAmount: (json['shipping_amount'] as num?)?.toInt(),
  baseShippingAmount: (json['base_shipping_amount'] as num?)?.toInt(),
  shippingDiscountAmount: (json['shipping_discount_amount'] as num?)?.toInt(),
  baseShippingDiscountAmount:
      (json['base_shipping_discount_amount'] as num?)?.toInt(),
  taxAmount: (json['tax_amount'] as num?)?.toInt(),
  baseTaxAmount: (json['base_tax_amount'] as num?)?.toInt(),
  weeeTaxAppliedAmount: json['weee_tax_applied_amount'],
  shippingTaxAmount: (json['shipping_tax_amount'] as num?)?.toInt(),
  baseShippingTaxAmount: (json['base_shipping_tax_amount'] as num?)?.toInt(),
  subtotalInclTax: (json['subtotal_incl_tax'] as num?)?.toInt(),
  shippingInclTax: (json['shipping_incl_tax'] as num?)?.toInt(),
  baseShippingInclTax: (json['base_shipping_incl_tax'] as num?)?.toInt(),
  baseCurrencyCode: json['base_currency_code'] as String?,
  quoteCurrencyCode: json['quote_currency_code'] as String?,
  couponCode: json['coupon_code'] as String?,
  itemsQty: (json['items_qty'] as num?)?.toInt(),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => CartTotalsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalSegments:
      (json['total_segments'] as List<dynamic>?)
          ?.map((e) => TotalSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$CartTotalsImplToJson(_$CartTotalsImpl instance) =>
    <String, dynamic>{
      'grand_total': instance.grandTotal,
      'base_grand_total': instance.baseGrandTotal,
      'subtotal': instance.subtotal,
      'base_subtotal': instance.baseSubtotal,
      'discount_amount': instance.discountAmount,
      'base_discount_amount': instance.baseDiscountAmount,
      'subtotal_with_discount': instance.subtotalWithDiscount,
      'base_subtotal_with_discount': instance.baseSubtotalWithDiscount,
      'shipping_amount': instance.shippingAmount,
      'base_shipping_amount': instance.baseShippingAmount,
      'shipping_discount_amount': instance.shippingDiscountAmount,
      'base_shipping_discount_amount': instance.baseShippingDiscountAmount,
      'tax_amount': instance.taxAmount,
      'base_tax_amount': instance.baseTaxAmount,
      'weee_tax_applied_amount': instance.weeeTaxAppliedAmount,
      'shipping_tax_amount': instance.shippingTaxAmount,
      'base_shipping_tax_amount': instance.baseShippingTaxAmount,
      'subtotal_incl_tax': instance.subtotalInclTax,
      'shipping_incl_tax': instance.shippingInclTax,
      'base_shipping_incl_tax': instance.baseShippingInclTax,
      'base_currency_code': instance.baseCurrencyCode,
      'quote_currency_code': instance.quoteCurrencyCode,
      'coupon_code': instance.couponCode,
      'items_qty': instance.itemsQty,
      'items': instance.items,
      'total_segments': instance.totalSegments,
    };

_$CartTotalsItemImpl _$$CartTotalsItemImplFromJson(Map<String, dynamic> json) =>
    _$CartTotalsItemImpl(
      itemId: (json['item_id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      basePrice: (json['base_price'] as num?)?.toInt(),
      qty: (json['qty'] as num?)?.toInt(),
      rowTotal: (json['row_total'] as num?)?.toInt(),
      baseRowTotal: (json['base_row_total'] as num?)?.toInt(),
      rowTotalWithDiscount: (json['row_total_with_discount'] as num?)?.toInt(),
      taxAmount: (json['tax_amount'] as num?)?.toInt(),
      baseTaxAmount: (json['base_tax_amount'] as num?)?.toInt(),
      taxPercent: (json['tax_percent'] as num?)?.toInt(),
      discountAmount: (json['discount_amount'] as num?)?.toInt(),
      baseDiscountAmount: (json['base_discount_amount'] as num?)?.toInt(),
      discountPercent: (json['discount_percent'] as num?)?.toInt(),
      priceInclTax: (json['price_incl_tax'] as num?)?.toInt(),
      basePriceInclTax: (json['base_price_incl_tax'] as num?)?.toInt(),
      rowTotalInclTax: (json['row_total_incl_tax'] as num?)?.toInt(),
      baseRowTotalInclTax: (json['base_row_total_incl_tax'] as num?)?.toInt(),
      options: json['options'] as String?,
      weeeTaxAppliedAmount: json['weee_tax_applied_amount'],
      weeeTaxApplied: json['weee_tax_applied'],
      extensionAttributes:
          json['extension_attributes'] == null
              ? null
              : FluffyExtensionAttributes.fromJson(
                json['extension_attributes'] as Map<String, dynamic>,
              ),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$CartTotalsItemImplToJson(
  _$CartTotalsItemImpl instance,
) => <String, dynamic>{
  'item_id': instance.itemId,
  'price': instance.price,
  'base_price': instance.basePrice,
  'qty': instance.qty,
  'row_total': instance.rowTotal,
  'base_row_total': instance.baseRowTotal,
  'row_total_with_discount': instance.rowTotalWithDiscount,
  'tax_amount': instance.taxAmount,
  'base_tax_amount': instance.baseTaxAmount,
  'tax_percent': instance.taxPercent,
  'discount_amount': instance.discountAmount,
  'base_discount_amount': instance.baseDiscountAmount,
  'discount_percent': instance.discountPercent,
  'price_incl_tax': instance.priceInclTax,
  'base_price_incl_tax': instance.basePriceInclTax,
  'row_total_incl_tax': instance.rowTotalInclTax,
  'base_row_total_incl_tax': instance.baseRowTotalInclTax,
  'options': instance.options,
  'weee_tax_applied_amount': instance.weeeTaxAppliedAmount,
  'weee_tax_applied': instance.weeeTaxApplied,
  'extension_attributes': instance.extensionAttributes,
  'name': instance.name,
};

_$FluffyExtensionAttributesImpl _$$FluffyExtensionAttributesImplFromJson(
  Map<String, dynamic> json,
) => _$FluffyExtensionAttributesImpl(
  productId: (json['product_id'] as num?)?.toInt(),
  imageUrl: json['image_url'] as String?,
);

Map<String, dynamic> _$$FluffyExtensionAttributesImplToJson(
  _$FluffyExtensionAttributesImpl instance,
) => <String, dynamic>{
  'product_id': instance.productId,
  'image_url': instance.imageUrl,
};

_$TotalSegmentImpl _$$TotalSegmentImplFromJson(Map<String, dynamic> json) =>
    _$TotalSegmentImpl(
      code: json['code'] as String?,
      title: json['title'] as String?,
      value: json['value'] as num?,
      extensionAttributes:
          json['extension_attributes'] == null
              ? null
              : TotalSegmentExtensionAttributes.fromJson(
                json['extension_attributes'] as Map<String, dynamic>,
              ),
      area: json['area'] as String?,
    );

Map<String, dynamic> _$$TotalSegmentImplToJson(_$TotalSegmentImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'title': instance.title,
      'value': instance.value,
      'extension_attributes': instance.extensionAttributes,
      'area': instance.area,
    };

_$TotalSegmentExtensionAttributesImpl
_$$TotalSegmentExtensionAttributesImplFromJson(Map<String, dynamic> json) =>
    _$TotalSegmentExtensionAttributesImpl(
      taxGrandtotalDetails: json['tax_grandtotal_details'] as List<dynamic>?,
    );

Map<String, dynamic> _$$TotalSegmentExtensionAttributesImplToJson(
  _$TotalSegmentExtensionAttributesImpl instance,
) => <String, dynamic>{'tax_grandtotal_details': instance.taxGrandtotalDetails};
