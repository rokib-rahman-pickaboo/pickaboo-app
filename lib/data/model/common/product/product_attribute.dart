import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_attribute.freezed.dart';
part 'product_attribute.g.dart';

@freezed
@HiveType(typeId: 32, adapterName: 'ProductAttributeAdapter')
class ProductAttribute with _$ProductAttribute {
  const factory ProductAttribute({
    @HiveField(0) @JsonKey(name: "code") String? code,
    @HiveField(1) @JsonKey(name: "label") String? label,
    @HiveField(2) @JsonKey(name: "value") String? value,
  }) = _ProductAttribute;

  factory ProductAttribute.fromJson(Map<String, dynamic> json) =>
      _$ProductAttributeFromJson(json);
}
