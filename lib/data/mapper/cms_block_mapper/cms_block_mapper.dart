import 'package:pickaboo/data/model/cms_block_response/cms_block_response.dart';
import 'package:pickaboo/domain/entity/cms_block/cms_block_entity.dart';

extension CmsBlockResponseMapper on CmsBlockResponse {
  CmsBlockEntity toEntity() {
    return CmsBlockEntity(
      id: id ?? 0,
      identifier: identifier ?? '',
      title: title ?? '',
      content: content ?? '',
      active: active ?? false,
      creationTime: creationTime ?? '',
      updateTime: updateTime ?? '',
    );
  }
}
