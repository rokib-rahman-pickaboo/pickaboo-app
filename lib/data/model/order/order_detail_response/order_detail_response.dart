import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/core/utils/date_time_utils.dart';

part 'order_detail_response.freezed.dart';
part 'order_detail_response.g.dart';

@freezed
class OrderDetailResponse with _$OrderDetailResponse {
  const factory OrderDetailResponse({
    @JsonKey(name: "order_id") int? orderId,
    @JsonKey(name: "order_number") String? orderNumber,
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(name: "created_at", fromJson: safeDateTimeFromJson, toJson: safeDateTimeToJson) DateTime? createdAt,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "status") String? status,
    @JsonKey(
      name: "items",
      fromJson: safeItemsFromJson,
      toJson: safeItemsToJson,
    )
    List<OrderItemDetailModel>? items,
    @JsonKey(name: "coupon_code") String? couponCode,
    @JsonKey(name: "spent_reward_points") String? spentRewardPoints,
    @JsonKey(name: "order_summary") OrderSummaryDetailModel? orderSummary,
    @JsonKey(
      name: "shipping_address",
      fromJson: safeShippingAddressFromJson,
      toJson: safeShippingAddressToJson,
    )
    List<ShippingAddressModel>? shippingAddress,
    @JsonKey(
      name: "payment_address",
      fromJson: safePaymentAddressFromJson,
      toJson: safePaymentAddressToJson,
    )
    List<PaymentAddressModel>? paymentAddress,
    @JsonKey(name: "shipping_method") String? shippingMethod,
    @JsonKey(name: "remote_ip") String? remoteIp,
    @JsonKey(name: "payment_method") String? paymentMethod,
    @JsonKey(
      name: "payment_information",
      fromJson: safePaymentInformationFromJson,
      toJson: safePaymentInformationToJson,
    )
    List<PaymentInfoModel>? paymentInformation,
    @JsonKey(name: "just_for_you") Object? justForYou,
    @JsonKey(
      name: "status_history",
      fromJson: safeStatusHistoryFromJson,
      toJson: safeStatusHistoryToJson,
    )
    List<StatusHistoryModel>? statusHistory,
    @JsonKey(
      name: "status_history_new",
      fromJson: safeStatusHistoryFromJson,
      toJson: safeStatusHistoryToJson,
    )
    List<StatusHistoryModel>? statusHistoryNew,
    @JsonKey(
      name: "status_label",
      fromJson: safeStatusLabelFromJson,
      toJson: safeStatusLabelToJson,
    )
    List<StatusLabel>? statusLabel,
    @JsonKey(name: "customer_name") String? customerName,
    @JsonKey(name: "customer_email") String? customerEmail,
    @JsonKey(name: "customer_phone") String? customerPhone,
    @JsonKey(name: "convenience_fee") num? convenienceFee,
    @JsonKey(name: "convenience_fee_percent") String? convenienceFeePercent,
    @JsonKey(name: "payment_mode") String? paymentMode,
    @JsonKey(name: "emi_tenure") dynamic emiTenure,
    @JsonKey(name: "emi_bank") String? emiBank,
    @JsonKey(name: "bank_name") String? bankName,
    @JsonKey(name: "tenure") dynamic tenure,
  }) = _OrderDetailResponse;

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailResponseFromJson(json);
}

@freezed
class OrderItemDetailModel with _$OrderItemDetailModel {
  const factory OrderItemDetailModel({
    @JsonKey(name: "item_id") dynamic itemId,
    @JsonKey(name: "item_name") String? itemName,
    @JsonKey(name: "product_id") dynamic productId,
    @JsonKey(name: "product_slug") String? productSlug,
    @JsonKey(name: "product_category_ids") List<dynamic>? productCategoryIds,
    @JsonKey(name: "product_category_names") List<String>? productCategoryNames,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "varient") List<Object>? varient,
    @JsonKey(name: "exta_options") List<Object>? extaOptions,
    @JsonKey(name: "sold_by") String? soldBy,
    @JsonKey(name: "qty") num? qty,
    @JsonKey(name: "regular_price") num? regularPrice,
    @JsonKey(name: "final_price") num? finalPrice,
    @JsonKey(name: "discount") num? discount,
  }) = _OrderItemDetailModel;

  factory OrderItemDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemDetailModelFromJson(json);
}

