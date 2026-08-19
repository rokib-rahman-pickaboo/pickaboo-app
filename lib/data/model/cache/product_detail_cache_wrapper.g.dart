// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_cache_wrapper.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDetailCacheWrapperAdapter
    extends TypeAdapter<ProductDetailCacheWrapper> {
  @override
  final int typeId = 31;

  @override
  ProductDetailCacheWrapper read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDetailCacheWrapper(
      productDetails: (fields[0] as List).cast<ProductDetailResponse>(),
      cachedAt: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ProductDetailCacheWrapper obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.productDetails)
      ..writeByte(1)
      ..write(obj.cachedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDetailCacheWrapperAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDetailCacheWrapperImpl _$$ProductDetailCacheWrapperImplFromJson(
  Map<String, dynamic> json,
) => _$ProductDetailCacheWrapperImpl(
  productDetails:
      (json['productDetails'] as List<dynamic>)
          .map((e) => ProductDetailResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
  cachedAt: DateTime.parse(json['cachedAt'] as String),
);

Map<String, dynamic> _$$ProductDetailCacheWrapperImplToJson(
  _$ProductDetailCacheWrapperImpl instance,
) => <String, dynamic>{
  'productDetails': instance.productDetails,
  'cachedAt': instance.cachedAt.toIso8601String(),
};
