import 'package:flutter/foundation.dart';
import 'package:pickaboo/data/model/cart/cart_response/cart_response.dart';
import 'package:pickaboo/data/model/cart/cart_item_response/cart_item_response.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/common/region_entity.dart';
import 'package:pickaboo/core/utils/product_image_resolver.dart';

extension CartResponseMapper on CartResponse {
  CartEntity toEntity() {
    if (kDebugMode) {
      print('🔄 CartMapper: Converting CartResponse to CartEntity');
      print('  Cart ID: $id');
      print('  Items count: $itemsCount');
      print('  Cart items length: ${items?.length}');
      print(
        '  Shipping assignments items: ${extensionAttributes?.shippingAssignments?.firstOrNull?.items?.length}',
      );
    }

    final cartItems =
        items ??
        extensionAttributes?.shippingAssignments?.firstOrNull?.items ??
        [];

    if (kDebugMode) {
      print('  Final cartItems length: ${cartItems.length}');
    }

    double calculatedSubtotal = 0.0;
    double calculatedGrandTotal = 0.0;

    for (final item in cartItems) {
      final itemSubtotal = (item.extensionAttributes?.itemSubtotal ?? 0)
          .toDouble();
      calculatedSubtotal += itemSubtotal;
      calculatedGrandTotal += itemSubtotal;
    }

    if (kDebugMode) {
      print('  Calculated subtotal: $calculatedSubtotal');
      print('  Calculated grandTotal: $calculatedGrandTotal');
    }

    final entity = CartEntity(
      id: id?.toString() ?? '',
      itemsCount: itemsCount ?? 0,
      items: cartItems.map((e) => e.toEntity()).toList(),
      subtotal: calculatedSubtotal,
      grandTotal: calculatedGrandTotal,
      discountAmount:
          0.0,
      shippingAmount:
          0.0,
      taxAmount: 0.0,
      couponCode:
          '',
      customer: customer?.toEntity(),
      billingAddress: billingAddress?.toEntity(),
      shippingAddress: extensionAttributes
          ?.shippingAssignments
          ?.firstOrNull
          ?.shipping
          ?.address
          ?.toEntity(),
    );

    if (kDebugMode) {
      print('✅ CartMapper: Entity created');
      print('  Entity ID: ${entity.id}');
      print('  Entity items count: ${entity.itemsCount}');
      print('  Entity items length: ${entity.items.length}');
      print('  Entity subtotal: ${entity.subtotal}');
      print('  Entity grand total: ${entity.grandTotal}');
      print('  Entity couponCode: "${entity.couponCode}"');
      print('  Entity discountAmount: ${entity.discountAmount}');
    }

    return entity;
  }
}

extension ItemMapper on Item {
  CartItemEntity toEntity() {
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
      imageUrl: ProductImageResolver.getCachedImage(extAttrs?.productId ?? 0) ??
          extAttrs?.imageUrl ?? '',
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

extension CustomOptionMapper on CustomOption {
  CustomOptionEntity toEntity() {
    return CustomOptionEntity(
      title: title ?? '',
      value: value ?? '',
      price: price ?? '',
    );
  }
}

extension ConfigOptionMapper on ConfigOption {
  ConfigOptionEntity toEntity() {
    return ConfigOptionEntity(title: title ?? '', value: value ?? '');
  }
}

extension CartItemResponseMapper on CartItemResponse {
  CartItemEntity toEntity() {
    return CartItemEntity(
      itemId: itemId ?? 0,
      sku: sku ?? '',
      qty: qty ?? 0,
      name: name ?? '',
      price: price ?? 0.0,
      productType: productType ?? '',
      quoteId: quoteId ?? '',
      rowTotal: rowTotal ?? 0.0,
      regularPrice: price ?? 0.0,
      specialPrice: 0.0,
      discount: '0',
      imageUrl: '',
      productUrlKey: '',
      productId: 0,
      brand: '',
      stockAvailable: true,
      soldBy: '',
      customOptions: [],
      configOptions: [],
    );
  }
}

extension CustomerMapper on Customer {
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

extension AddressElementMapper on AddressElement {
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

extension BillingAddressMapper on BillingAddressClass {
  AddressEntity toEntity() {
    RegionEntity? mappedRegion;

    if (region is Region) {
      mappedRegion = (region as Region).toEntity();
    } else if (region is Map<String, dynamic>) {
      try {
        final regionMap = region as Map<String, dynamic>;
        mappedRegion = RegionEntity(
          region: regionMap['region']?.toString() ?? '',
          regionCode: regionMap['region_code']?.toString() ?? '',
          regionId:
              int.tryParse(regionMap['region_id']?.toString() ?? '0') ?? 0,
        );
      } catch (_) {
        // Region could not be parsed as a map; mappedRegion remains empty fallback
      }
    }

    return AddressEntity(
      id: id,
      customerId: customerId,
      region: mappedRegion,
      regionId: regionId is int
          ? regionId
          : (regionId is String ? int.tryParse(regionId) : null),
      regionCode: regionCode?.toString(),
      countryId: countryId?.toString(),
      street: street ?? [],
      telephone: telephone?.toString(),
      postcode: postcode?.toString(),
      city: city?.toString(),
      firstname: firstname?.toString(),
      lastname: lastname?.toString(),
      email: email,
    );
  }
}

extension CartRegionMapper on Region {
  RegionEntity toEntity() {
    return RegionEntity(
      regionCode: regionCode ?? '',
      region: region ?? '',
      regionId: regionId ?? 0,
    );
  }
}