@freezed
class OrderSummaryDetailModel with _$OrderSummaryDetailModel {
  const factory OrderSummaryDetailModel({
    @JsonKey(name: "subtotal") num? subtotal,
    @JsonKey(name: "total_order_qty") num? totalOrderQty,
    @JsonKey(name: "discount_amount") num? discountAmount,
    @JsonKey(name: "rewards_discount") num? rewardsDiscount,
    @JsonKey(name: "shipping_fee") num? shippingFee,
    @JsonKey(name: "grand_total") num? grandTotal,
    @JsonKey(name: "reward_earned") num? rewardEarned,
    @JsonKey(name: "convenience_fee") num? convenienceFee,
    @JsonKey(name: "convenience_fee_percent") String? convenienceFeePercent,
    @JsonKey(name: "convenience_amount") num? convenienceAmount,
    @JsonKey(name: "convenience_price") num? conveniencePrice,
    @JsonKey(name: "fee") num? fee,
  }) = _OrderSummaryDetailModel;

  factory OrderSummaryDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderSummaryDetailModelFromJson(json);
}

@freezed
class ShippingAddressModel with _$ShippingAddressModel {
  const factory ShippingAddressModel({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "mobile") dynamic mobile,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "address") String? address,
  }) = _ShippingAddressModel;

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressModelFromJson(json);
}

@freezed
class PaymentAddressModel with _$PaymentAddressModel {
  const factory PaymentAddressModel({
    @JsonKey(name: "region_id") dynamic regionId,
    @JsonKey(name: "region_code") String? regionCode,
    @JsonKey(name: "country_id") String? countryId,
    @JsonKey(name: "region") String? region,
    @JsonKey(name: "street") List<String>? street,
    @JsonKey(name: "postcode") dynamic postcode,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "firstname") String? firstname,
    @JsonKey(name: "lastname") String? lastname,
    @JsonKey(name: "customer_id") dynamic customerId,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "telephone") dynamic telephone,
    @JsonKey(name: "shipping_carrier_code") String? shippingCarrierCode,
    @JsonKey(name: "shipping_method_code") String? shippingMethodCode,
    @JsonKey(name: "quoteId") dynamic quoteId,
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
    @JsonKey(name: "entity_id") dynamic entityId,
    @JsonKey(name: "parent_id") dynamic parentId,
    @JsonKey(name: "is_customer_notified") dynamic isCustomerNotified,
    @JsonKey(name: "is_visible_on_front") dynamic isVisibleOnFront,
    @JsonKey(name: "comment") String? comment,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "label") String? label,
    @JsonKey(name: "created_at", fromJson: safeDateTimeFromJson, toJson: safeDateTimeToJson) DateTime? createdAt,
    @JsonKey(name: "time", fromJson: safeDateTimeFromJson, toJson: safeDateTimeToJson) DateTime? time,
    @JsonKey(name: "time_raw") String? timeRaw,
    @JsonKey(name: "entity_name", fromJson: safeEntityNameFromJson, toJson: safeEntityNameToJson)
    EntityName? entityName,
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
  @JsonValue("shipment")
  shipment,
  @JsonValue("creditmemo")
  creditmemo,
}

EntityName? safeEntityNameFromJson(Object? json) {
  if (json == null) return null;
  final str = json.toString().toLowerCase().trim();
  switch (str) {
    case 'invoice':
      return EntityName.invoice;
    case 'order':
      return EntityName.order;
    case 'shipment':
      return EntityName.shipment;
    case 'creditmemo':
      return EntityName.creditmemo;
    default:
      return null;
  }
}

String? safeEntityNameToJson(EntityName? entityName) {
  return entityName?.name;
}

