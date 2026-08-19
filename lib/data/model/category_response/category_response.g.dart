// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryResponseAdapter extends TypeAdapter<CategoryResponse> {
  @override
  final int typeId = 1;

  @override
  CategoryResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryResponse(
      id: fields[0] as String?,
      slug: fields[1] as String?,
      name: fields[2] as String?,
      isSpecial: fields[3] as String?,
      icon: fields[4] as String?,
      childs: (fields[5] as List)?.cast<CategoryResponse>(),
    );
  }

  @override
  void write(BinaryWriter writer, CategoryResponse obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.slug)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.isSpecial)
      ..writeByte(4)
      ..write(obj.icon)
      ..writeByte(5)
      ..write(obj.childs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryResponseImpl _$$CategoryResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CategoryResponseImpl(
  id: json['id'] as String?,
  slug: json['slug'] as String?,
  name: json['name'] as String?,
  isSpecial: json['is_special'] as String?,
  icon: json['icon'] as String?,
  childs:
      (json['childs'] as List<dynamic>?)
          ?.map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$CategoryResponseImplToJson(
  _$CategoryResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'name': instance.name,
  'is_special': instance.isSpecial,
  'icon': instance.icon,
  'childs': instance.childs,
};
