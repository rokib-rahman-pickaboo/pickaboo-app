import 'package:pickaboo/domain/entity/cart/cart_entity.dart';

class CheckoutEntity {
  final CartCheckoutEntity cart;
  final CartTotalsEntity cartTotals;

  const CheckoutEntity({required this.cart, required this.cartTotals});
}

class CartCheckoutEntity {
  final int id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isActive;
  final bool isVirtual;
  final List<CartItemEntity> items;
  final int itemsCount;
  final int itemsQty;
  final CustomerEntity? customer;
  final AddressEntity? billingAddress;
  final AddressEntity? shippingAddress;
  final int? origOrderId;
  final CurrencyEntity? currency;
  final bool customerIsGuest;
  final bool customerNoteNotify;
  final int? customerTaxClassId;
  final int storeId;

  const CartCheckoutEntity({
    required this.id,
    this.createdAt,
    this.updatedAt,
    required this.isActive,
    required this.isVirtual,
    required this.items,
    required this.itemsCount,
    required this.itemsQty,
    this.customer,
    this.billingAddress,
    this.shippingAddress,
    this.origOrderId,
    this.currency,
    required this.customerIsGuest,
    required this.customerNoteNotify,
    this.customerTaxClassId,
    required this.storeId,
  });
}

class CurrencyEntity {
  final String globalCurrencyCode;
  final String baseCurrencyCode;
  final String storeCurrencyCode;
  final String quoteCurrencyCode;
  final int storeToBaseRate;
  final int storeToQuoteRate;
  final int baseToGlobalRate;
  final int baseToQuoteRate;

  const CurrencyEntity({
    required this.globalCurrencyCode,
    required this.baseCurrencyCode,
    required this.storeCurrencyCode,
    required this.quoteCurrencyCode,
    required this.storeToBaseRate,
    required this.storeToQuoteRate,
    required this.baseToGlobalRate,
    required this.baseToQuoteRate,
  });
}

class CartTotalsEntity {
  final double grandTotal;
  final double baseGrandTotal;
  final double subtotal;
  final double baseSubtotal;
  final double discountAmount;
  final double baseDiscountAmount;
  final double subtotalWithDiscount;
  final double baseSubtotalWithDiscount;
  final double shippingAmount;
  final double baseShippingAmount;
  final double shippingDiscountAmount;
  final double baseShippingDiscountAmount;
  final double taxAmount;
  final double baseTaxAmount;
  final double shippingTaxAmount;
  final double baseShippingTaxAmount;
  final double subtotalInclTax;
  final double shippingInclTax;
  final double baseShippingInclTax;
  final String baseCurrencyCode;
  final String quoteCurrencyCode;
  final String couponCode;
  final int itemsQty;
  final List<CartTotalsItemEntity> items;
  final List<TotalSegmentEntity> totalSegments;

  const CartTotalsEntity({
    required this.grandTotal,
    required this.baseGrandTotal,
    required this.subtotal,
    required this.baseSubtotal,
    required this.discountAmount,
    required this.baseDiscountAmount,
    required this.subtotalWithDiscount,
    required this.baseSubtotalWithDiscount,
    required this.shippingAmount,
    required this.baseShippingAmount,
    required this.shippingDiscountAmount,
    required this.baseShippingDiscountAmount,
    required this.taxAmount,
    required this.baseTaxAmount,
    required this.shippingTaxAmount,
    required this.baseShippingTaxAmount,
    required this.subtotalInclTax,
    required this.shippingInclTax,
    required this.baseShippingInclTax,
    required this.baseCurrencyCode,
    required this.quoteCurrencyCode,
    this.couponCode = '',
    required this.itemsQty,
    required this.items,
    required this.totalSegments,
  });
}

class CartTotalsItemEntity {
  final int itemId;
  final double price;
  final double basePrice;
  final int qty;
  final double rowTotal;
  final double baseRowTotal;
  final double rowTotalWithDiscount;
  final double taxAmount;
  final double baseTaxAmount;
  final int taxPercent;
  final double discountAmount;
  final double baseDiscountAmount;
  final int discountPercent;
  final double priceInclTax;
  final double basePriceInclTax;
  final double rowTotalInclTax;
  final double baseRowTotalInclTax;
  final String options;
  final String name;
  final int? productId;
  final String? imageUrl;

  const CartTotalsItemEntity({
    required this.itemId,
    required this.price,
    required this.basePrice,
    required this.qty,
    required this.rowTotal,
    required this.baseRowTotal,
    required this.rowTotalWithDiscount,
    required this.taxAmount,
    required this.baseTaxAmount,
    required this.taxPercent,
    required this.discountAmount,
    required this.baseDiscountAmount,
    required this.discountPercent,
    required this.priceInclTax,
    required this.basePriceInclTax,
    required this.rowTotalInclTax,
    required this.baseRowTotalInclTax,
    required this.options,
    required this.name,
    this.productId,
    this.imageUrl,
  });
}

class TotalSegmentEntity {
  final String code;
  final String title;
  final double value;
  final String? area;

  const TotalSegmentEntity({
    required this.code,
    required this.title,
    required this.value,
    this.area,
  });
}
