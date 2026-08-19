import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pickaboo/data/model/common/product/product_attribute.dart';

part 'product.freezed.dart';
part 'product.g.dart';

String? _toStringSafe(dynamic value) => value?.toString();

int? _toIntSafe(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return num.tryParse(value)?.toInt();
  return null;
}

double? _toDoubleSafe(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

bool? _toBoolSafe(dynamic value) {
  if (value == null) return null;
  if (value is bool) return value;
  if (value is num) return value != 0;
  if (value is String) {
    final v = value.toLowerCase();
    if (v == 'true' || v == '1') return true;
    if (v == 'false' || v == '0') return false;
  }
  return null;
}

@freezed
@HiveType(typeId: 9, adapterName: 'ProductAdapter')
class Product with _$Product {
  const factory Product({
    @HiveField(0) @JsonKey(name: "id", fromJson: _toStringSafe) String? id,
    @HiveField(1) @JsonKey(name: "express_delivery", fromJson: _toStringSafe) String? expressDelivery,
    @HiveField(2) @JsonKey(name: "product_name") String? productName,
    @HiveField(3) @JsonKey(name: "sku") String? sku,
    @HiveField(4) @JsonKey(name: "slug") String? slug,
    @HiveField(5) @JsonKey(name: "type_id") String? typeId,
    @HiveField(6) @JsonKey(name: "stock_available", fromJson: _toBoolSafe) bool? stockAvailable,
    @HiveField(7) @JsonKey(name: "free_delivery", fromJson: _toStringSafe) String? freeDelivery,
    @HiveField(8) @JsonKey(name: "product_price", fromJson: _toIntSafe) int? productPrice,
    @HiveField(9)
    @JsonKey(name: "product_specialPrice", fromJson: _toIntSafe)
    int? productSpecialPrice,
    @HiveField(10) @JsonKey(name: "product_discount", fromJson: _toIntSafe) int? productDiscount,
    @HiveField(11) @JsonKey(name: "offers", fromJson: _toStringSafe) String? offers,
    @HiveField(12) @JsonKey(name: "club_point", fromJson: _toDoubleSafe) double? clubPoint,
    @HiveField(13) @JsonKey(name: "rating", fromJson: _toDoubleSafe) double? rating,
    @HiveField(14) @JsonKey(name: "rating_count", fromJson: _toIntSafe) int? ratingCount,
    @HiveField(15) @JsonKey(name: "product_img") String? productImg,
    @HiveField(16) @JsonKey(name: "emi_available", fromJson: _toBoolSafe) bool? emiAvailable,
    @HiveField(17) @JsonKey(name: "coming_soon", fromJson: _toBoolSafe) bool? comingSoon,
    @HiveField(18) @JsonKey(name: "is_ad", fromJson: _toBoolSafe)
    bool? isAd,
    @HiveField(19) @JsonKey(name: "attributes") List<ProductAttribute>? attributes,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
