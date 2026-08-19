import 'package:pickaboo/data/model/support_article_response/support_article_response.dart';
import 'package:pickaboo/domain/entity/support_article/support_article_entity.dart';

extension SupportArticleResponseMapper on SupportArticleResponse {
  SupportArticleEntity toEntity() {
    return SupportArticleEntity(
      id: articleId ?? '',
      title: name ?? '',
      content: text ?? '',
      createdAt: createdAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: updatedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
