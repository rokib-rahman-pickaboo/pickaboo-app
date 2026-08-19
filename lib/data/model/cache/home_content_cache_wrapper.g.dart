// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_content_cache_wrapper.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeContentCacheWrapperAdapter
    extends TypeAdapter<HomeContentCacheWrapper> {
  @override
  final int typeId = 16;

  @override
  HomeContentCacheWrapper read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeContentCacheWrapper(
      homeContent: fields[0] as HomeContentResponse,
      cachedAt: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HomeContentCacheWrapper obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.homeContent)
      ..writeByte(1)
      ..write(obj.cachedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeContentCacheWrapperAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeContentCacheWrapperImpl _$$HomeContentCacheWrapperImplFromJson(
  Map<String, dynamic> json,
) => _$HomeContentCacheWrapperImpl(
  homeContent: HomeContentResponse.fromJson(
    json['homeContent'] as Map<String, dynamic>,
  ),
  cachedAt: DateTime.parse(json['cachedAt'] as String),
);

Map<String, dynamic> _$$HomeContentCacheWrapperImplToJson(
  _$HomeContentCacheWrapperImpl instance,
) => <String, dynamic>{
  'homeContent': instance.homeContent,
  'cachedAt': instance.cachedAt.toIso8601String(),
};
