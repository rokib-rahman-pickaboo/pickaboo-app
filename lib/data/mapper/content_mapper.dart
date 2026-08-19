import 'package:pickaboo/data/model/content_response/content_response.dart';
import 'package:pickaboo/domain/entity/content_page/content_page_entity.dart';

extension ContentResponseMapper on ContentResponse {
  ContentPageEntity toEntity() {
    return ContentPageEntity(
      id: pageId ?? '',
      title: title ?? '',
      layout: pageLayout ?? '',
      identifier: identifier ?? '',
      heading: contentHeading ?? '',
      content: content ?? '',
      isActive: _parseBool(isActive),
      sortOrder: int.tryParse(sortOrder ?? '0') ?? 0,
      metaTitle: metaTitle ?? '',
      metaKeywords: metaKeywords ?? '',
      metaDescription: metaDescription ?? '',
      createdAt: creationTime ?? DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: updateTime ?? DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  bool _parseBool(String? value) {
    return value == '1' || value?.toLowerCase() == 'true';
  }
}
