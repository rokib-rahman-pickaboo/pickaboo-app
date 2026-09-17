export 'package:pickaboo/domain/entity/common/product/product_attribute_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_attribute_entity.dart';
import 'package:pickaboo/core/utils/delivery_time_utils.dart';

class ProductEntity {
  final String id;
  final bool expressDelivery;
  final String productName;
  final String sku;
  final String slug;
  final String typeId;
  final bool stockAvailable;
  final bool freeDelivery;
  final int productPrice;
  final int productSpecialPrice;
  final int productDiscount;
  final String offers;
  final double rating;
  final double clubPoint;
  final int ratingCount;
  final String productImg;
  final bool emiAvailable;
  final bool comingSoon;
  final bool isAd;
  final List<ProductAttributeEntity> attributes;
  final String? deliveryInfo;

  const ProductEntity({
    required this.id,
    required this.expressDelivery,
    required this.productName,
    required this.sku,
    required this.slug,
    required this.typeId,
    required this.stockAvailable,
    required this.freeDelivery,
    required this.productPrice,
    required this.productSpecialPrice,
    required this.productDiscount,
    required this.offers,
    required this.rating,
    required this.clubPoint,
    required this.ratingCount,
    required this.productImg,
    required this.emiAvailable,
    required this.comingSoon,
    this.isAd = false,
    this.attributes = const [],
    this.deliveryInfo,
  });

  ProductEntity copyWith({
    String? id,
    bool? expressDelivery,
    String? productName,
    String? sku,
    String? slug,
    String? typeId,
    bool? stockAvailable,
    bool? freeDelivery,
    int? productPrice,
    int? productSpecialPrice,
    int? productDiscount,
    String? offers,
    double? rating,
    double? clubPoint,
    int? ratingCount,
    String? productImg,
    bool? emiAvailable,
    bool? comingSoon,
    bool? isAd,
    List<ProductAttributeEntity>? attributes,
    String? deliveryInfo,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      expressDelivery: expressDelivery ?? this.expressDelivery,
      productName: productName ?? this.productName,
      sku: sku ?? this.sku,
      slug: slug ?? this.slug,
      typeId: typeId ?? this.typeId,
      stockAvailable: stockAvailable ?? this.stockAvailable,
      freeDelivery: freeDelivery ?? this.freeDelivery,
      productPrice: productPrice ?? this.productPrice,
      productSpecialPrice: productSpecialPrice ?? this.productSpecialPrice,
      productDiscount: productDiscount ?? this.productDiscount,
      offers: offers ?? this.offers,
      rating: rating ?? this.rating,
      clubPoint: clubPoint ?? this.clubPoint,
      ratingCount: ratingCount ?? this.ratingCount,
      productImg: productImg ?? this.productImg,
      emiAvailable: emiAvailable ?? this.emiAvailable,
      comingSoon: comingSoon ?? this.comingSoon,
      isAd: isAd ?? this.isAd,
      attributes: attributes ?? this.attributes,
      deliveryInfo: deliveryInfo ?? this.deliveryInfo,
    );
  }

  /// Returns standard or custom delivery info (e.g. "Delivery by Today", "Delivery by Tomorrow", "Delivery by 2-3 working days")
  String get displayDeliveryText {
    final info = DeliveryTimeUtils.getProductItemDeliveryInfo(
      isExpress: expressDelivery,
      customDeliveryInfo: deliveryInfo,
    );
    return '${info.label}${info.target}';
  }

  /// Target bold text (e.g. "Today", "Tomorrow", "2-3 working days")
  String get deliveryTargetText {
    return DeliveryTimeUtils.getProductItemDeliveryInfo(
      isExpress: expressDelivery,
      customDeliveryInfo: deliveryInfo,
    ).target;
  }

  /// Prefix label text (e.g. "Delivery by ", "Get delivery in ")
  String get deliveryLabelText {
    return DeliveryTimeUtils.getProductItemDeliveryInfo(
      isExpress: expressDelivery,
      customDeliveryInfo: deliveryInfo,
    ).label;
  }

  /// Extracts brand from attributes or from first word of productName
  String get brand {
    for (final attr in attributes) {
      if (attr.code.toLowerCase() == 'manufacturer' ||
          attr.code.toLowerCase() == 'brand') {
        if (attr.value.isNotEmpty) return attr.value;
        if (attr.label.isNotEmpty) return attr.label;
      }
    }
    final firstWord = productName.trim().split(' ').first;
    if (firstWord.length >= 2 && !firstWord.contains(RegExp(r'[0-9]'))) {
      return firstWord;
    }
    return '';
  }

  int get finalPrice =>
      productSpecialPrice > 0 ? productSpecialPrice : productPrice;

  int get originalPrice =>
      productSpecialPrice > 0 ? productPrice : 0;

  int get computedDiscountPercentage {
    if (productDiscount > 0) return productDiscount;
    if (productSpecialPrice > 0 && productPrice > productSpecialPrice) {
      return ((productPrice - productSpecialPrice) / productPrice * 100).round();
    }
    return 0;
  }
}


