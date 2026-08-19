// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TicketResponseAdapter extends TypeAdapter<TicketResponse> {
  @override
  final int typeId = 17;

  @override
  TicketResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TicketResponse(
      ticketId: fields[0] as String?,
      ticketCode: fields[1] as String?,
      subject: fields[2] as String?,
      issueType: fields[3] as String?,
      lastReplyName: fields[4] as String?,
      lastReplyAt: fields[5] as String?,
      status: fields[6] as String?,
      department: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TicketResponse obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.ticketId)
      ..writeByte(1)
      ..write(obj.ticketCode)
      ..writeByte(2)
      ..write(obj.subject)
      ..writeByte(3)
      ..write(obj.issueType)
      ..writeByte(4)
      ..write(obj.lastReplyName)
      ..writeByte(5)
      ..write(obj.lastReplyAt)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.department);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TicketResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketResponseImpl _$$TicketResponseImplFromJson(Map<String, dynamic> json) =>
    _$TicketResponseImpl(
      ticketId: _toString(json['ticket_id']),
      ticketCode: _toString(json['ticket_code']),
      subject: _toString(json['subject']),
      issueType: _toString(json['issue_type']),
      lastReplyName: _toString(json['last_reply_name']),
      lastReplyAt: _toString(json['last_reply_at']),
      status: _toString(json['Status']),
      department: _toString(json['Department']),
    );

Map<String, dynamic> _$$TicketResponseImplToJson(
  _$TicketResponseImpl instance,
) => <String, dynamic>{
  'ticket_id': instance.ticketId,
  'ticket_code': instance.ticketCode,
  'subject': instance.subject,
  'issue_type': instance.issueType,
  'last_reply_name': instance.lastReplyName,
  'last_reply_at': instance.lastReplyAt,
  'Status': instance.status,
  'Department': instance.department,
};
