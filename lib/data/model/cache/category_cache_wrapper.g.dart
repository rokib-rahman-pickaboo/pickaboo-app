// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_cache_wrapper.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryCacheWrapperAdapter extends TypeAdapter<CategoryCacheWrapper> {
  @override
  final int typeId = 2;

  @override
  CategoryCacheWrapper read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryCacheWrapper(
      categories: (fields[0] as List).cast<CategoryResponse>(),
      cachedAt: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryCacheWrapper obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.categories)
      ..writeByte(1)
      ..write(obj.cachedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryCacheWrapperAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryCacheWrapperImpl _$$CategoryCacheWrapperImplFromJson(
  Map<String, dynamic> json,
) => _$CategoryCacheWrapperImpl(
  categories:
      (json['categories'] as List<dynamic>)
          .map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
  cachedAt: DateTime.parse(json['cachedAt'] as String),
);

Map<String, dynamic> _$$CategoryCacheWrapperImplToJson(
  _$CategoryCacheWrapperImpl instance,
) => <String, dynamic>{
  'categories': instance.categories,
  'cachedAt': instance.cachedAt.toIso8601String(),
};
