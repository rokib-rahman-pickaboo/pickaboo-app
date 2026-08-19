part of 'support_article_bloc.dart';

enum SupportArticleStatus { initial, loading, success, empty, update, error }

@freezed
class SupportArticleState with _$SupportArticleState {
  const factory SupportArticleState({
    @Default(SupportArticleStatus.initial) SupportArticleStatus status,
    AppErrorEntity? error,
    List<SupportArticleEntity>? articles,
  }) = _SupportArticleState;
}
