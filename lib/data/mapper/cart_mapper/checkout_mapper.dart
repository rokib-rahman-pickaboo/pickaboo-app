import 'package:pickaboo/data/model/cart/checkout_response/checkout_response.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/data/model/checkout/payment_methods_response.dart';
import 'package:pickaboo/data/model/checkout/shipping_method_model.dart';
import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';
import 'package:pickaboo/domain/entity/checkout/payment_methods_entity.dart';
import 'package:pickaboo/domain/entity/checkout/shipping_method_entity.dart';
import 'package:pickaboo/domain/entity/common/region_entity.dart';

extension CheckoutResponseMapper on CheckoutResponse {
  CheckoutEntity toEntity() {
    return CheckoutEntity(
      cart: cart.toCheckoutEntity(),
      cartTotals: cartTotals.toEntity(),
    );
  }
}

extension CartMapper on Cart {
  CartCheckoutEntity toCheckoutEntity() {
    final cartItems =
        items ??
        extensionAttributes?.shippingAssignments?.firstOrNull?.items ??
        [];

    final shippingAddr = extensionAttributes
        ?.shippingAssignments
        ?.firstOrNull
        ?.shipping
        ?.address;

    return CartCheckoutEntity(
      id: id ?? 0,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isActive: isActive ?? false,
      isVirtual: isVirtual ?? false,
      items: cartItems.map((e) => e.toCartItemEntity()).toList(),
      itemsCount: itemsCount ?? 0,
      itemsQty: itemsQty ?? 0,
      customer: customer?.toEntity(),
      billingAddress: billingAddress?.toEntity(),
      shippingAddress: shippingAddr?.toEntity(),
      origOrderId: origOrderId,
      currency: currency?.toEntity(),
      customerIsGuest: customerIsGuest ?? false,
      customerNoteNotify: customerNoteNotify ?? false,
      customerTaxClassId: customerTaxClassId,
      storeId: storeId ?? 0,
    );
  }
}

extension ShippingAssignmentItemMapper on ShippingAssignmentItem {
  CartItemEntity toCartItemEntity() {
    final extAttrs = extensionAttributes;

    return CartItemEntity(
      itemId: itemId ?? 0,
      sku: sku ?? '',
      qty: qty ?? 0,
      name: name ?? '',
      price: (price ?? 0).toDouble(),
      productType: productType ?? '',
      quoteId: quoteId ?? '',
      rowTotal: (extAttrs?.itemSubtotal ?? 0).toDouble(),
      regularPrice: (extAttrs?.regularPrice ?? 0).toDouble(),
      specialPrice: (extAttrs?.spacialPrice ?? 0).toDouble(),
      discount: extAttrs?.discount ?? '0',
      imageUrl: extAttrs?.imageUrl ?? '',
      productUrlKey: extAttrs?.productUrlKey ?? '',
      productId: extAttrs?.productId ?? 0,
      brand: extAttrs?.brand ?? '',
      stockAvailable: extAttrs?.stockAvailable ?? false,
      soldBy: extAttrs?.soldBy ?? '',
      customOptions:
          extAttrs?.customOptions?.map((e) => e.toEntity()).toList() ?? [],
      configOptions:
          extAttrs?.configOptions?.map((e) => e.toEntity()).toList() ?? [],
      earnPoints: (extAttrs?.rewardPoints?.earnPoints ?? 0).round(),
    );
  }
}

