// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDetailResponseImpl _$$OrderDetailResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OrderDetailResponseImpl(
  orderId: (json['order_id'] as num?)?.toInt(),
  orderNumber: json['order_number'] as String?,
  customerId: (json['customer_id'] as num?)?.toInt(),
  createdAt: safeDateTimeFromJson(json['created_at']),
  state: json['state'] as String?,
  status: json['status'] as String?,
  items: safeItemsFromJson(json['items']),
  couponCode: json['coupon_code'] as String?,
  spentRewardPoints: json['spent_reward_points'] as String?,
  orderSummary:
      json['order_summary'] == null
          ? null
          : OrderSummaryDetailModel.fromJson(
            json['order_summary'] as Map<String, dynamic>,
          ),
  shippingAddress: safeShippingAddressFromJson(json['shipping_address']),
  paymentAddress: safePaymentAddressFromJson(json['payment_address']),
  shippingMethod: json['shipping_method'] as String?,
  remoteIp: json['remote_ip'] as String?,
  paymentMethod: json['payment_method'] as String?,
  paymentInformation: safePaymentInformationFromJson(
    json['payment_information'],
  ),
  justForYou: json['just_for_you'],
  statusHistory: safeStatusHistoryFromJson(json['status_history']),
  statusHistoryNew: safeStatusHistoryFromJson(json['status_history_new']),
  statusLabel: safeStatusLabelFromJson(json['status_label']),
  customerName: json['customer_name'] as String?,
  customerEmail: json['customer_email'] as String?,
  customerPhone: json['customer_phone'] as String?,
  convenienceFee: json['convenience_fee'] as num?,
  convenienceFeePercent: json['convenience_fee_percent'] as String?,
  paymentMode: json['payment_mode'] as String?,
  emiTenure: json['emi_tenure'],
  emiBank: json['emi_bank'] as String?,
  bankName: json['bank_name'] as String?,
  tenure: json['tenure'],
);

Map<String, dynamic> _$$OrderDetailResponseImplToJson(
  _$OrderDetailResponseImpl instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'order_number': instance.orderNumber,
  'customer_id': instance.customerId,
  'created_at': safeDateTimeToJson(instance.createdAt),
  'state': instance.state,
  'status': instance.status,
  'items': safeItemsToJson(instance.items),
  'coupon_code': instance.couponCode,
  'spent_reward_points': instance.spentRewardPoints,
  'order_summary': instance.orderSummary,
  'shipping_address': safeShippingAddressToJson(instance.shippingAddress),
  'payment_address': safePaymentAddressToJson(instance.paymentAddress),
  'shipping_method': instance.shippingMethod,
  'remote_ip': instance.remoteIp,
  'payment_method': instance.paymentMethod,
  'payment_information': safePaymentInformationToJson(
    instance.paymentInformation,
  ),
  'just_for_you': instance.justForYou,
  'status_history': safeStatusHistoryToJson(instance.statusHistory),
  'status_history_new': safeStatusHistoryToJson(instance.statusHistoryNew),
  'status_label': safeStatusLabelToJson(instance.statusLabel),
  'customer_name': instance.customerName,
  'customer_email': instance.customerEmail,
  'customer_phone': instance.customerPhone,
  'convenience_fee': instance.convenienceFee,
  'convenience_fee_percent': instance.convenienceFeePercent,
  'payment_mode': instance.paymentMode,
  'emi_tenure': instance.emiTenure,
  'emi_bank': instance.emiBank,
  'bank_name': instance.bankName,
  'tenure': instance.tenure,
};

