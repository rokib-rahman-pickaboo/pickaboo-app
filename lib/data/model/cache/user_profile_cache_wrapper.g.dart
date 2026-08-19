// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_cache_wrapper.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserProfileCacheWrapperAdapter
    extends TypeAdapter<UserProfileCacheWrapper> {
  @override
  final int typeId = 8;

  @override
  UserProfileCacheWrapper read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProfileCacheWrapper(
      user: fields[0] as UserResponse,
      cachedAt: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, UserProfileCacheWrapper obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.user)
      ..writeByte(1)
      ..write(obj.cachedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfileCacheWrapperAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileCacheWrapperImpl _$$UserProfileCacheWrapperImplFromJson(
  Map<String, dynamic> json,
) => _$UserProfileCacheWrapperImpl(
  user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
  cachedAt: DateTime.parse(json['cachedAt'] as String),
);

Map<String, dynamic> _$$UserProfileCacheWrapperImplToJson(
  _$UserProfileCacheWrapperImpl instance,
) => <String, dynamic>{
  'user': instance.user,
  'cachedAt': instance.cachedAt.toIso8601String(),
};
