import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_detail_response.freezed.dart';
part 'order_detail_response.g.dart';

@freezed
class OrderDetailResponse with _$OrderDetailResponse {
  const factory OrderDetailResponse({
    @JsonKey(name: "order_id") int? orderId,
    @JsonKey(name: "order_number") String? orderNumber,
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "items") List<OrderItemDetailModel>? items,
    @JsonKey(name: "coupon_code") String? couponCode,
    @JsonKey(name: "spent_reward_points") String? spentRewardPoints,
    @JsonKey(name: "order_summary") OrderSummaryDetailModel? orderSummary,
    @JsonKey(name: "shipping_address")
    List<ShippingAddressModel>? shippingAddress,
    @JsonKey(name: "payment_address") List<PaymentAddressModel>? paymentAddress,
    @JsonKey(name: "shipping_method") String? shippingMethod,
    @JsonKey(name: "remote_ip") String? remoteIp,
    @JsonKey(name: "payment_method") String? paymentMethod,
    @JsonKey(name: "payment_information")
    List<PaymentInfoModel>? paymentInformation,
    @JsonKey(name: "just_for_you") Object? justForYou,
    @JsonKey(name: "status_history") List<StatusHistoryModel>? statusHistory,
    @JsonKey(name: "status_label") List<StatusLabel>? statusLabel,
    @JsonKey(name: "customer_name") String? customerName,
    @JsonKey(name: "customer_email") String? customerEmail,
    @JsonKey(name: "customer_phone") String? customerPhone,
  }) = _OrderDetailResponse;

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailResponseFromJson(json);
}

@freezed
class OrderItemDetailModel with _$OrderItemDetailModel {
  const factory OrderItemDetailModel({
    @JsonKey(name: "item_id") String? itemId,
    @JsonKey(name: "item_name") String? itemName,
    @JsonKey(name: "product_id") String? productId,
    @JsonKey(name: "product_slug") String? productSlug,
    @JsonKey(name: "product_category_ids") List<String>? productCategoryIds,
    @JsonKey(name: "product_category_names") List<String>? productCategoryNames,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "varient") List<Object>? varient,
    @JsonKey(name: "exta_options") List<Object>? extaOptions,
    @JsonKey(name: "sold_by") String? soldBy,
    @JsonKey(name: "qty") int? qty,
    @JsonKey(name: "regular_price") int? regularPrice,
    @JsonKey(name: "final_price") int? finalPrice,
    @JsonKey(name: "discount") int? discount,
  }) = _OrderItemDetailModel;

  factory OrderItemDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemDetailModelFromJson(json);
}

@freezed
class OrderSummaryDetailModel with _$OrderSummaryDetailModel {
  const factory OrderSummaryDetailModel({
    @JsonKey(name: "subtotal") int? subtotal,
    @JsonKey(name: "total_order_qty") int? totalOrderQty,
    @JsonKey(name: "discount_amount") int? discountAmount,
    @JsonKey(name: "rewards_discount") int? rewardsDiscount,
    @JsonKey(name: "shipping_fee") int? shippingFee,
    @JsonKey(name: "grand_total") int? grandTotal,
    @JsonKey(name: "reward_earned") int? rewardEarned,
  }) = _OrderSummaryDetailModel;

  factory OrderSummaryDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderSummaryDetailModelFromJson(json);
}

@freezed
class ShippingAddressModel with _$ShippingAddressModel {
  const factory ShippingAddressModel({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "mobile") String? mobile,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "address") String? address,
  }) = _ShippingAddressModel;

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressModelFromJson(json);
}

@freezed
class PaymentAddressModel with _$PaymentAddressModel {
  const factory PaymentAddressModel({
    @JsonKey(name: "region_id") String? regionId,
    @JsonKey(name: "region_code") String? regionCode,
    @JsonKey(name: "country_id") String? countryId,
    @JsonKey(name: "region") String? region,
    @JsonKey(name: "street") List<String>? street,
    @JsonKey(name: "postcode") String? postcode,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "firstname") String? firstname,
    @JsonKey(name: "lastname") String? lastname,
    @JsonKey(name: "customer_id") String? customerId,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "telephone") String? telephone,
    @JsonKey(name: "shipping_carrier_code") String? shippingCarrierCode,
    @JsonKey(name: "shipping_method_code") String? shippingMethodCode,
    @JsonKey(name: "quoteId") String? quoteId,
  }) = _PaymentAddressModel;

  factory PaymentAddressModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentAddressModelFromJson(json);
}

@freezed
class PaymentInfoModel with _$PaymentInfoModel {
  const factory PaymentInfoModel({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "value") Object? value,
  }) = _PaymentInfoModel;

  factory PaymentInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentInfoModelFromJson(json);
}

@freezed
class StatusHistoryModel with _$StatusHistoryModel {
  const factory StatusHistoryModel({
    @JsonKey(name: "entity_id") String? entityId,
    @JsonKey(name: "parent_id") String? parentId,
    @JsonKey(name: "is_customer_notified") String? isCustomerNotified,
    @JsonKey(name: "is_visible_on_front") String? isVisibleOnFront,
    @JsonKey(name: "comment") String? comment,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "entity_name") EntityName? entityName,
    @JsonKey(name: "seller_order_id") dynamic sellerOrderId,
  }) = _StatusHistoryModel;

  factory StatusHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$StatusHistoryModelFromJson(json);
}

enum EntityName {
  @JsonValue("invoice")
  invoice,
  @JsonValue("order")
  order,
}

final entityNameValues = EnumValues({
  "invoice": EntityName.invoice,
  "order": EntityName.order,
});

@freezed
class StatusLabel with _$StatusLabel {
  const factory StatusLabel({
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "is_default") String? isDefault,
    @JsonKey(name: "visible_on_front") String? visibleOnFront,
  }) = _StatusLabel;

  factory StatusLabel.fromJson(Map<String, dynamic> json) =>
      _$StatusLabelFromJson(json);
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