extension CheckoutCustomerMapper on Customer {
  CustomerEntity toEntity() {
    return CustomerEntity(
      id: id ?? 0,
      email: email ?? '',
      firstname: firstname ?? '',
      lastname: lastname ?? '',
      addresses: addresses?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension CheckoutAddressMapper on Address {
  AddressEntity toEntity() {
    return AddressEntity(
      id: id,
      customerId: customerId,
      region: region?.toEntity(),
      regionId: regionId,
      regionCode: region?.regionCode,
      countryId: countryId,
      street: street ?? [],
      telephone: telephone,
      postcode: postcode,
      city: city,
      firstname: firstname,
      lastname: lastname,
      email: null,
      defaultShipping: defaultShipping ?? false,
      defaultBilling: defaultBilling ?? false,
    );
  }
}

extension CheckoutBillingAddressMapper on BillingAddressClass {
  AddressEntity toEntity() {
    return AddressEntity(
      id: id,
      customerId: customerId,
      region: RegionEntity(
        region: region ?? '',
        regionId: regionId ?? 0,
        regionCode: regionCode?.toString() ?? '',
      ),
      regionId: regionId ?? 0,
      countryId: countryId?.toString() ?? '',
      street: street ?? [],
      telephone: telephone?.toString() ?? '',
      postcode: postcode?.toString() ?? '',
      city: city?.toString() ?? '',
      firstname: firstname?.toString() ?? '',
      lastname: lastname?.toString() ?? '',
      defaultShipping: false,
      defaultBilling: false,
      email: email,
    );
  }
}

extension CurrencyMapper on Currency {
  CurrencyEntity toEntity() {
    return CurrencyEntity(
      globalCurrencyCode: globalCurrencyCode ?? '',
      baseCurrencyCode: baseCurrencyCode ?? '',
      storeCurrencyCode: storeCurrencyCode ?? '',
      quoteCurrencyCode: quoteCurrencyCode ?? '',
      storeToBaseRate: storeToBaseRate ?? 0,
      storeToQuoteRate: storeToQuoteRate ?? 0,
      baseToGlobalRate: baseToGlobalRate ?? 0,
      baseToQuoteRate: baseToQuoteRate ?? 0,
    );
  }
}

extension CartTotalsMapper on CartTotals {
  CartTotalsEntity toEntity() {
    return CartTotalsEntity(
      grandTotal: (grandTotal ?? 0).toDouble(),
      baseGrandTotal: (baseGrandTotal ?? 0).toDouble(),
      subtotal: (subtotal ?? 0).toDouble(),
      baseSubtotal: (baseSubtotal ?? 0).toDouble(),
      discountAmount: (discountAmount ?? 0).toDouble(),
      baseDiscountAmount: (baseDiscountAmount ?? 0).toDouble(),
      subtotalWithDiscount: (subtotalWithDiscount ?? 0).toDouble(),
      baseSubtotalWithDiscount: (baseSubtotalWithDiscount ?? 0).toDouble(),
      shippingAmount: (shippingAmount ?? 0).toDouble(),
      baseShippingAmount: (baseShippingAmount ?? 0).toDouble(),
      shippingDiscountAmount: (shippingDiscountAmount ?? 0).toDouble(),
      baseShippingDiscountAmount: (baseShippingDiscountAmount ?? 0).toDouble(),
      taxAmount: (taxAmount ?? 0).toDouble(),
      baseTaxAmount: (baseTaxAmount ?? 0).toDouble(),
      shippingTaxAmount: (shippingTaxAmount ?? 0).toDouble(),
      baseShippingTaxAmount: (baseShippingTaxAmount ?? 0).toDouble(),
      subtotalInclTax: (subtotalInclTax ?? 0).toDouble(),
      shippingInclTax: (shippingInclTax ?? 0).toDouble(),
      baseShippingInclTax: (baseShippingInclTax ?? 0).toDouble(),
      baseCurrencyCode: baseCurrencyCode ?? '',
      quoteCurrencyCode: quoteCurrencyCode ?? '',
      couponCode: couponCode ?? '',
      itemsQty: itemsQty ?? 0,
      items: items?.map((e) => e.toEntity()).toList() ?? [],
      totalSegments: totalSegments?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension CartTotalsItemMapper on CartTotalsItem {
  CartTotalsItemEntity toEntity() {
    return CartTotalsItemEntity(
      itemId: itemId ?? 0,
      price: (price ?? 0).toDouble(),
      basePrice: (basePrice ?? 0).toDouble(),
      qty: qty ?? 0,
      rowTotal: (rowTotal ?? 0).toDouble(),
      baseRowTotal: (baseRowTotal ?? 0).toDouble(),
      rowTotalWithDiscount: (rowTotalWithDiscount ?? 0).toDouble(),
      taxAmount: (taxAmount ?? 0).toDouble(),
      baseTaxAmount: (baseTaxAmount ?? 0).toDouble(),
      taxPercent: taxPercent ?? 0,
      discountAmount: (discountAmount ?? 0).toDouble(),
      baseDiscountAmount: (baseDiscountAmount ?? 0).toDouble(),
      discountPercent: discountPercent ?? 0,
      priceInclTax: (priceInclTax ?? 0).toDouble(),
      basePriceInclTax: (basePriceInclTax ?? 0).toDouble(),
      rowTotalInclTax: (rowTotalInclTax ?? 0).toDouble(),
      baseRowTotalInclTax: (baseRowTotalInclTax ?? 0).toDouble(),
      options: options ?? '',
      name: name ?? '',
      productId: extensionAttributes?.productId,
      imageUrl: extensionAttributes?.imageUrl,
    );
  }
}

extension TotalSegmentMapper on TotalSegment {
  TotalSegmentEntity toEntity() {
    return TotalSegmentEntity(
      code: code ?? '',
      title: title ?? '',
      value: (value ?? 0).toDouble(),
      area: area,
    );
  }
}

extension RegionMapper on Region {
  RegionEntity toEntity() {
    return RegionEntity(
      regionCode: regionCode ?? '',
      region: region ?? '',
      regionId: regionId ?? 0,
    );
  }
}

extension ShippingMethodMapper on ShippingMethodModel {
  ShippingMethodEntity toEntity() {
    return ShippingMethodEntity(
      carrierCode: carrierCode ?? '',
      methodCode: methodCode ?? '',
      carrierTitle: carrierTitle ?? '',
      methodTitle: methodTitle ?? '',
      amount: amount ?? 0.0,
      baseAmount: baseAmount ?? 0.0,
      available: available ?? false,
      errorMessage: errorMessage ?? '',
      priceExclTax: priceExclTax ?? 0.0,
      priceInclTax: priceInclTax ?? 0.0,
    );
  }
}

extension PaymentMethodsMapper on PaymentMethodsResponse {
  PaymentMethodsEntity toEntity() {
    return PaymentMethodsEntity(
      paymentMethods: paymentMethods?.map((e) => e.toEntity()).toList() ?? [],
      totals: totals?.toEntity(),
    );
  }
}

extension PaymentMethodMapper on PaymentMethodModel {
  PaymentMethodEntity toEntity() {
    return PaymentMethodEntity(
      code: code ?? '',
      title: title ?? '',
      subtitle: subtitle ?? '',
      paymentGateway: paymentGateway,
    );
  }
}

extension CheckoutCustomOptionMapper on CustomOption {
  CustomOptionEntity toEntity() {
    return CustomOptionEntity(
      title: title ?? '',
      value: value ?? '',
      price: price ?? '',
    );
  }
}

extension CheckoutConfigOptionMapper on ConfigOption {
  ConfigOptionEntity toEntity() {
    return ConfigOptionEntity(title: title ?? '', value: value ?? '');
  }
}
