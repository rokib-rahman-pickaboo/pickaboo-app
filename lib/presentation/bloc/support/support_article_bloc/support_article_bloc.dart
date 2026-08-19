import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/support_article/support_article_entity.dart';
import 'package:pickaboo/domain/repository/support_repository.dart';

part 'support_article_event.dart';
part 'support_article_state.dart';
part 'support_article_bloc.freezed.dart';

@injectable
class SupportArticleBloc
    extends Bloc<SupportArticleEvent, SupportArticleState> {
  final SupportRepository repository;

  SupportArticleBloc(this.repository) : super(const SupportArticleState()) {
    on<SupportArticleEvent>((event, emit) async {
      await event.map(
        getSupportArticle: (_GetSupportAtricle req) async {
          emit(state.copyWith(status: SupportArticleStatus.loading));

          final result = await repository.getSupportArticle(
            categoryId: req.categoryId,
          );
          result.fold(
            (l) => emit(
              state.copyWith(error: l, status: SupportArticleStatus.error),
            ),
            (r) async {
              if (r.isNotEmpty == true) {
                emit(
                  state.copyWith(
                    status: SupportArticleStatus.success,
                    articles: r,
                  ),
                );
              } else {
                emit(state.copyWith(status: SupportArticleStatus.empty));
              }
            },
          );
        },

        searchSupportArticle: (_SearchSupportAtricle req) async {
          emit(state.copyWith(status: SupportArticleStatus.loading));

          final result = await repository.searchSupportArticle(
            query: req.query,
          );
          result.fold(
            (l) => emit(
              state.copyWith(error: l, status: SupportArticleStatus.error),
            ),
            (r) async {
              if (r.isNotEmpty == true) {
                emit(
                  state.copyWith(
                    status: SupportArticleStatus.success,
                    articles: r,
                  ),
                );
              } else {
                emit(state.copyWith(status: SupportArticleStatus.empty));
              }
            },
          );
        },

        refresh: (_Refresh req) async {
          emit(state.copyWith(status: SupportArticleStatus.loading));
          await Future.delayed(const Duration(milliseconds: 100));

          if (req.categoryId != null && req.categoryId!.isNotEmpty) {
            add(
              SupportArticleEvent.getSupportArticle(
                categoryId: req.categoryId!,
              ),
            );
          }
          else if (req.query != null && req.query!.isNotEmpty) {
            add(SupportArticleEvent.searchSupportArticle(query: req.query!));
          }
          else {
            emit(
              state.copyWith(
                status: SupportArticleStatus.error,
                error: const AppErrorEntity(
                  message:
                      'Either categoryId or query must be provided for refresh',
                ),
              ),
            );
          }
        },
      );
    });
  }
}