_$OrderItemDetailModelImpl _$$OrderItemDetailModelImplFromJson(
  Map<String, dynamic> json,
) => _$OrderItemDetailModelImpl(
  itemId: json['item_id'],
  itemName: json['item_name'] as String?,
  productId: json['product_id'],
  productSlug: json['product_slug'] as String?,
  productCategoryIds: json['product_category_ids'] as List<dynamic>?,
  productCategoryNames:
      (json['product_category_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  image: json['image'] as String?,
  varient:
      (json['varient'] as List<dynamic>?)?.map((e) => e as Object).toList(),
  extaOptions:
      (json['exta_options'] as List<dynamic>?)
          ?.map((e) => e as Object)
          .toList(),
  soldBy: json['sold_by'] as String?,
  qty: json['qty'] as num?,
  regularPrice: json['regular_price'] as num?,
  finalPrice: json['final_price'] as num?,
  discount: json['discount'] as num?,
);

Map<String, dynamic> _$$OrderItemDetailModelImplToJson(
  _$OrderItemDetailModelImpl instance,
) => <String, dynamic>{
  'item_id': instance.itemId,
  'item_name': instance.itemName,
  'product_id': instance.productId,
  'product_slug': instance.productSlug,
  'product_category_ids': instance.productCategoryIds,
  'product_category_names': instance.productCategoryNames,
  'image': instance.image,
  'varient': instance.varient,
  'exta_options': instance.extaOptions,
  'sold_by': instance.soldBy,
  'qty': instance.qty,
  'regular_price': instance.regularPrice,
  'final_price': instance.finalPrice,
  'discount': instance.discount,
};

_$OrderSummaryDetailModelImpl _$$OrderSummaryDetailModelImplFromJson(
  Map<String, dynamic> json,
) => _$OrderSummaryDetailModelImpl(
  subtotal: json['subtotal'] as num?,
  totalOrderQty: json['total_order_qty'] as num?,
  discountAmount: json['discount_amount'] as num?,
  rewardsDiscount: json['rewards_discount'] as num?,
  shippingFee: json['shipping_fee'] as num?,
  grandTotal: json['grand_total'] as num?,
  rewardEarned: json['reward_earned'] as num?,
  convenienceFee: json['convenience_fee'] as num?,
  convenienceFeePercent: json['convenience_fee_percent'] as String?,
  convenienceAmount: json['convenience_amount'] as num?,
  conveniencePrice: json['convenience_price'] as num?,
  fee: json['fee'] as num?,
);

Map<String, dynamic> _$$OrderSummaryDetailModelImplToJson(
  _$OrderSummaryDetailModelImpl instance,
) => <String, dynamic>{
  'subtotal': instance.subtotal,
  'total_order_qty': instance.totalOrderQty,
  'discount_amount': instance.discountAmount,
  'rewards_discount': instance.rewardsDiscount,
  'shipping_fee': instance.shippingFee,
  'grand_total': instance.grandTotal,
  'reward_earned': instance.rewardEarned,
  'convenience_fee': instance.convenienceFee,
  'convenience_fee_percent': instance.convenienceFeePercent,
  'convenience_amount': instance.convenienceAmount,
  'convenience_price': instance.conveniencePrice,
  'fee': instance.fee,
};

_$ShippingAddressModelImpl _$$ShippingAddressModelImplFromJson(
  Map<String, dynamic> json,
) => _$ShippingAddressModelImpl(
  name: json['name'] as String?,
  mobile: json['mobile'],
  email: json['email'] as String?,
  address: json['address'] as String?,
);

Map<String, dynamic> _$$ShippingAddressModelImplToJson(
  _$ShippingAddressModelImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'mobile': instance.mobile,
  'email': instance.email,
  'address': instance.address,
};

_$PaymentAddressModelImpl _$$PaymentAddressModelImplFromJson(
  Map<String, dynamic> json,
) => _$PaymentAddressModelImpl(
  regionId: json['region_id'],
  regionCode: json['region_code'] as String?,
  countryId: json['country_id'] as String?,
  region: json['region'] as String?,
  street: (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
  postcode: json['postcode'],
  city: json['city'] as String?,
  firstname: json['firstname'] as String?,
  lastname: json['lastname'] as String?,
  customerId: json['customer_id'],
  email: json['email'] as String?,
  telephone: json['telephone'],
  shippingCarrierCode: json['shipping_carrier_code'] as String?,
  shippingMethodCode: json['shipping_method_code'] as String?,
  quoteId: json['quoteId'],
);

Map<String, dynamic> _$$PaymentAddressModelImplToJson(
  _$PaymentAddressModelImpl instance,
) => <String, dynamic>{
  'region_id': instance.regionId,
  'region_code': instance.regionCode,
  'country_id': instance.countryId,
  'region': instance.region,
  'street': instance.street,
  'postcode': instance.postcode,
  'city': instance.city,
  'firstname': instance.firstname,
  'lastname': instance.lastname,
  'customer_id': instance.customerId,
  'email': instance.email,
  'telephone': instance.telephone,
  'shipping_carrier_code': instance.shippingCarrierCode,
  'shipping_method_code': instance.shippingMethodCode,
  'quoteId': instance.quoteId,
};

_$PaymentInfoModelImpl _$$PaymentInfoModelImplFromJson(
  Map<String, dynamic> json,
) => _$PaymentInfoModelImpl(
  code: json['code'] as String?,
  title: json['title'] as String?,
  value: json['value'],
);

Map<String, dynamic> _$$PaymentInfoModelImplToJson(
  _$PaymentInfoModelImpl instance,
) => <String, dynamic>{
  'code': instance.code,
  'title': instance.title,
  'value': instance.value,
};

_$StatusHistoryModelImpl _$$StatusHistoryModelImplFromJson(
  Map<String, dynamic> json,
) => _$StatusHistoryModelImpl(
  entityId: json['entity_id'],
  parentId: json['parent_id'],
  isCustomerNotified: json['is_customer_notified'],
  isVisibleOnFront: json['is_visible_on_front'],
  comment: json['comment'] as String?,
  status: json['status'] as String?,
  label: json['label'] as String?,
  createdAt: safeDateTimeFromJson(json['created_at']),
  time: safeDateTimeFromJson(json['time']),
  timeRaw: json['time_raw'] as String?,
  entityName: safeEntityNameFromJson(json['entity_name']),
  sellerOrderId: json['seller_order_id'],
);

Map<String, dynamic> _$$StatusHistoryModelImplToJson(
  _$StatusHistoryModelImpl instance,
) => <String, dynamic>{
  'entity_id': instance.entityId,
  'parent_id': instance.parentId,
  'is_customer_notified': instance.isCustomerNotified,
  'is_visible_on_front': instance.isVisibleOnFront,
  'comment': instance.comment,
  'status': instance.status,
  'label': instance.label,
  'created_at': safeDateTimeToJson(instance.createdAt),
  'time': safeDateTimeToJson(instance.time),
  'time_raw': instance.timeRaw,
  'entity_name': safeEntityNameToJson(instance.entityName),
  'seller_order_id': instance.sellerOrderId,
};

_$StatusLabelImpl _$$StatusLabelImplFromJson(Map<String, dynamic> json) =>
    _$StatusLabelImpl(
      status: json['status'] as String?,
      state: json['state'] as String?,
      isDefault: json['is_default'] as String?,
      visibleOnFront: json['visible_on_front'] as String?,
    );

Map<String, dynamic> _$$StatusLabelImplToJson(_$StatusLabelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'state': instance.state,
      'is_default': instance.isDefault,
      'visible_on_front': instance.visibleOnFront,
    };
