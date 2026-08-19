import 'package:freezed_annotation/freezed_annotation.dart';

part 'popup_response.freezed.dart';
part 'popup_response.g.dart';

@freezed
class PopupResponse with _$PopupResponse {
  const factory PopupResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "identifier") String? identifier,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "content") String? content,
    @JsonKey(name: "creation_time") DateTime? creationTime,
    @JsonKey(name: "update_time") DateTime? updateTime,
    @JsonKey(name: "active") bool? active,
  }) = _PopupResponse;

  factory PopupResponse.fromJson(Map<String, dynamic> json) =>
      _$PopupResponseFromJson(json);
}
