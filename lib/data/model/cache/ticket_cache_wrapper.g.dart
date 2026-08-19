// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_cache_wrapper.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TicketCacheWrapperAdapter extends TypeAdapter<TicketCacheWrapper> {
  @override
  final int typeId = 18;

  @override
  TicketCacheWrapper read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TicketCacheWrapper(
      tickets: (fields[0] as List).cast<TicketResponse>(),
      cachedAt: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TicketCacheWrapper obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.tickets)
      ..writeByte(1)
      ..write(obj.cachedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TicketCacheWrapperAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketCacheWrapperImpl _$$TicketCacheWrapperImplFromJson(
  Map<String, dynamic> json,
) => _$TicketCacheWrapperImpl(
  tickets:
      (json['tickets'] as List<dynamic>)
          .map((e) => TicketResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
  cachedAt: DateTime.parse(json['cachedAt'] as String),
);

Map<String, dynamic> _$$TicketCacheWrapperImplToJson(
  _$TicketCacheWrapperImpl instance,
) => <String, dynamic>{
  'tickets': instance.tickets,
  'cachedAt': instance.cachedAt.toIso8601String(),
};
