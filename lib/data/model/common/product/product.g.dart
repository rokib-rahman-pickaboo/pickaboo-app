// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 9;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as String?,
      expressDelivery: fields[1] as String?,
      productName: fields[2] as String?,
      sku: fields[3] as String?,
      slug: fields[4] as String?,
      typeId: fields[5] as String?,
      stockAvailable: fields[6] as bool?,
      freeDelivery: fields[7] as String?,
      productPrice: fields[8] as int?,
      productSpecialPrice: fields[9] as int?,
      productDiscount: fields[10] as int?,
      offers: fields[11] as String?,
      clubPoint: fields[12] as double?,
      rating: fields[13] as double?,
      ratingCount: fields[14] as int?,
      productImg: fields[15] as String?,
      emiAvailable: fields[16] as bool?,
      comingSoon: fields[17] as bool?,
      isAd: fields[18] as bool?,
      attributes: (fields[19] as List)?.cast<ProductAttribute>(),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.expressDelivery)
      ..writeByte(2)
      ..write(obj.productName)
      ..writeByte(3)
      ..write(obj.sku)
      ..writeByte(4)
      ..write(obj.slug)
      ..writeByte(5)
      ..write(obj.typeId)
      ..writeByte(6)
      ..write(obj.stockAvailable)
      ..writeByte(7)
      ..write(obj.freeDelivery)
      ..writeByte(8)
      ..write(obj.productPrice)
      ..writeByte(9)
      ..write(obj.productSpecialPrice)
      ..writeByte(10)
      ..write(obj.productDiscount)
      ..writeByte(11)
      ..write(obj.offers)
      ..writeByte(12)
      ..write(obj.clubPoint)
      ..writeByte(13)
      ..write(obj.rating)
      ..writeByte(14)
      ..write(obj.ratingCount)
      ..writeByte(15)
      ..write(obj.productImg)
      ..writeByte(16)
      ..write(obj.emiAvailable)
      ..writeByte(17)
      ..write(obj.comingSoon)
      ..writeByte(18)
      ..write(obj.isAd)
      ..writeByte(19)
      ..write(obj.attributes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: _toStringSafe(json['id']),
      expressDelivery: _toStringSafe(json['express_delivery']),
      productName: json['product_name'] as String?,
      sku: json['sku'] as String?,
      slug: json['slug'] as String?,
      typeId: json['type_id'] as String?,
      stockAvailable: _toBoolSafe(json['stock_available']),
      freeDelivery: _toStringSafe(json['free_delivery']),
      productPrice: _toIntSafe(json['product_price']),
      productSpecialPrice: _toIntSafe(json['product_specialPrice']),
      productDiscount: _toIntSafe(json['product_discount']),
      offers: _toStringSafe(json['offers']),
      clubPoint: _toDoubleSafe(json['club_point']),
      rating: _toDoubleSafe(json['rating']),
      ratingCount: _toIntSafe(json['rating_count']),
      productImg: json['product_img'] as String?,
      emiAvailable: _toBoolSafe(json['emi_available']),
      comingSoon: _toBoolSafe(json['coming_soon']),
      isAd: _toBoolSafe(json['is_ad']),
      attributes:
          (json['attributes'] as List<dynamic>?)
              ?.map((e) => ProductAttribute.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'express_delivery': instance.expressDelivery,
      'product_name': instance.productName,
      'sku': instance.sku,
      'slug': instance.slug,
      'type_id': instance.typeId,
      'stock_available': instance.stockAvailable,
      'free_delivery': instance.freeDelivery,
      'product_price': instance.productPrice,
      'product_specialPrice': instance.productSpecialPrice,
      'product_discount': instance.productDiscount,
      'offers': instance.offers,
      'club_point': instance.clubPoint,
      'rating': instance.rating,
      'rating_count': instance.ratingCount,
      'product_img': instance.productImg,
      'emi_available': instance.emiAvailable,
      'coming_soon': instance.comingSoon,
      'is_ad': instance.isAd,
      'attributes': instance.attributes,
    };
