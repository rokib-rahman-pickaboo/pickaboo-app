import 'package:pickaboo/data/model/popup_response/popup_response.dart';
import 'package:pickaboo/domain/entity/popup/popup_entity.dart';

extension PopupMapper on PopupResponse {
  PopupEntity toEntity() {
    return PopupEntity(
      id: id ?? 0,
      identifier: identifier ?? '',
      title: title ?? '',
      content: content ?? '',
      creationTime: creationTime ?? DateTime.now(),
      updateTime: updateTime ?? DateTime.now(),
      active: active ?? false,
    );
  }
}
