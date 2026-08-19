// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_attribute.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAttributeAdapter extends TypeAdapter<ProductAttribute> {
  @override
  final int typeId = 32;

  @override
  ProductAttribute read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductAttribute(
      code: fields[0] as String?,
      label: fields[1] as String?,
      value: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductAttribute obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.label)
      ..writeByte(2)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAttributeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductAttributeImpl _$$ProductAttributeImplFromJson(
  Map<String, dynamic> json,
) => _$ProductAttributeImpl(
  code: json['code'] as String?,
  label: json['label'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$$ProductAttributeImplToJson(
  _$ProductAttributeImpl instance,
) => <String, dynamic>{
  'code': instance.code,
  'label': instance.label,
  'value': instance.value,
};
