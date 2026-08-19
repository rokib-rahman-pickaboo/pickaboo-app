import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io';

part 'create_ticket_model.freezed.dart';
part 'create_ticket_model.g.dart';

@freezed
class CreateTicketModel with _$CreateTicketModel {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory CreateTicketModel({
    @JsonKey(name: "subject") required String subject,
    @JsonKey(name: "body") required String body,
    @JsonKey(name: "order_id") String? orderId,
    @JsonKey(name: "issue_type") String? issueType,
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<File>? attachments,
  }) = _CreateTicketModel;

  factory CreateTicketModel.fromJson(Map<String, dynamic> json) =>
      _$CreateTicketModelFromJson(json);
}
