import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';

part 'discover_category_event.dart';
part 'discover_category_state.dart';
part 'discover_category_bloc.freezed.dart';

@injectable
class DiscoverCategoryBloc extends Bloc<DiscoverCategoryEvent, DiscoverCategoryState> {
  final ProductRepository repository;

  DiscoverCategoryBloc(this.repository) : super(const DiscoverCategoryState()) {
    on<DiscoverCategoryEvent>((event, emit) async {
      await event.map(
        getDiscoverCategories: (_GetDiscoverCategories req) async {
          emit(state.copyWith(status: DiscoverCategoryStatus.loading));

          final result = await repository.getDiscoverCategories();
          result.fold(
            (l) => emit(state.copyWith(error: l, status: DiscoverCategoryStatus.error)),
            (r) {
              if (r.isNotEmpty) {
                emit(state.copyWith(
                  status: DiscoverCategoryStatus.success,
                  discoverCategories: r,
                ));
              } else {
                emit(state.copyWith(status: DiscoverCategoryStatus.empty));
              }
            },
          );
        },

        refresh: (_Refresh req) async {
          emit(state.copyWith(status: DiscoverCategoryStatus.loading));
          await Future.delayed(const Duration(milliseconds: 100));
          add(const DiscoverCategoryEvent.getDiscoverCategories());
        },
      );
    });
  }
}
