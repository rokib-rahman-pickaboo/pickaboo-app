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
          orderSummary?.toEntity(
            rootFee: convenienceFee,
            rootFeePercent: convenienceFeePercent,
          ) ??
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
      paymentInformation: _buildPaymentInformation(),
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

  List<PaymentInfoEntity> _buildPaymentInformation() {
    final list =
        paymentInformation?.map((info) => info.toEntity()).toList() ?? [];

    // If root payment_mode exists and isn't already present
    if (paymentMode != null &&
        paymentMode!.isNotEmpty &&
        !list.any((p) =>
            p.code.toLowerCase() == 'payment_mode' ||
            p.title.toLowerCase() == 'payment mode')) {
      list.add(PaymentInfoEntity(
        code: 'payment_mode',
        title: 'Payment Mode',
        value: paymentMode!,
      ));
    }

    // If root emi_tenure exists and isn't already present
    final effectiveTenure = emiTenure ?? tenure;
    if (effectiveTenure != null &&
        effectiveTenure.toString().isNotEmpty &&
        !list.any((p) =>
            p.code.toLowerCase() == 'emi_tenure' ||
            p.title.toLowerCase().contains('tenure'))) {
      list.add(PaymentInfoEntity(
        code: 'emi_tenure',
        title: 'EMI Tenure',
        value: effectiveTenure.toString(),
      ));
    }

    // If root emi_bank exists and isn't already present
    final effectiveBank = emiBank ?? bankName;
    if (effectiveBank != null &&
        effectiveBank.isNotEmpty &&
        !list.any((p) =>
            p.code.toLowerCase() == 'emi_bank' ||
            p.title.toLowerCase().contains('bank'))) {
      list.add(PaymentInfoEntity(
        code: 'emi_bank',
        title: 'EMI Bank',
        value: effectiveBank,
      ));
    }

    return list;
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
  OrderSummaryDetailEntity toEntity({num? rootFee, String? rootFeePercent}) {
    final rawFee =
        convenienceFee ?? conveniencePrice ?? convenienceAmount ?? fee ?? rootFee;
    double feeVal = (rawFee ?? 0).toDouble();

    final subtotalVal = (subtotal ?? 0).toDouble();
    final shippingVal = (shippingFee ?? 0).toDouble();
    final discountVal = (discountAmount ?? 0).toDouble();
    final grandTotalVal = (grandTotal ?? 0).toDouble();

    // Fallback calculation: If convenience fee was not explicitly named in the API,
    // but grandTotal exceeds (subtotal + shipping - discount), the exact difference is the fee.
    if (feeVal <= 0 && grandTotalVal > 0) {
      final expectedTotal = subtotalVal + shippingVal - discountVal.abs();
      final diff = grandTotalVal - expectedTotal;
      if (diff > 0.5) {
        feeVal = diff;
      }
    }

    String? feePercentStr = convenienceFeePercent ?? rootFeePercent;
    if ((feePercentStr == null || feePercentStr.isEmpty) && feeVal > 0) {
      // Calculate percentage based on (subtotal + shipping) or subtotal
      final base = (subtotalVal + shippingVal) > 0
          ? (subtotalVal + shippingVal)
          : subtotalVal;
      if (base > 0) {
        final pct = (feeVal / base) * 100;
        final roundedPct = double.parse(pct.toStringAsFixed(2));
        feePercentStr =
            '${roundedPct % 1 == 0 ? roundedPct.toInt() : roundedPct.toStringAsFixed(1)}%';
      }
    }

    return OrderSummaryDetailEntity(
      subtotal: subtotalVal,
      totalOrderQty: totalOrderQty ?? 0,
      discountAmount: discountVal,
      rewardsDiscount: (rewardsDiscount ?? 0).toDouble(),
      shippingFee: shippingVal,
      grandTotal: grandTotalVal,
      rewardEarned: rewardEarned ?? 0,
      convenienceFee: feeVal,
      convenienceFeePercent: feePercentStr,
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