final entityNameValues = EnumValues({
  "invoice": EntityName.invoice,
  "order": EntityName.order,
  "shipment": EntityName.shipment,
  "creditmemo": EntityName.creditmemo,
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

List<PaymentInfoModel>? safePaymentInformationFromJson(Object? json) {
  if (json == null) return null;
  if (json is List) {
    return json.map((e) {
      if (e is Map<String, dynamic>) {
        return PaymentInfoModel.fromJson(e);
      }
      return const PaymentInfoModel();
    }).toList();
  }
  if (json is Map<String, dynamic>) {
    return json.entries.map((entry) {
      if (entry.value is Map<String, dynamic>) {
        return PaymentInfoModel.fromJson(entry.value as Map<String, dynamic>);
      }
      return PaymentInfoModel(
        code: entry.key,
        title: entry.key,
        value: entry.value,
      );
    }).toList();
  }
  return null;
}

List<dynamic>? safePaymentInformationToJson(List<PaymentInfoModel>? list) {
  return list?.map((e) => e.toJson()).toList();
}

List<OrderItemDetailModel>? safeItemsFromJson(Object? json) {
  if (json == null) return null;
  if (json is List) {
    return json
        .whereType<Map<String, dynamic>>()
        .map((e) => OrderItemDetailModel.fromJson(e))
        .toList();
  }
  if (json is Map<String, dynamic>) {
    return [OrderItemDetailModel.fromJson(json)];
  }
  return null;
}

List<dynamic>? safeItemsToJson(List<OrderItemDetailModel>? list) {
  return list?.map((e) => e.toJson()).toList();
}

List<ShippingAddressModel>? safeShippingAddressFromJson(Object? json) {
  if (json == null) return null;
  if (json is List) {
    return json
        .whereType<Map<String, dynamic>>()
        .map((e) => ShippingAddressModel.fromJson(e))
        .toList();
  }
  if (json is Map<String, dynamic>) {
    return [ShippingAddressModel.fromJson(json)];
  }
  return null;
}

List<dynamic>? safeShippingAddressToJson(List<ShippingAddressModel>? list) {
  return list?.map((e) => e.toJson()).toList();
}

List<PaymentAddressModel>? safePaymentAddressFromJson(Object? json) {
  if (json == null) return null;
  if (json is List) {
    return json
        .whereType<Map<String, dynamic>>()
        .map((e) => PaymentAddressModel.fromJson(e))
        .toList();
  }
  if (json is Map<String, dynamic>) {
    return [PaymentAddressModel.fromJson(json)];
  }
  return null;
}

List<dynamic>? safePaymentAddressToJson(List<PaymentAddressModel>? list) {
  return list?.map((e) => e.toJson()).toList();
}

List<StatusHistoryModel>? safeStatusHistoryFromJson(Object? json) {
  if (json == null) return null;
  if (json is List) {
    return json.map((e) {
      if (e is Map<String, dynamic>) {
        final map = Map<String, dynamic>.from(e);
        if (map.containsKey('time') && map['time'] != null && !map.containsKey('time_raw')) {
          map['time_raw'] = map['time'].toString();
        } else if (map.containsKey('created_at') && map['created_at'] != null && !map.containsKey('time_raw')) {
          map['time_raw'] = map['created_at'].toString();
        }
        return StatusHistoryModel.fromJson(map);
      }
      if (e is String) {
        return StatusHistoryModel(status: e, label: e);
      }
      return const StatusHistoryModel();
    }).toList();
  }
  if (json is Map<String, dynamic>) {
    return [StatusHistoryModel.fromJson(json)];
  }
  return null;
}

List<dynamic>? safeStatusHistoryToJson(List<StatusHistoryModel>? list) {
  return list?.map((e) => e.toJson()).toList();
}

List<StatusLabel>? safeStatusLabelFromJson(Object? json) {
  if (json == null) return null;
  if (json is List) {
    return json.map((e) {
      if (e is Map<String, dynamic>) {
        return StatusLabel.fromJson(e);
      }
      if (e is String) {
        return StatusLabel(status: e, state: e);
      }
      return const StatusLabel();
    }).toList();
  }
  if (json is Map<String, dynamic>) {
    return [StatusLabel.fromJson(json)];
  }
  return null;
}

List<dynamic>? safeStatusLabelToJson(List<StatusLabel>? list) {
  return list?.map((e) => e.toJson()).toList();
}

