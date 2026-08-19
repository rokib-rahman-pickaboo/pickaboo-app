import 'package:pickaboo/data/model/order/order_detail_response/order_detail_response.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';

extension OrderDetailResponseMapper on OrderDetailResponse {
  OrderDetailEntity toEntity() {
    return OrderDetailEntity(
      orderId: orderId ?? 0,
      orderNumber: orderNumber ?? '',
      customerId: customerId ?? 0,
      createdAt: createdAt?.toIso8601String() ?? '',
      state: state ?? '',
      status: status ?? '',
      items: items?.map((item) => item.toEntity()).toList() ?? [],
      couponCode: couponCode?.toString(),
      spentRewardPoints: int.tryParse(spentRewardPoints ?? '0') ?? 0,
      orderSummary:
          orderSummary?.toEntity() ??
          const OrderSummaryDetailEntity(
            subtotal: 0,
            totalOrderQty: 0,
            discountAmount: 0,
            rewardsDiscount: 0,
            shippingFee: 0,
            grandTotal: 0,
            rewardEarned: 0,
          ),
      shippingAddress: (shippingAddress != null && shippingAddress!.isNotEmpty)
          ? shippingAddress!.first.toEntity()
          : null,
      paymentAddress: (paymentAddress != null && paymentAddress!.isNotEmpty)
          ? paymentAddress!.first.toEntity()
          : null,
      shippingMethod: shippingMethod ?? '',
      paymentMethod: paymentMethod ?? '',
      paymentInformation:
          paymentInformation?.map((info) => info.toEntity()).toList() ?? [],
      statusHistory:
          statusHistory?.map((history) => history.toEntity()).toList() ?? [],
      remoteIp: remoteIp,
      justForYou: justForYou,
      statusLabel: statusLabel?.map((label) => label.toEntity()).toList() ?? [],
      customerName: customerName,
      customerEmail: customerEmail,
      customerPhone: customerPhone,
    );
  }
}

extension ItemMapper on OrderItemDetailModel {
  OrderItemDetailEntity toEntity() {
    return OrderItemDetailEntity(
      itemId: int.tryParse(itemId ?? '0') ?? 0,
      itemName: itemName ?? '',
      productId: int.tryParse(productId ?? '0') ?? 0,
      productSlug: productSlug ?? '',
      productCategoryIds:
          productCategoryIds?.map((e) => int.tryParse(e) ?? 0).toList() ?? [],
      productCategoryNames: productCategoryNames ?? [],
      image: image,
      soldBy: soldBy,
      qty: qty ?? 0,
      regularPrice: (regularPrice ?? 0).toDouble(),
      finalPrice: (finalPrice ?? 0).toDouble(),
      discount: (discount ?? 0).toDouble(),
      varient: varient,
      extaOptions: extaOptions,
    );
  }
}

extension OrderSummaryMapper on OrderSummaryDetailModel {
  OrderSummaryDetailEntity toEntity() {
    return OrderSummaryDetailEntity(
      subtotal: (subtotal ?? 0).toDouble(),
      totalOrderQty: totalOrderQty ?? 0,
      discountAmount: (discountAmount ?? 0).toDouble(),
      rewardsDiscount: (rewardsDiscount ?? 0).toDouble(),
      shippingFee: (shippingFee ?? 0).toDouble(),
      grandTotal: (grandTotal ?? 0).toDouble(),
      rewardEarned: rewardEarned ?? 0,
    );
  }
}

extension ShippingAddressMapper on ShippingAddressModel {
  ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      name: name ?? '',
      mobile: mobile ?? '',
      email: email ?? '',
      address: address ?? '',
    );
  }
}

extension PaymentAddressMapper on PaymentAddressModel {
  PaymentAddressEntity toEntity() {
    return PaymentAddressEntity(
      region: region ?? '',
      street: street ?? [],
      city: city ?? '',
      postcode: postcode ?? '',
      firstname: firstname ?? '',
      lastname: lastname ?? '',
      email: email ?? '',
      telephone: telephone ?? '',
      quoteId: quoteId,
    );
  }
}

extension PaymentInformationMapper on PaymentInfoModel {
  PaymentInfoEntity toEntity() {
    return PaymentInfoEntity(
      code: code ?? '',
      title: title ?? '',
      value: value?.toString() ?? '',
    );
  }
}

extension StatusHistoryMapper on StatusHistoryModel {
  StatusHistoryEntity toEntity() {
    return StatusHistoryEntity(
      entityId: int.tryParse(entityId ?? '0') ?? 0,
      comment: comment,
      status: status ?? '',
      createdAt: createdAt?.toIso8601String() ?? '',
    );
  }
}

extension StatusLabelMapper on StatusLabel {
  StatusLabelEntity toEntity() {
    return StatusLabelEntity(
      status: status,
      state: state,
      isDefault: isDefault,
      visibleOnFront: visibleOnFront,
    );
  }
}
