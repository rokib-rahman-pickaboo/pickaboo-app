import 'package:pickaboo/domain/entity/common/region_entity.dart';

class CartEntity {
  final String id;
  final int itemsCount;
  final List<CartItemEntity> items;
  final double subtotal;
  final double grandTotal;
  final double discountAmount;
  final double shippingAmount;
  final double taxAmount;
  final String couponCode;
  final double rewardPointsDiscount;

  final int maxSpendablePoints;

  final int minSpendablePoints;

  final int appliedPoints;

  final int pointsToEarn;

  final String discountTitle;
  final CustomerEntity? customer;
  final AddressEntity? billingAddress;
  final AddressEntity? shippingAddress;

  const CartEntity({
    required this.id,
    required this.itemsCount,
    required this.items,
    required this.subtotal,
    required this.grandTotal,
    required this.discountAmount,
    required this.shippingAmount,
    required this.taxAmount,
    required this.couponCode,
    this.rewardPointsDiscount = 0,
    this.maxSpendablePoints = 0,
    this.minSpendablePoints = 0,
    this.appliedPoints = 0,
    this.pointsToEarn = 0,
    this.discountTitle = '',
    this.customer,
    this.billingAddress,
    this.shippingAddress,
  });
}

class CartItemEntity {
  final int earnPoints;
  final int itemId;
  final String sku;
  final int qty;
  final String name;
  final double price;
  final String productType;
  final String quoteId;
  final double rowTotal;
  final double regularPrice;
  final double specialPrice;
  final String discount;
  final String imageUrl;
  final String productUrlKey;
  final int productId;
  final String brand;
  final bool stockAvailable;
  final String soldBy;
  final List<CustomOptionEntity> customOptions;
  final List<ConfigOptionEntity> configOptions;

  const CartItemEntity({
    required this.itemId,
    required this.sku,
    required this.qty,
    required this.name,
    required this.price,
    required this.productType,
    required this.quoteId,
    required this.rowTotal,
    required this.regularPrice,
    required this.specialPrice,
    required this.discount,
    required this.imageUrl,
    required this.productUrlKey,
    required this.productId,
    required this.brand,
    required this.stockAvailable,
    this.soldBy = '',
    this.customOptions = const [],
    this.configOptions = const [],
    this.earnPoints = 0,
  });
}

class ConfigOptionEntity {
  final String title;
  final String value;

  const ConfigOptionEntity({required this.title, required this.value});
}

class CustomOptionEntity {
  final String title;
  final String value;
  final String price;

  const CustomOptionEntity({
    required this.title,
    required this.value,
    this.price = '',
  });
}

class ConfigurableItemOptionEntity {
  final String optionId;
  final String optionValue;
  final bool isCustomOption;

  const ConfigurableItemOptionEntity({
    required this.optionId,
    required this.optionValue,
    this.isCustomOption = false,
  });
}

class AddressEntity {
  final int? id;
  final int? customerId;
  final RegionEntity? region;
  final int? regionId;
  final String? regionCode;
  final String? countryId;
  final List<String> street;
  final String? telephone;
  final String? postcode;
  final String? city;
  final String? firstname;
  final String? lastname;
  final String? email;
  final bool defaultShipping;
  final bool defaultBilling;

  AddressEntity({
    this.id,
    this.customerId,
    this.region,
    this.regionId,
    this.regionCode,
    this.countryId,
    required this.street,
    this.telephone,
    this.postcode,
    this.city,
    this.firstname,
    this.lastname,
    this.email,
    this.defaultShipping = false,
    this.defaultBilling = false,
  });
}

class CustomerEntity {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final List<AddressEntity> addresses;

  const CustomerEntity({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.addresses,
  });
}
