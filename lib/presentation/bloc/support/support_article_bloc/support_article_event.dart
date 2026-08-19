part of 'support_article_bloc.dart';

@freezed
class SupportArticleEvent with _$SupportArticleEvent {
  const factory SupportArticleEvent.getSupportArticle({
    required String categoryId,
  }) = _GetSupportAtricle;
  const factory SupportArticleEvent.searchSupportArticle({
    required String query,
  }) = _SearchSupportAtricle;
  const factory SupportArticleEvent.refresh({
    required String? categoryId,
    required String? query,
  }) = _Refresh;
}
