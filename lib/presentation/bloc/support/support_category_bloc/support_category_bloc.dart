import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/support_category/support_category_entity.dart';
import 'package:pickaboo/domain/repository/support_repository.dart';

part 'support_category_event.dart';
part 'support_category_state.dart';
part 'support_category_bloc.freezed.dart';

@injectable
class SupportCategoryBloc
    extends Bloc<SupportCategoryEvent, SupportCategoryState> {
  final SupportRepository repository;

  SupportCategoryBloc(this.repository) : super(const SupportCategoryState()) {
    on<SupportCategoryEvent>((event, emit) async {
      await event.map(
        getSupportCategories: (_GetSupportCategories req) async {
          emit(state.copyWith(status: SupportCategoryStatus.loading));

          final result = await repository.getAllSupportCategories();
          result.fold(
            (l) => emit(
              state.copyWith(error: l, status: SupportCategoryStatus.error),
            ),
            (r) async {
              if (r.isNotEmpty == true) {
                emit(
                  state.copyWith(
                    status: SupportCategoryStatus.success,
                    categories: r,
                  ),
                );
              } else {
                emit(state.copyWith(status: SupportCategoryStatus.empty));
              }
            },
          );
        },

        refresh: (_Refresh req) async {
          emit(state.copyWith(status: SupportCategoryStatus.loading));
          await Future.delayed(const Duration(milliseconds: 100));
          add(const SupportCategoryEvent.getSupportCategories());
        },
      );
    });
  }
}
