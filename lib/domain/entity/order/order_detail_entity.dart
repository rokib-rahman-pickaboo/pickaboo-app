class OrderDetailEntity {
  final int orderId;
  final String orderNumber;
  final int customerId;
  final String createdAt;
  final String state;
  final String status;
  final List<OrderItemDetailEntity> items;
  final String? couponCode;
  final int spentRewardPoints;
  final OrderSummaryDetailEntity orderSummary;
  final ShippingAddressEntity? shippingAddress;
  final PaymentAddressEntity? paymentAddress;
  final String shippingMethod;
  final String paymentMethod;
  final List<PaymentInfoEntity> paymentInformation;
  final List<StatusHistoryEntity> statusHistory;
  final String? remoteIp;
  final Object? justForYou;
  final List<StatusLabelEntity>? statusLabel;
  final String? customerName;
  final String? customerEmail;
  final String? customerPhone;

  const OrderDetailEntity({
    required this.orderId,
    required this.orderNumber,
    required this.customerId,
    required this.createdAt,
    required this.state,
    required this.status,
    required this.items,
    this.couponCode,
    required this.spentRewardPoints,
    required this.orderSummary,
    this.shippingAddress,
    this.paymentAddress,
    required this.shippingMethod,
    required this.paymentMethod,
    required this.paymentInformation,
    required this.statusHistory,
    this.remoteIp,
    this.justForYou,
    this.statusLabel,
    this.customerName,
    this.customerEmail,
    this.customerPhone,
  });
}

class OrderItemDetailEntity {
  final int itemId;
  final String itemName;
  final int productId;
  final String productSlug;
  final List<int> productCategoryIds;
  final List<String> productCategoryNames;
  final String? image;
  final String? soldBy;
  final int qty;
  final double regularPrice;
  final double finalPrice;
  final double discount;
  final List<Object>? varient;
  final List<Object>? extaOptions;

  const OrderItemDetailEntity({
    required this.itemId,
    required this.itemName,
    required this.productId,
    required this.productSlug,
    required this.productCategoryIds,
    required this.productCategoryNames,
    this.image,
    this.soldBy,
    required this.qty,
    required this.regularPrice,
    required this.finalPrice,
    required this.discount,
    this.varient,
    this.extaOptions,
  });
}

class OrderSummaryDetailEntity {
  final double subtotal;
  final int totalOrderQty;
  final double discountAmount;
  final double rewardsDiscount;
  final double shippingFee;
  final double grandTotal;
  final int rewardEarned;

  const OrderSummaryDetailEntity({
    required this.subtotal,
    required this.totalOrderQty,
    required this.discountAmount,
    required this.rewardsDiscount,
    required this.shippingFee,
    required this.grandTotal,
    required this.rewardEarned,
  });
}

class ShippingAddressEntity {
  final String name;
  final String mobile;
  final String email;
  final String address;

  const ShippingAddressEntity({
    required this.name,
    required this.mobile,
    required this.email,
    required this.address,
  });
}

class PaymentAddressEntity {
  final String region;
  final List<String> street;
  final String city;
  final String postcode;
  final String firstname;
  final String lastname;
  final String email;
  final String telephone;
  final String? quoteId;

  const PaymentAddressEntity({
    required this.region,
    required this.street,
    required this.city,
    required this.postcode,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.telephone,
    this.quoteId,
  });
}

class PaymentInfoEntity {
  final String code;
  final String title;
  final String
  value;

  const PaymentInfoEntity({
    required this.code,
    required this.title,
    required this.value,
  });
}

class StatusHistoryEntity {
  final int entityId;
  final String? comment;
  final String status;
  final String createdAt;

  const StatusHistoryEntity({
    required this.entityId,
    this.comment,
    required this.status,
    required this.createdAt,
  });
}

class StatusLabelEntity {
  final String? status;
  final String? state;
  final String? isDefault;
  final String? visibleOnFront;

  const StatusLabelEntity({
    this.status,
    this.state,
    this.isDefault,
    this.visibleOnFront,
  });
}
