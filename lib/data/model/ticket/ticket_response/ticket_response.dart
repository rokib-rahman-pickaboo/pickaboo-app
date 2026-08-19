import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'ticket_response.freezed.dart';
part 'ticket_response.g.dart';

String? _toString(dynamic value) => value?.toString();

@freezed
@HiveType(typeId: 17, adapterName: 'TicketResponseAdapter')
class TicketResponse with _$TicketResponse {
  const factory TicketResponse({
    @HiveField(0)
    @JsonKey(name: "ticket_id", fromJson: _toString)
    String? ticketId,
    @HiveField(1)
    @JsonKey(name: "ticket_code", fromJson: _toString)
    String? ticketCode,
    @HiveField(2)
    @JsonKey(name: "subject", fromJson: _toString)
    String? subject,
    @HiveField(3)
    @JsonKey(name: "issue_type", fromJson: _toString)
    String? issueType,
    @HiveField(4)
    @JsonKey(name: "last_reply_name", fromJson: _toString)
    String? lastReplyName,
    @HiveField(5)
    @JsonKey(name: "last_reply_at", fromJson: _toString)
    String? lastReplyAt,
    @HiveField(6) @JsonKey(name: "Status", fromJson: _toString) String? status,
    @HiveField(7)
    @JsonKey(name: "Department", fromJson: _toString)
    String? department,
  }) = _TicketResponse;

  factory TicketResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketResponseFromJson(json);
}
